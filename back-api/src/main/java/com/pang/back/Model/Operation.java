package com.pang.back.Model;

import lombok.Data;

import java.io.Serializable;

@Data
public class Operation implements Serializable {
    private Integer operationID;
    private Integer operatorID;
    private String operationUrl;
    private String operationMethod;
    private String operationType;
    private String operationIP;
    private String operationUpdateTime;
}
