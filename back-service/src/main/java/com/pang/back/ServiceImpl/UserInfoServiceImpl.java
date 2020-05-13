package com.pang.back.ServiceImpl;

import com.alibaba.dubbo.config.annotation.Service;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.pang.back.Mapper.UserInfoMapper;
import com.pang.back.Model.Result;
import com.pang.back.Model.UserInfo;
import com.pang.back.service.UserInfoService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

@Service
public class UserInfoServiceImpl implements UserInfoService {
    @Autowired
    private UserInfoMapper userInfoMapper;



    /**
      * @Author: SmallPang
      * @Description: 得到全部用户信息
      * @Date: 2019/12/4
      **/
    
    @Override
    public PageInfo<UserInfo> getAllUserInfo(int pageNum, int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<UserInfo> list = userInfoMapper.getAllUserInfo();
        PageInfo<UserInfo> info = new PageInfo<>(list);
        return info;
    }

    /**
     * @Author: SmallPang
     * @Description: 用户信息表通过userID批量删除
     * @Date: 2019/12/5
     * @Param intArr: 用户ID数组
     * @return: com.pang.back.Model.Result
     **/
    @Override
    public Result batchDelete(int[] intArr) {
        Result result = new Result();
        result.setMsg("用户信息批量删除失败");
        result.setDetail(intArr);
        int rtnNum = userInfoMapper.batchDelete(intArr);
        if (rtnNum == intArr.length ) {
            result.setMsg("用户信息批量删除成功");
            result.setSuccess(true);
            System.out.println("用户信息批量删除成功");
            return result;
        }
        System.out.println("用户信息批量删除失败");
        return result;
    }

    /**
     * @Author: SmallPang
     * @Description: 添加用户信息
     * @Date: 2019/12/5
     * @Param userInfo: 用户信息
     * @return: com.pang.back.Model.Result
     **/
    @Override
    public Result addUserInfo(UserInfo userInfo) {
        Result result = new Result();
        result.setMsg("添加用户信息失败");
        int rtnNum = userInfoMapper.addUserInfo(userInfo);
        if (rtnNum == 1) {
            result.setMsg("添加用户信息成功");
            result.setSuccess(true);
            result.setDetail(userInfoMapper.selectUserInfoByID(userInfo.getUserID()));
            System.out.println("添加用户信息成功");
            return result;
        }
        System.out.println("添加用户信息失败");
        return result;
    }

    /**
     * @Author: SmallPang
     * @Description: 修改用户信息
     * @Date: 2019/12/4
     * @Param userInfo: 用户信息
     * @return: com.pang.back.Model.Result
     **/
    @Override
    public Result updateUserInfo(UserInfo userInfo) {
        Result result = new Result();
        result.setMsg("修改用户信息失败");
        int rtnNum = userInfoMapper.updateUserInfo(userInfo);
        if (rtnNum == 1) {
            result.setMsg("修改用户信息成功");
            result.setSuccess(true);
            result.setDetail(userInfoMapper.selectUserInfoByID(userInfo.getUserID()));
            System.out.println("修改用户信息成功");
            return result;
        }
        System.out.println("修改用户信息失败");
        return result;
    }

    /**
     * @Author: SmallPang
     * @Description: 删除用户信息
     * @Date: 2019/12/5
     * @Param userID: 用户ID
     * @return: com.pang.back.Model.Result
     **/
    @Override
    public Result deleteUserInfo(int userID) {
        Result result = new Result();
        result.setMsg("删除用户信息失败");
        int rtnNum = userInfoMapper.deleteUserInfo(userID);
        if (rtnNum == 1) {
            result.setMsg("删除用户信息成功");
            result.setSuccess(true);
            System.out.println("删除用户信息成功");
            return result;
        }
        System.out.println("删除用户信息失败");
        return result;
    }

    /**
     * @Author: SmallPang
     * @Description: 模糊查询
     * @Date: 2019/12/6
     * @Param fuzzyData: 关键字
     * @return: java.util.List<com.pang.back.Model.UserInfo>
     **/
    @Override
    public PageInfo<UserInfo> fuzzySelectUserInfo(int pageNum, int pageSize, String fuzzyData) {
        PageHelper.startPage(pageNum, pageSize);
        List<UserInfo> list = userInfoMapper.fuzzySelectUserInfo(fuzzyData);
        PageInfo<UserInfo> info = new PageInfo<>(list);
        return info;
    }

    /**
     * @Author: SmallPang
     * @Description: 根据ID查找用户信息是否存在
     * @Date: 2019/12/19
     * @Param userID: 用户ID
     * @return: com.pang.back.Model.Result
     **/
    @Override
    public Result selectUserInfoByID(int userID) {
        Result result = new Result();
        result.setMsg("不存在该用户信息");
        UserInfo userInfo = userInfoMapper.selectUserInfoByID(userID);
        if (userInfo != null) {
            result.setMsg("该用户信息已存在");
            result.setSuccess(true);
            result.setDetail(userInfo);
            System.out.println("该用户信息已存在");
            return result;
        }
        System.out.println("不存在该用户信息");
        return result;
    }

    @Override
    public UserInfo getUserInfo(Integer userID) {
        return userInfoMapper.getUserInfo(userID);
    }

    @Override
    public Result changeHeadPortrait(UserInfo userInfo) {
        Result result = new Result();
        result.setMsg("修改头像失败");
        result.setDetail(userInfo.getUserHeadPortrait());
        int rtnNum = userInfoMapper.changeHeadPortrait(userInfo);
        if (rtnNum == 1) {
            result.setMsg("修改头像成功");
            result.setSuccess(true);
            return result;
        }
        return result;
    }

    @Override
    public Result updateFrontUserInfo(UserInfo userInfo) {
        System.out.println("11111");
        Result result = new Result();
        result.setMsg("修改用户信息失败");
        int rtnNum = userInfoMapper.updateFrontUserInfo(userInfo);
        if (rtnNum == 1) {
            System.out.println("22222");
            result.setMsg("修改用户信息成功");
            result.setSuccess(true);
            return result;
        }
        return result;
    }
}
