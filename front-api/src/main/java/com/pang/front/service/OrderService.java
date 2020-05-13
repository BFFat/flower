package com.pang.front.service;

import com.github.pagehelper.PageInfo;
import com.pang.back.Model.Goods;
import com.pang.front.Model.IDSum;
import com.pang.front.Model.Order;
import com.pang.front.Model.OrderGoods;
import com.pang.front.Model.Result;

import java.util.List;
import java.util.Map;

public interface OrderService {
    List<OrderGoods> getGoodsList(int[] shoppingCartIDList);

    Result submitOrder(Order order, List<IDSum> idSumList);

    Result confirmOrderID(Long orderID);

    Result paymentOrderID(Long orderID, Double orderPriceSum);
    
    List<Order> getAllOrder(Integer userID);

    Order getOrderInfo(Long orderID);

    List<OrderGoods> selectGoodsList(Long orderID);

    Result selectOrderStatus(Long orderID);

    Result checkGoodsListInventory(List<IDSum> idSumList);

    Result cancelOrderID(Long orderID);

    Result rollbackInventory(Long orderID);

    Result deleteOrder(Long orderID);

    PageInfo<Order> selectAllOrder(Integer pageNum, Integer pageSize);

    Result batchDelete(Long[] intArr);

    PageInfo<Order> fuzzySelectOrder(int pageNum, int pageSize, String fuzzyData);

    Result deleteOrderByOrderID(Long orderID);

    Order selectOrderDetailed(Long orderID);

    List<OrderGoods> getGoodsListByOrderID(Long orderID);
}
