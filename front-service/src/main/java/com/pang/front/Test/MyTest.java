package com.pang.front.Test;

import com.pang.front.Util.RedisUtil;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

@RunWith(SpringRunner.class)
@SpringBootTest
public class MyTest {

    @Resource
    RedisUtil redisUtil;

    @Autowired
    RabbitTemplate rabbitTemplate;

    /**
     * 计算时间
     * @param startTime ： 开始时间
     * @param endTime  ： 结束时间
     * @return
     */
    public static int caculateTotalTime(String startTime,String endTime) {
        SimpleDateFormat formatter =   new SimpleDateFormat( "yyyy-MM-dd");
        Date date1=null;
        Date date = null;
        Long l = 0L;
        try {
            date = formatter.parse(startTime);
            long ts = date.getTime();
            date1 =  formatter.parse(endTime);
            long ts1 = date1.getTime();

            l = (ts - ts1) / (1000 * 60 * 60 * 24);

        } catch (ParseException e) {
            e.printStackTrace();
        }
        return l.intValue();
    }

//    public static void main(String[] args) {
//
//        String starTime = "2014-01-22";
//        String endTime =  "2020-02-03";
//        int i = MyTest.caculateTotalTime(starTime, endTime);
//        System.out.println("wo在一起天数：" + i);
//
//
//        String starTime1 = "2014-09-30";
//        String endTime1 =  "2020-02-03";
//        int i1 = MyTest.caculateTotalTime(starTime1, endTime1);
//        System.out.println("ta在一起天数：" + i1);
//    }

    @Test
    public void test1() {
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        String str = sdf.format(date);
        System.out.println(str);
    }

    @Test
    public void test2() {
        String randNum = "";
        for (int i = 0; i < 6; i++) {
            randNum += (int)(Math.random()*9);
        }
        System.out.println(randNum);
    }

    @Test
    public void test3() {
        String phone = "13929753093";
        RedisUtil redisUtil = new RedisUtil();
        String code = redisUtil.get(phone).toString();
        long time = redisUtil.getExpire(phone);
        System.out.println("手机号码为：" + phone);
        System.out.println("验证码为：" + code);
        System.out.println("剩余时间为：" + time);
    }

    @Test
    public void test5() {
        String phone = "13929753093";
        RedisUtil redisUtil = new RedisUtil();
        String code = SmsDemo.getRandnum();
        redisUtil.set(phone, code, 60);
    }


    @Test
    public void test6() {
        String ID = UUID.randomUUID().toString().replaceAll("-", "");
        System.out.println(ID);
    }

    @Test
    public void test7() {
        String key = "orderNum";
        long orderNum = 202002231653L;
        if (!redisUtil.hasKey(key)) {
            redisUtil.set(key, orderNum);//INIT_ID是自己设置的初始值
        }
        long orderId = redisUtil.incr(key, orderNum);//存在就生成+1的订单号
    }


    @Test
    public void amqp() {
        Long orderID = Long.parseLong(redisUtil.get("orderNum").toString());
        Map<String, Long> map = new HashMap<>();
        map.put("orderID", orderID);
        rabbitTemplate.convertAndSend("pang.direct", "pang.news", map);
    }

    @Test
    public void dingshiqi() {
        final long timeInterval = 10000;
        Runnable runnable = new Runnable() {
            @Override
            public void run() {
                while(true) {
                    System.out.println("看见我了吗？要定时10秒钟哦！");
                    try {
                        Thread.sleep(timeInterval);
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                }
            }
        };
        Thread thread = new Thread(runnable);
        thread.start();
    }

    @Test
    public void timerdingshiqi() {
        /**
         * Timer：是一个定时器工具，用来执行指定任务
         * TimerTask：是一个抽象类，他的子类可以代表一个被Timer计划的任务
         */
        TimerTask task = new TimerTask() {
            @Override
            public void run() {
                // task to run goes here
                // 执行的输出的内容
                System.out.println("Hello, stranger");
            }
        };
        Timer timer = new Timer();
        // 定义开始等待时间  --- 等待 5 秒
        // 1000ms = 1s
        long delay = 5000;
        // 定义每次执行的间隔时间
        long intevalPeriod = 5 * 1000;
        // schedules the task to be run in an interval
        // 安排任务在一段时间内运行
        timer.scheduleAtFixedRate(task, delay, intevalPeriod);
    } // end of main


}