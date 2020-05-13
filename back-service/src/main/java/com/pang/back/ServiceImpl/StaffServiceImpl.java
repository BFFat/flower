package com.pang.back.ServiceImpl;

import com.alibaba.dubbo.config.annotation.Service;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.pang.back.Mapper.StaffMapper;
import com.pang.back.Model.Result;
import com.pang.back.Model.Staff;
import com.pang.back.service.StaffService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import java.util.List;
import java.util.Map;

@Service
public class StaffServiceImpl implements StaffService {
    @Autowired
    private StaffMapper staffMapper;


    /**
     * @Author: SmallPang
     * @Description: 全部员工账号信息
     * @Date: 2019/12/24
     * @return: java.util.List<com.pang.back.Model.Staff>
     **/
    @Override
    public PageInfo<Staff> getAllStaff(int pageNum, int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Staff> list = staffMapper.getAllStaff();
        PageInfo<Staff> info = new PageInfo<>(list);
        return info;
    }

    /**
     * @Author: SmallPang
     * @Description: 添加员工
     * @Date: 2019/12/6
     * @Param staff: staff实体
     * @return: com.pang.back.Model.Result
     **/
    @Override
    public Result addStaff(Staff staff) {
        Result result = new Result();
        result.setMsg("添加员工失败");
        staff.setStaffPassword(new BCryptPasswordEncoder().encode(staff.getStaffPassword()));
        int rtnNum = staffMapper.addStaff(staff);
        int afterID = staffMapper.getLastID();
        if (rtnNum == 1) {
            result.setMsg("添加员工成功");
            result.setSuccess(true);
            result.setDetail(staffMapper.selectStaffByID(afterID));
            System.out.println("添加员工成功");
        }
        return result;
    }

    /**
     * @Author: SmallPang
     * @Description: 员工账号批量删除
     * @Date: 2019/12/6
     * @Param intArr: 员工ID数组
     * @return: com.pang.back.Model.Result
     **/
    @Override
    public Result batchDelete(int[] intArr) {
        Result result = new Result();
        result.setMsg("员工账号批量删除失败");
        result.setDetail(intArr);
        int rtnNum = staffMapper.batchDelete(intArr);
        if (rtnNum == intArr.length ) {
            result.setMsg("员工账号批量删除成功");
            result.setSuccess(true);
            System.out.println("员工账号批量删除成功");
            return result;
        }
        System.out.println("员工账号批量删除失败");
        return result;
    }

    /**
     * @Author: SmallPang
     * @Description: 删除员工账号
     * @Date: 2019/12/6
     * @Param staffID: 员工ID
     * @return: com.pang.back.Model.Result
     **/
    @Override
    public Result deleteUserInfo(int staffID) {
        Result result = new Result();
        result.setMsg("删除员工失败");
        Staff userInfo = staffMapper.selectStaffByID(staffID);
        result.setDetail(userInfo);
        int rtnNum = staffMapper.deleteStaff(staffID);
        if (rtnNum == 1) {
            result.setMsg("删除员工成功");
            result.setSuccess(true);
            System.out.println("删除员工成功");
            return result;
        }
        System.out.println("删除员工失败");
        return result;
    }

    /**
     * @Author: SmallPang
     * @Description: 修改员工账号
     * @Date: 2019/12/6
     * @Param staff: staff实体
     * @return: com.pang.back.Model.Result
     **/
    @Override
    public Result updateStaff(Staff staff) {
        Result result = new Result();
        result.setMsg("修改员工失败");
        staff.setStaffPassword(new BCryptPasswordEncoder().encode(staff.getStaffPassword()));
        int rtnNum = staffMapper.updateStaff(staff);
        int userID = staff.getStaffID();
        if (rtnNum == 1) {
            result.setMsg("修改员工失败");
            result.setSuccess(true);
            Staff newUserInfo = staffMapper.selectStaffByID(userID);
            result.setDetail(newUserInfo);
            System.out.println("修改员工成功");
            return result;
        }
        System.out.println("修改员工失败");
        return result;
    }

    @Override
    public PageInfo<Staff> fuzzySelectStaff(int pageNum, int pageSize, String fuzzyData) {
        PageHelper.startPage(pageNum, pageSize);
        List<Staff> list = staffMapper.fuzzySelectStaff(fuzzyData);
        PageInfo<Staff> info = new PageInfo<>(list);
        return info;
    }

    @Override
    public Staff getStaffByID(Integer staffID) {
        return staffMapper.getStaffByID(staffID);
    }


    @Override
    public Staff getUserInfoByUsername(Integer StaffInfoID) {
        return staffMapper.getStaffByID(StaffInfoID);
    }

    /**
     * @Author: SmallPang
     * @Description: 查找员工账号信息
     * @Date: 2019/12/24
     * @Param staffID: 员工号
     * @return: com.pang.back.Model.Result
     **/
    @Override
    public Result selectStaffByID(Integer staffID) {
        Result result = new Result();
        result.setMsg("该店员不存在");
        Staff staff = staffMapper.selectStaffByID(staffID);
        if (staff != null) {
            result.setMsg("该店员存在");
            result.setSuccess(true);
            System.out.println("该店员存在");
            return result;
        }
        System.out.println("该店员ID不存在");
        return result;
    }

    @Override
    public Result changePassword(Map map) {
        Result result = new Result();
        Staff staff = new Staff();
        result.setMsg("修改密码失败");
        Integer staffID = Integer.parseInt(map.get("staffID").toString());
        String staffPassword = map.get("staffPassword").toString();
        String oldPassword = map.get("oldPassword").toString();
        String newPassword = map.get("newPassword").toString();
        String confirmPassword = map.get("confirmPassword").toString();
        String encodeNewPassword = new BCryptPasswordEncoder().encode(newPassword);
        boolean oldPwd = new BCryptPasswordEncoder().matches(oldPassword, staffPassword);
        boolean newPwd = new BCryptPasswordEncoder().matches(newPassword, staffPassword);
        if (!newPassword.equals(confirmPassword)) {
            result.setMsg("两次输入的密码不相同");
            return result;
        } else if (!oldPwd) {
            result.setMsg("旧密码输入错误");
            return result;
        } else if (newPwd) {
            result.setMsg("新密码不能与旧密码相同");
            return result;
        }
        staff.setStaffPassword(encodeNewPassword);
        staff.setStaffID(staffID);
        int rtnNum = staffMapper.changePassword(staff);
        if (rtnNum == 1) {
            result.setMsg("修改密码成功");
            result.setSuccess(true);
            result.setDetail(staffMapper.getStaffByID(staff.getStaffID()));
            System.out.println("修改密码成功");
            return result;
        }
        System.out.println("修改密码失败");
        return result;
    }

}