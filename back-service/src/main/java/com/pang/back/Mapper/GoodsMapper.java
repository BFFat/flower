package com.pang.back.Mapper;

import com.pang.back.Model.Goods;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface GoodsMapper {

    int addGoods(Goods goods);

    int updateGoods(Goods goods);

    @Delete("delete from goods where goodsID = #{goodsID}")
    int deleteGoods(Integer goodsID);

    int batchDeleteGoods(int[] intArr);

    List<Goods> fuzzySelectGoods(String fuzzyData);

    @Select("select * from goods")
    List<Goods> getAllGoods();

    @Select("select * from goods where goodsNumber = #{goodsNumber}")
    Goods selectExistGoodsNumber(String goodsNumber);

    @Update("update goods set goodsHot = if(goodsHot = 0, 1, 0) where goodsID = #{goodsID}")
    int changeGoodsHot(Integer goodsID);

    @Update("update goods set goodsShelves = if(goodsShelves = 0, 1, 0) where goodsID = #{goodsID}")
    int changeGoodsShelves(Integer goodsID);

    @Select("select * from goods where goodsID = #{goodsID}")
    Goods selectGoodsByID(Integer goodsID);

    @Select("select * from goods where goodsClassName IN (select goodsClassName from goodsClass where goodsClassParent = '鲜花') and goodsHot = 1 and goodsShelves = 1 limit 8")
    List<Goods> getHotFlower();

    @Select("select * from goods where goodsClassName IN (select goodsClassName from goodsClass where goodsClassParent = '永生花') and goodsHot = 1 and goodsShelves = 1 limit 8")
    List<Goods> getHotEternalFlower();

    @Select("select * from goods where goodsClassName IN (select goodsClassName from goodsClass where goodsClassParent = '礼品') and goodsHot = 1 and goodsShelves = 1 limit 8")
    List<Goods> getHotPresent();

    @Select("select * from goods where goodsClassName IN (select goodsClassName from goodsClass where goodsClassParent = #{selectData}) and goodsShelves = 1 order by goodsSort DESC")
    List<Goods> selectAllClass(String selectData);

    @Select("select * from goods where goodsClassName IN (select goodsClassName from goodsClass where goodsClassParent = #{selectData}) and goodsShelves = 1 order by goodsSales DESC")
    List<Goods> selectAllClassBySales(String selectData);

    @Select("select * from goods where goodsClassName IN (select goodsClassName from goodsClass where goodsClassParent = #{selectData}) and goodsShelves = 1 order by goodsPrice ASC")
    List<Goods> selectAllClassByPriceUp(String selectData);

    @Select("select * from goods where goodsClassName IN (select goodsClassName from goodsClass where goodsClassParent = #{selectData}) and goodsShelves = 1 order by goodsPrice DESC")
    List<Goods> selectAllClassByPriceDown(String selectData);

    @Select("select * from goods where goodsID = #{goodsID}")
    Goods selectGoodsDetailedByID(int goodsID);

    @Select("select * from goods where goodsClassName IN (select goodsClassName from goods where goodsID = #{goodsID}) and goodsShelves = 1 and goodsHot = 1 and goodsID not IN(#{goodsID}) order by goodsSort DESC limit 3")
    List<Goods> productsSelected(int goodsID);

    @Select("select goodsInventory from goods where goodsID = #{goodsID}")
    int getGoodsInventory(Integer goodsID);
}
