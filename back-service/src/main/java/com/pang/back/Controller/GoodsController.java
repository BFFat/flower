package com.pang.back.Controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.alibaba.fastjson.JSONObject;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.pang.back.Model.Goods;
import com.pang.back.Model.Result;
import com.pang.back.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;

@RestController
@RequestMapping(value = "/goods")
public class GoodsController {
    @Reference
    GoodsService goodsService;

    /**
     * @Author: SmallPang
     * @Description: 添加商品
     * @Date: 2020/1/6
     * @Param goodsClassName:
     * @Param goodsName:
     * @Param goodsSubTitle:
     * @Param goodsNumber:
     * @Param goodsHot:
     * @Param goodsShelves:
     * @Param goodsMarketPrice:
     * @Param goodsPrice:
     * @Param goodsInventory:
     * @Param goodsSort:
     * @Param goodsPresentExp:
     * @Param imageList:
     * @Param detailedImageList:
     * @return: com.pang.back.Model.Result
     **/
    @PostMapping(value = "/addGoods")
    public Result addGoods(
            @RequestParam(value = "goodsClassName")String goodsClassName,
            @RequestParam(value = "goodsName")String goodsName,
            @RequestParam(value = "goodsSubTitle")String goodsSubTitle,
            @RequestParam(value = "goodsNumber")String goodsNumber,
            @RequestParam(value = "goodsHot")Boolean goodsHot,
            @RequestParam(value = "goodsShelves")Boolean goodsShelves,
            @RequestParam(value = "goodsMarketPrice")Double goodsMarketPrice,
            @RequestParam(value = "goodsPrice")Double goodsPrice,
            @RequestParam(value = "goodsSales")int goodsSales,
            @RequestParam(value = "goodsInventory")int goodsInventory,
            @RequestParam(value = "goodsSort")int goodsSort,
            @RequestParam(value = "goodsPresentExp")int goodsPresentExp,
            @RequestParam(value = "imageList", required = false) MultipartFile[] imageList,
            @RequestParam(value = "detailedImageList", required = false) MultipartFile[] detailedImageList
    ) throws IOException {
        Goods goods = new Goods();
        goods.setGoodsClassName(goodsClassName);
        goods.setGoodsName(goodsName);
        goods.setGoodsSubTitle(goodsSubTitle);
        goods.setGoodsNumber(goodsNumber);
        goods.setGoodsHot(goodsHot);
        goods.setGoodsShelves(goodsShelves);
        goods.setGoodsMarketPrice(goodsMarketPrice);
        goods.setGoodsPrice(goodsPrice);
        goods.setGoodsSales(goodsSales);
        goods.setGoodsInventory(goodsInventory);
        goods.setGoodsSort(goodsSort);
        goods.setGoodsPresentExp(goodsPresentExp);

        String src = "http://localhost:8889/";

        StringBuilder submitImageList = new StringBuilder();
        for (int i = 0; i < imageList.length; i++) {
            MultipartFile file = imageList[i];
            if (file != null) {
                String fileName = file.getOriginalFilename() + System.currentTimeMillis();
                String trueImageList = goodsNumber + "_image" + i + ".jpg";
                System.out.println("***********true*********");
                System.out.println(trueImageList);
                System.out.println("***********true*********");
                String path = "G:\\nginx\\img\\" + trueImageList;
                File dest = new File(path);
                if (!dest.getParentFile().exists()) {
                    System.out.println("文件路径不存在");
                }
                file.transferTo(dest);
                String newSrc = src + trueImageList;
                System.out.println("*************newSrc********************");
                System.out.println(newSrc);
                System.out.println("*************newSrc********************");
                submitImageList.append(newSrc);
                if ((i + 1) != imageList.length) {
                    submitImageList.append(",");
                }
            } else {
                System.out.println("文件为空");
            }
        }
        goods.setGoodsImageList(submitImageList.toString());

        StringBuilder submitDetailedImageList = new StringBuilder();
        for (int img = 0; img < detailedImageList.length; img++) {
            MultipartFile file = detailedImageList[img];
            if (file != null) {
                String fileName = file.getOriginalFilename() + System.currentTimeMillis();
                String trueImageList = goodsNumber + "_detailedImage" + img + ".jpg";
                System.out.println(trueImageList);
                String path = "G:\\nginx\\img\\" + trueImageList;
                File dest = new File(path);
                if (!dest.getParentFile().exists()) {
                    System.out.println("文件路径不存在");
                }
                file.transferTo(dest);
                String newSrc = src + trueImageList;
                System.out.println(newSrc);
                submitDetailedImageList.append(newSrc);
                if ((img + 1) != detailedImageList.length) {
                    submitDetailedImageList.append(",");
                }
            } else {
                System.out.println("文件为空");
            }
        }
        goods.setGoodsDetailedImageList(submitDetailedImageList.toString());
        return goodsService.addGoods(goods);
    }

