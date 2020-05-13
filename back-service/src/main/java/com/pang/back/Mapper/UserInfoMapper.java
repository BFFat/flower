package com.pang.back.Mapper;

import com.pang.back.Model.UserInfo;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface UserInfoMapper {
    @Select("select * from userInfo")
    List<UserInfo> getAllUserInfo();

    int batchDelete(int[] intArr);

    @Select("select * from userInfo where userID = #{userID}")
    UserInfo selectUserInfoByID(int userID);

    int addUserInfo(UserInfo userInfo);

    int updateUserInfo(UserInfo userInfo);

    @Delete("delete from userInfo where userID = #{userID}")
    int deleteUserInfo(int userID);

    List<UserInfo> fuzzySelectUserInfo(String fuzzyData);

    @Select("select * from userInfo where userID = #{userID}")
    UserInfo getUserInfo(Integer userID);

    @Update("update userInfo set userHeadPortrait = #{userHeadPortrait} where userID = #{userID}")
    int changeHeadPortrait(UserInfo userInfo);

    int updateFrontUserInfo(UserInfo userInfo);
}
