package com.pang.back.service;

import com.github.pagehelper.PageInfo;
import com.pang.back.Model.Result;
import com.pang.back.Model.Staff;

import java.util.List;
import java.util.Map;


public interface StaffService {

    PageInfo<Staff> getAllStaff(int pageNum, int pageSize);

    Result addStaff(Staff staff);

    Result batchDelete(int[] intArr);

    Result deleteUserInfo(int userID);

    Result updateStaff(Staff staff);

    PageInfo<Staff> fuzzySelectStaff(int pageNum, int pageSize, String fuzzyData);

    Staff getStaffByID(Integer staffID);

    Staff getUserInfoByUsername(Integer StaffInfoID);

    Result selectStaffByID(Integer staffID);

    Result changePassword(Map map);
}
