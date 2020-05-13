package com.pang.back.Model;

import lombok.Data;

import java.io.Serializable;

@Data
public class Goods implements Serializable {
    private Integer goodsID;
    private String goodsClassName;
    private String goodsName;
    private String goodsSubTitle;
    private String goodsNumber;
    private Boolean goodsHot;
    private Boolean goodsShelves;
    private double goodsMarketPrice;
    private double goodsPrice;
    private int goodsSales;
    private int goodsInventory;
    private int goodsSort;
    private int goodsPresentExp;
    private String goodsImageList;
    private String goodsDetailedImageList;
    private String goodsUpdateTime;
}