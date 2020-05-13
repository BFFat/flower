package com.pang.front.Model;

import lombok.Data;

import java.io.Serializable;

@Data
public class Evaluate implements Serializable {
    private Integer evaluateID;
    private Integer goodsID;
    private Integer userID;
    private Long orderID;
    private String evaluateContent;
    private String evaluateImageList;
    private Double goodsPrice;
    private String goodsName;
    private String goodsImageList;
    private String userName;
    private String userHeadPortrait;
    private String evaluateUpdateTime;
}
