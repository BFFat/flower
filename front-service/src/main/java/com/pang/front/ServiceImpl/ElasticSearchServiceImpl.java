package com.pang.front.ServiceImpl;

import com.alibaba.dubbo.config.annotation.Service;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.pang.back.Model.Goods;
import com.pang.front.Model.Page;
import com.pang.front.service.ElasticSearchService;
import org.apache.http.HttpEntity;
import org.apache.http.HttpHost;
import org.apache.http.entity.ContentType;
import org.apache.http.nio.entity.NStringEntity;
import org.apache.http.util.EntityUtils;
import org.elasticsearch.client.Response;
import org.elasticsearch.client.RestClient;
import org.junit.Test;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Service
@Component
public class ElasticSearchServiceImpl implements ElasticSearchService {
    private RestClient restClient;

    /**
     * @Author: SmallPang
     * @Description: 综合排序
     * @Date: 2020/3/15
     * @Param goodsName: 搜索名
     * @Param from: 第几行
     * @return: java.util.List<com.pang.back.Model.Goods>
     **/
    @Override
    public Page<Goods> selectGoodsDetailedDescGoodsSort(String goodsName, int from) throws IOException {
        selectRest();
        String size =  "8";
        String page = Integer.toString((from-1)*8);
        String method = "POST";
        String endpoint = "/goods/_doc/_search?from=" + page + "&size=" + size + "&sort=goodsSort:desc";
        HttpEntity entity = new NStringEntity("{\n" +
                "  \"query\": {\n" +
                "    \"match\": {\n" +
                "      \"goodsName\": \"" + goodsName + "\"}\n" +
                "  }\n" +
                "}", ContentType.APPLICATION_JSON);
        Response response = restClient.performRequest(method,endpoint,Collections.<String, String>emptyMap(),entity);
        String responseEntity = EntityUtils.toString(response.getEntity());
        return queryAll(responseEntity, from);
    }

    @Override
    public Page<Goods> selectGoodsDetailedDescGoodsPrice(String goodsName, int from) throws IOException {
        selectRest();
        String size =  "8";
        String page = Integer.toString((from-1)*8);
        String method = "POST";
        String endpoint = "/goods/_doc/_search?from=" + page + "&size=" + size + "&sort=goodsPrice:desc";
        HttpEntity entity = new NStringEntity("{\n" +
                "  \"query\": {\n" +
                "    \"match\": {\n" +
                "      \"goodsName\": \"" + goodsName + "\"}\n" +
                "  }\n" +
                "}", ContentType.APPLICATION_JSON);
        Response response = restClient.performRequest(method,endpoint,Collections.<String, String>emptyMap(),entity);
        String responseEntity = EntityUtils.toString(response.getEntity());
        return queryAll(responseEntity, from);
    }

    @Override
    public Page<Goods> selectGoodsDetailedAscGoodsPrice(String goodsName, int from) throws IOException {
        selectRest();
        String size =  "8";
        String page = Integer.toString((from-1)*8);
        String method = "POST";
        String endpoint = "/goods/_doc/_search?from=" + page + "&size=" + size + "&sort=goodsPrice:asc";
        HttpEntity entity = new NStringEntity("{\n" +
                "  \"query\": {\n" +
                "    \"match\": {\n" +
                "      \"goodsName\": \"" + goodsName + "\"}\n" +
                "  }\n" +
                "}", ContentType.APPLICATION_JSON);
        Response response = restClient.performRequest(method,endpoint,Collections.<String, String>emptyMap(),entity);
        String responseEntity = EntityUtils.toString(response.getEntity());
        return queryAll(responseEntity, from);
    }

    @Override
    public Page<Goods> selectGoodsDetailedDescGoodsSales(String goodsName, int from) throws IOException {
        selectRest();
        String size =  "8";
        String page = Integer.toString((from-1)*8);
        String method = "POST";
        String endpoint = "/goods/_doc/_search?from=" + page + "&size=" + size + "&sort=goodsSales:desc";
        HttpEntity entity = new NStringEntity("{\n" +
                "  \"query\": {\n" +
                "    \"match\": {\n" +
                "      \"goodsName\": \"" + goodsName + "\"}\n" +
                "  }\n" +
                "}", ContentType.APPLICATION_JSON);
        Response response = restClient.performRequest(method,endpoint,Collections.<String, String>emptyMap(),entity);
        String responseEntity = EntityUtils.toString(response.getEntity());
        return queryAll(responseEntity, from);
    }


    public void selectRest(){
        restClient = RestClient.builder(new HttpHost("localhost", 9200, "http")).build();
    }

    public Page<Goods> queryAll(String responseEntity, int from) {
        List<Goods> goodsList = new ArrayList<>();
        JSONObject jsonObject =JSONObject.parseObject(responseEntity);
        JSONObject object = (JSONObject) jsonObject.get("hits");
        JSONArray array = (JSONArray) object.get("hits");
        for (int i = 0;i<array.size();i++){
            JSONObject jj  =  array.getJSONObject(i);
            Goods gg = JSONObject.parseObject(jj.get("_source").toString(), Goods.class);
            goodsList.add(gg);
        }
        JSONObject total = (JSONObject) object.get("total");
        Integer pages = Integer.parseInt(total.get("value").toString());
        Page<Goods> page = new Page<Goods>(pages);
        page.setPageList(goodsList);
        page.setPageNo(from);
        page.setStart((from-1)*8);
        return page;
    }

}
