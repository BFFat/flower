package com.pang.back.service;

import com.github.pagehelper.PageInfo;
import com.pang.back.Model.GoodsClass;
import com.pang.back.Model.Result;

import java.util.List;

public interface GoodsClassService {
    PageInfo<GoodsClass> getAllGoodsClass(int pageNum, int pageSize, String selectGoodsClassParent);

    Result addGoodsClass(GoodsClass goodsClass);

    Result updateGoodsClass(GoodsClass goodsClass);

    Result deleteGoodsClass(Integer goodsClassID);

    Result selectExistName(String goodsClassName);

    List<String> getParentLevel();

    Result changeGoodsClassShow(Integer goodsClassID);

    List<String> getLower(String goodsClassParent);
}
