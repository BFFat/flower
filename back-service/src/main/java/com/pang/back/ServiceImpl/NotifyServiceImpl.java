package com.pang.back.ServiceImpl;

import com.alibaba.dubbo.config.annotation.Service;
import com.pang.back.Mapper.NotifyMapper;
import com.pang.back.Model.Message;
import com.pang.back.Model.Result;
import com.pang.back.Model.Staff;
import com.pang.back.Model.StaffMessage;
import com.pang.back.service.NotifyService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

@Service
public class NotifyServiceImpl implements NotifyService {
    @Autowired
    private NotifyMapper notifyMapper;

    /**
     * @Author: SmallPang
     * @Description: 添加通知
     * @Date: 2019/12/28
     * @Param messageContent: 通知消息
     * @return: com.pang.back.Model.Result
     **/
    @Override
    public Result sentNotify(Integer senderID, String notifyContent) {
        Result result = new Result();
        result.setMsg("发送通知失败");
        int rtnNum = notifyMapper.addNotifyMessage(senderID, notifyContent);
        if (rtnNum == 1) {
            List<Staff> staffIDList = notifyMapper.getAllStaffID();
            for (Staff staff:staffIDList) {
                notifyMapper.addStaffMessage(staff.getStaffID(), senderID, notifyContent, 0);
            }
            result.setMsg("发送通知成功");
            result.setSuccess(true);
            result.setDetail(notifyContent);
            System.out.println("发送通知成功");
            return result;
        }
        System.out.println("发送通知失败");
        return null;
    }

    /**
     * @Author: SmallPang
     * @Description: 获取全部通知消息
     * @Date: 2019/12/28
     * @return: java.util.List<com.pang.back.Model.Message>
     **/
    @Override
    public List<Message> getAllMessage() {
        return notifyMapper.getAllMessage();
    }

    /**
     * @Author: SmallPang
     * @Description: 删除通知消息
     * @Date: 2019/12/28
     * @Param messageID: 消息ID
     * @return: com.pang.back.Model.Result
     **/
    @Override
    public Result deleteMessage(Integer messageID) {
        Result result = new Result();
        result.setMsg("删除通知消息失败");
        int rtnNum = notifyMapper.deleteMessage(messageID);
        if (rtnNum == 1) {
            result.setMsg("删除通知消息成功");
            result.setSuccess(true);
            result.setDetail(messageID);
            System.out.println("删除通知消息成功");
            return result;
        }
        System.out.println("删除通知消息失败");
        return result;
    }

    /**
     * @Author: SmallPang
     * @Description: 获取未读消息的数量
     * @Date: 2019/12/28
     * @Param staffID: 员工号
     * @return: int
     **/
    @Override
    public int getUnreadMessageNum(Integer staffID) {
        int rtnNum = notifyMapper.getUnreadMessageNum(staffID, 0);
        return rtnNum;
    }

    /**
     * @Author: SmallPang
     * @Description: 通过员工号查找通知消息
     * @Date: 2019/12/28
     * @Param staffID: 员工号
     * @return: java.util.List<com.pang.back.Model.StaffMessage>
     **/
    @Override
    public List<StaffMessage> getAllStaffMessage(Integer staffID) {
        return notifyMapper.getAllStaffMessage(staffID);
    }

    @Override
    public Result deleteStaffMessage(Integer staffMessageID) {
        Result result = new Result();
        result.setMsg("删除员工信息失败");
        int rtnNum = notifyMapper.deleteStaffMessage(staffMessageID);
        if (rtnNum == 1) {
            result.setMsg("删除员工信息成功");
            result.setSuccess(true);
            result.setDetail(staffMessageID);
            System.out.println("删除员工信息成功");
            return result;
        }
        System.out.println("删除员工信息失败");
        return result;
    }

    @Override
    public Result markRead(Integer staffMessageID) {
        Result result = new Result();
        result.setMsg("标为已读失败");
        int rtnNum = notifyMapper.markRead(staffMessageID);
        if (rtnNum == 1) {
            result.setMsg("标为已读成功");
            result.setSuccess(true);
            result.setDetail(staffMessageID);
            System.out.println("标为已读成功");
            return result;
        }
        System.out.println("标为已读失败");
        return result;
    }

    @Override
    public Result deleteAllStaffMessage(Integer staffID) {
        Result result = new Result();
        result.setMsg("全部删除失败");
        int itemNum = notifyMapper.getStaffMessageItemNum(staffID);
        int rtnNum = notifyMapper.deleteAllStaffMessage(staffID);
        if (rtnNum == itemNum) {
            result.setMsg("全部删除成功");
            result.setSuccess(true);
            System.out.println("全部删除成功");
            return result;
        }
        System.out.println("全部删除失败");
        return result;
    }

    @Override
    public Result markAllRead(Integer staffID) {
        Result result = new Result();
        result.setMsg("全部标为已读失败");
        int itemNum = notifyMapper.getStaffMessageItemNum(staffID);
        int rtnNum = notifyMapper.markAllRead(staffID);
        if (rtnNum == itemNum) {
            result.setMsg("全部标为已读成功");
            result.setSuccess(true);
            System.out.println("全部标为已读成功");
            return result;
        }
        System.out.println("全部标为已读失败");
        return null;
    }

    @Override
    public Result deleteAllMessage() {
        Result result = new Result();
        result.setMsg("删除全部通知失败");
        int itemNum = notifyMapper.getMessageItemNum();
        int rtnNum = notifyMapper.deleteAllMessage();
        if (rtnNum == itemNum) {
            result.setMsg("删除全部通知成功");
            result.setSuccess(true);
            System.out.println("删除全部通知成功");
            return result;
        }
        System.out.println("删除全部通知失败");
        return result;
    }
}
