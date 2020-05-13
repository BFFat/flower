package com.pang.back.Model;

import lombok.Data;

import java.io.Serializable;

@Data
public class StaffInfo implements Serializable {
    private Integer staffID;
    private String staffName;
    private String staffSex;
    private String staffBirthday;
    private String staffPhone;
    private String staffHeadPortrait;
    private String staffAddress;
    private String staffInfoUpdateTime;
}

