package com.pang.back.Security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;


@EnableWebSecurity //启动springsecurity过滤器链
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class securityConfig extends WebSecurityConfigurerAdapter {
    @Autowired
    private MyStaffDetailsService userDetailsService;

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth
                .userDetailsService(userDetailsService)
                .passwordEncoder(new BCryptPasswordEncoder());

    }

    //该方法的作用就是代替之前配置<security:http>
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        System.out.println("进入拦截配置...");
        http.authorizeRequests()
                .antMatchers("/successLogin").hasAnyRole("店员","店长")
                .antMatchers("/staff/addStaff").hasAnyRole("店员","店长")
                .antMatchers("/staff/updateStaff").hasAnyRole("店长")
                .antMatchers("/staff/deleteStaff").hasAnyRole("店长")
                .antMatchers("/staff/batchDelete").hasAnyRole("店长")
                .antMatchers("/notifyMessage").hasAnyRole("店长")
                .antMatchers("/login").permitAll()
                .antMatchers("/img/**", "/css/**", "/js/**", "/fonts/**").permitAll()
                .anyRequest().authenticated()  //所有请求都需要验证
                //.antMatchers("/**")
                //.fullyAuthenticated()
                .and()
                .formLogin()
                .loginPage("/login")//使用自己的登录界面;
                //要让security的UsernamePasswordAuthenticationFilter这个类使用我们自定义登录的路径就需要配置.loginProcessingUrl("自己的路径")
                .loginProcessingUrl("/login")
                .successForwardUrl("/user")
                .and()
                .csrf().disable();


        /**
         * @Author: SmallPang
         * @Description: 注销登录
         * @Date: 2019/12/16
         **/
        http
                .logout()
                .logoutUrl("/logout")
                .logoutSuccessUrl("/login")
                .invalidateHttpSession(true);
    }
}
