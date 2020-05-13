package com.pang.back.Mapper;

import com.pang.back.Model.Operation;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface OperationMapper {

    void addOperation(Operation operation);

    @Select("select * from operation order by operationUpdateTime desc")
    List<Operation> getAllOperation();

    List<Operation> selectOperatorInfo(Integer operatorID, String startTime, String endTime);
}
