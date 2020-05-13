package com.pang.back.ServiceImpl;

import com.alibaba.dubbo.config.annotation.Service;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.pang.back.Mapper.StaffInfoMapper;
import com.pang.back.Model.Result;
import com.pang.back.Model.StaffInfo;
import com.pang.back.Util.RedisUtil;
import com.pang.back.service.StaffInfoService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;


@Service
public class StaffInfoServiceImpl implements StaffInfoService {
    @Autowired
    private StaffInfoMapper staffInfoMapper;

    /**
     * @Author: SmallPang
     * @Description: 根据ID查询员工信息
     * @Date: 2019/12/23
     * @Param StaffInfoID: 员工ID
     * @return: com.pang.back.Model.StaffInfo
     **/
    @Override
    public Result selectStaffInfoByID(Integer staffID) {
        Result result = new Result();
        result.setMsg("该店员信息不存在");
        StaffInfo staffInfo = staffInfoMapper.selectStaffInfoByID(staffID);
        if (staffInfo != null) {
            result.setMsg("该店员存在");
            result.setSuccess(true);
            System.out.println("该店员存在");
            return result;
        }
        System.out.println("该店员ID不存在");
        return result;
    }

    /**
     * @Author: SmallPang
     * @Description: 模糊查询
     * @Date: 2019/12/23
     * @Param fuzzyData: 关键字
     * @return: java.util.List<com.pang.back.Model.StaffInfo>
     **/
    @Override
    public PageInfo<StaffInfo> fuzzySelectStaffInfo(int pageNum, int pageSize, String fuzzyData) {
        PageHelper.startPage(pageNum, pageSize);
        List<StaffInfo> list = staffInfoMapper.fuzzySelectStaffInfo(fuzzyData);
        PageInfo<StaffInfo> info = new PageInfo<>(list);
        return info;
    }

    /**
     * @Author: SmallPang
     * @Description: 删除店员信息
     * @Date: 2019/12/23
     * @Param staffID: 员工号
     * @return: com.pang.back.Model.Result
     **/
    @Override
    public Result deleteStaffInfo(int staffID) {
        Result result = new Result();
        result.setMsg("删除店员信息失败");
        int rtnNum = staffInfoMapper.deleteStaffInfo(staffID);
        if (rtnNum == 1) {
            result.setMsg("删除店员信息成功");
            result.setSuccess(true);
            System.out.println("删除店员信息成功");
            return result;
        }
        System.out.println("删除店员信息失败");
        return result;
    }

    /**
     * @Author: SmallPang
     * @Description: 修改店员信息
     * @Date: 2019/12/23
     * @Param staffInfo: 店员信息
     * @return: com.pang.back.Model.Result
     **/
    @Override
    public Result updateStaffInfo(StaffInfo staffInfo) {
        Result result = new Result();
        result.setMsg("修改店员信息失败");
        int rtnNum = staffInfoMapper.updateStaffInfo(staffInfo);
        if (rtnNum == 1) {
            result.setMsg("修改店员信息成功");
            result.setSuccess(true);
            result.setDetail(staffInfoMapper.selectStaffInfoByID(staffInfo.getStaffID()));
            System.out.println("修改店员信息成功");
            return result;
        }
        System.out.println("修改店员信息失败");
        return result;
    }

    /**
     * @Author: SmallPang
     * @Description: 添加店员信息
     * @Date: 2019/12/23
     * @Param staffInfo: 店员信息
     * @return: com.pang.back.Model.Result
     **/
    @Override
    public Result addStaffInfo(StaffInfo staffInfo) {
        Result result = new Result();
        result.setMsg("添加店员信息失败");
        int rtnNum = staffInfoMapper.addStaffInfo(staffInfo);
        if (rtnNum == 1) {
            result.setMsg("添加店员信息成功");
            result.setSuccess(true);
            result.setDetail(staffInfoMapper.selectStaffInfoByID(staffInfo.getStaffID()));
            System.out.println("添加店员信息成功");
            return result;
        }
        System.out.println("添加店员信息失败");
        return result;
    }

    /**
     * @Author: SmallPang
     * @Description: 批量删除店员信息
     * @Date: 2019/12/23
     * @Param intArr: 批量删除店员ID数组
     * @return: com.pang.back.Model.Result
     **/
    @Override
    public Result batchDelete(int[] intArr) {
        Result result = new Result();
        result.setMsg("店员信息批量删除失败");
        result.setDetail(intArr);
        int rtnNum = staffInfoMapper.batchDelete(intArr);
        if (rtnNum == intArr.length ) {
            result.setMsg("店员信息批量删除成功");
            result.setSuccess(true);
            System.out.println("店员信息批量删除成功");
            return result;
        }
        System.out.println("店员信息批量删除失败");
        return result;
    }

    /**
     * @Author: SmallPang
     * @Description: 得到全部店员信息
     * @Date: 2019/12/23
     * @return: java.util.List<com.pang.back.Model.StaffInfo>
     **/
    @Override
    public PageInfo<StaffInfo> getAllStaffInfo(int pageNum, int pageSize) {
//        RedisUtil redisUtil = new RedisUtil();
//        List<StaffInfo> returnList = new ArrayList<StaffInfo>();
//        Object ob = redisUtil.lGet("staffInfo", 0, -1);
//        returnList = (List<StaffInfo>) ob;
//        if (returnList.size() == 0) {
//            returnList = staffInfoMapper.getAllStaffInfo();
//            for (StaffInfo staffInfo:returnList) {
//                redisUtil.lSet("staffInfo", staffInfo, (long)24*3600);
//            }
//            return returnList;
//        }
//        return returnList;
        PageHelper.startPage(pageNum, pageSize);
        List<StaffInfo> list = staffInfoMapper.getAllStaffInfo();
        PageInfo<StaffInfo> info = new PageInfo<>(list);
        return info;
    }


    /**
     * @Author: SmallPang
     * @Description: 获取个人信息
     * @Date: 2019/12/24
     * @Param staffID: 登录的员工号
     * @return: com.pang.back.Model.Result
     **/
    @Override
    public Result getPersonInfo(Integer staffID) {
        Result result = new Result();
        result.setMsg("获取个人信息失败");
        Map map = staffInfoMapper.getPersonInfo(staffID);
        System.out.println(map);
        if (map.size() > 0) {
            result.setMsg("获取个人信息成功");
            result.setSuccess(true);
            result.setDetail(map);
            System.out.println("获取个人信息成功");
            return result;
        }
        System.out.println("获取个人信息失败");
        return result;
    }

    /**
     * @Author: SmallPang
     * @Description: 修改头像
     * @Date: 2019/12/24
     * @Param staffInfo: 员工信息
     * @return: com.pang.back.Model.Result
     **/
    @Override
    public Result changeHeadPortrait(StaffInfo staffInfo) {
        Result result = new Result();
        result.setMsg("修改头像失败");
        int rtnNum = staffInfoMapper.changeHeadPortrai(staffInfo);
        if (rtnNum == 1) {
            result.setMsg("修改头像成功");
            result.setSuccess(true);
            result.setDetail(staffInfoMapper.selectStaffInfoByID(staffInfo.getStaffID()));
            System.out.println("修改头像成功");
            return result;
        }
        System.out.println("修改头像失败");
        return result;
    }

    public StaffInfo getOneStaffInfoByID(Integer staffID) {
        return staffInfoMapper.getOneStaffInfoById(staffID);
    }

}
