package com.wxn.weixin.dal.mapper;


import com.wxn.weixin.dal.model.TbkItemDetailDO;

public interface TbkItemDetailMapper {

    /**
     * 获取商品详情
     * @param tbkItemDetailDO
     * @return
     */
    TbkItemDetailDO getItemDetail(TbkItemDetailDO tbkItemDetailDO);
}