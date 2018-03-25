package com.wxn.weixin.pojo;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class SuperQueryPo extends Page {
    private String title;
    private String minfee;//最小金额
    private String maxfee;//最大金额
    private String gotype;//1：综合排序 2：返利比率 3：销量排序
    private String jiage;//按价格排序 up down
    private String onlyq;//是否查询有券商品 0：是 1：否
    private String nbsite;//是否查询站内优惠券 1：是 0：否
    private String itemType;//1:女装 2:男装 3:内衣 4:母婴 5:化妆品 6:居家 7:鞋包 8:配饰 9:车品 10:其它
    private String operType;//1:9.9专区 2：19.9专区 3：特惠女装
}
