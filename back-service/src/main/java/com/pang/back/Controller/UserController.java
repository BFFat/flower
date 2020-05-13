package com.pang.back.Controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.alibaba.fastjson.JSONObject;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.pang.back.Model.Result;
import com.pang.back.Model.User;
import com.pang.back.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@RestController
@RequestMapping("/user")
public class UserController {

    @Reference
    UserService userService;

    /**
     * @Author: SmallPang
     * @Description: 根据ID查找用户
     * @Date: 2019/12/23
     * @Param obj: userID
     * @return: com.pang.back.Model.Result
     **/
    @PostMapping(value = "/selectUserByID")
    public Result selectUserByID(@RequestBody JSONObject obj) {
        return userService.selectUserByID((Integer.parseInt(obj.get("userID").toString())));
    }

    /**
     * @Author: SmallPang
     * @Description: 添加用户
     * @Date: 2019/12/19
     * @Param user:
     * @return: com.pang.back.Model.Result
     **/
    @RequestMapping(value = "/addUser", method = RequestMethod.POST)
    public Result addUser(@RequestBody User user) {
        System.out.println(user);
        return userService.addUser(user);
    }


    /**
     * @Author: SmallPang
     * @Description: 批量删除
     * @Date: 2019/12/19
     * @Param obj: 批量删除用户ID数组
     * @return: com.pang.back.Model.Result
     **/
    @RequestMapping(value = "/batchDelete", method = RequestMethod.POST)
    public Result batchDelete(@RequestBody JSONObject obj) {
        System.out.println(obj.get("checksIdArray"));
        String str = obj.get("checksIdArray").toString();
        str = str.substring(1,str.length()-1);
        String[] array = str.split(",");
        int[] intArr = new int[array.length];
        for(int i = 0; i < array.length; i++) {
            intArr[i] = Integer.parseInt(array[i].trim());
            System.out.println(intArr[i]);
        }
        return userService.batchDelete(intArr);
    }


    /**
     * @Author: SmallPang
     * @Description: 返回全部用户列表
     * @Date: 2019/12/6
     * @Param obj: 页号页大小
     * @return: com.github.pagehelper.PageInfo<com.pang.back.Model.User>
     **/
    @RequestMapping(value = "/getAllPerson", method = RequestMethod.POST)
    public PageInfo<User> getAllPerson(@RequestBody JSONObject obj) {
        int pageNum = Integer.parseInt(obj.get("pageNum").toString());
        int pageSize = Integer.parseInt(obj.get("pageSize").toString());
        return userService.selectAllUser(pageNum, pageSize);
    }


    /**
     * @Author: SmallPang
     * @Description: 模糊查询
     * @Date: 2019/12/19
     * @Param obj: 模糊搜索数据
     * @return: com.github.pagehelper.PageInfo<com.pang.back.Model.User>
     **/
    @RequestMapping(value = "/fuzzySelectUser", method = RequestMethod.POST)
    public PageInfo<User> fuzzySelectUser(@RequestBody JSONObject obj) {
        int pageNum = Integer.parseInt(obj.get("pageNum").toString());
        int pageSize = Integer.parseInt(obj.get("pageSize").toString());
        String fuzzyData = obj.get("fuzzyData").toString();
        return userService.fuzzySelectUser(pageNum, pageSize, fuzzyData);
    }

    /**
     * @Author: SmallPang
     * @Description: 删除单个用户
     * @Date: 2019/12/19
     * @Param obj: 用户ID
     * @return: com.pang.back.Model.Result
     **/
    @RequestMapping(value = "/deleteUser", method = RequestMethod.POST)
    public Result deleteUser(@RequestBody JSONObject obj) {
        int userID = Integer.parseInt(obj.get("userID").toString());
        return userService.deleteUser(userID);
    }

    /**
     * @Author: SmallPang
     * @Description: 更新用户账号信息
     * @Date: 2019/12/19
     * @Param user: 用户
     * @return: com.pang.back.Model.Result
     **/
    @RequestMapping(value = "/updateUser", method = RequestMethod.POST)
    public Result updateUser(@RequestBody User user) {
        return userService.updateUser(user);
    }

}
