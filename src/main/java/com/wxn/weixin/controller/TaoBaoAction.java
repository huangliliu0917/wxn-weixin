package com.wxn.weixin.controller;

import com.alibaba.fastjson.JSON;
import com.taobao.api.ApiException;
import com.taobao.api.DefaultTaobaoClient;
import com.taobao.api.TaobaoClient;
import com.taobao.api.response.TbkDgItemCouponGetResponse;
import com.wxn.weixin.commons.Commons;
import com.wxn.weixin.dal.model.TbkItemDO;
import com.wxn.weixin.dal.model.TbkItemDetailDO;
import com.wxn.weixin.dal.model.TbkMaterialOptionalDO;
import com.wxn.weixin.manager.TaoBaoManager;
import com.wxn.weixin.manager.TbkSuperQueryManager;
import com.wxn.weixin.pojo.SuperQueryPo;
import com.wxn.weixin.pojo.TbkItemSuperDO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
@Slf4j
public class TaoBaoAction extends BaseAction{

    @Autowired
    private TaoBaoManager taoBaoManager;
    @Autowired
    private TbkSuperQueryManager tbkSuperQueryManager;

    /**
     * 优惠券入口
     * @return
     */
    @RequestMapping("/")
    public String index(){
        return "page/index";
    }
   /**
     * 优惠券入口
     * @return
     */
    @RequestMapping("/manage/index.do")
    public String getItems(){
        return "page/index";
    }
    /**
     * 通过点击图标，查询相应商品列表
     * @param model
     * @return
     */
    @RequestMapping(value = "/manage/tbkItemsByImg.do" , method = RequestMethod.GET)
    public String getItemsByImg(Model model,SuperQueryPo superQuery){
        try {
            log.info("通过点击图标，查询相应商品列表,param:{}",superQuery.toString());
            model.addAttribute("tbkItem",superQuery);
        } catch (Exception e) {
            log.error(e.getMessage(),e);
        }
        return "page/itemList";
    }

    /**
     * 加载更多商品
     * @param superQuery
     * @param response
     * @throws ApiException
     */
    @RequestMapping(value="/manage/loadMoreItems.do")
    public void loadMoreCoupon(SuperQueryPo superQuery, HttpServletResponse response){
        log.info("加载更多商品,param:{}",superQuery.toString());
        List<TbkMaterialOptionalDO> tbkItems = taoBaoManager.getItems(superQuery);
        sendMessages(response, JSON.toJSONString(tbkItems));
    }

    /**
     * 跳转到超级搜索
     * @return
     */
    @RequestMapping("/manage/superQuery.do")
    public String superQuery(Model model){
        try {
            log.info("超级搜索页面");
            List<TbkMaterialOptionalDO> tbkItems = taoBaoManager.getItemsBySuperQueryPage();
            model.addAttribute("tbkItems",tbkItems);
        } catch (Exception e) {
           log.error(e.getMessage(),e);
        }
        return "page/superQuery";
    }
    /**
     * 通过超级搜索搜索商品
     * @param superQuery
     * @return
     */
    @RequestMapping("/manage/skipItemListPage.do")
    public String getItemListBySuper(Model model,SuperQueryPo superQuery){
        log.info("要查询的商品内容,title{}",superQuery.toString());
        model.addAttribute("itemName",superQuery.getTitle());
        return "page/superQuery_list";
    }

    /**
     * 通过超级搜索搜索商品
     * @param superQuery
     * @return
     */
    @RequestMapping("/manage/superQuery_list.do")
    public void getItemList(SuperQueryPo superQuery,HttpServletResponse response){
        try {
            log.info("要查询的商品内容,title{}",superQuery.toString());
            List<TbkMaterialOptionalDO> tbkItems = null;
            if("1".equals(superQuery.getNbsite())){//查询站内优惠券
                tbkItems = taoBaoManager.getItemsToSuperQuery(superQuery);
            }
            if("0".equals(superQuery.getNbsite())){//超级搜索
                tbkItems = tbkSuperQueryManager.getItemsToSuperQuery(superQuery);
            }
            sendMessages(response, JSON.toJSONString(tbkItems));
        } catch (Exception e) {
            log.error(e.getMessage(),e);
            sendMessages(response, JSON.toJSONString("系统异常"));
        }
    }

    /**
     * 加载更多商品
     * @param superQuery
     * @param response
     * @throws ApiException
     *//*
    @RequestMapping(value="/manage/loadMoreItems.do")
    public void loadMoreCoupon(SuperQueryPo superQuery, HttpServletResponse response){
        log.info("加载更多商品,param:{}",superQuery.toString());
        List<TbkItemSuperDO> tbkItems = taoBaoManager.getItems(superQuery );
        sendMessages(response, JSON.toJSONString(tbkItems));
    }*/
    /**
     * 查询商品详情
     * @param model
     * @param item
     * @return
     */
    @RequestMapping("/manage/tbkItemDetail.do")
    public String getTbkItemDetail(Model model,TbkMaterialOptionalDO item){
        log.info("获取商品详情,tbkMaterialOptionalDO{}",item.toString());
        try {
            if("1".equals(item.getIsCode())){//站内商品
                item = taoBaoManager.getTbkItemDetail(item);
            }else {
                item = tbkSuperQueryManager.getTbkItemDetail(item);
            }
          /*  //查找相似产品
            List<TbkItemSuperDO> tbkItems = taoBaoManager.getSimilarityItems(tbkItemDetail);*/

            //调用淘口令接口
            if(item.getCoupon_remain_count() > 0){
                String token = taoBaoManager.getTbkCouponDetail(item);
                model.addAttribute("token",token);
            }
            String[] imgs = item.getSmallImages().split(",");
            model.addAttribute("tbkitemdetail",item);
            model.addAttribute("imgs",imgs);
        } catch (Exception e) {
            log.error(e.getMessage(),e);
        }
        return "page/detail";
    }
   /* @RequestMapping("/manage/tbkItemDetail.do")
    public String getTbkItemDetail(Model model,TbkItemDetailDO tbkItemDetailDO){
        log.info("获取商品详情,tbkItemDetail{}",tbkItemDetailDO.toString());
        try {
            TbkItemDetailDO tbkItemDetail = null;
            if("1".equals(tbkItemDetailDO.getIsCode())){//站内商品
                tbkItemDetail = taoBaoManager.getTbkItemDetail(tbkItemDetailDO);
            }else {//站内没有此商品，需调用超级搜索接口将信息同步到站内

            }
          *//*  //查找相似产品
            List<TbkItemSuperDO> tbkItems = taoBaoManager.getSimilarityItems(tbkItemDetail);*//*

            //调用淘口令接口
            String token = taoBaoManager.getTbkCouponDetail(tbkItemDetail);
            String[] imgs = tbkItemDetail.getSmallImages().split(",");
            model.addAttribute("tbkitemdetail",tbkItemDetail);
            model.addAttribute("token",token);
            model.addAttribute("imgs",imgs);
        } catch (Exception e) {
            log.error(e.getMessage(),e);
        }
        return "page/detail";
    }*/
}



