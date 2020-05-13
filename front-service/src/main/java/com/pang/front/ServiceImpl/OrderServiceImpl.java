package com.pang.front.ServiceImpl;

import com.alibaba.dubbo.config.annotation.Service;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.pang.back.Model.Goods;
import com.pang.back.Model.User;
import com.pang.front.Mapper.OrderMapper;
import com.pang.front.Model.IDSum;
import com.pang.front.Model.Order;
import com.pang.front.Model.OrderGoods;
import com.pang.front.Model.Result;
import com.pang.front.Util.RedisUtil;
import com.pang.front.service.OrderService;
import org.springframework.amqp.rabbit.annotation.RabbitHandler;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.connection.Message;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.*;

@Service
@Component
public class OrderServiceImpl implements OrderService {
    @Autowired
    OrderMapper orderMapper;

    @Resource
    RedisUtil redisUtil;

    /**
     * @Author: SmallPang
     * @Description: 获得生成订单的商品
     * @Date: 2020/2/26
     * @Param obj: 商品ID数组
     * @return: java.util.List<com.pang.front.Model.OrderGoods>
     **/
    @Override
    public List<OrderGoods> getGoodsList(int[] shoppingCartIDList) {
        List<OrderGoods> list =  orderMapper.getGoodsList(shoppingCartIDList);
        System.out.println(list);
        return list;
    }

    /**
     * @Author: SmallPang
     * @Description: 添加订单信息
     * @Date: 2020/2/26
     * @Param order: 订单实体
     * @return: com.pang.front.Model.Result
     **/
    @Override
    public Result submitOrder(Order order, List<IDSum> idSumList) {
        Result result = new Result();
        result.setMsg("添加订单失败");
        order.setOrderStatus("待付款");
        int orderNum = orderMapper.submitOrder(order);
        int uoNum = orderMapper.insertUOTable(order.getUserID(), order.getOrderID());
        int ogNum = orderMapper.insertOGTable(order.getOrderID(), idSumList);
        if (orderNum + uoNum + ogNum == idSumList.size() + 2) {
            result.setSuccess(true);
            result.setMsg("添加订单成功");
            //删除购物车该商品
            orderMapper.deleteShoppingCart(order.getUserID(), idSumList);
            //减库存
            orderMapper.reduceGoodsSum(idSumList);
            //待付款订单写入redis
            redisUtil.set("Order:" + order.getOrderID().toString(), idSumList, 9000L);
            return result;
        }
        return result;
    }

    /**
     * @Author: SmallPang
     * @Description: 确定收货
     * @Date: 2020/2/27
     * @Param obj: 订单ID
     * @return: com.pang.front.Model.Result
     **/
    @Override
    public Result confirmOrderID(Long orderID) {
        Result result = new Result();
        result.setMsg("确定收货失败");
        result.setDetail(orderID);
        int rtnNum = orderMapper.confirmOrderID(orderID);
        if (rtnNum == 1) {
            result.setSuccess(true);
            result.setMsg("确定收货成功");
            return result;
        }
        return result;
    }

    @Override
    public Result paymentOrderID(Long orderID, Double orderPriceSum) {
        Result result = new Result();
        result.setDetail(orderID);
        result.setMsg("付款失败");
        int rtnNum = orderMapper.paymentOrderID(orderID);
        if (rtnNum == 1) {
            result.setMsg("付款成功");
            result.setSuccess(true);
            return result;
        }
        return result;
    }

    @Override
    public List<Order> getAllOrder(Integer userID) {
        List<Order> order = orderMapper.getAllOrder(userID);
        System.out.println(order);
        return order;
    }

    @Override
    public Order getOrderInfo(Long orderID) {
        return orderMapper.getOrderInfo(orderID);
    }

    @Override
    public List<OrderGoods> selectGoodsList(Long orderID) {
        return orderMapper.selectGoodsList(orderID);
    }

    @Override
    public Result selectOrderStatus(Long orderID) {
        Result result = new Result();
        result.setMsg("获取订单状态失败");
        result.setDetail(orderID);
        String orderStatus = orderMapper.selectOrderStatus(orderID);
        if (orderStatus == "待评价") {
            result.setSuccess(true);
            return result;
        }
        return null;
    }

