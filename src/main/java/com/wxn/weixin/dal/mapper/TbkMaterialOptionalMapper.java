package com.wxn.weixin.dal.mapper;


import com.wxn.weixin.dal.model.TbkMaterialOptionalDO;
import com.wxn.weixin.pojo.SuperQueryPo;

import java.util.List;

public interface TbkMaterialOptionalMapper {
    void insert(TbkMaterialOptionalDO item);

    List<TbkMaterialOptionalDO> getItems(SuperQueryPo superQuery);

    TbkMaterialOptionalDO getItemById(TbkMaterialOptionalDO item);

    List<TbkMaterialOptionalDO> getItemsToSuperQuery(SuperQueryPo superQuery);

    List<TbkMaterialOptionalDO> getItemsBySuperQueryPage();
}
