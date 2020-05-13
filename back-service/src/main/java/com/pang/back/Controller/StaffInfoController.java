package com.pang.back.Controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.pang.back.Model.Result;
import com.pang.back.Model.StaffInfo;
import com.pang.back.service.StaffInfoService;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.util.List;

@RestController
@RequestMapping(value = "/staffInfo")
public class StaffInfoController {
    @Reference
    StaffInfoService staffInfoService;

    /**
     * @Author: SmallPang
     * @Description: 修改头像
     * @Date: 2019/12/24
     * @Param file: 头像文件
     * @Param staffID: 员工号
     * @return: com.pang.back.Model.Result
     **/
    @PostMapping(value = "/changeHeadPortrait")
    public Result changeHeadPortrait(
            @RequestParam(value = "file", required = false) MultipartFile file,
            @RequestParam(value = "staffID") Integer staffID
    ) throws IOException{
        StaffInfo staffInfo = new StaffInfo();
        staffInfo.setStaffID(staffID);
        if (file != null) {
            String src = "http://localhost:8889/";
            String filename = file.getOriginalFilename();
            String[] fileType = filename.split("\\.");
            String type = fileType[fileType.length - 1];
            // 自定义的文件名称
            String trueFileName = staffID + "_" + "HeadPortrait." + type;
            staffInfo.setStaffHeadPortrait(src + trueFileName);
            String path = "G:\\nginx\\img\\" + trueFileName;
            File dest = new File(path);
            if (!dest.getParentFile().exists()) {
                System.out.println("文件路径不存在");
            }
            file.transferTo(dest);
        } else {
            System.out.println("文件为空");
        }
        return staffInfoService.changeHeadPortrait(staffInfo);
    }

    /**
     * @Author: SmallPang
     * @Description: 获取个人信息
     * @Date: 2019/12/24
     * @Param principal: principal对象
     * @return: com.pang.back.Model.Result
     **/
    @PostMapping(value = "/getPersonInfo")
    public Result getPersonInfo(Principal principal) {
        Integer staffID = Integer.parseInt(principal.getName());
        return staffInfoService.getPersonInfo(staffID);
    }

    /**
     * @Author: SmallPang
     * @Description: 根据ID查找店员信息
     * @Date: 2019/12/23
     * @Param obj: 员工号
     * @return: com.pang.back.Model.Result
     **/
    @PostMapping(value = "/selectStaffInfoByID")
    public Result selectStaffInfoByID(@RequestBody JSONObject obj) {
        return staffInfoService.selectStaffInfoByID(Integer.parseInt(obj.get("staffID").toString()));
    }

    /**
     * @Author: SmallPang
     * @Description: 模糊查询
     * @Date: 2019/12/23
     * @Param obj: 关键字
     * @return: com.github.pagehelper.PageInfo<com.pang.back.Model.StaffInfo>
     **/
    @PostMapping(value = "/fuzzySelectStaffInfo")
    public PageInfo<StaffInfo> fuzzySelectStaffInfo(@RequestBody JSONObject obj) {
        int pageNum = Integer.parseInt(obj.get("pageNum").toString());
        int pageSize = Integer.parseInt(obj.get("pageSize").toString());
        String fuzzyData = obj.get("fuzzyData").toString();
        return staffInfoService.fuzzySelectStaffInfo(pageNum, pageSize, fuzzyData);
    }

    /**
     * @Author: SmallPang
     * @Description: 删除店员信息
     * @Date: 2019/12/23
     * @Param obj: 员工号
     * @return: com.pang.back.Model.Result
     **/
    @PostMapping(value = "/deleteStaffInfo")
    public Result deleteStaffInfo(@RequestBody JSONObject obj) {
        return staffInfoService.deleteStaffInfo(Integer.parseInt(obj.get("staffID").toString()));
    }