    /**
     * @Author: SmallPang
     * @Description: 修改商品
     * @Date: 2020/1/6
     * @Param goodsClassName:
     * @Param goodsName:
     * @Param goodsSubTitle:
     * @Param goodsNumber:
     * @Param goodsHot:
     * @Param goodsShelves:
     * @Param goodsMarketPrice:
     * @Param goodsPrice:
     * @Param goodsInventory:
     * @Param goodsSort:
     * @Param goodsPresentExp:
     * @Param imageList:
     * @Param detailedImageList:
     * @return: com.pang.back.Model.Result
     **/
    @PostMapping(value = "/updateGoods")
    public Result updateGoods(
            @RequestParam(value = "goodsID")Integer goodsID,
            @RequestParam(value = "goodsClassName")String goodsClassName,
            @RequestParam(value = "goodsName")String goodsName,
            @RequestParam(value = "goodsSubTitle")String goodsSubTitle,
            @RequestParam(value = "goodsNumber")String goodsNumber,
            @RequestParam(value = "goodsHot")Boolean goodsHot,
            @RequestParam(value = "goodsShelves")Boolean goodsShelves,
            @RequestParam(value = "goodsMarketPrice")Double goodsMarketPrice,
            @RequestParam(value = "goodsPrice")Double goodsPrice,
            @RequestParam(value = "goodsSales")int goodsSales,
            @RequestParam(value = "goodsInventory")int goodsInventory,
            @RequestParam(value = "goodsSort")int goodsSort,
            @RequestParam(value = "goodsPresentExp")int goodsPresentExp,
            @RequestParam(value = "imageList", required = false) MultipartFile[] imageList,
            @RequestParam(value = "detailedImageList", required = false) MultipartFile[] detailedImageList
    ) throws IOException {
        Goods goods = new Goods();
        goods.setGoodsID(goodsID);
        goods.setGoodsClassName(goodsClassName);
        goods.setGoodsName(goodsName);
        goods.setGoodsSubTitle(goodsSubTitle);
        goods.setGoodsNumber(goodsNumber);
        goods.setGoodsHot(goodsHot);
        goods.setGoodsShelves(goodsShelves);
        goods.setGoodsMarketPrice(goodsMarketPrice);
        goods.setGoodsPrice(goodsPrice);
        goods.setGoodsSales(goodsSales);
        goods.setGoodsInventory(goodsInventory);
        goods.setGoodsSort(goodsSort);
        goods.setGoodsPresentExp(goodsPresentExp);
        String src = "http://localhost:8889/";
        StringBuilder submitImageList = new StringBuilder();
        for (int i = 0; i < imageList.length; i++) {
            MultipartFile file = imageList[i];
            System.out.println("文件名字：" + file.getOriginalFilename());
            if (file != null) {
                String fileName = file.getOriginalFilename() + System.currentTimeMillis();
                String trueImageList = goodsNumber + "_image" + i + ".jpg";
                System.out.println("***********true*********");
                System.out.println(trueImageList);
                System.out.println("***********true*********");
                String path = "G:\\nginx\\img\\" + trueImageList;
                File dest = new File(path);
                if (!dest.getParentFile().exists()) {
                    System.out.println("文件路径不存在");
                }
                file.transferTo(dest);
                String newSrc = src + trueImageList;
                System.out.println("*************newSrc********************");
                System.out.println(newSrc);
                System.out.println("*************newSrc********************");
                submitImageList.append(newSrc);
                if ((i + 1) != imageList.length) {
                    submitImageList.append(",");
                }
            } else {
                System.out.println("文件为空");
            }
        }
        goods.setGoodsImageList(submitImageList.toString());

        StringBuilder submitDetailedImageList = new StringBuilder();
        for (int img = 0; img < detailedImageList.length; img++) {
            MultipartFile file = detailedImageList[img];
            if (file != null) {
                String fileName = file.getOriginalFilename() + System.currentTimeMillis();
                String trueImageList = goodsNumber + "_detailedImage" + img + ".jpg";
                System.out.println(trueImageList);
                String path = "G:\\nginx\\img\\" + trueImageList;
                File dest = new File(path);
                if (!dest.getParentFile().exists()) {
                    System.out.println("文件路径不存在");
                }
                file.transferTo(dest);
                String newSrc = src + trueImageList;
                System.out.println(newSrc);
                submitDetailedImageList.append(newSrc);
                if ((img + 1) != detailedImageList.length) {
                    submitDetailedImageList.append(",");
                }
            } else {
                System.out.println("文件为空");
            }
        }
        goods.setGoodsDetailedImageList(submitDetailedImageList.toString());
        return goodsService.updateGoods(goods);
    }

