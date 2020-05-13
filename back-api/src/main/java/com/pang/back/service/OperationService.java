package com.pang.back.service;

import com.github.pagehelper.PageInfo;
import com.pang.back.Model.Operation;

import java.util.List;

public interface OperationService {
    void addOperation(Operation operation);

    PageInfo<Operation> getAllOperation(int pageNum, int pageSize);

    PageInfo<Operation> selectOperatorInfo(int pageNum, int pageSize, Integer operatorID, String startTime, String endTime);
}
