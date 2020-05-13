package com.pang.front.Controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.alibaba.fastjson.JSONObject;
import com.pang.front.Model.Evaluate;
import com.pang.front.Model.Result;
import com.pang.front.service.EvaluateService;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;

@RestController
@RequestMapping(value = "/evaluate")
public class EvaluateController {
    @Reference
    EvaluateService evaluateService;

    /**
     * @Author: SmallPang
     * @Description: 添加评论
     * @Date: 2020/3/3
     * @Param evaluate: 评论实体
     * @return: com.pang.front.Model.Result
     **/
    @PostMapping(value = "/addEvaluate")
    public Result addEvaluate(
            @RequestParam(value = "goodsID") Integer goodsID,
            @RequestParam(value = "userID") Integer userID,
            @RequestParam(value = "orderID") Long orderID,
            @RequestParam(value = "evaluateContent") String evaluateContent,
            @RequestParam(value = "imageList", required = false) MultipartFile[] imageList
    ) throws IOException {
        Evaluate evaluate = new Evaluate();
        evaluate.setGoodsID(goodsID);
        evaluate.setUserID(userID);
        evaluate.setOrderID(orderID);
        evaluate.setEvaluateContent(evaluateContent);
        String src = "http://localhost:8889/";

        StringBuilder submitImageList = new StringBuilder();
        for (int i = 0; i < imageList.length; i++) {
            MultipartFile file = imageList[i];
            if (file != null) {
                String fileName = file.getOriginalFilename() + System.currentTimeMillis();
                String trueImageList = goodsID + userID +"_evaluate" + i + ".jpg";
                String path = "G:\\nginx\\img\\" + trueImageList;
                File dest = new File(path);
                if (!dest.getParentFile().exists()) {
                    System.out.println("文件路径不存在");
                }
                file.transferTo(dest);
                String newSrc = src + trueImageList;
                submitImageList.append(newSrc);
                if ((i + 1) != imageList.length) {
                    submitImageList.append(",");
                }
            } else {
                System.out.println("文件为空");
            }
        }
        evaluate.setEvaluateImageList(submitImageList.toString());
        return evaluateService.addEvaluate(evaluate);
    }

    @PostMapping(value = "/changeEvaluate")
    public Result changeEvaluate(
            @RequestParam(value = "goodsID") Integer goodsID,
            @RequestParam(value = "userID") Integer userID,
            @RequestParam(value = "orderID") Long orderID,
            @RequestParam(value = "evaluateContent") String evaluateContent,
            @RequestParam(value = "imageList", required = false) MultipartFile[] imageList
    ) throws IOException {
        Evaluate evaluate = new Evaluate();
        evaluate.setGoodsID(goodsID);
        evaluate.setUserID(userID);
        evaluate.setOrderID(orderID);
        evaluate.setEvaluateContent(evaluateContent);
        String src = "http://localhost:8889/";

        StringBuilder submitImageList = new StringBuilder();
        for (int i = 0; i < imageList.length; i++) {
            MultipartFile file = imageList[i];
            if (file != null) {
                String fileName = file.getOriginalFilename() + System.currentTimeMillis();
                String trueImageList = goodsID + userID +"_evaluate" + i + ".jpg";
                String path = "G:\\nginx\\img\\" + trueImageList;
                File dest = new File(path);
                if (!dest.getParentFile().exists()) {
                    System.out.println("文件路径不存在");
                }
                file.transferTo(dest);
                String newSrc = src + trueImageList;
                submitImageList.append(newSrc);
                if ((i + 1) != imageList.length) {
                    submitImageList.append(",");
                }
            } else {
                System.out.println("文件为空");
            }
        }
        evaluate.setEvaluateImageList(submitImageList.toString());
        return evaluateService.changeEvaluate(evaluate);
    }

    @PostMapping(value = "/getGoodsAllEvaluate")
    public List<Evaluate> getGoodsAllEvaluate(@RequestBody JSONObject obj) {
        Long orderID = Long.parseLong(obj.getString("orderID"));
        return evaluateService.getGoodsAllEvaluate(orderID);
    }
}
