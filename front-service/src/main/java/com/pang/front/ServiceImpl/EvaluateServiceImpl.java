package com.pang.front.ServiceImpl;

import com.alibaba.dubbo.config.annotation.Service;
import com.pang.front.Mapper.EvaluateMapper;
import com.pang.front.Model.Evaluate;
import com.pang.front.Model.Result;
import com.pang.front.service.EvaluateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

@Service
@Component
public class EvaluateServiceImpl implements EvaluateService {
    @Autowired
    EvaluateMapper evaluateMapper;

    /**
     * @Author: SmallPang
     * @Description: 添加评论
     * @Date: 2020/3/3
     * @Param evaluate: 评论实体
     * @return: com.pang.front.Model.Result
     **/
    @Override
    public Result addEvaluate(Evaluate evaluate) {
        Result result = new Result();
        result.setMsg("添加评论失败");
        result.setDetail(evaluate.getGoodsID() + evaluate.getUserID());
        int rtnNum = evaluateMapper.addEvaluate(evaluate);
        if (rtnNum == 1) {
            result.setSuccess(true);
            result.setMsg("添加评论成功");
            evaluateMapper.changeOrderEvaluateStatus(evaluate.getOrderID());
            return result;
        }
        return result;
    }

    @Override
    public List<Evaluate> getGoodsAllEvaluate(Long orderID) {
        return evaluateMapper.getGoodsAllEvaluate(orderID);
    }

    @Override
    public Result changeEvaluate(Evaluate evaluate) {
        Result result = new Result();
        result.setMsg("修改评论失败");
        result.setDetail(evaluate.getGoodsID() + evaluate.getUserID());
        int rtnNum = evaluateMapper.changeEvaluate(evaluate);
        if (rtnNum == 1) {
            result.setSuccess(true);
            result.setMsg("修改评论成功");
            return result;
        }
        return result;
    }

    @Override
    public List<Evaluate> getGoodsDetailedEvaluate(Integer goodsID) {
        if (goodsID == null) {
            return evaluateMapper.getGoodsDetailedAllEvaluate();
        }
        return evaluateMapper.getGoodsDetailedEvaluate(goodsID);
    }
}
