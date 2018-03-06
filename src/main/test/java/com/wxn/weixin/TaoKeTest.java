package com.wxn.weixin;

import com.wxn.weixin.pojo.HttpClientResponse;
import com.wxn.weixin.utils.HttpClientUtils;
import org.junit.Test;

public class TaoKeTest {
    public final static String appKey = "acd78a443c";
    public final static String url = "http://api.dataoke.com/index.php?r=goodsLink/www";

    @Test
    public void test(){
        HttpClientResponse response = HttpClientUtils.get("http://api.dataoke.com/index.php?r=Port/index&type=paoliang&appkey=acd78a443c&v=2");
        //response.setContentEncoding("utf-8");

        String temp = response.getResponseContent();
        StringBuffer string = new StringBuffer();
        String[] hex = temp.split("\\\\u");
        for (int i = 1; i < hex.length; i++) {
            // 转换出每一个代码点
            int data = Integer.parseInt(hex[i], 16);
            // 追加成string
            string.append((char) data);
        }
        System.out.println(string.toString());
    }
}
