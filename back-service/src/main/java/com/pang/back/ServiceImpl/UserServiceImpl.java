package com.pang.back.ServiceImpl;

import com.alibaba.dubbo.config.annotation.Service;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.pang.back.Mapper.UserMapper;
import com.pang.back.Model.Result;
import com.pang.back.Model.User;
import com.pang.back.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.parameters.P;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

import java.util.List;


@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;


    /**
     * @Author: SmallPang
     * @Description:
     * @Date: 2019/12/19
     * @return: java.util.List<com.pang.back.Model.User>
     **/
    @Override
    public PageInfo<User> selectAllUser(int pageNum, int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<User> list = userMapper.selectAllUser();
        PageInfo<User> info = new PageInfo<>(list);
        return info;
    }



    /**
     * @Author: SmallPang
     * @Description: 删除用户账号信息
     * @Date: 2019/12/19
     * @Param userID: 用户ID
     * @return: com.pang.back.Model.Result
     **/
    @Override
    public Result deleteUser(int userID) {
        Result result = new Result();
        result.setDetail(userID);
        result.setMsg(userID + "删除用户失败");
        int rtnNum = userMapper.deleteUser(userID);
        if (rtnNum == 1) {
            result.setMsg(userID + "删除用户成功");
            result.setSuccess(true);
            System.out.println("删除用户成功");
            return result;
        }
        System.out.println("删除用户失败");
        return result;
    }

    /**
     * @Author: SmallPang
     * @Description: 修改用户账号信息
     * @Date: 2019/12/19
     * @Param user: 用户
     * @return: com.pang.back.Model.Result
     **/
    @Override
    public Result updateUser(User user) {
        Result result = new Result();
        result.setMsg("修改操作失败");
        User existUser = userMapper.selectUserByPhone(user.getUserPhone());
        if (existUser != null) {
            result.setMsg("该手机号码已存在");
            System.out.println("该手机号码已存在");
            return result;
        }
        user.setUserPassword(new BCryptPasswordEncoder().encode(user.getUserPassword()));
        int rtnNum = userMapper.updateUser(user);
        if (rtnNum == 1) {
            result.setMsg("修改操作成功");
            result.setSuccess(true);
            result.setDetail(userMapper.selectUserByID(user.getUserID()));
            System.out.println(user.getUserID() + "修改成功");
            return result;
        }
        System.out.println(user.getUserID() + "修改失败");
        return result;
    }


    /**
     * @Author: SmallPang
     * @Description: 用户表的模糊查询搜索框
     * @Date: 2019/12/19
     * @Param fuzzyData: 模糊搜索信息
     * @return: java.util.List<com.pang.back.Model.User>
     **/
    @Override
    public PageInfo<User> fuzzySelectUser(int pageNum, int pageSize, String fuzzyData) {
        PageHelper.startPage(pageNum, pageSize);
        List<User> list = userMapper.fuzzySelectUser(fuzzyData);
        PageInfo<User> info = new PageInfo<>(list);
        return info;
    }


    /**
     * @Author: SmallPang
     * @Description: 添加用户账号信息
     * @Date: 2019/12/19
     * @Param user: 用户List
     * @return: com.pang.back.Model.Result
     **/
    @Override
    public Result addUser(User user) {
        Result result = new Result();
        result.setMsg("添加用户账号失败");
        User existUser = userMapper.selectUserByPhone(user.getUserPhone());
        if (existUser != null) {
            result.setMsg("该手机号码已存在");
            System.out.println("该手机号码已存在");
            return result;
        }
        user.setUserPassword(new BCryptPasswordEncoder().encode(user.getUserPassword()));
        int rtnNum = userMapper.addUser(user);
        int lastID = user.getUserID();
        if (rtnNum == 1) {
            result.setMsg("添加用户账号成功");
            result.setSuccess(true);
            result.setDetail(userMapper.selectUserByID(lastID));
            System.out.println("添加用户账号成功");
            return result;
        }
        System.out.println("添加用户账号失败");
        return result;
    }

    /**
     * @Author: SmallPang
     * @Description: 根据ID查找用户
     * @Date: 2019/12/23
     * @Param userID: 用户ID
     * @return: com.pang.back.Model.Result
     **/
    @Override
    public Result selectUserByID(int userID) {
        Result result = new Result();
        result.setMsg("该用户不存在");
        User user = userMapper.selectUserByID(userID);
        if (user != null) {
            result.setMsg("该用户存在");
            result.setSuccess(true);
            System.out.println("该用户存在");
            return result;
        }
        System.out.println("该用户ID不存在");
        return result;
    }



    /**
     * @Author: SmallPang
     * @Description: 批量删除用户账号信息
     * @Date: 2019/12/19
     * @Param intArr: 批量删除用户账号数组
     * @return: com.pang.back.Model.Result
     **/
    @Override
    public Result batchDelete(int[] intArr) {
        Result result = new Result();
        result.setMsg("用户账号信息批量删除失败");
        result.setDetail(intArr);
        int rtnNum = userMapper.batchDelete(intArr);
        if (rtnNum == intArr.length ) {
            result.setMsg("用户账号信息批量删除成功");
            result.setSuccess(true);
            System.out.println("删除成功");
            return result;
        }
        System.out.println("删除失败");
        return result;
    }


//    /**
//     * MD5加密
//     *
//     * */
//    public String passwordMD5(String userName, String userPassword) {
//        // 需要加密的字符串
//        String src = userName + userPassword;
//        try {
//            // 加密对象，指定加密方式
//            MessageDigest md5 = MessageDigest.getInstance("md5");
//            // 准备要加密的数据
//            byte[] b = src.getBytes();
//            // 加密：MD5加密一种被广泛使用的密码散列函数，
//            // 可以产生出一个128位（16字节）的散列值（hash value），用于确保信息传输完整一致
//            byte[] digest = md5.digest(b);
//            // 十六进制的字符
//            char[] chars = new char[]{'0', '1', '2', '3', '4', '5',
//                    '6', '7', 'A', 'B', 'C', 'd', 'o', '*', '#', '/'};
//            StringBuffer sb = new StringBuffer();
//            // 处理成十六进制的字符串(通常)
//            // 遍历加密后的密码，将每个元素向右位移4位，然后与15进行与运算(byte变成数字)
//            for (byte bb : digest) {
//                sb.append(chars[(bb >> 4) & 15]);
//                sb.append(chars[bb & 15]);
//            }
//            // 打印加密后的字符串
//            System.out.println(sb);
//            return sb.toString();
//        } catch (NoSuchAlgorithmException e) {
//            e.printStackTrace();
//        }
//        return null;
//    }
}
