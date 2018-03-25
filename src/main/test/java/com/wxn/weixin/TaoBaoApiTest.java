package com.wxn.weixin;

import com.taobao.api.ApiException;
import com.taobao.api.DefaultTaobaoClient;
import com.taobao.api.TaobaoClient;
import com.taobao.api.domain.NTbkItem;
import com.taobao.api.request.*;
import com.taobao.api.response.*;
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
       /* req.setPlatform(1L);
        req.setCat("16,18");*/
        req.setPageSize(2L);
        req.setQ("爱丽小屋学生款可爱奶茶口红");
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
        obj1.setUrl("http:\\/\\/uland.taobao.com\\/coupon\\/edetail?e=kjXU9cvoXh4GQASttHIRqUHq4Z9h5IvhRgVVI0lqCarbLaGB9uZG%2Btxf1SlTHSkYI2dSeRVq4Af2AHmhXzkvYAT2sdLup%2BCUDfqEFBOhTcwVNuMTM6bQOZVcBmYiQPO5j4OZCZybfY1qvtxrQaaW8GPfrr0N2WBeCVFQx8T36lD7J8FmRkgg%2BMMHqQ%2Bw9yuTqLe9qAj%2BukEsrbjNtqpwBw%3D%3D&traceId=0ab22d6215200548007171029");
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
        req.setText("长度大于5个字符");
        req.setUrl("https://uland.taobao.com/coupon/edetail?e=8wf%2FVWbXbIwN%2BoQUE6FNzBU24xMzptA5lVwGZiJA87mPg5kJnJt9jUDSR7Uyp%2BzrlS70ILUl5sW8uogIr%2FgW43z%2F5lYwoL5IC0DytI6FkgQtRQESerfUYbtSK7uoVJlqqGqKrnb%2BK8QeQvvf934DYKvk59rYX%2FOY&af=1&pid=mm_120912411_42970707_272988181");
        req.setLogo("https://uland.taobao.com/");
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
        TbkTpwdCreateRequest req = new TbkTpwdCreateRequest();
        req.setText("长度大于5个字符");
        req.setUrl("https://s.click.taobao.com/bpKbFTw");
        req.setLogo("https://uland.taobao.com/");
        TbkTpwdCreateResponse rsp = client.execute(req);
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
        req.setNumIids("562533629533");
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
        TbkUatmFavoritesGetRequest req = new TbkUatmFavoritesGetRequest();
        //req.setPageNo(1L);
        //req.setPageSize(20L);
        req.setFields("favorites_title,favorites_id,type");
       // req.setType(1L);
        TbkUatmFavoritesGetResponse rsp = client.execute(req);
        System.out.println(rsp.getBody());
    }




}
