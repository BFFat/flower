package com.pang.front.ServiceImpl;

import com.alibaba.dubbo.config.annotation.Service;
import com.aliyuncs.dysmsapi.model.v20170525.QuerySendDetailsResponse;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsResponse;
import com.aliyuncs.exceptions.ClientException;
import com.pang.front.Mapper.RegisterMapper;
import com.pang.front.Model.Result;
import com.pang.front.Model.User;
import com.pang.front.Test.SmsDemo;
import com.pang.front.Util.RedisUtil;
import com.pang.front.service.RegisterService;
import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.UUID;

import static com.pang.front.Test.SmsDemo.querySendDetails;
import static com.pang.front.Test.SmsDemo.sendSms;

@Service
@Component
public class RegisterServiceImpl implements RegisterService {
    @Resource
    RedisUtil redisUtil;

    @Autowired
    RegisterMapper registerMapper;

    /**
     * @Author: SmallPang
     * @Description: 注册发送验证码
     * @Date: 2020/2/3
     * @Param phone: 手机号
     * @return: com.pang.front.Model.Result
     **/
    @Override
    public Result getRegisterNumber(String phone) {
        Result result = new Result();
        result.setMsg("该手机号码已注册");
        User user = registerMapper.selectUserPhone(phone);
        if (user == null) {
            return(sentSMS(phone));
        }
        result.setDetail(phone);
        return result;
    }

