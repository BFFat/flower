package com.pang.front.Test;

import org.jsoup.Jsoup;

import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.junit.Test;


import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLSession;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;


import java.io.*;

public class JsoupTest {

    public static void downImages(String filePath, String imgUrl, int dataID) {
        // 若指定文件夹没有，则先创建
        File dir = new File(filePath);
        if (!dir.exists()) {
            dir.mkdirs();
        }
        // 写出的路径，设置成楼房的ID号为楼房图片命名
        File file = new File(filePath + File.separator + dataID + ".jpg");

        try {
            // 获取图片URL
            URL url = new URL(imgUrl);
            // 获得连接
            URLConnection connection = url.openConnection();
            // 设置10秒的相应时间
            connection.setConnectTimeout(10 * 1000);
            // 获得输入流
            InputStream in = connection.getInputStream();
            // 获得输出流
            BufferedOutputStream out = new BufferedOutputStream(new FileOutputStream(file));
            // 构建缓冲区
            byte[] buf = new byte[1024];
            int size;
            // 写入到文件
            while (-1 != (size = in.read(buf))) {
                out.write(buf, 0, size);
            }
            out.close();
            in.close();
        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    HostnameVerifier hv = new HostnameVerifier() {
        public boolean verify(String urlHostName, SSLSession session) {
            System.out.println("Warning: URL Host: " + urlHostName + " vs. " + session.getPeerHost());
            return true;
        }
    };

    private static void trustAllHttpsCertificates() throws Exception {
        javax.net.ssl.TrustManager[] trustAllCerts = new javax.net.ssl.TrustManager[1];
        javax.net.ssl.TrustManager tm = new miTM();
        trustAllCerts[0] = tm;
        javax.net.ssl.SSLContext sc = javax.net.ssl.SSLContext.getInstance("SSL");
        sc.init(null, trustAllCerts, null);
        javax.net.ssl.HttpsURLConnection.setDefaultSSLSocketFactory(sc.getSocketFactory());
    }
    static class miTM implements javax.net.ssl.TrustManager, javax.net.ssl.X509TrustManager {
        public java.security.cert.X509Certificate[] getAcceptedIssuers() {
            return null;
        }

        public boolean isServerTrusted(java.security.cert.X509Certificate[] certs) {
            return true;
        }

        public boolean isClientTrusted(java.security.cert.X509Certificate[] certs) {
            return true;
        }

        public void checkServerTrusted(java.security.cert.X509Certificate[] certs, String authType)
                throws java.security.cert.CertificateException {
            return;
        }

        public void checkClientTrusted(java.security.cert.X509Certificate[] certs, String authType)
                throws java.security.cert.CertificateException {
            return;
        }
    }

    public void delTempChild(File file){
        if (file.isDirectory()) {
            String[] children = file.list();//获取文件夹下所有子文件夹
             //递归删除目录中的子目录下
            for (int i=0; i<children.length; i++) {
                delTempChild(new File(file, children[i]));
            }
        }
        // 目录空了，进行删除
    }


    @Test
    public void test() throws IOException {
        File file = new File("G:/爬虫");
        delTempChild(file);

        try {
            Writer w = new FileWriter("G:/爬虫/test.txt", true);
            trustAllHttpsCertificates();
            HttpsURLConnection.setDefaultHostnameVerifier(hv);
            String url = "https://www.hua.com/product/1200216.html?huaPid=%2Ftoys%2F-1200216";
            Document doc = Jsoup.connect(url).timeout(500000).userAgent("Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.64 Safari/537.31").get();

            Elements title = doc.getElementsByClass("product-title");
            String goodsName = title.first().text();
            Elements subtitle = doc.getElementsByClass("product-subtitle");
            String goodsSubtitle = subtitle.text();
            Elements sales = doc.getElementsByClass("title");
            String goodsSales = sales.select("span").text();
            Elements price = doc.getElementsByClass("price-original");
            String goodsPrice = price.toString();
            Elements sellPrice = doc.getElementsByClass("price-sell");
            String goodsMarketPrice = sellPrice.toString();
            w.write(goodsName + "\r\n" + goodsSubtitle + "\r\n" + goodsSales + "\r\n" + goodsPrice + "\r\n" + goodsMarketPrice + "\r\n");

            //下载商品图片
            Elements data = doc.getElementsByClass("swiper-slide");
//            Elements data = doc.getElementsByClass("pro-bigimage");
            Elements dataIdList = data.select("img");
            int imgID = 0;
            for (Element dataIdElement : dataIdList) {
                imgID = imgID + 1;
                //获取每个img标签URL "abs:"表示绝对路径
                String imgSrc = dataIdElement.attr("abs:src");
                // 打印URL
                System.out.println(imgSrc);
                //下载图片到本地
                JsoupTest.downImages("G:/爬虫/img", imgSrc, imgID);
            }

            //下载商品详情图片
            Elements detailedPhoto = doc.getElementsByClass("tabs-panel");
            Elements detailedPhotoList = detailedPhoto.select("img");
            int detailedPhotoID = 0;
            for (Element dataIdElement : detailedPhotoList) {
                detailedPhotoID = detailedPhotoID + 1;
                //获取每个img标签URL "abs:"表示绝对路径
                String imgSrc = dataIdElement.attr("abs:src");
                // 打印URL
                System.out.println(imgSrc);
                //下载图片到本地
                JsoupTest.downImages("G:/爬虫/detailedImg", imgSrc, detailedPhotoID);
            }

            w.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
