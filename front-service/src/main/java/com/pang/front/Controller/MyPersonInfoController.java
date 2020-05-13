package com.pang.front.Controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.alibaba.fastjson.JSONObject;
import com.pang.back.Model.Result;
import com.pang.back.Model.StaffInfo;
import com.pang.back.Model.UserInfo;
import com.pang.back.service.UserInfoService;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

@RestController
@RequestMapping(value = "/myPersonInfo")
public class MyPersonInfoController {
    @Reference
    UserInfoService userInfoService;

    @PostMapping(value = "/getUserAllInfo")
    public UserInfo getUserAllInfo(@RequestBody JSONObject obj) {
        Integer userID = Integer.parseInt(obj.getString("userID"));
        return userInfoService.getUserInfo(userID);
    }

    @PostMapping(value = "/changeHeadPortrait")
    public Result changeHeadPortrait(
            @RequestParam(value = "file", required = false) MultipartFile file,
            @RequestParam(value = "userID") Integer userID
    ) throws IOException {
        UserInfo userInfo = new UserInfo();
        userInfo.setUserID(userID);
        if (file != null) {
            String src = "http://localhost:8889/";
            String filename = file.getOriginalFilename();
            String[] fileType = filename.split("\\.");
            String type = fileType[fileType.length - 1];
            // 自定义的文件名称
            String trueFileName = userID + "_" + "HeadPortrait." + type;
            userInfo.setUserHeadPortrait(src + trueFileName);
            String path = "G:\\nginx\\img\\" + trueFileName;
            File dest = new File(path);
            if (!dest.getParentFile().exists()) {
                System.out.println("文件路径不存在");
            }
            file.transferTo(dest);
        } else {
            System.out.println("文件为空");
        }
        return userInfoService.changeHeadPortrait(userInfo);
    }

    @PostMapping(value = "/addUserInfo")
    public Result addUserInfo(@RequestBody JSONObject obj) {
        Integer userID = Integer.parseInt(obj.getString("userID"));
        String userName = obj.getString("userName");
        String userSex = obj.getString("userSex");
        String userBirthday = obj.getString("userBirthday");
        String userAddress = obj.getString("userAddress");
        UserInfo userInfo = new UserInfo();
        userInfo.setUserID(userID);
        userInfo.setUserName(userName);
        if (userSex != null && !userSex.equals("")) {
            userInfo.setUserSex(userSex);
        }
        if (userBirthday != null && !userBirthday.equals("")) {
            userInfo.setUserBirthday(userBirthday);
        }
        if (userAddress != null && !userAddress.equals("")) {
            userInfo.setUserAddress(userAddress);
        }
        System.out.println("userInfo: " + userInfo);
        return userInfoService.updateFrontUserInfo(userInfo);
    }
}
