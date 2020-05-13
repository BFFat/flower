package com.pang.front;

import com.alibaba.dubbo.config.spring.context.annotation.DubboComponentScan;
import com.alibaba.dubbo.config.spring.context.annotation.EnableDubboConfig;
import com.alibaba.dubbo.qos.common.Constants;
import org.springframework.amqp.rabbit.annotation.EnableRabbit;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import com.alibaba.dubbo.qos.server.Server;

@EnableRabbit //开启基于注解的RabbitMQ模式
@SpringBootApplication
@EnableDubboConfig
@DubboComponentScan
public class FrontApplication {

    public static void main(String[] args) {
        //配置dubbo.qos.port端口
        System.setProperty(Constants.QOS_PORT,"33333");
        //配置dubbo.qos.accept.foreign.ip是否关闭远程连接
        System.setProperty(Constants.ACCEPT_FOREIGN_IP,"false");
        SpringApplication.run(FrontApplication.class, args);
        //关闭QOS服务
        Server.getInstance().stop();
    }

}
