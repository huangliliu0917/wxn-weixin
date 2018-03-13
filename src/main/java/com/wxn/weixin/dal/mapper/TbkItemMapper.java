package com.wxn.weixin.dal.mapper;


import com.wxn.weixin.dal.model.TbkItemDO;
import com.wxn.weixin.dal.model.TbkItemDetailDO;

import java.util.List;

public interface TbkItemMapper {

    void insert(TbkItemDO tbkItemDO);

    /**
     * 获取商品列表
     * @param tbkItemDO
     * @return
     */
    List<TbkItemDO> getItems(TbkItemDO tbkItemDO);

    /**
     * 查找相似产品
     * @param tbkItemDetail
     * @return
     */
    List<TbkItemDO> getSimilarityItems(TbkItemDetailDO tbkItemDetail);
}