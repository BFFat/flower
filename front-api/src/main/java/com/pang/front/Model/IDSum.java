package com.pang.front.Model;

import lombok.Data;

import java.io.Serializable;

@Data
public class IDSum implements Serializable {
    private Integer goodsID;
    private int goodsSum;
}
