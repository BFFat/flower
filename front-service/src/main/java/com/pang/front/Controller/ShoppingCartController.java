package com.pang.front.Controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.alibaba.fastjson.JSONObject;
import com.pang.front.Model.Result;
import com.pang.front.Model.ShoppingCart;
import com.pang.front.service.ShoppingCartService;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/shoppingCart")
public class ShoppingCartController {
    @Reference
    ShoppingCartService shoppingCartService;

    @RequestMapping("/getUserShoppingCart")
    public List<ShoppingCart> getUserShoppingCart(@RequestBody JSONObject obj) {
        String userID = obj.getString("userID");
        return shoppingCartService.getUserShoppingCart(userID);
    }

    @RequestMapping(value = "/deleteShoppingCart")
    public Result deleteShoppingCart(@RequestBody JSONObject obj) {
        String shoppingCartID = obj.getString("shoppingCartID");
        return shoppingCartService.deleteShoppingCart(shoppingCartID);
    }

    @RequestMapping(value = "/changeGoodsSum")
    public Result changeGoodsSum(@RequestBody JSONObject obj) {
        Integer shoppingCartID = Integer.parseInt(obj.getString("shoppingCartID"));
        Integer goodsSum = Integer.parseInt(obj.getString("goodsSum"));
        return shoppingCartService.changeGoodsSum(shoppingCartID, goodsSum);
    }

    @PostMapping(value = "/addToShoppingCart")
    public Result addToShoppingCart(@RequestBody JSONObject obj) {
        Integer userID = Integer.parseInt(obj.getString("userID"));
        Integer goodsID = Integer.parseInt(obj.getString("goodsID"));
        int goodsSum = Integer.parseInt(obj.getString("goodsSum"));
        return shoppingCartService.addToShoppingCart(userID, goodsID, goodsSum);
    }
}
