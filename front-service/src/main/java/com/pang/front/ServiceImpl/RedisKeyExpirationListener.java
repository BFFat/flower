package com.pang.front.ServiceImpl;

import com.alibaba.dubbo.config.annotation.Reference;
import com.pang.front.Mapper.OrderMapper;
import com.pang.front.Model.Order;
import com.pang.front.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.connection.Message;
import org.springframework.data.redis.listener.KeyExpirationEventMessageListener;
import org.springframework.data.redis.listener.RedisMessageListenerContainer;
import org.springframework.stereotype.Component;


/**
 * 监听所有db的过期事件__keyevent@*__:expired"
 * @author lsm
 */
@Component
public class RedisKeyExpirationListener extends KeyExpirationEventMessageListener {
    @Autowired
    OrderMapper orderMapper;

    public RedisKeyExpirationListener(RedisMessageListenerContainer listenerContainer) {
        super(listenerContainer);
    }

    /**
     * 针对redis数据失效事件，进行数据处理
     * @param message
     * @param pattern
     */
    @Override
    public void onMessage(Message message, byte[] pattern) {
        // 用户做自己的业务处理即可,注意message.toString()可以获取失效的key
        String keyMessage = message.toString();
        if(keyMessage.startsWith("Order:")){
            //如果是Order:开头的key，进行处理
            Long orderID = Long.parseLong(keyMessage.substring(0, 6));
            System.out.println("监听失效的ID：" + orderID);
            Order order = orderMapper.selectOrderByID(orderID);
            if (order != null) {
                orderMapper.cancelOrderID(orderID);
            }
        }

    }
}
