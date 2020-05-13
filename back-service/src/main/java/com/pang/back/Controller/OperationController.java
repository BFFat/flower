package com.pang.back.Controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.pang.back.Model.Operation;
import com.pang.back.service.OperationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping(value = "/operation")
public class OperationController {
    @Reference
    OperationService operationService;

    /**
     * @Author: SmallPang
     * @Description: 操作日志
     * @Date: 2020/2/11
     * @Param operatorID: 操作者ID
     * @Param startTime: 开始时间
     * @Param endTime: 结束时间
     * @return: com.github.pagehelper.PageInfo<com.pang.back.Model.Operation>
     **/
    @PostMapping(value = "/selectOperatorInfo")
    public PageInfo<Operation> selectOperatorInfo(@RequestBody(required=false) JSONObject obj) {
        int pageNum = Integer.parseInt(obj.get("pageNum").toString());
        int pageSize = Integer.parseInt(obj.get("pageSize").toString());
        Integer operatorID = null;
        if (!obj.get("operatorID").toString().equals("")){
            operatorID = Integer.parseInt(obj.get("operatorID").toString());
        }
        String startTime = obj.get("startTime").toString();
        String endTime = obj.get("endTime").toString();
        return operationService.selectOperatorInfo(pageNum, pageSize, operatorID, startTime, endTime);
    }


    /**
     * @Author: SmallPang
     * @Description: 返回全部操作日志
     * @Date: 2019/12/26
     * @Param obj:
     * @return: com.github.pagehelper.PageInfo<com.pang.back.Model.Operation>
     **/
    @PostMapping(value = "/getAllOperation")
    public PageInfo<Operation> getAllOperation(@RequestBody JSONObject obj) {
        int pageNum = Integer.parseInt(obj.get("pageNum").toString());
        int pageSize = Integer.parseInt(obj.get("pageSize").toString());
        return operationService.getAllOperation(pageNum, pageSize);
    }
}
