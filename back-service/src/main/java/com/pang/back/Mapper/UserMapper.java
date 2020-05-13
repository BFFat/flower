package com.pang.back.Mapper;

import com.pang.back.Model.User;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface UserMapper {
    @Select("select * from user")
    public List<User> selectAllUser();

    int addUser(User user);

    @Delete("delete from user where userID = #{userID}")
    int deleteUser(int userID);

    @Update("update user set userPhone = #{userPhone} userPassword = #{userPassword}, userStatus = #{userStatus} where userID = #{userID}")
    int updateUser(User user);

//    搜索框：模糊查询
    @Select("select * from user where userID like CONCAT('%',#{fuzzyData},'%') or userPhone like CONCAT('%',#{fuzzyData},'%') or userStatus like concat('%',#{fuzzyData},'%') or userUpdateTime like concat('%',#{fuzzyData},'%')")
    List<User> fuzzySelectUser(String fuzzyData);

    int batchDelete(int[] intArr);

    @Select("select * from user where userID = #{userID}")
    User selectUserByID(int userID);

    @Select("select * from user where userPhone = #{userPhone}")
    User selectUserByPhone(String userPhone);
}
