package com.wxn.weixin.manager;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.taobao.api.ApiException;
import com.taobao.api.DefaultTaobaoClient;
import com.taobao.api.TaobaoClient;
import com.taobao.api.request.TbkDgMaterialOptionalRequest;
import com.taobao.api.response.TbkDgMaterialOptionalResponse;
import com.wxn.weixin.commons.Commons;
import com.wxn.weixin.dal.model.TbkMaterialOptionalDO;
import com.wxn.weixin.pojo.HttpClientResponse;
import com.wxn.weixin.pojo.SuperQueryPo;
import com.wxn.weixin.pojo.TbkItemSuperDO;
import com.wxn.weixin.utils.HttpClientUtils;
import lombok.extern.slf4j.Slf4j;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
@Slf4j
public class TbkSuperQueryManager {

    /**
     * 淘宝联盟超级搜索
     * @param superQuery
     * @return
     */
    public List<TbkItemSuperDO> superQueryItems(SuperQueryPo superQuery) {
        String url = Commons.SUPER_URL;
        if("0".equals(superQuery.getOnlyq())){//通过超级搜索，查询全部商品
            long t = new Date().getTime();
            if("1".equals(superQuery.getGotype())){//综合排序
                url = Commons.SUPER_URL+"?q="+superQuery.getTitle()+
                        "&_t="+t+"&toPage="+superQuery.getPageNo()+"&perPageSize="+superQuery.getPageSize();
            }else if("2".equals(superQuery.getGotype())){//返金比率
                url = Commons.SUPER_URL+"?q="+superQuery.getTitle()+
                        "&_t="+t+"&toPage="+superQuery.getPageNo()+"&perPageSize="+superQuery.getPageSize()+"&queryType=0&sortType=1";
            }else if("3".equals(superQuery.getGotype())){//30日销量
                url = Commons.SUPER_URL+"?q="+superQuery.getTitle()+
                        "&_t="+t+"&toPage="+superQuery.getPageNo()+"&perPageSize="+superQuery.getPageSize()+"&queryType=0&sortType=9";
            }else if("4".equals(superQuery.getGotype())){//券后价
                if("up".equals(superQuery.getJiage())){//价格降序
                    url = Commons.SUPER_URL+"?q="+superQuery.getTitle()+
                            "&_t="+t+"&toPage="+superQuery.getPageNo()+"&perPageSize="+superQuery.getPageSize()+"&queryType=0&sortType=4";
                }
                if("down".equals(superQuery.getJiage())){//价格的升序
                    url = Commons.SUPER_URL+"?q="+superQuery.getTitle()+
                            "&_t="+t+"&toPage="+superQuery.getPageNo()+"&perPageSize="+superQuery.getPageSize()+"&queryType=0&sortType=3";
                }
            }
        }
        if("1".equals(superQuery.getOnlyq())){//只查询有券商品
            long t = new Date().getTime();
            if("1".equals(superQuery.getGotype())){//综合排序
                url = Commons.SUPER_URL+"?q="+superQuery.getTitle()+
                        "&_t="+t+"&toPage="+superQuery.getPageNo()+"&perPageSize="+superQuery.getPageSize()+"&shopTag=dpyhq";
            }else if("2".equals(superQuery.getGotype())){//返金比率
                url = Commons.SUPER_URL+"?q="+superQuery.getTitle()+
                        "&_t="+t+"&toPage="+superQuery.getPageNo()+"&perPageSize="+superQuery.getPageSize()+"&queryType=0&sortType=1&shopTag=dpyhq";
            }else if("3".equals(superQuery.getGotype())){//30日销量
                url = Commons.SUPER_URL+"?q="+superQuery.getTitle()+
                        "&_t="+t+"&toPage="+superQuery.getPageNo()+"&perPageSize="+superQuery.getPageSize()+"&queryType=0&sortType=9&shopTag=dpyhq";
            }else if("4".equals(superQuery.getGotype())){//券后价
                if("up".equals(superQuery.getJiage())){//价格降序
                    url = Commons.SUPER_URL+"?q="+superQuery.getTitle()+
                            "&_t="+t+"&toPage="+superQuery.getPageNo()+"&perPageSize="+superQuery.getPageSize()+"&queryType=0&sortType=4&shopTag=dpyhq";
                }
                if("down".equals(superQuery.getJiage())){//价格的升序
                    url = Commons.SUPER_URL+"?q="+superQuery.getTitle()+
                            "&_t="+t+"&toPage="+superQuery.getPageNo()+"&perPageSize="+superQuery.getPageSize()+"&queryType=0&sortType=3&shopTag=dpyhq";
                }
            }
        }
        log.info("请求超级搜索，url:{}",url);
        HttpClientResponse rsp =  HttpClientUtils.get(url);
        List<TbkItemSuperDO> tbkItemList = null;
        if(null != rsp){
            JSONObject json = JSONObject.fromObject(rsp.getResponseContent());
            JSONObject data = JSONObject.fromObject(json.getString("data"));
            String pageList = data.getString("pageList");
            //将json数据转bean对象
            Gson gson = new Gson();
            tbkItemList =gson.fromJson(pageList, new TypeToken<List<TbkItemSuperDO>>(){}.getType());
        }
        return tbkItemList;
    }

