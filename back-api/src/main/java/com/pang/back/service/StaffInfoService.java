package com.pang.back.service;

import com.github.pagehelper.PageInfo;
import com.pang.back.Model.Result;
import com.pang.back.Model.StaffInfo;

import java.util.List;

public interface StaffInfoService {
    Result selectStaffInfoByID(Integer StaffID);

    PageInfo<StaffInfo> fuzzySelectStaffInfo(int pageNum, int pageSize, String fuzzyData);

    Result deleteStaffInfo(int staffID);

    Result updateStaffInfo(StaffInfo staffInfo);

    Result addStaffInfo(StaffInfo staffInfo);

    Result batchDelete(int[] intArr);

    PageInfo<StaffInfo> getAllStaffInfo(int pageNum, int pageSize);

    Result getPersonInfo(Integer staffID);

    Result changeHeadPortrait(StaffInfo staffInfo);

    StaffInfo getOneStaffInfoByID(Integer staffInfo);
}
