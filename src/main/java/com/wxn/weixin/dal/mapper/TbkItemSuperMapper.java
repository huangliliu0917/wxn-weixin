package com.wxn.weixin.dal.mapper;


import com.wxn.weixin.pojo.SuperQueryPo;
import com.wxn.weixin.pojo.TbkItemSuperDO;

import java.util.List;

public interface TbkItemSuperMapper {

    void insert(TbkItemSuperDO item);

    List<TbkItemSuperDO> getItems(SuperQueryPo superQuery);

    List<TbkItemSuperDO> getItemsByPo(SuperQueryPo superQuery);
}