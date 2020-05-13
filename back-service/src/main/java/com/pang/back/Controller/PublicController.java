package com.pang.back.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PublicController {
    @RequestMapping("/successLogin")
    public String successLogin() {
        return "successLogin";
    }

    @RequestMapping("/successRegister")
    public String successRegister() {
        return "successRegister";
    }

    @RequestMapping(value = "/login")
    public String login() {
        return "login";
    }

    @RequestMapping(value = "/staff")
    public String staff() {
        return "staff";
    }

    @RequestMapping(value = "/staffInfo")
    public String staffInfo() {
        return "staffInfo";
    }

    @RequestMapping(value = "/operation")
    public String operation() {
        return "operation";
    }

    @RequestMapping(value = "/changePassword")
    public String changePassword() {
        return "changePassword";
    }

    @RequestMapping(value = "/personInfo")
    public String personInfo() {
        return "personInfo";
    }

    @RequestMapping(value = "/403")
    public String forbidden() {
        return "403";
    }

    @RequestMapping(value = "/404")
    public String notFound() {
        return "404";
    }

    @RequestMapping(value = "/notifyMessage")
    public String notifyMessage() {
        return "notifyMessage";
    }

    @RequestMapping(value = "/messageCenter")
    public String messageCenter() {
        return "messageCenter";
    }

    @RequestMapping(value = "/goodsClass")
    public String addClass() {
        return "goodsClass";
    }

    @RequestMapping(value = "/addGoods")
    public String addGoods() {
        return "addGoods";
    }

    @RequestMapping(value = "/goodsInfo")
    public String goodsInfo() {
        return "goodsInfo";
    }

    @RequestMapping(value = "/updateGoods")
    public String updateGoods() {
        return "updateGoods";
    }

    @RequestMapping(value = "/user")
    public String user() {
        return "user";
    }

    @RequestMapping(value = "/userInfo")
    public String userInfo() {
        return "userInfo";
    }

    @RequestMapping(value = "/order")
    public String order() {
        return "order";
    }

    @RequestMapping(value = "/orderDetailed")
    public String orderDetailed() {
        return "orderDetailed";
    }

    @RequestMapping(value = "/evaluate")
    public String evaluate() {
        return "evaluate";
    }

}
