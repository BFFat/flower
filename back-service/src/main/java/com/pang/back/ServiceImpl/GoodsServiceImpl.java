package com.pang.back.ServiceImpl;

import com.alibaba.dubbo.config.annotation.Service;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.pang.back.Mapper.GoodsMapper;
import com.pang.back.Model.Goods;
import com.pang.back.Model.Result;
import com.pang.back.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

@Service
public class GoodsServiceImpl implements GoodsService {
    @Autowired
    private GoodsMapper goodsMapper;

    /**
     * @Author: SmallPang
     * @Description: 添加商品
     * @Date: 2020/1/6
     * @Param goods: 商品实体
     * @return: com.pang.back.Model.Result
     **/
    @Override
    public Result addGoods(Goods goods) {
        Result result = new Result();
        result.setMsg("添加商品失败");
        int rtnNum = goodsMapper.addGoods(goods);
        if (rtnNum == 1) {
            result.setMsg("添加商品成功");
            result.setSuccess(true);
            result.setDetail(goods);
            System.out.println("添加商品成功");
            return result;
        }
        System.out.println("添加商品失败");
        return null;
    }

    /**
     * @Author: SmallPang
     * @Description: 修改商品
     * @Date: 2020/1/6
     * @Param goods: 商品实体
     * @return: com.pang.back.Model.Result
     **/
    @Override
    public Result updateGoods(Goods goods) {
        Result result = new Result();
        result.setMsg("修改商品失败");
        int rtnNum = goodsMapper.updateGoods(goods);
        if (rtnNum == 1) {
            result.setMsg("修改商品成功");
            result.setSuccess(true);
            result.setDetail(goods);
            System.out.println("修改商品成功");
            return result;
        }
        System.out.println("修改商品失败");
        return result;
    }

    /**
     * @Author: SmallPang
     * @Description: 删除商品
     * @Date: 2020/1/6
     * @Param goodsID: 商品ID
     * @return: com.pang.back.Model.Result
     **/
    @Override
    public Result deleteGoods(Integer goodsID) {
        Result result = new Result();
        result.setMsg("删除商品失败");
        int rtnNum = goodsMapper.deleteGoods(goodsID);
        if (rtnNum == 1) {
            result.setMsg("删除商品成功");
            result.setSuccess(true);
            result.setDetail(goodsID);
            System.out.println("删除商品成功");
            return result;
        }
        System.out.println("删除商品失败");
        return result;
    }

    /**
     * @Author: SmallPang
     * @Description: 批量删除
     * @Date: 2020/1/6
     * @Param intArr: 批量删除ID数组
     * @return: com.pang.back.Model.Result
     **/
    @Override
    public Result batchDeleteGoods(int[] intArr) {
        Result result = new Result();
        result.setMsg("批量删除失败");
        int rtnNum = goodsMapper.batchDeleteGoods(intArr);
        if (rtnNum == intArr.length) {
            result.setMsg("批量删除成功");
            result.setSuccess(true);
            result.setDetail(intArr);
            System.out.println("批量删除成功");
            return result;
        }
        System.out.println("批量删除失败");
        return result;
    }

    /**
     * @Author: SmallPang
     * @Description: 关键字搜索
     * @Date: 2020/1/6
     * @Param fuzzyData: 关键字
     * @return: java.util.List<com.pang.back.Model.Goods>
     **/
    @Override
    public PageInfo<Goods> fuzzySelectGoods(int pageNum, int pageSize, String fuzzyData) {
        PageHelper.startPage(pageNum, pageSize);
        List<Goods> list = goodsMapper.fuzzySelectGoods(fuzzyData);
        PageInfo<Goods> info = new PageInfo<>(list);
        return info;
    }

    /**
     * @Author: SmallPang
     * @Description: 得到全部商品
     * @Date: 2020/1/6
     * @return: java.util.List<com.pang.back.Model.Goods>
     **/
    @Override
    public PageInfo<Goods> getAllGoods(int pageNum, int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Goods> list = goodsMapper.getAllGoods();
        PageInfo<Goods> info = new PageInfo<>(list);
        return info;
    }

    /**
     * @Author: SmallPang
     * @Description: 查看商品货号是否存在
     * @Date: 2020/1/7
     * @Param goodsNumber: 商品货号
     * @return: com.pang.back.Model.Result
     **/
    @Override
    public Result selectExistGoodsNumber(String goodsNumber) {
        Result result = new Result();
        result.setMsg("商品货号已存在");
        Goods existGoods = goodsMapper.selectExistGoodsNumber(goodsNumber);
        if (existGoods == null) {
            result.setMsg("商品货号不存在");
            result.setSuccess(true);
            result.setDetail(goodsNumber);
            System.out.println("商品货号不存在");
            return result;
        }
        System.out.println("商品货号已存在");
        return result;
    }

    /**
     * @Author: SmallPang
     * @Description: 修改热门状态
     * @Date: 2020/1/7
     * @Param goodsID: 商品ID
     * @return: com.pang.back.Model.Result
     **/
    @Override
    public Result changeGoodsHot(Integer goodsID) {
        Result result = new Result();
        result.setMsg("修改热门失败");
        int rtnNum = goodsMapper.changeGoodsHot(goodsID);
        if (rtnNum == 1) {
            result.setMsg("修改热门成功");
            result.setSuccess(true);
            result.setDetail(goodsID);
            System.out.println("修改热门成功");
            return result;
        }
        System.out.println("修改热门失败");
        return result;
    }

