package com.pang.front.service;

import com.pang.back.Model.Goods;
import com.pang.front.Model.Page;

import java.io.IOException;
import java.util.List;

public interface ElasticSearchService {
     Page<Goods> selectGoodsDetailedDescGoodsSort(String goodsName, int from) throws IOException;

     Page<Goods> selectGoodsDetailedDescGoodsPrice(String goodsName, int from) throws IOException;

     Page<Goods> selectGoodsDetailedAscGoodsPrice(String goodsName, int from) throws IOException;

     Page<Goods> selectGoodsDetailedDescGoodsSales(String goodsName, int from) throws IOException;
}
