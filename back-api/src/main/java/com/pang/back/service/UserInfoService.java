package com.pang.back.service;


import com.github.pagehelper.PageInfo;
import com.pang.back.Model.Result;
import com.pang.back.Model.UserInfo;

import java.util.List;


public interface UserInfoService {
    PageInfo<UserInfo> getAllUserInfo(int pageNum, int pageSize);

    Result batchDelete(int[] intArr);

    Result addUserInfo(UserInfo userInfo);

    Result updateUserInfo(UserInfo userInfo);

    Result deleteUserInfo(int userID);

    PageInfo<UserInfo> fuzzySelectUserInfo(int pageNum, int pageSize, String fuzzyData);

    Result selectUserInfoByID(int userID);

    UserInfo getUserInfo(Integer userID);

    Result changeHeadPortrait(UserInfo userInfo);

    Result updateFrontUserInfo(UserInfo userInfo);
}
