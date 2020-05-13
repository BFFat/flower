package com.pang.front.Config;

import java.io.FileWriter;
import java.io.IOException;

public class AlipayConfig {
    // 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
    public static String app_id = "2016092900627169";

    // 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCL74HChcaT5CLNuI0zBXN6koHWpXz0MqskfWjH3/ZJYiENHU7RKTgigyo83xq/I+B6GDbXuS4OSj6baQfMgbvHb8F0ozaR6NaQItdMYmwQEA15zIuyVW+GBZWGfo2vOtrLOh2pz0K5pLjlwLK+Mz71bJilgEQ+rn9wROfj/COYCF8fQq6PHnHIqeOGmSIBfpGZFZjr4OeCQ1K0f3tSzVbFeJ58c1dOro404zXU17P7EQ4WIvMe6LWOXgmMo+J/xoClEOoFjC62k6xor9Xa/N3END6hc1k6+5P2LZwfTSK9eNxLNeSg+CsBwh5PM6EWHXUdAmXhADlTeuZeJ7r554V/AgMBAAECggEAMjw2AgYSRq9Ei0OwdNuFHECSGeNo2yWBaOUYg4B0It32bYXS8KVygHlD5XxWVr3jbRFaRtE0pm6i0RnAcfs01SDaeyvIgFLtC+tmDQbcMlwA6nOyxr+C/MLubczqwjhHqWNgmMBN/OUUd25Y/IzbEjH9DpTgavwrxbsG4EJ46K+4kPnb+DHDusDa8zUJoVk6pJVW3aAA9sUikFAId2/lPY4SlCprT9U7SV8RXjRQ39FfuGNkZXZJCFkjBqBWeZ9uJ9nCRlu6hVLgAXGUBb/ABz6PbRmYUU2adp+GrqmgIteYHqLl/5es+eDoaG77q0STSUzy1XBvXSEhSbJXlwBlIQKBgQDIWt+6wAd6vN6AHHk7WqC8F9kIlSmG2roVqVu7MDkJGt/UeLOZAUN3EOUnhMn46CFG/POIOwvWvd/ibkcHMEf99Ry8ZkGljuaYKuQkERXjrdnQBPrW+MmgVaR/JFwJDkaZiUEd1FQ5MLCctHfIa7vtvJfYgxZojlpdlSwLEitVkQKBgQCyzNjv2P6SBSlZmV7cYwCnVprEg5oy6aYPE6n4s2y+P5aqdPH8trhHnAHbM36AdLj2tLJoILw19FKMUMgnfVklrChA/UV0ofQpbGduSiC26xKZObEWCT6Fmw03rjGmOEH+yqv2z/k8R+9Y6o2qcJl+yCpD3x+oTAliuY7JKtxiDwKBgAw9oRWjzdEt4Noq4y1BKDjVrCjeFB9tFZllM3mIRLPNtIciqLZcYWbQ3W9AqaZPaFkR8z8LfHmuOBN5cVV7GarmYs8P4ErhJC1/0VhywseaQ4h2BW1E3eyxzs8Fxam3+ZA/1n6gDlVAKEoqrHbOPjkUIKLVv3S73cGB76LthUBBAoGAAYwCKHkRIsRGqk7IYlG89LWsGx0kXWJmHGVIKC2tOCwmqozedxhBmeUAoxvb8VKRMxk3He2Ck1jsyef9A1JzTf8iTgWi7zJjgWQ9tNeRVuPLwmWcYZts3g0MXTn1lgGQmJq6SCVee6YHrRZCaYIV4eHrc7Dffj5CKod+c8EaLQMCgYARPek0MUOz7zf7BmBANigG1KbL5mRDeDyarpdysELTeYbIagl6iyyDCk4yj0d4H/nBUDCMKFRSJq/JHbKUN20b5zah4yiJZMWqXstHIV1qin1Veqtz2BCrwYOONVGvhZ9WKSNYCL0z+hijhvY8eA5apVLcqG+KyLChs8mJ7r36ig==";

    // 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA2svkXGpaGdc5fPEUGWm/2RGs7TDGPfEHTFaDyI7y4MpLBMNEIoq9cNAt+7C2MNit26E114SmfiSkVJaT4aNmzi66H8aaP9DsmoZqD2rVuQob5YrU/+VZMn4iuo4n8o/CEBhidPy2Pf+xZ89lohoTllBiML4JdUTTG1LQZV9+PN8mDa5Q4sIye0Gv80HIrmUK4jS16Dgp52PWj0ZKsYpLQzEoUxLPUhV72GvnJuoMFiLSpUA09z7HCDCb+u5UxwUbnO1kMOBvvNDUhekW1BTGzF8WPr96/vojuY2YwWpaudiMADtWlN22i6xfTYfefUoFm9Y/6WgWaOsGFRG/sNbCIwIDAQAB";

    // 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    public static String notify_url = "http://localhost:9998/notify";

    // 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    public static String return_url = "http://localhost:9998/returnUrl";

    // 签名方式
    public static String sign_type = "RSA2";

    // 字符编码格式
    public static String charset = "utf-8";

    // 支付宝网关
    public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";

    // 支付宝网关
    public static String log_path = "G:\\";


//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

    /**
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
