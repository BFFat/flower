package com.pang.back.Mapper;

import com.pang.back.Model.Evaluate;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface EvaluateMapper {
    @Select("select * from evaluate")
    List<Evaluate> getAllEvaluate();

    @Select("select * from evaluate where userID like CONCAT('%',#{fuzzyData},'%') or goodsID like CONCAT('%',#{fuzzyData},'%') or orderID like concat('%',#{fuzzyData},'%') or evaluateUpdateTime like concat('%',#{fuzzyData},'%')")
    List<Evaluate> fuzzySelectEvaluate(String fuzzyData);
}