    @Override
    public Result checkGoodsListInventory(List<IDSum> idSumList) {
        Result result = new Result();
        for(int i = 0; i < idSumList.size(); i++) {
            int goodsInventory = orderMapper.checkGoodsListInventory(idSumList.get(i).getGoodsID());
            if (idSumList.get(i).getGoodsSum() > goodsInventory) {
                result.setMsg("库存不足，请重新下单");
            }
        }
        result.setMsg("库存充足，立即下单");
        result.setSuccess(true);
        return result;
    }

    @Override
    public Result cancelOrderID(Long orderID) {
        Result result = new Result();
        result.setMsg("取消订单失败");
        int rtnNum = orderMapper.cancelOrderID(orderID);
        if (rtnNum == 1) {
            result.setMsg("取消订单成功");
            //库存回滚
            rollbackInventory(orderID);
            result.setSuccess(true);
            return result;
        }
        return result;
    }

    /**
     * @Author: SmallPang
     * @Description: 库存回滚
     * @Date: 2020/3/5
     * @Param orderID: 订单ID
     * @return: com.pang.front.Model.Result
     **/
    @Override
    public Result rollbackInventory(Long orderID) {
        Result result = new Result();
        result.setMsg("库存回滚失败");
        List<OrderGoods> goodsIDList = orderMapper.getOrderList(orderID);
        int rtnNum = orderMapper.rollbackInventory(goodsIDList);
        if (rtnNum == goodsIDList.size()) {
            result.setMsg("库存回滚成功");
            result.setSuccess(true);
            redisUtil.del("Order:" + orderID);
            return result;
        }
        return result;
    }

    @Override
    public Result deleteOrder(Long orderID) {
        Result result = new Result();
        result.setMsg("删除订单失败");
        result.setDetail(orderID);
        int rtnNum = orderMapper.deleteOrder(orderID);
        if (rtnNum == 1) {
            result.setMsg("删除订单成功");
            result.setSuccess(true);
            return result;
        }
        return result;
    }

    @Override
    public PageInfo<Order> selectAllOrder(Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Order> list = orderMapper.selectAllOrder();
        PageInfo<Order> info = new PageInfo<>(list);
        return info;
    }

    @Override
    public Result batchDelete(Long[] intArr) {
        Result result = new Result();
        result.setMsg("订单信息批量删除失败");
        result.setDetail(intArr);
        int rtnNum = orderMapper.batchDelete(intArr);
        if (rtnNum == intArr.length ) {
            result.setMsg("订单信息批量删除成功");
            result.setSuccess(true);
            System.out.println("删除成功");
            return result;
        }
        System.out.println("删除失败");
        return result;
    }

    @Override
    public PageInfo<Order> fuzzySelectOrder(int pageNum, int pageSize, String fuzzyData) {
        PageHelper.startPage(pageNum, pageSize);
        List<Order> list = orderMapper.fuzzySelectOrder(fuzzyData);
        PageInfo<Order> info = new PageInfo<>(list);
        return info;
    }

    @Override
    public Result deleteOrderByOrderID(Long orderID) {
        Result result = new Result();
        result.setMsg("删除订单失败");
        result.setDetail(orderID);
        int rtnNum = orderMapper.deleteOrderByOrderID(orderID);
        if (rtnNum == 1) {
            result.setMsg("删除订单成功");
            result.setSuccess(true);
            return result;
        }
        return result;
    }

    @Override
    public Order selectOrderDetailed(Long orderID) {
        System.out.println("selectOrderDetailed   impl:" + orderID);
        return orderMapper.selectOrderDetailed(orderID);
    }

    @Override
    public List<OrderGoods> getGoodsListByOrderID(Long orderID) {
        System.out.println("getGoodsListByOrderID   impl:" + orderID);
        return orderMapper.getGoodsListByOrderID(orderID);
    }

    @RabbitHandler
    @RabbitListener(queues = "pang.news")
    public void successPay(JSONObject message) {
        System.out.println("监听的获得的数据" + message.getString("orderID"));
        Long orderID = Long.parseLong(message.getString("orderID"));
        System.out.println("监听获得的ID" + orderID);
        int rtnNum = orderMapper.changeOrderStatus(orderID);
        if (rtnNum == 1) {
            redisUtil.del("orderID:" + orderID);
        }
    }


}
