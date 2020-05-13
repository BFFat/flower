package com.pang.front.service;

import com.pang.front.Model.Result;
import com.pang.front.Model.ShoppingCart;

import java.util.List;

public interface ShoppingCartService {
    List<ShoppingCart> getUserShoppingCart(String userID);

    Result deleteShoppingCart(String shoppingCartID);

    Result changeGoodsSum(Integer shoppingCartID, Integer goodsSum);

    Result addToShoppingCart(Integer userID, Integer goodsID, int goodsSum);
}
