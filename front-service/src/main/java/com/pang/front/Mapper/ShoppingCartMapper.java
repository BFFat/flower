package com.pang.front.Mapper;

import com.pang.front.Model.ShoppingCart;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface ShoppingCartMapper {
    @Select("select s.shoppingCartID, g.goodsName, g.goodsPrice, g.goodsImageList, s.goodsSum, g.goodsInventory from shoppingCart s, goods g where g.goodsID IN (select goodsID from shoppingCart where userID = #{userID}) and g.goodsID = s.goodsID")
    List<ShoppingCart> getUserShoppingCart(String userID);

    @Delete("delete from shoppingCart where shoppingCartID = #{shoppingCartID}")
    int deleteShoppingCart(String shoppingCartID);

    @Update("update shoppingCart set goodsSum = #{goodsSum} where shoppingCartID = #{shoppingCartID}")
    int changeGoodsSum(Integer shoppingCartID, Integer goodsSum);

    @Insert("insert into shoppingCart(userID, goodsID, goodsSum) values(#{userID}, #{goodsID}, #{goodsSum})")
    int addToShoppingCart(Integer userID, Integer goodsID, int goodsSum);

    @Select("select * from shoppingCart where userID = #{userID} and goodsID = #{goodsID}")
    ShoppingCart selectExistShoppingCart(Integer userID, Integer goodsID);

    @Update("update shoppingCart set goodsSum = goodsSum + #{goodsSum} where shoppingCartID = #{shoppingCartID}")
    int addShoppingCartGoodsSum(Integer shoppingCartID, int goodsSum);
}