    public Result sentSMS(String phone) {
        //获取验证码
        String code = SmsDemo.getRandnum();

        //结果类
        Result result = new Result();
        result.setMsg("短信发送失败");

        //redis缓存
        if (!redisUtil.hasKey(phone)) {
            //将短信验证码存入缓存 过期时间为60s
            redisUtil.set(phone, code, 60);
            result.setDetail(code);

            System.out.println("手机号码为：" + phone);
            System.out.println("验证码为：" + code);
            //发短信
            SendSmsResponse response = null;
            try {
                response = sendSms(phone, code);
            } catch (ClientException e) {
                e.printStackTrace();
            }
            System.out.println("短信接口返回的数据----------------");
            System.out.println("Code=" + response.getCode());
            System.out.println("Message=" + response.getMessage());
            System.out.println("RequestId=" + response.getRequestId());
            System.out.println("BizId=" + response.getBizId());

            try {
                Thread.sleep(3000L);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }

            //查明细
            if(response.getCode() != null && response.getCode().equals("OK")) {
                QuerySendDetailsResponse querySendDetailsResponse = null;
                try {
                    querySendDetailsResponse = querySendDetails(response.getBizId(), phone);
                } catch (ClientException e) {
                    e.printStackTrace();
                }
                System.out.println("短信明细查询接口返回数据----------------");
                System.out.println("Code=" + querySendDetailsResponse.getCode());
                System.out.println("Message=" + querySendDetailsResponse.getMessage());
                int i = 0;
                for(QuerySendDetailsResponse.SmsSendDetailDTO smsSendDetailDTO : querySendDetailsResponse.getSmsSendDetailDTOs())
                {
                    System.out.println("SmsSendDetailDTO["+i+"]:");
                    System.out.println("Content=" + smsSendDetailDTO.getContent());
                    System.out.println("ErrCode=" + smsSendDetailDTO.getErrCode());
                    System.out.println("OutId=" + smsSendDetailDTO.getOutId());
                    System.out.println("PhoneNum=" + smsSendDetailDTO.getPhoneNum());
                    System.out.println("ReceiveDate=" + smsSendDetailDTO.getReceiveDate());
                    System.out.println("SendDate=" + smsSendDetailDTO.getSendDate());
                    System.out.println("SendStatus=" + smsSendDetailDTO.getSendStatus());
                    System.out.println("Template=" + smsSendDetailDTO.getTemplateCode());
                }
                System.out.println("TotalCount=" + querySendDetailsResponse.getTotalCount());
                System.out.println("RequestId=" + querySendDetailsResponse.getRequestId());
            }
            if (response.getCode().equals("OK") && response.getMessage().equals("OK")) {
                result.setSuccess(true);
                result.setMsg("发送短信成功");
            }
        }else {
            result.setMsg("操作繁忙，请稍后再试");
            result.setDetail("frequency");
        }
        return result;
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
    @Override
    public Result registerUser(String userName, String userPhone, String userPassword, String userHeadPortrait) {
        Result result = new Result();
        result.setDetail(userPhone);
        result.setMsg("注册失败");
        String userStatus = "正常";
//        userPassword = new BCryptPasswordEncoder().encode(userPassword);
        User user = new User();
        user.setUserPhone(userPhone);
        user.setUserPassword(passwordMD5(userPhone, userPassword));
        user.setUserStatus(userStatus);
        System.out.println("返回的结果：" + registerMapper.registerUser(user));
        Integer userID = user.getUserID();
        if (userID != null) {
            int insertRtn = registerMapper.insertRegisterUserName(userID, userName, userHeadPortrait);;
            if (insertRtn == 1) {
                result.setSuccess(true);
                result.setMsg("注册成功");
                return result;
            } else {
                registerMapper.deleteUserByID(userID);
            }
        }
        return result;
    }

    public String passwordMD5(String userName, String userPassword) {
        // 需要加密的字符串
        String src = userName + userPassword;
        try {
            // 加密对象，指定加密方式
            MessageDigest md5 = MessageDigest.getInstance("md5");
            // 准备要加密的数据
            byte[] b = src.getBytes();
            // 加密：MD5加密一种被广泛使用的密码散列函数，
            // 可以产生出一个128位（16字节）的散列值（hash value），用于确保信息传输完整一致
            byte[] digest = md5.digest(b);
            // 十六进制的字符
            char[] chars = new char[]{'0', '1', '2', '3', '4', '5',
                    '6', '7', 'A', 'B', 'C', 'd', 'o', '*', '#', '/'};
            StringBuffer sb = new StringBuffer();
            // 处理成十六进制的字符串(通常)
            // 遍历加密后的密码，将每个元素向右位移4位，然后与15进行与运算(byte变成数字)
            for (byte bb : digest) {
                sb.append(chars[(bb >> 4) & 15]);
                sb.append(chars[bb & 15]);
            }
            // 打印加密后的字符串
            System.out.println(sb);
            return sb.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return null;
    }



    /**
     * @Author: SmallPang
     * @Description: 登录短信
     * @Date: 2020/2/19
     * @Param phone: 手机号码
     * @return: com.pang.front.Model.Result
     **/
    @Override
    public Result getLoginNumber(String phone) {
        Result result = new Result();
        User user = registerMapper.selectUserPhone(phone);
        if (user == null) {
            result.setMsg("该手机号码未注册");
            System.out.println("该手机号码未注册");
            result.setDetail("unRegistered");
            return result;
        }
        return(sentSMS(phone));
    }

    /**
     * @Author: SmallPang
     * @Description: 账号密码登录
     * @Date: 2020/2/19
     * @Param userPhone: 手机号码
     * @Param userPassword: 密码
     * @return: com.pang.front.Model.Result
     **/
    @Override
    public Result accountPasswordLogin(String userPhone, String userPassword) {
        Result result = new Result();
        result.setMsg("登录失败");
        User user = registerMapper.selectUserPhone(userPhone);
        if (user == null) {
            result.setMsg("该手机号码未注册");
            result.setDetail("unRegistered");
            return result;
        } else if (!user.getUserPassword().equals(passwordMD5(userPhone, userPassword))) {
            result.setMsg("密码不正确");
            result.setDetail("wrongPassword");
            return result;
        } else if (user.getUserPassword().equals(passwordMD5(userPhone, userPassword))) {
            result.setMsg("密码正确");
            String token = UUID.randomUUID().toString().replaceAll("-", "").toUpperCase();
            redisUtil.set(token, user.getUserID(), 7200);
            result.setDetail(token);
            result.setSuccess(true);
            return result;
        }
        return result;
    }

    /**
     * @Author: SmallPang
     * @Description: 验证短信验证码
     * @Date: 2020/2/19
     * @Param userPhone: 手机号码
     * @Param smsCode: 短信验证码
     * @return: com.pang.front.Model.Result
     **/
    @Override
    public Result judgeSmsCode(String userPhone, String smsCode) {
        Result result = new Result();
        result.setMsg("验证码不正确");
        if (redisUtil.get(userPhone).equals(smsCode)) {
            result.setSuccess(true);
            result.setMsg("验证码正确");
            String token = UUID.randomUUID().toString().replaceAll("-", "").toUpperCase();
            User user = registerMapper.selectUserPhone(userPhone);
            redisUtil.set(token, user.getUserID(), 3600);
            result.setDetail(token);
            return result;
        }
        result.setDetail(userPhone);
        return result;
    }

    @Override
    public Result updatePassword(String userPhone, String userPassword) {
        Result result = new Result();
        int rtnNum = registerMapper.updatePassword(userPhone, userPassword);
        if (rtnNum == 1) {
            result.setMsg("修改密码成功");
            System.out.println("修改密码成功");
            result.setSuccess(true);
            result.setDetail(userPhone);
            return result;
        }
        result.setMsg("修改密码失败");
        System.out.println("修改密码失败");
        return result;
    }

    @Override
    public Result registerJudgeSmsCode(String userPhone, String smsCode) {
        Result result = new Result();
        result.setMsg("验证码不正确");
        result.setDetail(userPhone);
        if (redisUtil.get(userPhone).equals(smsCode)) {
            result.setSuccess(true);
            result.setMsg("验证码正确");
            return result;
        }
        return result;
    }
}
