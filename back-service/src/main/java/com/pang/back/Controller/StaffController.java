package com.pang.back.Controller;


import com.alibaba.dubbo.config.annotation.Reference;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.pang.back.Model.Result;
import com.pang.back.Model.Staff;
import com.pang.back.service.StaffService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;


@RestController
@RequestMapping(value = "/staff")
public class StaffController {
    @Reference
    StaffService staffService;

    @PostMapping(value = "/changePassword")
    public Result changePassword(@RequestBody Map map) {
        System.out.println(map);
        return staffService.changePassword(map);
    }

    /**
     * @Author: SmallPang
     * @Description: 查找员工账号信息
     * @Date: 2019/12/24
     * @Param obj: 员工号
     * @return: com.pang.back.Model.Result
     **/
    @PostMapping(value = "/selectStaffByID")
    public Result selectStaffByID(@RequestBody JSONObject obj) {
        return staffService.selectStaffByID(Integer.parseInt(obj.get("staffID").toString()));
    }

    /**
     * @Author: SmallPang
     * @Description: 模糊查询
     * @Date: 2019/12/23
     * @Param obj: 关键字
     * @return: com.github.pagehelper.PageInfo<com.pang.back.Model.Staff>
     **/
    @RequestMapping(value = "/fuzzySelectStaff", method = RequestMethod.POST)
    public PageInfo<Staff> fuzzySelectUserInfo(@RequestBody JSONObject obj) {
        int pageNum = Integer.parseInt(obj.get("pageNum").toString());
        int pageSize = Integer.parseInt(obj.get("pageSize").toString());
        String fuzzyData = obj.get("fuzzyData").toString();
        return staffService.fuzzySelectStaff(pageNum, pageSize, fuzzyData);
    }

    /**
     * @Author: SmallPang
     * @Description: 修改员工账号
     * @Date: 2019/12/6
     * @Param staff: staff实体
     * @return: com.pang.back.Model.Result
     **/
    @RequestMapping(value = "/updateStaff", method = RequestMethod.POST)
    public Result updateStaff(@RequestBody Staff staff) {
        return staffService.updateStaff(staff);
    }

    /**
     * @Author: SmallPang
     * @Description: 删除员工账号
     * @Date: 2019/12/6
     * @Param obj: 员工ID
     * @return: com.pang.back.Model.Result
     **/
    @RequestMapping(value = "/deleteStaff", method = RequestMethod.POST)
    public Result deleteUserInfo(@RequestBody JSONObject obj) {
        int staffID = Integer.parseInt(obj.get("staffID").toString());
        return staffService.deleteUserInfo(staffID);
    }

    /**
     * @Author: SmallPang
     * @Description: 批量删除员工账号
     * @Date: 2019/12/6
     * @Param obj: 员工ID数组
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
        return staffService.batchDelete(intArr);
    }

    /**
     * @Author: SmallPang
     * @Description: 添加员工账号
     * @Date: 2019/12/6
     * @Param staff: staff实体
     * @return: com.pang.back.Model.Result
     **/
    @RequestMapping(value = "/addStaff", method = RequestMethod.POST)
    public Result addStaff(@RequestBody Staff staff) {
        return staffService.addStaff(staff);
    }

    /**
     * @Author: SmallPang
     * @Description: 得到全部staff列表
     * @Date: 2019/12/6
     * @Param obj: 页大小和当前页号
     * @return: com.github.pagehelper.PageInfo<com.pang.back.Model.Staff>
     **/
    @RequestMapping(value = "/getAllStaff", method = RequestMethod.POST)
    public PageInfo<Staff> getAllStaff(@RequestBody JSONObject obj) {
        int pageNum = Integer.parseInt(obj.get("pageNum").toString());
        int pageSize = Integer.parseInt(obj.get("pageSize").toString());
        return staffService.getAllStaff(pageNum, pageSize);
    }


}
