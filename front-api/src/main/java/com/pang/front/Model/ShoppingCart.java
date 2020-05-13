package com.pang.front.Model;

import lombok.Data;

import java.io.Serializable;

@Data
public class ShoppingCart implements Serializable {
    private Integer shoppingCartID;
    private String goodsName;
    private double goodsPrice;
    private String goodsImageList;
    private int goodsSum;
    private int goodsInventory;
    private String shoppingCartUpdateTime;
}
