package com.pang.back.service;

import com.github.pagehelper.PageInfo;
import com.pang.back.Model.Evaluate;

public interface EvaluateService {
    PageInfo<Evaluate> getAllEvaluate(Integer pageNum, Integer pageSize);

    PageInfo<Evaluate> fuzzySelectEvaluate(Integer pageNum, Integer pageSize, String fuzzyData);
}
