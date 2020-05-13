package com.pang.back.Model;

import lombok.Data;

import java.io.Serializable;

@Data
public class UserInfo implements Serializable {
    private Integer userID;
    private String userName;
    private String userSex;
    private String userBirthday;
    private String userHeadPortrait;
    private String userAddress;
    private String userInfoUpdateTime;
}