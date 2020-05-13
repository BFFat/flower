package com.pang.front.Model;

import lombok.Data;

import java.io.Serializable;
import java.util.List;

@Data
public class Order implements Serializable {
    private Long orderID;
    private Integer userID;
    private int[] goodsIDList;
    private String consigneeName;
    private String consigneePhone;
    private String consigneeAddress;
    private String subscriberName;
    private String subscriberPhone;
    private String deliveryDate;
    private String greetingMessage;
    private String orderStatus;
    private Double orderPriceSum;
    private String goodsImageList;
    private String orderUpdateTime;
}
