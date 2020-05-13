package com.pang.front.Model;

import lombok.Data;
import java.io.Serializable;

@Data
public class OrderGoods implements Serializable {
    private Integer goodsID;
    private String goodsName;
    private Double goodsPrice;
    private int goodsPresentExp;
    private String goodsImageList;
    private int goodsSum;
}
