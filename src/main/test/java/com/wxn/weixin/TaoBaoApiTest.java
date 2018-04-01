package com.wxn.weixin;

import com.taobao.api.ApiException;
import com.taobao.api.DefaultTaobaoClient;
import com.taobao.api.TaobaoClient;
import com.taobao.api.domain.NTbkItem;
import com.taobao.api.request.*;
import com.taobao.api.response.*;
import com.wxn.weixin.commons.Commons;
import com.wxn.weixin.pojo.HttpClientResponse;
import com.wxn.weixin.utils.HttpClientUtils;
import org.junit.Test;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class TaoBaoApiTest {

    public final static String url = "https://eco.taobao.com/router/rest";
    public final static String appkey = "24810297";
    public final static String secret = "76250cfab3f567fdb5e90e7d03c1b10c";

    @Test
    public void getPorducts() throws ApiException{
        TaobaoClient client = new DefaultTaobaoClient(url, appkey, secret);
        TbkItemGetRequest req = new TbkItemGetRequest();
        req.setFields("num_iid,title,pict_url,small_images,reserve_price,zk_final_price,user_type,provcity,item_url,seller_id,volume,nick");
        req.setQ("白衬衫女韩范长袖春装2018新款中长款韩版宽松大码雪纺衬衣胖mm潮\n");
        //req.setCat("16,18");
        //req.setItemloc("杭州");
        req.setSort("total_sales");
        req.setPageNo(1L);//第几页
        req.setPageSize(2L);//每页多少产品
        TbkItemGetResponse rsp = client.execute(req);
        List<NTbkItem> list  = rsp.getResults();
        for(NTbkItem nTbkItem : list){
            System.out.println(nTbkItem.getItemUrl());
        }
    }

    @Test
    public void getHaoQuans() throws ApiException{
        TaobaoClient client = new DefaultTaobaoClient(url, appkey, secret);
        TbkDgItemCouponGetRequest req = new TbkDgItemCouponGetRequest();
        req.setAdzoneId(272988181l);
        req.setPageSize(2L);
        req.setQ("女装短袖");
        req.setPageNo(1L);
        TbkDgItemCouponGetResponse rsp = client.execute(req);
        List<TbkDgItemCouponGetResponse.TbkCoupon> list = rsp.getResults();

        for(TbkDgItemCouponGetResponse.TbkCoupon tbkCoupon : list){
            //getTaoKouLing3(tbkCoupon.getCouponClickUrl());
        }

    }

    @Test
    public void toTaoKouLing1() throws ApiException{
        TaobaoClient client = new DefaultTaobaoClient(url, appkey, secret);
        WirelessShareTpwdCreateRequest req = new WirelessShareTpwdCreateRequest();
        WirelessShareTpwdCreateRequest.GenPwdIsvParamDto obj1 = new WirelessShareTpwdCreateRequest.GenPwdIsvParamDto();
        obj1.setExt("{\"xx\":\"xx\"}");
        obj1.setLogo("http:\\/\\/img.alicdn.com\\/tfscom\\/i3\\/2260511004\\/TB1jMuxbeuSBuNjy1XcXXcYjFXa_!!0-item_pic.jpg");
        obj1.setUrl("http://uland.taobao.com/coupon/edetail?activityId=042990a64f254eaeb8c5f21473ed7ef6&pid=mm_120912411_42970707_272988181&itemId=19146792344&src=pgy_pgyqf&dx=1");
        obj1.setText("超值活动，惊喜活动多多");
        obj1.setUserId(24234234234L);
        req.setTpwdParam(obj1);
        WirelessShareTpwdCreateResponse rsp = client.execute(req);
        System.out.println(rsp.getBody());
    }

    @Test
    public void toTaoKouLing2() throws ApiException{
        TaobaoClient client = new DefaultTaobaoClient(url, appkey, secret);
        TbkTpwdCreateRequest req = new TbkTpwdCreateRequest();
        req.setText("唯美家居专营店");
        req.setUrl("https://uland.taobao.com/coupon/edetail?activityId=6226acd8bbf44c4199eab71f3ca97685&pid=mm_120912411_42970707_272988181&itemId=37275728910&src=pgy_pgyqf&dx=1");
        req.setLogo("https:\\/\\/img.alicdn.com\\/bao\\/uploaded\\/i3\\/TB1rdbjOXXXXXcxXXXXXXXXXXXX_!!0-item_pic.jpg");
        TbkTpwdCreateResponse rsp = client.execute(req);
         System.out.println(rsp.getBody());

    }

    @Test
    public void getTaoBaoCode(){
       /* Map<String,String> map = new HashedMap();
        map.put("token","70002101312356298d5c3a96174661b62db634ad8c28d0910c548e99d5278e40257f34d1025399842");
        map.put("item_id","551625849471");
        map.put("adzone_id","272988181");
        map.put("site_id","42970707");
        map.put("qq","2116177952");

        HttpClientResponse response = HttpClientUtils.post("https://b.9xiaoma.com/app/public/HightApi.xiaocao",map);
        System.out.println(response.getResponseContent());*/

    }



    @Test
    public void getTaoKouLing3() throws ApiException{
        TaobaoClient client = new DefaultTaobaoClient(url, appkey, secret);
        TbkUatmFavoritesGetRequest req = new TbkUatmFavoritesGetRequest();
        req.setPageNo(1L);
        req.setPageSize(20L);
        req.setFields("favorites_title,favorites_id,type");
        req.setType(1L);
        TbkUatmFavoritesGetResponse rsp = client.execute(req);
        System.out.println(rsp.getBody());

    }

    /**
     * 商品详情简版
     * @throws ApiException
     */
    @Test
    public void itemDetail()throws ApiException{
        TaobaoClient client = new DefaultTaobaoClient(url, appkey, secret);
        TbkItemInfoGetRequest req = new TbkItemInfoGetRequest();
        req.setFields("num_iid,title,pict_url,small_images,reserve_price,zk_final_price,user_type,provcity,item_url");
       //req.setPlatform(2L);
        req.setNumIids("546863299715");
        TbkItemInfoGetResponse rsp = client.execute(req);
        System.out.println(rsp.getBody());
    }

    /**
     * 优惠券信息查询
     * @throws ApiException
     */
    @Test
    public void couponMessage()throws ApiException{
        TaobaoClient client = new DefaultTaobaoClient(url, appkey, secret);
        TbkCouponGetRequest req = new TbkCouponGetRequest();
        //req.setMe("nfr%2BYTo2k1PX18gaNN%2BIPkIG2PadNYbBnwEsv6mRavWieOoOE3L9OdmbDSSyHbGxBAXjHpLKvZbL1320ML%2BCF5FRtW7N7yJ056Lgym4X01A%3D");
        req.setItemId(535962426659l);
        //req.setActivityId("sdfwe3eefsdf");
        TbkCouponGetResponse rsp = client.execute(req);
        System.out.println(rsp.getBody());
    }

    /**
     * 优惠券信息查询
     * @throws ApiException
     */
    @Test
    public void couponMessage1()throws ApiException{
        TaobaoClient client = new DefaultTaobaoClient(url, appkey, secret);
        TbkCouponGetRequest req = new TbkCouponGetRequest();
        //req.setMe("nfr%2BYTo2k1PX18gaNN%2BIPkIG2PadNYbBnwEsv6mRavWieOoOE3L9OdmbDSSyHbGxBAXjHpLKvZbL1320ML%2BCF5FRtW7N7yJ056Lgym4X01A%3D");
        req.setItemId(563763204092l);
        req.setActivityId("4fa53b76c9954e108e8d40d918cd74");
        TbkCouponGetResponse rsp = client.execute(req);
        System.out.println(rsp.getBody());
    }


    @Test
    public void dtkApi() throws ApiException {
        TaobaoClient client = new DefaultTaobaoClient(url, appkey, secret);
        TbkUatmFavoritesItemGetRequest req = new TbkUatmFavoritesItemGetRequest();
        req.setPlatform(1L);
        req.setPageSize(20L);
        req.setAdzoneId(272988181l);
        req.setFavoritesId(16391739l);
        req.setPageNo(2L);
        req.setFields("num_iid,title,pict_url,small_images,reserve_price,zk_final_price,user_type,provcity,item_url,seller_id,volume,nick,shop_title,zk_final_price_wap,event_start_time,event_end_time,tk_rate,status,type");
        TbkUatmFavoritesItemGetResponse rsp = client.execute(req);
        System.out.println(rsp.getBody());
    }

    /**
     * taobao.tbk.sc.material.optional (通用物料搜索API)
     */
    @Test
    public void tbkOptional() throws ApiException {
        TaobaoClient client = new DefaultTaobaoClient(url, appkey, secret);
        TbkDgMaterialOptionalRequest req = new TbkDgMaterialOptionalRequest();
        /*req.setStartDsr(10L);
        req.setPageSize(20L);
        req.setPageNo(1L);
        req.setPlatform(1L);
        req.setEndTkRate(1234L);
        req.setStartTkRate(1234L);
        req.setEndPrice(10L);
        req.setStartPrice(10L);
        req.setIsOverseas(false);
        req.setIsTmall(false);
        req.setSort("tk_rate_des");
        req.setItemloc("杭州");*/
        //req.setCat("16,18");
        req.setPageSize(5L);
        req.setPageNo(1L);
        req.setQ("男装");
        req.setSort("total_sales");
        req.setHasCoupon(true);
        req.setAdzoneId(272988181L);
        TbkDgMaterialOptionalResponse rsp = client.execute(req);


         System.out.println(rsp.getBody());
    }
}
