package com.pang.back.service;

import com.github.pagehelper.PageInfo;
import com.pang.back.Model.Goods;
import com.pang.back.Model.Result;

import java.util.List;

public interface GoodsService {
    Result addGoods(Goods goods);

    Result updateGoods(Goods goods);

    Result deleteGoods(Integer goodsID);

    Result batchDeleteGoods(int[] intArr);

    PageInfo<Goods> fuzzySelectGoods(int pageNum, int pageSize, String fuzzyData);

    PageInfo<Goods> getAllGoods(int pageNum, int pageSize);

    Result selectExistGoodsNumber(String goodsNumber);

    Result changeGoodsHot(Integer goodsID);

    Result changeGoodsShelves(Integer goodsID);

    List<Goods> getHotFlower();

    List<Goods> getHotEternalFlower();

    List<Goods> getHotPresent();

    Goods selectGoodsByID(Integer goodsID);

    PageInfo<Goods> selectAllClass(int pageNum, int pageSize, String selectData);

    PageInfo<Goods> selectAllClassBySales(int pageNum, int pageSize, String selectData);

    PageInfo<Goods> selectAllClassByPriceUp(int pageNum, int pageSize, String selectData);

    PageInfo<Goods> selectAllClassByPriceDown(int pageNum, int pageSize, String selectData);

    Goods selectGoodsDetailedByID(int goodsID);

    List<Goods> productsSelected(int goodsID);

    int getGoodsInventory(Integer goodsID);
}
