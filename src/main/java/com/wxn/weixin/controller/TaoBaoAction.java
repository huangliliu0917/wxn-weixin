package com.wxn.weixin.controller;

import com.alibaba.fastjson.JSON;
import com.taobao.api.ApiException;
import com.taobao.api.response.TbkDgItemCouponGetResponse;
import com.wxn.weixin.dal.model.TbkItemDO;
import com.wxn.weixin.dal.model.TbkItemDetailDO;
import com.wxn.weixin.manager.TaoBaoManager;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
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
     * 查询商品列表
     * @param model
     * @return
     */
    @RequestMapping("/manage/tbkItems.do")
    public String getItems(Model model,TbkItemDO tbkItemDO){
        try {
            log.info("查询商品列表,tbkItem{}",tbkItemDO.toString());
            List<TbkItemDO> tbkItems = taoBaoManager.getItems(tbkItemDO );
            model.addAttribute("tbkItems",tbkItems);
        } catch (Exception e) {
            log.error(e.getMessage(),e);
        }
        return "page/index";
    }

    @RequestMapping("/manage/tbkItemDetail.do")
    public String getTbkItemDetail(Model model,TbkItemDetailDO tbkItemDetailDO){
        log.info("获取商品详情,tbkItemDetail{}",tbkItemDetailDO.toString());
        try {
            TbkItemDetailDO tbkItemDetail = taoBaoManager.getTbkItemDetail(tbkItemDetailDO);
            //查找相似产品
            List<TbkItemDO> tbkItems = taoBaoManager.getSimilarityItems(tbkItemDetail);

            String[] imgs = tbkItemDetail.getSmallImages().split(",");
            model.addAttribute("tbkitemdetail",tbkItemDetail);
            model.addAttribute("tbkItems",tbkItems);
            model.addAttribute("imgs",imgs);
        } catch (Exception e) {
            log.error(e.getMessage(),e);
        }
        return "page/detail";
    }

    /**
     * 通过点击图标，查询相应商品列表
     * @param model
     * @return
     */
    @RequestMapping("/manage/tbkItemsByImg.do")
    public String getItemsByImg(Model model,TbkItemDO tbkItemDO){
        try {
            log.info("通过点击图标，查询相应商品列表,tbkItem{}",tbkItemDO.toString());
            List<TbkItemDO> tbkItems = taoBaoManager.getItems(tbkItemDO);
            model.addAttribute("tbkItems",tbkItems);
        } catch (Exception e) {
            log.error(e.getMessage(),e);
        }
        return "page/ToTbkItems";
    }

    /**
     * 加载更多商品
     * @param model
     * @param tbkItemDO
     * @param response
     * @throws ApiException
     */
    @RequestMapping(value="/manage/loadMoreItems.do")
    public void loadMoreCoupon(ModelMap model,TbkItemDO tbkItemDO, HttpServletResponse response)throws ApiException{
        log.info("加载更多商品,tbkItem{}",tbkItemDO.toString());
        List<TbkItemDO> tbkItems = taoBaoManager.getItems(tbkItemDO );
        System.out.println(JSON.toJSONString(tbkItems));
        sendMessages(response, JSON.toJSONString(tbkItems));
    }















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
        return "page/ToTbkItems";
    }

}



