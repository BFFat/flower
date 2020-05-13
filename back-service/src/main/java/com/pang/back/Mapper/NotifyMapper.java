package com.pang.back.Mapper;

import com.pang.back.Model.Message;
import com.pang.back.Model.Staff;
import com.pang.back.Model.StaffMessage;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface NotifyMapper {

    @Insert("insert into notifyMessage(senderID, messageContent) values(#{senderID}, #{messageContent})")
    int addNotifyMessage(Integer senderID, String messageContent);

    @Select("select * from notifyMessage order by messageID desc")
    List<Message> getAllMessage();

    @Delete("delete from notifyMessage where messageID = #{messageID}")
    int deleteMessage(Integer messageID);

    @Select("select staffID from staff")
    List<Staff> getAllStaffID();

    @Insert("insert into staffMessage(staffID, senderID, staffMessageContent, staffMessageStatus) values(#{staffID}, #{senderID}, #{staffMessageContent}, #{staffMessageStatus})")
    void addStaffMessage(Integer staffID, Integer senderID, String staffMessageContent, int staffMessageStatus);

    @Select("select count(*) from staffMessage where staffID = #{staffID} and staffMessageStatus = #{staffMessageStatus}")
    int getUnreadMessageNum(Integer staffID, int staffMessageStatus);

    @Select("select staffMessageID, staffName, staffHeadPortrait, staffMessageContent, staffMessageStatus, staffMessageTime from staffInfo, staffMessage where staffMessage.staffID = #{staffID} and staffInfo.staffID = staffMessage.senderID order by staffMessageID desc")
    List<StaffMessage> getAllStaffMessage(Integer staffID);

    @Delete("delete from staffMessage where staffMessageID = #{staffMessageID}")
    int deleteStaffMessage(Integer staffMessageID);

    @Update("update staffMessage set staffMessageStatus = 1 where staffMessageID = #{staffMessageID}")
    int markRead(Integer staffMessageID);

    @Select("select count(*) from staffMessage where staffID = #{staffID}")
    int getStaffMessageItemNum(Integer staffID);

    @Delete("delete from staffMessage where staffID = #{staffID}")
    int deleteAllStaffMessage(Integer staffID);

    @Update("update staffMessage set staffMessageStatus = 1 where staffID = #{staffID}")
    int markAllRead(Integer staffID);

    @Select("select count(*) from notifyMessage")
    int getMessageItemNum();

    @Delete("delete from notifyMessage")
    int deleteAllMessage();
}