    /**
     * @Author: SmallPang
     * @Description: 修改上架状态
     * @Date: 2020/1/7
     * @Param goodsID: 商品ID
     * @return: com.pang.back.Model.Result
     **/
    @Override
    public Result changeGoodsShelves(Integer goodsID) {
        Result result = new Result();
        result.setMsg("修改上架失败");
        int rtnNum = goodsMapper.changeGoodsShelves(goodsID);
        if (rtnNum == 1) {
            result.setMsg("修改上架成功");
            result.setSuccess(true);
            result.setDetail(goodsID);
            System.out.println("修改上架成功");
            return result;
        }
        System.out.println("修改上架失败");
        return result;
    }

    /**
     * @Author: SmallPang
     * @Description: 得到热门鲜花
     * @Date: 2020/2/14

     * @return: java.util.List<com.pang.back.Model.Goods>
     **/
    @Override
    public List<Goods> getHotFlower() {
        return goodsMapper.getHotFlower();
    }

    /**
     * @Author: SmallPang
     * @Description: 得到热门永生花
     * @Date: 2020/2/14

     * @return: java.util.List<com.pang.back.Model.Goods>
     **/
    @Override
    public List<Goods> getHotEternalFlower() {
        return goodsMapper.getHotEternalFlower();
    }

    /**
     * @Author: SmallPang
     * @Description: 得到热门礼品
     * @Date: 2020/2/14

     * @return: java.util.List<com.pang.back.Model.Goods>
     **/
    @Override
    public List<Goods> getHotPresent() {
        return goodsMapper.getHotPresent();
    }

    /**
     * @Author: SmallPang
     * @Description: 修改商品时返回该商品的信息
     * @Date: 2020/2/14
     * @Param goodsID: 商品ID
     * @return: com.pang.back.Model.Goods
     **/
    @Override
    public Goods selectGoodsByID(Integer goodsID) {
        return goodsMapper.selectGoodsByID(goodsID);
    }

    /**
     * @Author: SmallPang
     * @Description: 综合分类
     * @Date: 2020/2/16
     * @Param pageNum: 页号
     * @Param pageSize: 页数
     * @Param selectData: 选择分类
     * @return: com.github.pagehelper.PageInfo<com.pang.back.Model.Goods>
     **/
    @Override
    public PageInfo<Goods> selectAllClass(int pageNum, int pageSize, String selectData) {
        PageHelper.startPage(pageNum, pageSize);
        List<Goods> list = goodsMapper.selectAllClass(selectData);
        PageInfo<Goods> info = new PageInfo<>(list);
        return info;
    }

    /**
     * @Author: SmallPang
     * @Description: 售量分类
     * @Date: 2020/2/16
     * @Param pageNum: 页号
     * @Param pageSize: 页数
     * @Param selectData: 选择分类
     * @return: com.github.pagehelper.PageInfo<com.pang.back.Model.Goods>
     **/
    @Override
    public PageInfo<Goods> selectAllClassBySales(int pageNum, int pageSize, String selectData) {
        PageHelper.startPage(pageNum, pageSize);
        List<Goods> list = goodsMapper.selectAllClassBySales(selectData);
        PageInfo<Goods> info = new PageInfo<>(list);
        return info;
    }

    /**
     * @Author: SmallPang
     * @Description: 分类价格升序
     * @Date: 2020/2/16
     * @Param pageNum: 页号
     * @Param pageSize: 页数
     * @Param selectData: 选择分类
     * @return: com.github.pagehelper.PageInfo<com.pang.back.Model.Goods>
     **/
    @Override
    public PageInfo<Goods> selectAllClassByPriceUp(int pageNum, int pageSize, String selectData) {
        PageHelper.startPage(pageNum, pageSize);
        List<Goods> list = goodsMapper.selectAllClassByPriceUp(selectData);
        PageInfo<Goods> info = new PageInfo<>(list);
        return info;
    }

    /**
     * @Author: SmallPang
     * @Description: 分类价格降序
     * @Date: 2020/2/16
     * @Param pageNum: 页号
     * @Param pageSize: 页数
     * @Param selectData: 选择分类
     * @return: com.github.pagehelper.PageInfo<com.pang.back.Model.Goods>
     **/
    @Override
    public PageInfo<Goods> selectAllClassByPriceDown(int pageNum, int pageSize, String selectData) {
        PageHelper.startPage(pageNum, pageSize);
        List<Goods> list = goodsMapper.selectAllClassByPriceDown(selectData);
        PageInfo<Goods> info = new PageInfo<>(list);
        return info;
    }

    /**
     * @Author: SmallPang
     * @Description: 通过ID查看商品详情
     * @Date: 2020/2/16
     * @Param goodsID: 商品ID
     * @return: com.pang.back.Model.Goods
     **/
    @Override
    public Goods selectGoodsDetailedByID(int goodsID) {
        return goodsMapper.selectGoodsDetailedByID(goodsID);
    }


    @Override
    public List<Goods> productsSelected(int goodsID) {
        return goodsMapper.productsSelected(goodsID);
    }

    @Override
    public int getGoodsInventory(Integer goodsID) {
        return goodsMapper.getGoodsInventory(goodsID);
    }
}
