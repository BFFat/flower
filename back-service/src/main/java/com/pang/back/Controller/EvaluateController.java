package com.pang.back.Controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageInfo;
import com.pang.back.Model.Evaluate;
import com.pang.back.service.EvaluateService;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "/evaluate")
public class EvaluateController {
    @Reference
    EvaluateService evaluateService;

    @PostMapping(value = "/getAllEvaluate")
    public PageInfo<Evaluate> getAllEvaluate(@RequestBody JSONObject obj) {
        Integer pageNum = Integer.parseInt(obj.getString("pageNum"));
        Integer pageSize = Integer.parseInt(obj.getString("pageSize"));
        return evaluateService.getAllEvaluate(pageNum, pageSize);
    }

    @PostMapping(value = "/fuzzySelectEvaluate")
    public PageInfo<Evaluate> fuzzySelectEvaluate(@RequestBody JSONObject obj) {
        Integer pageNum = Integer.parseInt(obj.getString("pageNum"));
        Integer pageSize = Integer.parseInt(obj.getString("pageSize"));
        String fuzzyData = obj.getString("fuzzyData");
        return evaluateService.fuzzySelectEvaluate(pageNum, pageSize, fuzzyData);
    }
}
