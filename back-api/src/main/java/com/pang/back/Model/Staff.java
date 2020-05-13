package com.pang.back.Model;

import lombok.Data;

import java.io.Serializable;

@Data
public class Staff implements Serializable {
    private Integer staffID;
    private String staffPassword;
    private String staffRole;
    private String staffStatus;
    private String staffUpdateTime;
}