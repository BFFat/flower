package com.pang.front.Controller;

import com.pang.front.Util.RedisUtil;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

@Controller
public class PublicController {
    @Resource
    RedisUtil redisUtil;

    @Autowired
    RabbitTemplate rabbitTemplate;

    @RequestMapping(value = "/front_Home")
    public String frontHome() {
        return "front_Home";
    }

    @RequestMapping(value = "/front_Login")
    public String frontLogin() {
        return "front_Login";
    }

    @RequestMapping(value = "/front_Register")
    public String frontRegister() {
        return "front_Register";
    }

    @RequestMapping(value = "/goodsClassify")
    public String goodsClassify() {
        return "goodsClassify";
    }

    @RequestMapping(value = "/goodsDetailedInfo")
    public String goodsDetailedInfo() {
        return "goodsDetailedInfo";
    }

    @RequestMapping(value = "updatePassword")
    public String updatePassword() {
        return "updatePassword";
    }

    @RequestMapping(value = "/403")
    public String forbidden() {
        return "403";
    }

    @RequestMapping(value = "/404")
    public String notFound() {
        return "404";
    }

    @RequestMapping(value = "/500")
    public String SERVICE_UNAVAILABLE() {
        return "500";
    }

    @RequestMapping("/pay")
    public String pay() {
        return "pay";
    }

    @RequestMapping("/my_order")
    public String order() {
        return "my_order";
    }

    @RequestMapping("/add_order")
    public String addOrder() {
        return "add_order";
    }

    @RequestMapping("/shopping")
    public String shoppingCart() {
        return "shopping_cart";
    }

    @RequestMapping("/select_order")
    public String selectOrder() {
        return "select_order";
    }

    @RequestMapping("/allEvaluate")
    public String allEvaluate() {
        return "allEvaluate";
    }

    @RequestMapping(value = "/evaluate")
    public String evaluate() {
        return "evaluate";
    }

    @RequestMapping(value = "/updateEvaluate")
    public String updateEvaluate() {
        return "updateEvaluate";
    }

    @RequestMapping(value = "/myPersonInfo/selectPersonInfo")
    public String myPersonInfo() {
        return "my_personInfo";
    }

    @RequestMapping(value = "/goodsBySelectData")
    public String goodsBySelectData() {
        return "goodsBySelectData";
    }

    @ResponseBody
    @PostMapping(value = "/getUserIDByToken")
    public Integer getUserIDByToken(HttpServletRequest request, HttpServletResponse response) {
        String token = request.getHeader("token");
        Integer userID = null;
        if (token != null && redisUtil.hasKey(token)) {
            userID = Integer.parseInt(redisUtil.get(token).toString());
            return userID;
        }
        return userID;
    }

}
