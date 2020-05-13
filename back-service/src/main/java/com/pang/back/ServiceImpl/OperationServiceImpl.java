package com.pang.back.ServiceImpl;

import com.alibaba.dubbo.config.annotation.Service;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.pang.back.Mapper.OperationMapper;
import com.pang.back.Model.Operation;
import com.pang.back.service.OperationService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

@Service
public class OperationServiceImpl implements OperationService {
    @Autowired
    private OperationMapper operationMapper;

    /**
     * @Author: SmallPang
     * @Description: AOP切面更改类型
     * @Date: 2019/12/26
     * @Param operation: 操作日志
     * @return: void
     **/

    public void addOperation(Operation operation) {
        String operationType = operation.getOperationType();
        String firstStr = operationType.substring(0, 1);
        if ("a".equals(firstStr)) {
            operation.setOperationType("添加");
            operationMapper.addOperation(operation);
        } else if ("u".equals(firstStr) || "c".equals(firstStr)) {
            operation.setOperationType("修改");
            operationMapper.addOperation(operation);
        } else if ("d".equals(firstStr) || "b".equals(firstStr)) {
            operation.setOperationType("删除");
            operationMapper.addOperation(operation);
        }

    }


    public PageInfo<Operation> getAllOperation(int pageNum, int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Operation> list = operationMapper.getAllOperation();
        PageInfo<Operation> info = new PageInfo<>(list);
        return info;
    }


    public PageInfo<Operation> selectOperatorInfo(int pageNum, int pageSize, Integer operatorID, String startTime, String endTime) {
        PageHelper.startPage(pageNum, pageSize);
        List<Operation> list = operationMapper.selectOperatorInfo(operatorID, startTime, endTime);
        PageInfo<Operation> info = new PageInfo<>(list);
        return info;
    }
}
