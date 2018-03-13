package com.wxn.weixin.manager;

import com.github.pagehelper.PageHelper;
import com.taobao.api.ApiException;
import com.taobao.api.DefaultTaobaoClient;
import com.taobao.api.TaobaoClient;
import com.taobao.api.domain.NTbkItem;
import com.taobao.api.request.TbkDgItemCouponGetRequest;
import com.taobao.api.request.TbkItemGetRequest;
import com.taobao.api.request.TbkTpwdCreateRequest;
import com.taobao.api.response.TbkDgItemCouponGetResponse;
import com.taobao.api.response.TbkItemGetResponse;
import com.taobao.api.response.TbkTpwdCreateResponse;
import com.wxn.weixin.dal.mapper.TbkItemDetailMapper;
import com.wxn.weixin.dal.mapper.TbkItemMapper;
import com.wxn.weixin.dal.model.TbkItemDO;
import com.wxn.weixin.dal.model.TbkItemDetailDO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.concurrent.ThreadPoolExecutor;

@Service
public class TaoBaoManager {

    @Autowired
    private TbkItemMapper tbkItemMapper;
    @Autowired
    private TbkItemDetailMapper tbkItemDetailMapper;

    /**
     *
     * @param url
     * @param appkey
     * @param secret
     * @return List<NTbkItem>
     * @throws ApiException
     */
    public List<TbkDgItemCouponGetResponse.TbkCoupon> getTbkCoupon(String url, String appkey, String secret,String title,Long pageNo) throws ApiException {
        List<TbkDgItemCouponGetResponse.TbkCoupon> list = null;
        TaobaoClient client = new DefaultTaobaoClient(url, appkey, secret);
        TbkDgItemCouponGetRequest req = new TbkDgItemCouponGetRequest();
        req.setAdzoneId(272988181l);
        req.setQ(title);
        req.setPlatform(2L);
        req.setPageSize(20L);
        req.setPageNo(pageNo);
        TbkDgItemCouponGetResponse rsp = client.execute(req);
        if(null == rsp.getErrorCode()){
            list = rsp.getResults();
        }
        return list;
    }

    /**
     * 获取优惠券详细信息
     * @param url
     * @param appkey
     * @param secret
     * @param tbkCoupon
     * @return
     * @throws ApiException
     */
    public String getTbkCouponDetail(String url,String appkey, String secret,
                                                                   TbkDgItemCouponGetResponse.TbkCoupon tbkCoupon)throws ApiException {
        String tbkCode = "";
        TaobaoClient client = new DefaultTaobaoClient(url, appkey, secret);
        TbkTpwdCreateRequest req = new TbkTpwdCreateRequest();
        req.setText(tbkCoupon.getTitle());
        req.setUrl(tbkCoupon.getCouponClickUrl());
        req.setLogo(tbkCoupon.getPictUrl());
        TbkTpwdCreateResponse rsp = client.execute(req);
        if(null == rsp.getErrorCode()){
            tbkCode = rsp.getData().getModel();
        }
        return tbkCode;
    }

    public List<TbkDgItemCouponGetResponse.TbkCoupon> loadMoreCoupon(String url, String appkey, String secret, Long pageNo) throws ApiException {
        List<TbkDgItemCouponGetResponse.TbkCoupon> list = null;
        TaobaoClient client = new DefaultTaobaoClient(url, appkey, secret);
        TbkDgItemCouponGetRequest req = new TbkDgItemCouponGetRequest();
        req.setAdzoneId(272988181l);
        req.setPlatform(2L);
        req.setPageSize(20L);
        req.setPageNo(pageNo);
        TbkDgItemCouponGetResponse rsp = client.execute(req);
        if(null == rsp.getErrorCode()){
            list = rsp.getResults();
        }
        return list;
    }

    /**
     * 查询商品列表
     * @param tbkItemDO
     * @return
     */
    public List<TbkItemDO> getItems(TbkItemDO tbkItemDO) {
        //mybatis分页插件引入
        PageHelper.startPage(tbkItemDO.getPageNo(),tbkItemDO.getPageSize());
        return tbkItemMapper.getItems(tbkItemDO);
    }

    /**
     * 查询商品详情
     * @param tbkItemDetailDO
     * @return
     */
    public TbkItemDetailDO getTbkItemDetail(TbkItemDetailDO tbkItemDetailDO) {
        return tbkItemDetailMapper.getItemDetail(tbkItemDetailDO);
    }

    /**
     * 根据title,查找相似产品
     * @param tbkItemDetail
     * @return
     */
    public List<TbkItemDO> getSimilarityItems(TbkItemDetailDO tbkItemDetail) {
        TbkItemDO tbkItemDO = new TbkItemDO();
        tbkItemDO.setTitle(tbkItemDetail.getTitle());
        return tbkItemMapper.getItems(tbkItemDO);
    }
}
