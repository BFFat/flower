package com.pang.back.Controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.pang.back.Model.GoodsClass;
import com.pang.back.Model.Result;
import com.pang.back.service.GoodsClassService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping(value = "/goodsClass")
public class GoodsClassController {
    @Reference
    GoodsClassService goodsClassService;

    /**
     * @Author: SmallPang
     * @Description: 获得全部商品分类信息
     * @Date: 2020/1/3
     * @Param obj: 分页信息
     * @return: com.github.pagehelper.PageInfo<com.pang.back.Model.GoodsClass>
     **/
    @PostMapping(value = "/getAllGoodsClass")
    public PageInfo<GoodsClass> getAllGoodsClass(@RequestBody JSONObject obj) {
        int pageNum = Integer.parseInt(obj.get("pageNum").toString());
        int pageSize = Integer.parseInt(obj.get("pageSize").toString());
        String selectGoodsClassParent = obj.get("selectGoodsClassParent").toString();
        return goodsClassService.getAllGoodsClass(pageNum, pageSize, selectGoodsClassParent);
    }
    /**
     * @Author: SmallPang
     * @Description: 添加商品分类
     * @Date: 2020/1/3
     * @Param obj: 添加信息
     * @return: com.pang.back.Model.Result
     **/
    @PostMapping(value = "/addGoodsClass")
    public Result addGoodsClass(@RequestBody GoodsClass goodsClass) {
        return goodsClassService.addGoodsClass(goodsClass);
    }

    /**
     * @Author: SmallPang
     * @Description: 修改商品分类
     * @Date: 2020/1/3
     * @Param obj: 修改信息
     * @return: com.pang.back.Model.Result
     **/
    @PostMapping(value = "/updateGoodsClass")
    public Result updateGoodsClass(@RequestBody GoodsClass goodsClass) {
        return goodsClassService.updateGoodsClass(goodsClass);
    }

    /**
     * @Author: SmallPang
     * @Description: 删除商品分类
     * @Date: 2020/1/4
     * @Param obj: 删除ID
     * @return: com.pang.back.Model.Result
     **/
    @PostMapping(value = "/deleteGoodsClass")
    public Result deleteGoodsClass(@RequestBody JSONObject obj) {
        Integer goodsClassID = Integer.parseInt(obj.get("goodsClassID").toString());
        return goodsClassService.deleteGoodsClass(goodsClassID);
    }

    /**
     * @Author: SmallPang
     * @Description: 查找名称是否存在
     * @Date: 2020/1/4
     * @Param obj: 商品分类名称
     * @return: com.pang.back.Model.Result
     **/
    @PostMapping(value = "/selectExistName")
    public Result selectExistName(@RequestBody JSONObject obj) {
        String goodsClassName = obj.get("goodsClassName").toString();
        return goodsClassService.selectExistName(goodsClassName);
    }

    /**
     * @Author: SmallPang
     * @Description: 获得一级分类
     * @Date: 2020/1/4

     * @return: java.util.List<java.lang.String>
     **/
    @PostMapping(value = "/getParentLevel")
    public List<String> getParentLevel() {
        return goodsClassService.getParentLevel();
    }

    /**
     * @Author: SmallPang
     * @Description: 改变显示状态
     * @Date: 2020/1/6
     * @Param obj: 改变的ID
     * @return: com.pang.back.Model.Result
     **/
    @PostMapping(value = "/changeGoodsClassShow")
    public Result changeGoodsClassShow(@RequestBody JSONObject obj) {
        Integer goodsClassID = Integer.parseInt(obj.get("goodsClassID").toString());
        return goodsClassService.changeGoodsClassShow(goodsClassID);
    }

    /**
     * @Author: SmallPang
     * @Description: 根据上级名称获得二级分类
     * @Date: 2020/1/6
     * @Param obj: 上级名称
     * @return: java.util.List<java.lang.String>
     **/
    @PostMapping(value = "/getLower")
    public List<String> getLower(@RequestBody JSONObject obj) {
        String goodsClassParent = obj.get("goodsClassParent").toString();
        return goodsClassService.getLower(goodsClassParent);
    }
}
