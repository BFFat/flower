package com.pang.front.ServiceImpl;

import com.alibaba.dubbo.config.annotation.Service;
import com.pang.front.Mapper.ShoppingCartMapper;
import com.pang.front.Model.Result;
import com.pang.front.Model.ShoppingCart;
import com.pang.front.service.ShoppingCartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

@Service
@Component
public class ShoppingCartServiceImpl implements ShoppingCartService {
    @Autowired
    ShoppingCartMapper shoppingCartMapper;

    @Override
    public List<ShoppingCart> getUserShoppingCart(String userID) {
        return shoppingCartMapper.getUserShoppingCart(userID);
    }

    @Override
    public Result deleteShoppingCart(String shoppingCartID) {
        Result result = new Result();
        result.setMsg("删除失败");
        result.setDetail(shoppingCartID);
        int rtnNum = shoppingCartMapper.deleteShoppingCart(shoppingCartID);
        if (rtnNum == 1) {
            result.setMsg("删除成功");
            result.setSuccess(true);
            System.out.println("删除成功");
            return result;
        }
        System.out.println("删除失败");
        return result;
    }

    @Override
    public Result changeGoodsSum(Integer shoppingCartID, Integer goodsSum) {
        Result result = new Result();
        result.setMsg("更改数量失败");
        result.setDetail(shoppingCartID);
        int rtnNum = shoppingCartMapper.changeGoodsSum(shoppingCartID, goodsSum);
        if (rtnNum == 1) {
            result.setMsg("更改数量成功");
            result.setSuccess(true);
            return result;
        }
        return result;
    }

    @Override
    public Result addToShoppingCart(Integer userID, Integer goodsID, int goodsSum) {
        Result result = new Result();
        result.setMsg("加入购物车失败");
        result.setDetail(goodsID);
        int rtnNum = 0;
        ShoppingCart shoppingCart = shoppingCartMapper.selectExistShoppingCart(userID, goodsID);
        if (shoppingCart != null) {
            rtnNum = shoppingCartMapper.addShoppingCartGoodsSum(shoppingCart.getShoppingCartID(), goodsSum);
        } else {
            rtnNum = shoppingCartMapper.addToShoppingCart(userID, goodsID, goodsSum);
        }
        if (rtnNum == 1) {
            result.setMsg("加入购物车成功");
            result.setSuccess(true);
            return result;
        }
        return result;
    }
}
