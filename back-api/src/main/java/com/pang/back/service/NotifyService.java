package com.pang.back.service;

import com.pang.back.Model.Message;
import com.pang.back.Model.Result;
import com.pang.back.Model.StaffMessage;

import java.util.List;

public interface NotifyService {

    Result sentNotify(Integer senderID, String notifyContent);

    List<Message> getAllMessage();

    Result deleteMessage(Integer messageID);

    int getUnreadMessageNum(Integer staffID);

    List<StaffMessage> getAllStaffMessage(Integer staffID);

    Result deleteStaffMessage(Integer staffMessageID);

    Result markRead(Integer staffMessageID);

    Result deleteAllStaffMessage(Integer staffID);

    Result markAllRead(Integer staffID);

    Result deleteAllMessage();
}