    /**
     * @Author: SmallPang
     * @Description: 修改店员信息
     * @Date: 2019/12/23
     * @Param file: 本地上传头像二进制文件
     * @Param staffID: 员工号
     * @Param staffName: 员工姓名
     * @Param staffSex: 员工性别
     * @Param staffBirthday: 员工生日
     * @Param staffPhone: 员工手机号码
     * @Param staffHeadPortrait: 员工头像
     * @Param staffAddress: 员工地址
     * @return: com.pang.back.Model.Result
     **/
    @PostMapping(value = "/updateStaffInfo")
    public Result updateStaffInfo(
            @RequestParam(value = "file", required=false) MultipartFile file,
            @RequestParam(value = "staffID")Integer staffID,
            @RequestParam(value = "staffName")String staffName,
            @RequestParam(value = "staffSex")String staffSex,
            @RequestParam(value = "staffBirthday")String staffBirthday,
            @RequestParam(value = "staffPhone")String staffPhone,
            @RequestParam(value = "staffHeadPortrait")String staffHeadPortrait,
            @RequestParam(value = "staffAddress")String staffAddress
    ) throws IOException {
        String src = null;
        String filename = null;
        StaffInfo staffInfo = new StaffInfo();
        staffInfo.setStaffID(staffID);
        staffInfo.setStaffName(staffName);
        staffInfo.setStaffSex(staffSex);
        staffInfo.setStaffBirthday(staffBirthday);
        staffInfo.setStaffPhone(staffPhone);
        staffInfo.setStaffHeadPortrait(staffHeadPortrait);
        staffInfo.setStaffAddress(staffAddress);
        if (file != null) {
            src = "http://localhost:8889/";
            filename = file.getOriginalFilename();
            System.out.println("filename:" + filename);
            String[] fileType = filename.split("\\.");
            String type = fileType[fileType.length - 1];
            // 自定义的文件名称
            String trueFileName = staffID + "_" + "HeadPortrait." + type;
            staffInfo.setStaffHeadPortrait(src + trueFileName);
            String path = "G:\\nginx\\img\\" + trueFileName;
            File dest = new File(path);
            if (!dest.getParentFile().exists()) {
                System.out.println("文件路径不存在");
            }
            file.transferTo(dest);
        } else {
            System.out.println("文件为空");
        }
        return staffInfoService.updateStaffInfo(staffInfo);
    }

    /**
     * @Author: SmallPang
     * @Description: 添加店员信息
     * @Date: 2019/12/23
     * @Param file: 本地上传头像二进制文件
     * @Param staffID: 员工号
     * @Param staffName: 员工姓名
     * @Param staffSex: 员工性别
     * @Param staffBirthday: 员工生日
     * @Param staffPhone: 员工手机号码
     * @Param staffHeadPortrait: 员工头像
     * @Param staffAddress: 员工地址
     * @return: com.pang.back.Model.Result
     **/
    @PostMapping(value = "/addStaffInfo")
    public Result addStaffInfo(
            @RequestParam(value = "file", required=false) MultipartFile file,
            @RequestParam(value = "staffID")Integer staffID,
            @RequestParam(value = "staffName")String staffName,
            @RequestParam(value = "staffSex")String staffSex,
            @RequestParam(value = "staffBirthday")String staffBirthday,
            @RequestParam(value = "staffPhone")String staffPhone,
            @RequestParam(value = "staffHeadPortrait")String staffHeadPortrait,
            @RequestParam(value = "staffAddress")String staffAddress
    ) throws IOException {
        StaffInfo staffInfo = new StaffInfo();
        staffInfo.setStaffID(staffID);
        staffInfo.setStaffName(staffName);
        staffInfo.setStaffSex(staffSex);
        staffInfo.setStaffBirthday(staffBirthday);
        staffInfo.setStaffPhone(staffPhone);
        staffInfo.setStaffHeadPortrait(staffHeadPortrait);
        staffInfo.setStaffAddress(staffAddress);
        if (file != null) {
            String src = "http://localhost:8889/";
            String filename = file.getOriginalFilename();
            String[] fileType = filename.split("\\.");
            String type = fileType[fileType.length - 1];
            // 自定义的文件名称
            String trueFileName = staffID + "_" + "HeadPortrait." + type;
            staffInfo.setStaffHeadPortrait(src + trueFileName);
            String path = "G:\\nginx\\img\\" + trueFileName;
            File dest = new File(path);
            if (!dest.getParentFile().exists()) {
                System.out.println("文件路径不存在");
            }
            file.transferTo(dest);
        } else {
            System.out.println("文件为空");
        }
        return staffInfoService.addStaffInfo(staffInfo);
    }

    /**
     * @Author: SmallPang
     * @Description: 批量删除店员信息
     * @Date: 2019/12/23
     * @Param obj: 批量删除店员ID数组
     * @return: com.pang.back.Model.Result
     **/
    @PostMapping(value = "/batchDelete")
    public Result batchDelete(@RequestBody JSONObject obj) {
        String str = obj.get("checksIdArray").toString();
        str = str.substring(1,str.length()-1);
        String[] array = str.split(",");
        int[] intArr = new int[array.length];
        for(int i = 0; i < array.length; i++) {
            intArr[i] = Integer.parseInt(array[i].trim());
        }
        return staffInfoService.batchDelete(intArr);
    }

    /**
     * @Author: SmallPang
     * @Description: 搜索全部人员信息表数据
     * @Date: 2019/12/23
     * @Param obj: pageNum：页号；pageSize： 页大小
     * @return: com.github.pagehelper.PageInfo<com.pang.back.Model.StaffInfo>
     **/
    @PostMapping(value = "/getAllStaffInfo")
    public PageInfo<StaffInfo> getAllUserInfo(@RequestBody JSONObject obj) {
        int pageNum = Integer.parseInt(obj.get("pageNum").toString());
        int pageSize = Integer.parseInt(obj.get("pageSize").toString());
        return staffInfoService.getAllStaffInfo(pageNum, pageSize);
    }
}
