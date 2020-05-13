package com.pang.back.ServiceImpl;

import com.alibaba.dubbo.config.annotation.Service;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.pang.back.Mapper.GoodsClassMapper;
import com.pang.back.Model.GoodsClass;
import com.pang.back.Model.Result;
import com.pang.back.Model.goodsCentre;
import com.pang.back.service.GoodsClassService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;


@Service
public class GoodsClassServiceImpl implements GoodsClassService {
    @Autowired
    private GoodsClassMapper goodsClassMapper;

    /**
     * @Author: SmallPang
     * @Description: 获得全部商品分类信息
     * @Date: 2020/1/3

     * @return: java.util.List<com.pang.back.Model.GoodsClass>
     **/
    @Override
    public PageInfo<GoodsClass> getAllGoodsClass(int pageNum, int pageSize, String selectGoodsClassParent) {
        PageHelper.startPage(pageNum, pageSize);
        List<GoodsClass> list = goodsClassMapper.getAllGoodsClass(selectGoodsClassParent);
        PageInfo<GoodsClass> info = new PageInfo<>(list);
        return info;
    }

    /**
     * @Author: SmallPang
     * @Description: 添加商品分类
     * @Date: 2020/1/3
     * @Param goodsClass: 添加信息
     * @return: com.pang.back.Model.Result
     **/
    @Override
    public Result addGoodsClass(GoodsClass goodsClass) {

        Result result = new Result();
        result.setMsg("添加商品分类失败");
        int rtnNum = goodsClassMapper.addGoodsClass(goodsClass);
        if (rtnNum == 1) {
            result.setMsg("添加商品分类成功");
            result.setSuccess(true);
            result.setDetail(goodsClass);
            System.out.println("添加商品分类成功");
//            if (!goodsClass.getGoodsClassParent().equals("无")) {
//                int goodsClassParentID = goodsClassMapper.getGoodsClassID(goodsClass.getGoodsClassParent());
//                int goodsClassChildrenID = goodsClassMapper.getGoodsClassID(goodsClass.getGoodsClassName());
//                List<goodsCentre> goodsCentreList = goodsClassMapper.selectGoodsCentre(goodsClassParentID, goodsClassChildrenID);
//                if (goodsCentreList == null) {
//                    int insertNum = goodsClassMapper.addGoodsCentre(goodsClassParentID, goodsClassChildrenID);
//                    if (insertNum == 1) {
//                        System.out.println("添加中间表成功");
//                    } else {
//                        System.out.println("添加中间表失败");
//                    }
//                } else {
//                    System.out.println("数据已存在");
//                }
//            }
            return result;
        }
        System.out.println("添加商品分类失败");
        return result;
    }

    /**
     * @Author: SmallPang
     * @Description: 修改商品分类
     * @Date: 2020/1/3
     * @Param goodsClass: 修改信息
     * @return: com.pang.back.Model.Result
     **/
    @Override
    public Result updateGoodsClass(GoodsClass goodsClass) {
        Result result = new Result();
        result.setMsg("修改商品分类失败");
        int rtnNum = goodsClassMapper.updateGoodsClass(goodsClass);
        if (rtnNum == 1) {
            result.setMsg("修改商品分类成功");
            result.setSuccess(true);
            result.setDetail(goodsClass);
            System.out.println("修改商品分类成功");
//            if (!goodsClass.getGoodsClassParent().equals("无")) {
//                int goodsClassParentID = goodsClassMapper.getGoodsClassID(goodsClass.getGoodsClassParent());
//                int goodsClassChildrenID = goodsClassMapper.getGoodsClassID(goodsClass.getGoodsClassName());
//                List<goodsCentre> goodsCentreList = goodsClassMapper.selectGoodsCentre(goodsClassParentID, goodsClassChildrenID);
//                if (goodsCentreList == null) {
//                    int insertNum = goodsClassMapper.addGoodsCentre(goodsClassParentID, goodsClassChildrenID);
//                    if (insertNum == 1) {
//                        System.out.println("添加中间表成功");
//                    } else {
//                        System.out.println("添加中间表失败");
//                    }
//                } else {
//                    System.out.println("数据已存在");
//                }
//            }
            return result;
        }
        System.out.println("修改商品分类失败");
        return result;
    }

    /**
     * @Author: SmallPang
     * @Description: 删除商品分类
     * @Date: 2020/1/4
     * @Param goodsClassID: 删除ID
     * @return: com.pang.back.Model.Result
     **/
    @Override
    public Result deleteGoodsClass(Integer goodsClassID) {
        Result result = new Result();
        result.setMsg("删除商品分类失败");
        int rtnNum = goodsClassMapper.deleteGoodsClass(goodsClassID);
        if (rtnNum == 1) {
            result.setMsg("删除商品分类成功");
            result.setSuccess(true);
            result.setDetail(goodsClassID);
            System.out.println("删除商品分类成功");
            return result;
        }
        System.out.println("删除商品分类失败");
        return result;
    }

    /**
     * @Author: SmallPang
     * @Description: 查找商品分类名称是否存在
     * @Date: 2020/1/4
     * @Param goodsClassName: 商品分类名称
     * @return: com.pang.back.Model.Result
     **/
    @Override
    public Result selectExistName(String goodsClassName) {
        Result result = new Result();
        result.setMsg("商品分类名称已存在");
        GoodsClass goodsClass = goodsClassMapper.selectExistName(goodsClassName);
        if (goodsClass == null) {
            result.setMsg("商品分类名称可用");
            result.setSuccess(true);
            result.setDetail(goodsClassName);
            System.out.println("商品分类名称可用");
            return result;
        }
        result.setDetail(goodsClass);
        System.out.println("商品分类名称已存在");
        return result;
    }

    /**
     * @Author: SmallPang
     * @Description: 获得一级分类
     * @Date: 2020/1/4

     * @return: java.util.List<java.lang.String>
     **/
    @Override
    public List<String> getParentLevel() {
        return goodsClassMapper.getParentLevel();
    }

    /**
     * @Author: SmallPang
     * @Description: 修改单选框显示状态
     * @Date: 2020/1/5
     * @Param goodsClassID: 商品分类ID
     * @return: com.pang.back.Model.Result
     **/
    @Override
    public Result changeGoodsClassShow(Integer goodsClassID) {
        Result result = new Result();
        result.setMsg("修改失败");
        int rtnNum = goodsClassMapper.changeGoodsClassShow(goodsClassID);
        if (rtnNum == 1) {
            result.setMsg("修改成功");
            result.setSuccess(true);
            result.setDetail(goodsClassID);
            System.out.println("修改成功");
            return result;
        }
        System.out.println("修改失败");
        return result;
    }

    @Override
    public List<String> getLower(String goodsClassParent) {
        return goodsClassMapper.getLower(goodsClassParent);
    }


}
