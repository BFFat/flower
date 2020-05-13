package com.pang.front.Controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageInfo;
import com.pang.back.Model.Goods;
import com.pang.back.service.GoodsService;
import com.pang.back.service.UserInfoService;
import com.pang.back.Model.UserInfo;
import com.pang.front.Model.Evaluate;
//import com.pang.front.Repository.GoodsByESRepository;
//import com.pang.front.service.ElasticSearchService;
import com.pang.front.Model.Page;
import com.pang.front.service.ElasticSearchService;
import com.pang.front.service.EvaluateService;
import org.apache.http.HttpEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.List;

@RestController
@RequestMapping(value = "/front")
public class FrontHomeController {
    @Reference
    GoodsService goodsService;

    @Reference
    EvaluateService evaluateService;

    @Reference
    UserInfoService userInfoService;

    @Reference
    ElasticSearchService elasticSearchService;

    /**
     * @Author: SmallPang
     * @Description: 得到热门鲜花
     * @Date: 2020/2/14

     * @return: java.util.List<com.pang.back.Model.Goods>
     **/
    @PostMapping(value = "/getHotFlower")
    public List<Goods> getHotFlower() {
        return goodsService.getHotFlower();
    }

    /**
     * @Author: SmallPang
     * @Description: 得到热门永生花
     * @Date: 2020/2/14

     * @return: java.util.List<com.pang.back.Model.Goods>
     **/
    @PostMapping(value = "/getHotEternalFlower")
    public List<Goods> getHotEternalFlower() {
        return goodsService.getHotEternalFlower();
    }

    /**
     * @Author: SmallPang
     * @Description: 得到热门礼品
     * @Date: 2020/2/14

     * @return: java.util.List<com.pang.back.Model.Goods>
     **/
    @PostMapping(value = "/getHotPresent")
    public List<Goods> getHotPresent() {
        return goodsService.getHotPresent();
    }

    /**
     * @Author: SmallPang
     * @Description: 综合分类
     * @Date: 2020/2/16
     * @Param obj: pageNum：页号， pageSize：页数， selectData：选择分类
     * @return: com.github.pagehelper.PageInfo<com.pang.back.Model.Goods>
     **/
    @PostMapping(value = "/selectAllClass")
    public PageInfo<Goods> selectAllClass(@RequestBody JSONObject obj) {
        int pageNum = Integer.parseInt(obj.get("pageNum").toString());
        int pageSize = Integer.parseInt(obj.get("pageSize").toString());
        String selectData = obj.get("selectData").toString();
        return goodsService.selectAllClass(pageNum, pageSize, selectData);
    }

    /**
     * @Author: SmallPang
     * @Description: 售量分类
     * @Date: 2020/2/16
     * @Param obj: pageNum：页号， pageSize：页数， selectData：选择分类
     * @return: com.github.pagehelper.PageInfo<com.pang.back.Model.Goods>
     **/
    @PostMapping(value = "/selectAllClassBySales")
    public PageInfo<Goods> selectAllClassBySales(@RequestBody JSONObject obj) {
        int pageNum = Integer.parseInt(obj.get("pageNum").toString());
        int pageSize = Integer.parseInt(obj.get("pageSize").toString());
        String selectData = obj.get("selectData").toString();
        return goodsService.selectAllClassBySales(pageNum, pageSize, selectData);
    }

    /**
     * @Author: SmallPang
     * @Description: 分类价格升序
     * @Date: 2020/2/16
     * @Param obj: pageNum：页号， pageSize：页数， selectData：选择分类
     * @return: com.github.pagehelper.PageInfo<com.pang.back.Model.Goods>
     **/
    @PostMapping(value = "/selectAllClassByPriceUp")
    public PageInfo<Goods> selectAllClassByPriceUp(@RequestBody JSONObject obj) {
        int pageNum = Integer.parseInt(obj.get("pageNum").toString());
        int pageSize = Integer.parseInt(obj.get("pageSize").toString());
        String selectData = obj.get("selectData").toString();
        return goodsService.selectAllClassByPriceUp(pageNum, pageSize, selectData);
    }

