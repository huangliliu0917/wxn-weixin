package com.wxn.weixin.manager;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.wxn.weixin.commons.Commons;
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
}
