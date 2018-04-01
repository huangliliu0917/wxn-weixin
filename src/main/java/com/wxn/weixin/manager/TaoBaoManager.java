package com.wxn.weixin.manager;

import com.github.pagehelper.PageHelper;
import com.taobao.api.ApiException;
import com.taobao.api.DefaultTaobaoClient;
import com.taobao.api.TaobaoClient;
import com.taobao.api.request.TbkDgItemCouponGetRequest;
import com.taobao.api.request.TbkTpwdCreateRequest;
import com.taobao.api.response.TbkDgItemCouponGetResponse;
import com.taobao.api.response.TbkTpwdCreateResponse;
import com.wxn.weixin.commons.Commons;
import com.wxn.weixin.dal.mapper.TbkItemDetailMapper;
import com.wxn.weixin.dal.mapper.TbkItemMapper;
import com.wxn.weixin.dal.mapper.TbkItemSuperMapper;
import com.wxn.weixin.dal.mapper.TbkMaterialOptionalMapper;
import com.wxn.weixin.dal.model.TbkItemDetailDO;
import com.wxn.weixin.dal.model.TbkMaterialOptionalDO;
import com.wxn.weixin.pojo.SuperQueryPo;
import com.wxn.weixin.pojo.TbkItemSuperDO;
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
    @Autowired
    private TbkItemSuperMapper tbkItemSuperMapper;
    @Autowired
    private TbkMaterialOptionalMapper tbkMaterialOptionalMapper;

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
     * 获取淘口令
     * @param token
     * @return
     * @throws ApiException
     */
    public String getTbkCouponDetail(TbkMaterialOptionalDO token)throws ApiException {
        //如果是有券商品，手动拼接二合一链接
        String tokenUrl = "https://uland.taobao.com/coupon/edetail?activityId="+token.getCoupon_id()+"&pid=mm_120912411_42970707_272988181&itemId="+token.getNum_iid()+"&src=pgy_pgyqf&dx=1";
        String tbkCode = "";
        TaobaoClient client = new DefaultTaobaoClient(Commons.TBK_URL,Commons.APPKEY,Commons.SECRET);
        TbkTpwdCreateRequest req = new TbkTpwdCreateRequest();
        req.setText(token.getTitle());
        req.setUrl(tokenUrl);
        req.setLogo(token.getPict_url());
        TbkTpwdCreateResponse rsp = client.execute(req);
        if(null == rsp.getErrorCode()){
            tbkCode = rsp.getData().getModel();
        }
        return tbkCode;
    }

    /**
     * 加载更多商品
     * @param url
     * @param appkey
     * @param secret
     * @param pageNo
     * @return
     * @throws ApiException
     */
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
     * 查询商品详情
     * @param item
     * @return
     */
    public TbkMaterialOptionalDO getTbkItemDetail(TbkMaterialOptionalDO item) {
        return tbkMaterialOptionalMapper.getItemById(item);
    }
    /*public TbkItemDetailDO getTbkItemDetail(TbkItemDetailDO tbkItemDetailDO) {
        return tbkItemDetailMapper.getItemDetail(tbkItemDetailDO);
    }*/

    /**
     * 根据title,查找相似产品
     * @param tbkItemDetail
     * @return
     */
    public List<TbkItemSuperDO> getSimilarityItems(TbkItemDetailDO tbkItemDetail) {
        SuperQueryPo superQueryPo = new SuperQueryPo();
        superQueryPo.setTitle(tbkItemDetail.getTitle());
        return tbkItemSuperMapper.getItems(superQueryPo);
    }

    /**
     * 查询商品列表
     * @param superQuery
     * @return
     */
    public List<TbkMaterialOptionalDO> getItems(SuperQueryPo superQuery) {
        //mybatis分页插件引入
        PageHelper.startPage(superQuery.getPageNo(),superQuery.getPageSize());
        return tbkMaterialOptionalMapper.getItems(superQuery);
    }
    /*public List<TbkItemSuperDO> getItems(SuperQueryPo superQuery) {
        //mybatis分页插件引入
        PageHelper.startPage(superQuery.getPageNo(),superQuery.getPageSize());
        return tbkItemSuperMapper.getItems(superQuery);
    }*/

    /**
     * 查询商品列表
     * @param superQuery
     * @return
     */
    public List<TbkItemSuperDO> getItemsByPo(SuperQueryPo superQuery) {
        //mybatis分页插件引入
        PageHelper.startPage(superQuery.getPageNo(),superQuery.getPageSize());
        return tbkItemSuperMapper.getItemsByPo(superQuery);
    }

    public List<TbkMaterialOptionalDO> getItemsToSuperQuery(SuperQueryPo superQuery) {
        //mybatis分页插件引入
        PageHelper.startPage(superQuery.getPageNo(),superQuery.getPageSize());
        return tbkMaterialOptionalMapper.getItemsToSuperQuery(superQuery);
    }

    public List<TbkMaterialOptionalDO> getItemsBySuperQueryPage() {
        return tbkMaterialOptionalMapper.getItemsBySuperQueryPage();
    }
}
