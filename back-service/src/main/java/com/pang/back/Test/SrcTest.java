package com.pang.back.Test;


import org.junit.Test;

import java.text.SimpleDateFormat;
import java.util.Scanner;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class SrcTest {
    @Test
    public void test1() {
        String src1 = "https://www.dada.com/8889:small.jpg";
        String[] a = src1.split(",");
        System.out.println(a[0]);
    }

    @Test
    public void test2() {
        StringBuilder sentSrc = new StringBuilder();
        String src = "http://localhost:8889/";
        sentSrc.append(src);
        sentSrc.append(",");
        System.out.println(sentSrc.toString());
    }

    @Test
    public void test3() {
        String src = "555555555_19747320_131328126660_2 - 副本 - 副本.jpg";
        String reg = "_(.*?)\\.";
        Pattern pattern = Pattern.compile(reg);
        Matcher matcher = pattern.matcher(src);
        if (matcher.find()) {
            System.out.println(matcher.group(1));
        }
    }

    @Test
    public void test4() {
        String fileName = "pang.png";
        System.out.println(System.currentTimeMillis() + fileName);
    }

    public static String dateToStamp(String s) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String res = "";
        if (!"".equals(s)) {
            try {
                res = String.valueOf(sdf.parse(s).getTime() / 1000);
            } catch (Exception e) {
                System.out.println("传入了null值");
            }
        } else {
            long time = System.currentTimeMillis();
            res = String.valueOf(time / 1000);
        }

        return res;
    }

    @Test
    public void test5() {
//        public static void main(String[] arg) {
//            System.out.println("请输入：");
//            Scanner in = new Scanner(System.in);
//            if (in.hasNext()) {
//                String str = in.next();
//                System.out.println("输入的是：" + str);
//            }
//
//        }

    }



































}
