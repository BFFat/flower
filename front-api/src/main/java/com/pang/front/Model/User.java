package com.pang.front.Model;

import lombok.Data;

import java.io.Serializable;

@Data
public class User implements Serializable {
    private Integer userID;
    private String userPhone;
    private String userPassword;
    private String userStatus;
    private String userUpdateTime;
}
