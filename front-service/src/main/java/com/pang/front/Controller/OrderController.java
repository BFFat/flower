package com.pang.front.Controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.alibaba.fastjson.JSONObject;
import com.pang.front.Model.IDSum;
import com.pang.front.Model.Order;
import com.pang.front.Model.OrderGoods;
import com.pang.front.Model.Result;
import com.pang.front.Util.RedisUtil;
import com.pang.front.service.OrderService;
import com.sun.xml.internal.bind.v2.model.core.ID;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping(value = "/order")
public class OrderController {
    @Reference
    OrderService orderService;

    @Resource
    RedisUtil redisUtil;

    @Autowired
    RabbitTemplate rabbitTemplate;

    /**
     * @Author: SmallPang
     * @Description: 获得生成订单的商品
     * @Date: 2020/2/26
     * @Param obj: 商品ID数组
     * @return: java.util.List<com.pang.front.Model.OrderGoods>
     **/
    @PostMapping(value = "/getGoodsList")
    public List<OrderGoods> getGoodsList(@RequestBody JSONObject obj) {
        String getStr = obj.getString("shoppingCartIDList");
        String[] getStrList = getStr.substring(1, getStr.length()-1).split(",");
        int[] shoppingCartIDList = new int[getStrList.length];
        for(int i = 0; i < getStrList.length; i++) {
            shoppingCartIDList[i] = Integer.parseInt(getStrList[i].trim());
            System.out.println(shoppingCartIDList[i]);
        }
        return orderService.getGoodsList(shoppingCartIDList);
    }

    /**
     * @Author: SmallPang
     * @Description: 添加订单信息
     * @Date: 2020/2/26
     * @Param order: 订单实体
     * @return: com.pang.front.Model.Result
     **/
    @PostMapping(value = "/submitOrder")
    public Result submitOrder(@RequestBody JSONObject obj) {
        Order order = new Order();
        String key = "orderNum";
        long orderNum = 202002231653L;
        if (!redisUtil.hasKey(key)) {
            redisUtil.set(key, orderNum);//INIT_ID是自己设置的初始值
        }
        order.setOrderID(redisUtil.incr(key, 1));//存在就生成+1的订单号
        order.setUserID(Integer.parseInt(obj.getString("userID")));
        order.setConsigneeName(obj.getString("consigneeName"));
        order.setConsigneePhone(obj.getString("consigneePhone"));
        order.setConsigneeAddress(obj.getString("consigneeAddress"));
        order.setSubscriberName(obj.getString("subscriberName"));
        order.setSubscriberPhone(obj.getString("subscriberPhone"));
        order.setDeliveryDate(obj.getString("deliveryDate"));
        order.setGreetingMessage(obj.getString("greetingMessage"));
        order.setOrderPriceSum(Double.parseDouble(obj.getString("orderPriceSum")));
        String getStr = obj.getString("goodsIDList");
        String[] idList = getStr.substring(1, getStr.length()-1).split(",");
        String sumStr = obj.getString("goodsIDSumList");
        String[] sumList = sumStr.substring(1, sumStr.length()-1).split(",");
        IDSum idSum = new IDSum();
        List<IDSum> idSumList = new ArrayList<>();
        for (int i = 0; i < idList.length; i++) {
            idSum.setGoodsID(Integer.parseInt(idList[i].trim()));
            idSum.setGoodsSum(Integer.parseInt(sumList[i].trim()));
            idSumList.add(i,idSum);
        }
        return orderService.submitOrder(order, idSumList);
    }

