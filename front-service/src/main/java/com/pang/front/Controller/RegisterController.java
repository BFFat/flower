package com.pang.front.Controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.alibaba.fastjson.JSONObject;
import com.pang.front.Model.Result;
import com.pang.front.service.RegisterService;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

@RestController
@RequestMapping(value = "/register")
public class RegisterController {

    @Reference
    RegisterService registerService;

    @PostMapping(value = "/getRegisterNumber")
    public Result getRegisterNumber(@RequestBody JSONObject obj) {
        String phone = obj.get("userPhone").toString();
        return registerService.getRegisterNumber(phone);
    }

    /**
     * @Author: SmallPang
     * @Description: 注册用户
     * @Date: 2020/2/18
     * @Param userName: 用户名
     * @Param userPassword: 用户密码
     * @Param userPhone: 手机号
     * @return: com.pang.front.Model.Result
     **/
    @PostMapping(value = "/registerUser")
    public Result registerUser(
            @RequestParam(value = "userName")String userName,
            @RequestParam(value = "userPhone")String userPhone,
            @RequestParam(value = "userPassword")String userPassword,
            @RequestParam(value = "file", required = false)MultipartFile file
    ) throws IOException {
        String userHeadPortrait = null;
        if (file != null) {
            String src = "http://localhost:8889/";
            String filename = file.getOriginalFilename();
            System.out.println("文件名" + filename);
            // 自定义的文件名称
            String trueFileName = userPhone + "_" + filename;
            userHeadPortrait = src + trueFileName;
            String path = "G:\\nginx\\img\\" + trueFileName;
            File dest = new File(path);
            if (!dest.getParentFile().exists()) {
                System.out.println("文件路径不存在");
            }
            file.transferTo(dest);
        } else {
            System.out.println("文件为空");
        }
        return registerService.registerUser(userName, userPhone, userPassword, userHeadPortrait);
    }

    /**
     * @Author: SmallPang
     * @Description: 登录短信
     * @Date: 2020/2/19
     * @Param userPhone: 手机号码
     * @return: com.pang.front.Model.Result
     **/
    @PostMapping(value = "/getLoginNumber")
    public Result getLoginNumber(@RequestBody JSONObject obj) {
        String userPhone = obj.getString("userPhone");
        return registerService.getLoginNumber(userPhone);
    }

    /**
     * @Author: SmallPang
     * @Description: 账号密码登录
     * @Date: 2020/2/19
     * @Param userPhone: 手机号码
     * @Param userPassword: 密码
     * @return: com.pang.front.Model.Result
     **/
    @PostMapping(value = "/accountPasswordLogin")
    public Result accountPasswordLogin(@RequestBody JSONObject obj) {
        String userPhone = obj.getString("userPhone");
        String userPassword = obj.getString("userPassword");
        return registerService.accountPasswordLogin(userPhone, userPassword);
    }

    /**
     * @Author: SmallPang
     * @Description: 验证短信验证码
     * @Date: 2020/2/19
     * @Param userPhone: 手机号码
     * @Param smsCode: 短信验证码
     * @return: com.pang.front.Model.Result
     **/
    @PostMapping(value = "/judgeSmsCode")
    public Result judgeSmsCode(@RequestBody JSONObject obj) {
        String userPhone = obj.getString("userPhone");
        String smsCode = obj.getString("smsCode");
        return registerService.judgeSmsCode(userPhone, smsCode);
    }

    @PostMapping(value = "/updatePassword")
    public Result updatePassword(@RequestBody JSONObject obj) {
        String userPhone = obj.getString("userPhone");
        String userPassword = obj.getString("userPassword");
        return registerService.updatePassword(userPhone, userPassword);
    }

    @PostMapping(value = "/registerJudgeSmsCode")
    public Result registerJudgeSmsCode(@RequestBody JSONObject obj) {
        String userPhone = obj.getString("userPhone");
        String smsCode = obj.getString("smsCode");
        return registerService.registerJudgeSmsCode(userPhone, smsCode);
    }
}
