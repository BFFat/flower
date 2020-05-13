package com.pang.front.service;

import com.pang.front.Model.Evaluate;
import com.pang.front.Model.Result;

import java.util.List;

public interface EvaluateService {
    Result addEvaluate(Evaluate evaluate);

    List<Evaluate> getGoodsAllEvaluate(Long orderID);

    Result changeEvaluate(Evaluate evaluate);

    List<Evaluate> getGoodsDetailedEvaluate(Integer goodsID);
}
