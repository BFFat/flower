package com.pang.front.Mapper;

import com.pang.front.Model.User;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface RegisterMapper {
    int registerUser(User user);

    @Insert("insert into userInfo(userID, userName, userHeadPortrait) values(#{userID}, #{userName}, #{userHeadPortrait})")
    int insertRegisterUserName(Integer userID, String userName, String userHeadPortrait);

    @Select("select * from user where userPhone = #{userPhone}")
    User selectUserPhone(String userPhone);

    @Update("update user set userPassword = #{userPassword} where userPhone = #{userPhone}")
    int updatePassword(String userPhone, String userPassword);

    @Select("select * from user where userPhone = #{userPhone}")
    Integer getRegisterUserID(String userPhone);

    @Delete("delete from user where userID = #{userID}")
    int deleteUserByID(Integer userID);


}
