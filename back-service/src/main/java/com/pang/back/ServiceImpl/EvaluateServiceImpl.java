package com.pang.back.ServiceImpl;

import com.alibaba.dubbo.config.annotation.Service;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.pang.back.Mapper.EvaluateMapper;
import com.pang.back.Model.Evaluate;
import com.pang.back.Model.Goods;
import com.pang.back.service.EvaluateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

@Service
public class EvaluateServiceImpl implements EvaluateService {
    @Autowired
    EvaluateMapper evaluateMapper;

    @Override
    public PageInfo<Evaluate> getAllEvaluate(Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Evaluate> list = evaluateMapper.getAllEvaluate();
        PageInfo<Evaluate> info = new PageInfo<>(list);
        return info;
    }

    @Override
    public PageInfo<Evaluate> fuzzySelectEvaluate(Integer pageNum, Integer pageSize, String fuzzyData) {
        PageHelper.startPage(pageNum, pageSize);
        List<Evaluate> list = evaluateMapper.fuzzySelectEvaluate(fuzzyData);
        PageInfo<Evaluate> info = new PageInfo<>(list);
        return info;
    }
}
