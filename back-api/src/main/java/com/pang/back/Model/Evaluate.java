package com.pang.back.Model;

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
    private String evaluateUpdateTime;
}
