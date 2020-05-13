package com.pang.back.Controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.pang.back.Model.Result;
import com.pang.back.Model.UserInfo;
import com.pang.back.service.UserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;

@RestController
@RequestMapping("/userInfo")
public class UserInfoController {
    @Reference
    UserInfoService userInfoService;

    @PostMapping(value = "/selectUserInfoByID")
    public Result selectUserInfoByID(@RequestBody JSONObject obj) {
        return userInfoService.selectUserInfoByID(Integer.parseInt(obj.get("userID").toString()));
    }

    /**
     * @Author: SmallPang
     * @Description: 模糊查询
     * @Date: 2019/12/6
     * @Param obj: 关键字
     * @return: com.github.pagehelper.PageInfo<com.pang.back.Model.UserInfo>
     **/
    @RequestMapping(value = "/fuzzySelectUserInfo", method = RequestMethod.POST)
    public PageInfo<UserInfo> fuzzySelectUserInfo(@RequestBody JSONObject obj) {
        int pageNum = Integer.parseInt(obj.get("pageNum").toString());
        int pageSize = Integer.parseInt(obj.get("pageSize").toString());
        String fuzzyData = obj.get("fuzzyData").toString();
        return userInfoService.fuzzySelectUserInfo(pageNum, pageSize, fuzzyData);
    }

    /**
     * @Author: SmallPang
     * @Description: 删除用户信息
     * @Date: 2019/12/5
     * @Param userID: 用户ID
     * @return: com.pang.back.Model.Result
     **/
    @RequestMapping(value = "/deleteUserInfo", method = RequestMethod.POST)
    public Result deleteUserInfo(@RequestBody JSONObject obj) {
        Integer userID = Integer.parseInt(obj.get("userID").toString());
        return userInfoService.deleteUserInfo(userID);
    }

    /**
     * @Author: SmallPang
     * @Description: 修改用户信息
     * @Date: 2019/12/5
     * @Param userInfo: 用户信息
     * @return: com.pang.back.Model.Result
     **/
    @RequestMapping(value = "/updateUserInfo", method = RequestMethod.POST)
    public Result updateUserInfo(
            @RequestParam(value = "file", required=false) MultipartFile file,
            @RequestParam(value = "userID")Integer userID,
            @RequestParam(value = "userName")String userName,
            @RequestParam(value = "userSex")String userSex,
            @RequestParam(value = "userBirthday")String userBirthday,
            @RequestParam(value = "userHeadPortrait")String userHeadPortrait,
            @RequestParam(value = "userAddress")String userAddress
    ) throws IOException{
        String src = null;
        String filename = null;
        UserInfo userInfo = new UserInfo();
        userInfo.setUserID(userID);
        userInfo.setUserName(userName);
        userInfo.setUserSex(userSex);
        userInfo.setUserBirthday(userBirthday);
        userInfo.setUserHeadPortrait(userHeadPortrait);
        userInfo.setUserAddress(userAddress);
        if (file != null) {
            src = "http://localhost:8889/";
            filename = file.getOriginalFilename();
            // 自定义的文件名称
            String trueFileName = userID + "_" + filename;
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
        return userInfoService.updateUserInfo(userInfo);
    }


    /**
     * @Author: SmallPang
     * @Description: 添加用户信息
     * @Date: 2019/12/5
     * @Param userInfo: 用户信息
     * @return: com.pang.back.Model.Result
     **/
    @RequestMapping(value = "/addUserInfo", method = RequestMethod.POST)
    public Result addUserInfo(
            @RequestParam(value = "file", required=false) MultipartFile file,
            @RequestParam(value = "userID")Integer userID,
            @RequestParam(value = "userName")String userName,
            @RequestParam(value = "userSex")String userSex,
            @RequestParam(value = "userBirthday")String userBirthday,
            @RequestParam(value = "userHeadPortrait")String userHeadPortrait,
            @RequestParam(value = "userAddress")String userAddress
    ) throws IOException {
        UserInfo userInfo = new UserInfo();
        userInfo.setUserID(userID);
        userInfo.setUserName(userName);
        userInfo.setUserSex(userSex);
        userInfo.setUserBirthday(userBirthday);
        userInfo.setUserHeadPortrait(userHeadPortrait);
        userInfo.setUserAddress(userAddress);
        if (file != null) {
            String src = "http://localhost:8889/";
            String filename = file.getOriginalFilename();
            System.out.println("文件名" + filename);
            // 自定义的文件名称
            String trueFileName = userID + "_" + filename;
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
        return userInfoService.addUserInfo(userInfo);
    }

    /**
     * @Author: SmallPang
     * @Description: 批量删除用户信息
     * @Date: 2019/12/6
     * @Param obj: 用户ID数组
     * @return: com.pang.back.Model.Result
     **/
    @RequestMapping(value = "/batchDelete", method = RequestMethod.POST)
    public Result batchDelete(@RequestBody JSONObject obj) {
        String str = obj.get("checksIdArray").toString();
        str = str.substring(1,str.length()-1);
        String[] array = str.split(",");
        int[] intArr = new int[array.length];
        for(int i = 0; i < array.length; i++) {
            intArr[i] = Integer.parseInt(array[i].trim());
        }
        return userInfoService.batchDelete(intArr);
    }

    /**
     * 搜索全部人员信息表数据
     * @Param pageNum：页号
     * @Param pageSize： 页大小
     * */
    @RequestMapping(value = "/getAllUserInfo", method = RequestMethod.POST)
    public PageInfo<UserInfo> getAllUserInfo(@RequestBody JSONObject obj) {
        int pageNum = Integer.parseInt(obj.get("pageNum").toString());
        int pageSize = Integer.parseInt(obj.get("pageSize").toString());
        return userInfoService.getAllUserInfo(pageNum, pageSize);
    }
}