    /**
     * 淘宝联盟物料导购
     * @param superQuery
     * @return
     */
    public List<TbkMaterialOptionalDO> getItemsToSuperQuery(SuperQueryPo superQuery) throws ApiException {
        TaobaoClient client = new DefaultTaobaoClient(Commons.TBK_URL, Commons.APPKEY, Commons.SECRET);
        TbkDgMaterialOptionalRequest req = new TbkDgMaterialOptionalRequest();

        req.setPageSize(new Long(superQuery.getPageSize()));
        req.setPageNo(new Long(superQuery.getPageNo()));
        req.setQ(superQuery.getTitle());
        req.setAdzoneId(272988181L);
        if("0".equals(superQuery.getOnlyq())){//通过超级搜索，查询全部商品
            if("1".equals(superQuery.getGotype())){//综合排序

            }else if("2".equals(superQuery.getGotype())){//返金比率
                req.setSort("tk_rate");
            }else if("3".equals(superQuery.getGotype())){//30日销量
                req.setSort("total_sales");
            }else if("4".equals(superQuery.getGotype())){//券后价
                if("up".equals(superQuery.getJiage())){//价格降序
                    req.setSort("price_des");
                }
                if("down".equals(superQuery.getJiage())){//价格的升序
                    req.setSort("price_asc");
                }
            }
        }
        if("1".equals(superQuery.getOnlyq())){//只查询有券商品
            req.setHasCoupon(true);
            if("1".equals(superQuery.getGotype())){//综合排序

            }else if("2".equals(superQuery.getGotype())){//返金比率
                req.setSort("tk_rate");
            }else if("3".equals(superQuery.getGotype())){//30日销量
                req.setSort("total_sales");
            }else if("4".equals(superQuery.getGotype())){//券后价
                if("up".equals(superQuery.getJiage())){//价格降序
                    req.setSort("price_des");
                }
                if("down".equals(superQuery.getJiage())){//价格的升序
                    req.setSort("price_asc");
                }
            }
        }
        TbkDgMaterialOptionalResponse rsp = client.execute(req);

        JSONObject jsonObject = JSONObject.fromObject(rsp.getBody());
        String tbkResp = jsonObject.get("tbk_dg_material_optional_response").toString();
        JSONObject jsonObject1 = JSONObject.fromObject(tbkResp);
        String resultList = jsonObject1.get("result_list").toString();
        JSONObject jsonObject2 = JSONObject.fromObject(resultList);
        String mapData = jsonObject2.get("map_data").toString();

        Gson gson = new Gson();
        List<TbkMaterialOptionalDO> tbkItemSupers = gson.fromJson(mapData, new TypeToken<List<TbkMaterialOptionalDO>>() {}.getType());
        return tbkItemSupers;
    }

    public TbkMaterialOptionalDO getTbkItemDetail(TbkMaterialOptionalDO item) throws ApiException {
        TaobaoClient client = new DefaultTaobaoClient(Commons.TBK_URL, Commons.APPKEY, Commons.SECRET);
        TbkDgMaterialOptionalRequest req = new TbkDgMaterialOptionalRequest();
        req.setQ(item.getItem_url());
        req.setAdzoneId(272988181L);
        TbkDgMaterialOptionalResponse rsp = client.execute(req);

        JSONObject jsonObject = JSONObject.fromObject(rsp.getBody());
        String tbkResp = jsonObject.get("tbk_dg_material_optional_response").toString();
        JSONObject jsonObject1 = JSONObject.fromObject(tbkResp);
        String resultList = jsonObject1.get("result_list").toString();
        JSONObject jsonObject2 = JSONObject.fromObject(resultList);
        String mapData = jsonObject2.get("map_data").toString();

        Gson gson = new Gson();
        List<TbkMaterialOptionalDO> tbkItemSupers = gson.fromJson(mapData, new TypeToken<List<TbkMaterialOptionalDO>>() {}.getType());
        for (TbkMaterialOptionalDO tbkItem : tbkItemSupers) {
            String[] imgs = tbkItem.getSmall_images().getString();
            StringBuilder stringBuilder = new StringBuilder();
            for (int i = 0; i < imgs.length; i++) {
                if (i == imgs.length - 1) {
                    stringBuilder.append(imgs[i]);
                } else {
                    stringBuilder.append(imgs[i] + ",");
                }
            }
            tbkItem.setSmallImages(stringBuilder.toString());
        }
        return tbkItemSupers.get(0);
    }
}
