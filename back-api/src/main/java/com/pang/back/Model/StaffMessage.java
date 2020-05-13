package com.pang.back.Model;

import lombok.Data;

import java.io.Serializable;

@Data
public class StaffMessage implements Serializable {
    private Integer staffMessageID;
    private String staffName;
    private String staffHeadPortrait;
    private String staffMessageContent;
    private String staffMessageStatus;
    private String staffMessageTime;
}