    @PostMapping(value = "/checkGoodsListInventory")
    public Result checkGoodsListInventory(@RequestBody JSONObject obj) {
        String getList = obj.getString("goodsIDList");
        System.out.println("getList:" + getList);
        String[] goodsIDListString = getList.substring(1, getList.length()-1).split(",");
        System.out.println("goodsIDListString" + goodsIDListString);
        String sumStr = obj.getString("goodsIDSumList");
        String[] sumList = sumStr.substring(1, sumStr.length()-1).split(",");
        IDSum idSum = new IDSum();
        List<IDSum> idSumList = new ArrayList<>();
        for (int i = 0; i < goodsIDListString.length; i++) {
            idSum.setGoodsID(Integer.parseInt(goodsIDListString[i].trim()));
            idSum.setGoodsSum(Integer.parseInt(sumList[i].trim()));
            idSumList.add(i,idSum);
        }
        return orderService.checkGoodsListInventory(idSumList);
    }

    /**
     * @Author: SmallPang
     * @Description: 确定收货
     * @Date: 2020/2/27
     * @Param obj: 订单ID
     * @return: com.pang.front.Model.Result
     **/
    @PostMapping(value = "/confirmOrderID")
    public Result confirmOrderID(@RequestBody JSONObject obj) {
        Long orderID = Long.parseLong(obj.getString("orderID"));
        return orderService.confirmOrderID(orderID);
    }

    @PostMapping(value = "/paymentOrderID")
    public ModelAndView paymentOrderID(@RequestBody JSONObject obj) {
        Long orderID = Long.parseLong(obj.getString("orderID"));
        Double orderPriceSum = Double.parseDouble(obj.getString("orderPriceSum"));
        ModelAndView modelAndView = new ModelAndView("redirect:/goAlipay/?price=" + orderPriceSum + "&orderID=" + orderID);
        return modelAndView;
    }

    @PostMapping(value = "/cancelOrderID")
    public Result cancelOrderID(@RequestBody JSONObject obj) {
        Long orderID = Long.parseLong(obj.getString("orderID"));
        return orderService.cancelOrderID(orderID);
    }

    /**
     * @Author: SmallPang
     * @Description: 返回所有订单信息
     * @Date: 2020/3/3
     * @Param obj: 用户ID
     * @return: java.util.List<com.pang.front.Model.Order>
     **/
    @PostMapping(value = "/getAllOrder")
    public List<Order> getAllOrder(@RequestBody JSONObject obj) {
        Integer userID = Integer.parseInt(obj.getString("userID"));
        return orderService.getAllOrder(userID);
    }

    /**
     * @Author: SmallPang
     * @Description: 返回某个订单的所有信息
     * @Date: 2020/3/3
     * @Param obj: 订单ID
     * @return: com.pang.front.Model.Order
     **/
    @PostMapping(value = "/getOrderInfo")
    public Order getOrderInfo(@RequestBody JSONObject obj) {
        Long orderID = Long.parseLong(obj.getString("orderID"));
        return orderService.getOrderInfo(orderID);
    }

    /**
     * @Author: SmallPang
     * @Description: 返回订单的所有商品
     * @Date: 2020/3/3
     * @Param obj: 订单ID
     * @return: java.util.List<com.pang.front.Model.OrderGoods>
     **/
    @PostMapping(value = "/selectGoodsList")
    public List<OrderGoods> selectGoodsList(@RequestBody JSONObject obj) {
        Long orderID = Long.parseLong(obj.getString("orderID"));
        return orderService.selectGoodsList(orderID);
    }

    /**
     * @Author: SmallPang
     * @Description: 评价时查找订单的状态
     * @Date: 2020/3/3
     * @Param obj: 订单ID
     * @return: com.pang.front.Model.Result
     **/
    @PostMapping(value = "/selectOrderStatus")
    public Result selectOrderStatus(@RequestBody JSONObject obj) {
        Long orderID = Long.parseLong(obj.getString("orderID"));
        return orderService.selectOrderStatus(orderID);
    }

    @PostMapping(value = "/deleteOrder")
    public Result deleteOrder(@RequestBody JSONObject obj) {
        Long orderID = Long.parseLong(obj.getString("orderID"));
        return orderService.deleteOrder(orderID);
    }
}
