package com.pang.back.service;

import com.github.pagehelper.PageInfo;
import com.pang.back.Model.Result;
import com.pang.back.Model.User;

import java.util.List;


public interface UserService {

    PageInfo<User> selectAllUser(int pageNum, int pageSize);

    Result updateUser(User user);

    Result deleteUser(int userID);

    Result batchDelete(int[] intArr);

    PageInfo<User> fuzzySelectUser(int pageNum, int pageSize, String fuzzyData);

    Result addUser(User user);

    Result selectUserByID(int userID);
}