    /**
     * @Author: SmallPang
     * @Description: 删除商品
     * @Date: 2020/1/6
     * @Param obj: 商品ID
     * @return: com.pang.back.Model.Result
     **/
    @PostMapping(value = "/deleteGoods")
    public Result deleteGoods(@RequestBody JSONObject obj) {
        Integer goodsID = Integer.parseInt(obj.get("goodsID").toString());
        return goodsService.deleteGoods(goodsID);
    }

    /**
     * @Author: SmallPang
     * @Description: 批量删除
     * @Date: 2020/1/6
     * @Param obj: 批量删除ID数组
     * @return: com.pang.back.Model.Result
     **/
    @PostMapping(value = "/batchDeleteGoods")
    public Result batchDeleteGoods(@RequestBody JSONObject obj) {
        String str = obj.get("checksIdArray").toString();
        str = str.substring(1,str.length()-1);
        String[] array = str.split(",");
        int[] intArr = new int[array.length];
        for(int i = 0; i < array.length; i++) {
            intArr[i] = Integer.parseInt(array[i].trim());
        }
        return goodsService.batchDeleteGoods(intArr);
    }

    /**
     * @Author: SmallPang
     * @Description: 关键字搜索
     * @Date: 2020/1/6
     * @Param obj: 关键字
     * @return: com.github.pagehelper.PageInfo<com.pang.back.Model.Goods>
     **/
    @PostMapping(value = "/fuzzySelectGoods")
    public PageInfo<Goods> fuzzySelectGoods(@RequestBody JSONObject obj) {
        int pageNum = Integer.parseInt(obj.get("pageNum").toString());
        int pageSize = Integer.parseInt(obj.get("pageSize").toString());
        String fuzzyData = obj.get("fuzzyData").toString();
        return goodsService.fuzzySelectGoods(pageNum, pageSize, fuzzyData);
    }

    /**
     * @Author: SmallPang
     * @Description: 得到全部商品列表
     * @Date: 2020/1/6
     * @Param obj: 分页大小和页数
     * @return: com.github.pagehelper.PageInfo<com.pang.back.Model.Goods>
     **/
    @PostMapping(value = "/getAllGoods")
    public PageInfo<Goods> getAllGoods(@RequestBody JSONObject obj) {
        int pageNum = Integer.parseInt(obj.get("pageNum").toString());
        int pageSize = Integer.parseInt(obj.get("pageSize").toString());
        return goodsService.getAllGoods(pageNum, pageSize);
    }

    /**
     * @Author: SmallPang
     * @Description: 查看商品货号是否存在
     * @Date: 2020/1/7
     * @Param obj: 商品货号
     * @return: com.pang.back.Model.Result
     **/
    @PostMapping(value = "/selectExistGoodsNumber")
    public Result selectExistGoodsNumber(@RequestBody JSONObject obj) {
        String goodsNumber = obj.get("goodsNumber").toString();
        return goodsService.selectExistGoodsNumber(goodsNumber);
    }

    /**
     * @Author: SmallPang
     * @Description: 修改热门状态
     * @Date: 2020/1/7
     * @Param obj: 商品ID
     * @return: com.pang.back.Model.Result
     **/
    @PostMapping(value = "/changeGoodsHot")
    public Result changeGoodsHot(@RequestBody JSONObject obj) {
        Integer goodsID = Integer.parseInt(obj.get("goodsID").toString());
        return goodsService.changeGoodsHot(goodsID);
    }

    /**
     * @Author: SmallPang
     * @Description: 修改上架状态
     * @Date: 2020/1/7
     * @Param obj: 商品ID
     * @return: com.pang.back.Model.Result
     **/
    @PostMapping(value = "/changeGoodsShelves")
    public Result changeGoodsShelves(@RequestBody JSONObject obj) {
        Integer goodsID = Integer.parseInt(obj.get("goodsID").toString());
        return goodsService.changeGoodsShelves(goodsID);
    }

    /**
     * @Author: SmallPang
     * @Description: 查找商品
     * @Date: 2020/1/11
     * @Param obj: 商品ID
     * @return: com.pang.back.Model.Goods
     **/
    @PostMapping(value = "/selectGoodsByID")
    public Goods selectGoodsByID(@RequestBody JSONObject obj) {
        Integer goodsID = Integer.parseInt(obj.get("goodsID").toString());
        return goodsService.selectGoodsByID(goodsID);
    }

    /**
     * @Author: SmallPang
     * @Description: 删除图片
     * @Date: 2020/1/11
     * @Param obj: 图片路径
     * @return: void
     **/
    @PostMapping(value = "/deleteImage")
    public void deleteImage(@RequestBody JSONObject obj) {
        String deletePath = obj.getString("deletePath");
        String[] path = deletePath.split("/");
        String fileName = path[path.length - 1];
        String filePath = "G:\\nginx\\img\\" + fileName;
        File file = new File(filePath);
        if (file.exists()) {
            file.delete();
            System.out.println("文件删除成功");
        } else {
            System.out.println("文件不存在");
        }
    }
}
