package com.pang.back.Controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageInfo;
import com.pang.back.Model.Goods;
import com.pang.front.Model.OrderGoods;
import com.pang.front.Model.Result;
import com.pang.front.Model.Order;
import com.pang.front.service.OrderService;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping(value = "/order")
public class OrderController {
    @Reference
    OrderService orderService;

    @PostMapping(value = "/selectAllOrder")
    public PageInfo<Order> selectAllOrder(@RequestBody JSONObject obj) {
        Integer pageNum = Integer.parseInt(obj.getString("pageNum"));
        Integer pageSize = Integer.parseInt(obj.getString("pageSize"));
        return orderService.selectAllOrder(pageNum, pageSize);
    }

    @PostMapping(value = "/batchDelete")
    public Result batchDelete(@RequestBody JSONObject obj) {
        String str = obj.get("checksIdArray").toString();
        str = str.substring(1,str.length()-1);
        String[] array = str.split(",");
        Long[] intArr = new Long[array.length];
        for(int i = 0; i < array.length; i++) {
            intArr[i] = Long.parseLong(array[i].trim());
            System.out.println(intArr[i]);
        }
        return orderService.batchDelete(intArr);
    }

    @PostMapping(value = "/fuzzySelectOrder")
    public PageInfo<Order> fuzzySelectOrder(@RequestBody JSONObject obj) {
        int pageNum = Integer.parseInt(obj.get("pageNum").toString());
        int pageSize = Integer.parseInt(obj.get("pageSize").toString());
        String fuzzyData = obj.get("fuzzyData").toString();
        return orderService.fuzzySelectOrder(pageNum, pageSize, fuzzyData);
    }

    @PostMapping(value = "/deleteOrderByOrderID")
    public Result deleteOrderByOrderID(@RequestBody JSONObject obj) {
        Long orderID = Long.parseLong(obj.getString("orderID"));
        return orderService.deleteOrderByOrderID(orderID);
    }

    @PostMapping(value = "/selectOrderDetailed")
    public Order selectOrderDetailed(@RequestBody JSONObject obj) {
        Long orderID = Long.parseLong(obj.getString("orderID"));
        System.out.println(orderID);
        return orderService.selectOrderDetailed(orderID);
    }

    @PostMapping(value = "/getGoodsListByOrderID")
    public List<OrderGoods> getGoodsListByOrderID(@RequestBody JSONObject obj) {
        Long orderID = Long.parseLong(obj.getString("orderID"));
        System.out.println(orderID);
        return orderService.getGoodsListByOrderID(orderID);
    }
}
