package com.pang.front.Config;

import com.pang.front.Interceptor.LoginInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * @Auther: cxy
 * @Date: 2019/1/10
 * @Description: 在web的配置文件中，实例化登陆的拦截器，并添加规则
 */
@Configuration
public class WebConfigurer implements WebMvcConfigurer {
    @Bean
    public LoginInterceptor getLoginIntegerceptor() {
        return new LoginInterceptor();
    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(getLoginIntegerceptor())
                .addPathPatterns("/order/**", "/shoppingCart/**", "/myPersonInfo", "/pay")
                .excludePathPatterns(
                        "/**/*.js",              //js静态资源
                        "/**/*.css",             //css静态资源
                        "/**/*.woff",
                        "/**/*.ttf",
                        "/img/**"
                );
    }
}