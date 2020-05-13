package com.pang.back.Mapper;

import com.pang.back.Model.StaffInfo;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Mapper
@Repository
public interface StaffInfoMapper {
    @Select("select * from staffInfo where staffID = #{staffID}")
    StaffInfo selectStaffInfoByID(Integer staffID);

    List<StaffInfo> fuzzySelectStaffInfo(String fuzzyData);

    @Delete("delete from staffInfo where staffID = #{staffID}")
    int deleteStaffInfo(int staffID);

    int updateStaffInfo(StaffInfo staffInfo);

    int addStaffInfo(StaffInfo staffInfo);

    int batchDelete(int[] intArr);

    @Select("select * from staffInfo")
    List<StaffInfo> getAllStaffInfo();

    Map getPersonInfo(Integer staffID);

    @Update("update staffInfo set staffHeadPortrait=#{staffHeadPortrait} where staffID = #{staffID}")
    int changeHeadPortrai(StaffInfo staffInfo);

    @Select("select * from staffInfo where staffID = #{staffID}")
    StaffInfo getOneStaffInfoById(Integer staffID);
}
