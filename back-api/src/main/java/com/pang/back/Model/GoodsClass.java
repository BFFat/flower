package com.pang.back.Model;

import lombok.Data;

import java.io.Serializable;

@Data
public class GoodsClass implements Serializable {
    private Integer goodsClassID;
    private String goodsClassName;
    private String goodsClassLevel;
    private String goodsClassParent;
    private Boolean goodsClassShow;
    private int goodsClassSort;
    private String goodsClassUpdateTime;
}