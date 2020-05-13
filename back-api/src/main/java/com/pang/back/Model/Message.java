package com.pang.back.Model;

import lombok.Data;

import java.io.Serializable;

@Data
public class Message implements Serializable {
    private Integer messageID;
    private Integer senderID;
    private String messageContent;
    private String messageTime;
}
