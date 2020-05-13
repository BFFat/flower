package com.pang.front.Mapper;

import com.pang.front.Model.Evaluate;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface EvaluateMapper {

    int addEvaluate(Evaluate evaluate);

    List<Evaluate> getGoodsAllEvaluate(Long orderID);

    @Update("update `order` set orderStatus = '已评价' where orderID = #{orderID}")
    void changeOrderEvaluateStatus(Long orderID);

    int changeEvaluate(Evaluate evaluate);

    List<Evaluate> getGoodsDetailedEvaluate(Integer goodsID);

    List<Evaluate> getGoodsDetailedAllEvaluate();
}
