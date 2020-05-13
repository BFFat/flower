package com.pang.front.Mapper;

import com.pang.back.Model.Goods;
import com.pang.front.Model.IDSum;
import com.pang.front.Model.Order;
import com.pang.front.Model.OrderGoods;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;
import java.util.Map;

@Mapper
@Repository
public interface OrderMapper {
    List<OrderGoods> getGoodsList(int[] shoppingCartIDList);

    int submitOrder(Order order);

    int insertUOTable(@Param("userID") Integer userID, @Param("orderID") Long orderID);

    int insertOGTable(@Param("orderID") Long orderID, @Param("idSumList") List<IDSum> idSumList);

    @Update("update `order` set orderStatus = '待评价' where orderID = #{orderID}")
    int confirmOrderID(Long orderID);

    @Update("update `order` set orderStatus = '待配送' where orderID = #{orderID}")
    int paymentOrderID(Long orderID);

    List<Order> getAllOrder(Integer userID);

    @Select("select * from `order` where orderID = #{orderID}")
    Order getOrderInfo(Long orderID);

    List<OrderGoods> selectGoodsList(@Param("orderID") Long orderID);

    @Select("select orderStatus from `order` where orderID = #{orderID}")
    String selectOrderStatus(Long orderID);

    @Update("update `order` set orderStatus = '待配送' where orderID = #{orderID}")
    int changeOrderStatus(Long orderID);

    @Select("select goodsInventory from goods where goodsID = #{goodsID}")
    int checkGoodsListInventory(Integer goodsID);

    void reduceGoodsSum(List<IDSum> idSumList);

    int cancelOrderID(Long orderID);

    List<OrderGoods> getOrderList(Long orderID);

    int rollbackInventory(List<OrderGoods> goodsIDList);

    @Select("select * from `order` where orderID = #{orderID}")
    Order selectOrderByID(Long orderID);

    @Update("update `order` set orderStatus = '已删除' where orderID = #{orderID}")
    int deleteOrder(Long orderID);

    void deleteShoppingCart(@Param("userID") Integer userID, @Param("idSumList") List<IDSum> idSumList);

    List<Order> selectAllOrder();

    int batchDelete(Long[] intArr);

    List<Order> fuzzySelectOrder(String fuzzyData);

    @Delete("delete from `order` where orderID = #{orderID}")
    int deleteOrderByOrderID(Long orderID);

    Order selectOrderDetailed(Long orderID);

    List<OrderGoods> getGoodsListByOrderID(Long orderID);
}
