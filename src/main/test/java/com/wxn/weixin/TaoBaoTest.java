package com.wxn.weixin;

import com.wxn.weixin.dal.mapper.TbkItemMapper;
import com.wxn.weixin.dal.model.TbkItemDO;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

@Slf4j
public class TaoBaoTest extends BaseSpringTest {

    @Autowired
    private TbkItemMapper tbkItemMapper;

    /**
     * 获取商品列表
     */
    @Test
    public void getItems(){
        TbkItemDO tbkItemDO = new TbkItemDO();
        List<TbkItemDO> list = tbkItemMapper.getItems(tbkItemDO);
        for(TbkItemDO tbkItemDO1 : list ){
            System.out.println(tbkItemDO1.toString());
        }
    }
}
