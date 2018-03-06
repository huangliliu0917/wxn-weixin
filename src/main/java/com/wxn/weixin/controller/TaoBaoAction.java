package com.wxn.weixin.controller;

import com.alibaba.fastjson.JSON;
import com.taobao.api.ApiException;
import com.taobao.api.response.TbkDgItemCouponGetResponse;
import com.wxn.weixin.manager.TaoBaoManager;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@Slf4j
public class TaoBaoAction extends BaseAction{

    public final static String url = "https://eco.taobao.com/router/rest";
    public final static String appkey = "24810297";
    public final static String secret = "76250cfab3f567fdb5e90e7d03c1b10c";

    @Autowired
    private TaoBaoManager taoBaoManager;
    /**
     * taobao.tbk.dg.item.coupon.get (好券清单API【导购】)
     * @param model
     * @return
     */
    @RequestMapping("/manage/tbkCoupon.do")
    public String getTbkCoupon(Model model,String title) throws ApiException {
        log.info("好券清单导购API调用");
        List<TbkDgItemCouponGetResponse.TbkCoupon> tbkCoupons = taoBaoManager.getTbkCoupon(url,appkey,secret,title,1l);
        model.addAttribute("tbkCoupon",tbkCoupons);
        return "page/index";
    }

    @RequestMapping("/manage/detail")
    public String getTbkCouponDetail(Model model, TbkDgItemCouponGetResponse.TbkCoupon tbkCoupon){
        try {
            String tbkCode = taoBaoManager.getTbkCouponDetail(url,appkey,secret,tbkCoupon);
            String title = null;
            //查找相似产品
            if(tbkCoupon.getTitle().length()>10){
                title = tbkCoupon.getTitle().substring(0,9);
            }
            List<TbkDgItemCouponGetResponse.TbkCoupon> tbkCoupons = taoBaoManager.getTbkCoupon(url,appkey,secret,title,1l);

            //跳转之前对图文详情进行转换
            List<String> list = new ArrayList<String>();
            for(String item : tbkCoupon.getSmallImages()){
                if(item.contains("[")){
                    int num = item.indexOf("[");
                    String str2=String.valueOf(item.charAt(num));
                    item=item.replace(str2,"");
                    list.add(item);
                }else if(item.contains("]")){
                    int num = item.indexOf("]");
                    String str2=String.valueOf(item.charAt(num));
                    item=item.replace(str2,"");
                    list.add(item);
                }else {
                    list.add(item);
                }
            }
            model.addAttribute("tbkoCupon",tbkCoupon);
            model.addAttribute("tbkCode",tbkCode);
            model.addAttribute("imgs",list);
            model.addAttribute("tbkCouponList",tbkCoupons);
        } catch (ApiException e) {


        }
        return "page/detail";
    }

    /**
     * 通过搜索框进行搜索
     * taobao.tbk.dg.item.coupon.get (好券清单API【导购】)
     * @param model
     * @return
     */
    @RequestMapping("/manage/queryTbkCoupons.do")
    public String queryTbkCoupon(Model model,String couponName,Long pageNo){
        try {
            log.info("通过搜索框进行搜索,couponName{},pageNo{}",couponName,pageNo);
            List<TbkDgItemCouponGetResponse.TbkCoupon> tbkCoupons = taoBaoManager.getTbkCoupon(url,appkey,secret,couponName,pageNo);
            model.addAttribute("tbkCoupon",tbkCoupons);
            model.addAttribute("userQueryTitle",couponName);
        } catch (ApiException e) {
            e.printStackTrace();
        }
        return "page/queryTbkCoupon";
    }

    @RequestMapping(value="/manage/loadMoreCoupon.do")
    public void loadMoreCoupon(HttpSession session, ModelMap model,Long pageNo, HttpServletResponse response)throws ApiException{
        List<TbkDgItemCouponGetResponse.TbkCoupon> tbkCoupons = taoBaoManager.loadMoreCoupon(url,appkey,secret,pageNo);
        System.out.println(JSON.toJSONString(tbkCoupons));
        sendMessages(response, JSON.toJSONString(tbkCoupons));
    }


}



