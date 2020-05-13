package com.pang.front.service;

import com.pang.front.Model.Result;

public interface RegisterService {

    Result getRegisterNumber(String phone);

    Result registerUser(String userName, String userPhone, String userPassword, String userHeadPortrait);

    Result getLoginNumber(String userPhone);

    Result accountPasswordLogin(String userPhone, String userPassword);

    Result judgeSmsCode(String userPhone, String smsCode);

    Result updatePassword(String userPhone, String userPassword);

    Result registerJudgeSmsCode(String userPhone, String smsCode);
}
