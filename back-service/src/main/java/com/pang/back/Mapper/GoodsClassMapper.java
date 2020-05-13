package com.pang.back.Mapper;

import com.pang.back.Model.GoodsClass;
import com.pang.back.Model.goodsCentre;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface GoodsClassMapper {
    @Select("select * from goodsClass where goodsClassParent = #{selectGoodsClassParent} and goodsClassShow = 1")
    List<GoodsClass> getAllGoodsClass(String selectGoodsClassParent);

//    @Select("select * from goodsClass where goodsClassID IN (select childrenID from goodsCentre where parentID = #{goodsClassID}) and goodsClassShow = 1")
//    List<GoodsClass> getAllGoodsClassSecondLevel(int goodsClassID);

    @Insert("insert into goodsClass(goodsClassName, goodsClassLevel, goodsClassShow, goodsClassSort) values(#{goodsClassName}, #{goodsClassLevel}, #{goodsClassShow}, #{goodsClassSort})")
    int addGoodsClass(GoodsClass goodsClass);

    @Update("update goodsClass set goodsClassName = #{goodsClassName}, goodsClassLevel = #{goodsClassLevel}, goodsClassShow = #{goodsClassShow}, goodsClassSort = #{goodsClassSort} where goodsClassID = #{goodsClassID}")
    int updateGoodsClass(GoodsClass goodsClass);

    @Delete("delete from goodsClass where goodsClassID = #{goodsClassID}")
    int deleteGoodsClass(Integer goodsClassID);

    @Select("select * from goodsClass where goodsClassName = #{goodsClassName}")
    GoodsClass selectExistName(String goodsClassName);

    @Select("select goodsClassName from goodsClass where goodsClassLevel = '一级' and goodsClassShow = 1 order by goodsClassSort DESC")
    List<String> getParentLevel();

    @Update("update goodsClass set goodsClassShow = if(goodsClassShow = 0, 1, 0) where goodsClassID = #{goodsClassID}")
    int changeGoodsClassShow(Integer goodsClassID);

    @Select("select goodsClassName from goodsClass where goodsClassParent = #{goodsClassParent} and goodsClassShow = 1 order by goodsClassSort DESC")
    List<String> getLower(String goodsClassParent);

    @Select("select goodsClassID from goodsClass where goodsClassName = #{goodsClassName}")
    int getGoodsClassID(String goodsClassName);

//    @Insert("insert into goodsCentre(parentID, childrenID) values(#{goodsClassParentID}, #{goodsClassChildrenID})")
//    int addGoodsCentre(int goodsClassParentID, int goodsClassChildrenID);
//
//    @Select("select * from goodsCentre where parentID = #{goodsClassParentID} and childrenID = #{goodsClassChildrenID}")
//    List<goodsCentre> selectGoodsCentre(int goodsClassParentID, int goodsClassChildrenID);
}
