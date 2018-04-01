package com.wxn.weixin.test;

import com.taobao.api.ApiException;
import com.taobao.api.DefaultTaobaoClient;
import com.taobao.api.TaobaoClient;
import com.taobao.api.request.TbkDgMaterialOptionalRequest;
import com.taobao.api.request.TbkTpwdCreateRequest;
import com.taobao.api.response.TbkDgMaterialOptionalResponse;
import com.taobao.api.response.TbkTpwdCreateResponse;

/**
 * Created by wangkecheng on 2018/4/1.
 */
public class TaoBaoApiTest {

    public final static String url = "https://eco.taobao.com/router/rest";
    public final static String appkey = "24810297";
    public final static String secret = "76250cfab3f567fdb5e90e7d03c1b10c";


    public static void main(String[] args) throws ApiException {

        TaobaoClient client = new DefaultTaobaoClient(url, appkey, secret);
        TbkDgMaterialOptionalRequest req = new TbkDgMaterialOptionalRequest();
        req.setPageSize(2l);
        req.setQ("https://item.taobao.com/item.htm?id=558506799701");
        req.setAdzoneId(272988181L);
        TbkDgMaterialOptionalResponse rsp = client.execute(req);
        System.out.println(rsp.getResultList());



    }

    public static void zhuanlian() throws ApiException {
        TaobaoClient client = new DefaultTaobaoClient(url, appkey, secret);
        TbkTpwdCreateRequest req = new TbkTpwdCreateRequest();
        req.setText("唯美家居专营店");
        req.setUrl("https://uland.taobao.com/coupon/edetail?e=UN%2FNVq8bw4IN%2BoQUE6FNzBU24xMzptA5lVwGZiJA87mPg5kJnJt9jUDSR7Uyp%2BzrNksTjybgTBf0%2FAXonfFRul6i97NcswApSB9Oxyt7%2BcAdw3lDEBrG%2Bg%3D%3D&af=1&pid=mm_120912411_42970707_272988181");
        req.setLogo("https:\\/\\/img.alicdn.com\\/bao\\/uploaded\\/i3\\/TB1rdbjOXXXXXcxXXXXXXXXXXXX_!!0-item_pic.jpg");
        TbkTpwdCreateResponse rsp = client.execute(req);
        System.out.println(rsp.getBody());
    }
}
