package com.pang.back.Mapper;

import com.pang.back.Model.Staff;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface StaffMapper {


    
    @Select("select * from staff")
    List<Staff> getAllStaff();

    @Select("SELECT @@Identity")
    int getLastID();

    int addStaff(Staff staff);

    @Select("select * from staff where staffID = #{afterID}")
    Staff selectStaffByID(int afterID);

    int batchDelete(int[] intArr);

    Staff batchSelect(int[] intArr);

    @Delete("delete from staff where staffID = #{staffID}")
    int deleteStaff(int staffID);

    int updateStaff(Staff staff);

    List<Staff> fuzzySelectStaff(String fuzzyData);

    @Select("select st.staffID, st.staffPassword, st.staffRole from staff st where staffID = #{staffID}")
    Staff getStaffByID(Integer staffID);

    @Update("update staff set staffPassword = #{staffPassword} where staffID = #{staffID}")
    int changePassword(Staff staff);
}
