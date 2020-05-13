package com.pang.front.Interceptor;

import com.alibaba.dubbo.config.annotation.Reference;
import com.pang.back.Model.Result;
import com.pang.back.service.UserService;
import com.pang.front.Util.RedisUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @Auther: cxy
 * @Date: 2019/1/10
 * @Description: 拦截器
 */
public class LoginInterceptor implements HandlerInterceptor {
    @Resource
    RedisUtil redisUtil;

    @Reference
    UserService userService;

    private Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);
    @Override
    public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response, Object handler) throws Exception {
        String token = request.getHeader("token");
        System.out.println("**********************************");
        System.out.println("token:" + token);
        if (token!= null && redisUtil.hasKey(token)) {
            int userID = Integer.parseInt(redisUtil.get(token).toString());
            if (userService.selectUserByID(userID).getSuccess()) {
                return true;
            }
        }
        System.out.println("token不存在");
        response.sendRedirect("/front_Login");
        return false;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        logger.info("postHandle...");
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        logger.info("afterCompletion...");
    }
}