    /**
     * @Author: SmallPang
     * @Description: 分类价格降序
     * @Date: 2020/2/16
     * @Param obj: pageNum：页号， pageSize：页数， selectData：选择分类
     * @return: com.github.pagehelper.PageInfo<com.pang.back.Model.Goods>
     **/
    @PostMapping(value = "/selectAllClassByPriceDown")
    public PageInfo<Goods> selectAllClassByPriceDown(@RequestBody JSONObject obj) {
        int pageNum = Integer.parseInt(obj.get("pageNum").toString());
        int pageSize = Integer.parseInt(obj.get("pageSize").toString());
        String selectData = obj.get("selectData").toString();
        return goodsService.selectAllClassByPriceDown(pageNum, pageSize, selectData);
    }

    /**
     * @Author: SmallPang
     * @Description: 通过ID查看商品详情
     * @Date: 2020/2/16
     * @Param obj: goodsID：商品ID
     * @return: java.util.List<com.pang.back.Model.Goods>
     **/
    @PostMapping(value = "/selectGoodsDetailedByID")
    public Goods selectGoodsDetailedByID(@RequestBody JSONObject obj) {
        int goodsID = Integer.parseInt(obj.get("goodsID").toString());
        return goodsService.selectGoodsDetailedByID(goodsID);
    }

    @PostMapping(value = "/productsSelected")
    public List<Goods> productsSelected(@RequestBody JSONObject obj) {
        int goodsID = Integer.parseInt(obj.get("goodsID").toString());
        return goodsService.productsSelected(goodsID);
    }

    @PostMapping(value = "/getUserInfo")
    public UserInfo getUserInfo(@RequestBody JSONObject obj) {
        Integer userID = Integer.parseInt(obj.getString("userID"));
        return userInfoService.getUserInfo(userID);
    }

    @PostMapping(value = "/getGoodsInventory")
    public int getGoodsInventory(@RequestBody JSONObject obj) {
        Integer goodsID = Integer.parseInt(obj.getString("goodsID"));
        return goodsService.getGoodsInventory(goodsID);
    }

    @PostMapping(value = "/getGoodsDetailedEvaluate")
    public List<Evaluate> getGoodsDetailedEvaluate(@RequestBody JSONObject obj) {
        Integer goodsID = null;
        if (!obj.getString("goodsID").equals("")) {
            goodsID = Integer.parseInt(obj.getString("goodsID"));
        }
        return evaluateService.getGoodsDetailedEvaluate(goodsID);
    }

    @PostMapping(value = "/selectGoodsDetailedDescGoodsSort")
    public Page<Goods> selectGoodsDetailedDescGoodsSort(@RequestBody JSONObject obj) throws IOException {
        String selectData = obj.getString("selectData");
        int from = Integer.parseInt(obj.getString("from"));
        return elasticSearchService.selectGoodsDetailedDescGoodsSort(selectData, from);
    }

    @PostMapping(value = "/selectGoodsDetailedDescGoodsPrice")
    public Page<Goods> selectGoodsDetailedDescGoodsPrice(@RequestBody JSONObject obj) throws IOException {
        String selectData = obj.getString("selectData");
        int from = Integer.parseInt(obj.getString("from"));
        return elasticSearchService.selectGoodsDetailedDescGoodsPrice(selectData, from);
    }

    @PostMapping(value = "/selectGoodsDetailedAscGoodsPrice")
    public Page<Goods> selectGoodsDetailedAscGoodsPrice(@RequestBody JSONObject obj) throws IOException {
        String selectData = obj.getString("selectData");
        int from = Integer.parseInt(obj.getString("from"));
        return elasticSearchService.selectGoodsDetailedAscGoodsPrice(selectData, from);
    }

    @PostMapping(value = "/selectGoodsDetailedDescGoodsSales")
    public Page<Goods> selectGoodsDetailedDescGoodsSales(@RequestBody JSONObject obj) throws IOException {
        String selectData = obj.getString("selectData");
        int from = Integer.parseInt(obj.getString("from"));
        return elasticSearchService.selectGoodsDetailedDescGoodsSales(selectData, from);
    }
}
