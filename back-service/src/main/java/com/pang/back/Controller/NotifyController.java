package com.pang.back.Controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.alibaba.fastjson.JSONObject;
import com.pang.back.Model.Message;
import com.pang.back.Model.Result;
import com.pang.back.Model.StaffMessage;
import com.pang.back.service.NotifyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;


@RestController
@RequestMapping(value = "/notify")
public class NotifyController {
    @Reference
    NotifyService notifyService;

    /**
     * @Author: SmallPang
     * @Description: 添加通知
     * @Date: 2019/12/28
     * @Param obj: 通知消息
     * @return: com.pang.back.Model.Result
     **/
    @PostMapping(value = "/sentNotify")
    public Result sentNotify(@RequestBody JSONObject obj) {
        Integer senderID = Integer.parseInt(obj.get("senderID").toString());
        String notifyContent = obj.get("notifyContent").toString();
        return notifyService.sentNotify(senderID, notifyContent);
    }

    /**
     * @Author: SmallPang
     * @Description: 查看全部通知消息
     * @Date: 2019/12/28
     * @return: java.util.List<com.pang.back.Model.Message>
     **/
    @PostMapping(value = "/showAllMessage")
    public List<Message> showAllMessage() {
        return notifyService.getAllMessage();
    }

    /**
     * @Author: SmallPang
     * @Description: 删除通知消息
     * @Date: 2019/12/28
     * @Param obj: 消息ID
     * @return: com.pang.back.Model.Result
     **/
    @PostMapping(value = "/deleteMessage")
    public Result deleteMessage(@RequestBody JSONObject obj) {
        Integer messageID = Integer.parseInt(obj.get("messageID").toString());
        return notifyService.deleteMessage(messageID);
    }

    /**
     * @Author: SmallPang
     * @Description: 获取未读消息数量
     * @Date: 2019/12/28
     * @Param obj: 员工ID
     * @return: int
     **/
    @PostMapping(value = "/getUnreadMessageNum")
    public int getUnreadMessageNum(@RequestBody JSONObject obj) {
        Integer staffID = Integer.parseInt(obj.get("staffID").toString());
        return notifyService.getUnreadMessageNum(staffID);
    }

    @PostMapping(value = "/getAllStaffMessage")
    public List<StaffMessage> getAllStaffMessage(@RequestBody JSONObject obj) {
        Integer staffID = Integer.parseInt(obj.get("staffID").toString());
        return notifyService.getAllStaffMessage(staffID);
    }

    @PostMapping(value = "/deleteStaffMessage")
    public Result deleteStaffMessage(@RequestBody JSONObject obj) {
        Integer staffMessageID = Integer.parseInt(obj.get("staffMessageID").toString());
        return notifyService.deleteStaffMessage(staffMessageID);
    }

    @PostMapping(value = "/markRead")
    public Result markRead(@RequestBody JSONObject obj) {
        Integer staffMessageID = Integer.parseInt(obj.get("staffMessageID").toString());
        return notifyService.markRead(staffMessageID);
    }

    @PostMapping(value = "/markAllRead")
    public Result markAllRead(@RequestBody JSONObject obj) {
        Integer staffID = Integer.parseInt(obj.get("staffID").toString());
        return notifyService.markAllRead(staffID);
    }

    @PostMapping(value = "/deleteAllStaffMessage")
    public Result deleteAllStaffMessage(@RequestBody JSONObject obj) {
        Integer staffID = Integer.parseInt(obj.get("staffID").toString());
        return notifyService.deleteAllStaffMessage(staffID);
    }

    @PostMapping(value = "/deleteAllMessage")
    public Result deleteAllMessage() {
        return notifyService.deleteAllMessage();
    }
}
