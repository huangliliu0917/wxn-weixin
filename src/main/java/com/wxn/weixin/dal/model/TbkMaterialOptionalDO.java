package com.wxn.weixin.dal.model;

import com.google.gson.annotations.SerializedName;
import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class TbkMaterialOptionalDO {

    @SerializedName("coupon_start_time")
    private String coupon_start_time;//优惠券开始时间

    @SerializedName("coupon_end_time")
    private String coupon_end_time;//优惠券结束时间

    @SerializedName("info_dxjh")
    private String info_dxjh;//定向计划信息

    @SerializedName("tk_total_sales")
    private int tk_total_sales;//淘客30天月推广量

    @SerializedName("tk_total_commi")
    private String tk_total_commi;//月支出佣金

    @SerializedName("coupon_id")
    private String coupon_id;//优惠券id

    @SerializedName("num_iid")
    private String num_iid;//宝贝id

    @SerializedName("title")
    private String title;//商品标题

    @SerializedName("pict_url")
    private String pict_url;//商品标题

    @SerializedName("small_images")
    private ImgBean small_images;//商品小图列表*/

    @SerializedName("reserve_price")
    private String reserve_price;//商品一口价格

    @SerializedName("zk_final_price")
    private String zk_final_price;//商品折扣价格

    @SerializedName("user_type")
    private String user_type;//卖家类型0表示集市，1表示商城

    @SerializedName("provcity")
    private String provcity;//宝贝所在地

    @SerializedName("item_url")
    private String item_url;//商品地址

    @SerializedName("include_mkt")
    private String include_mkt;//是否包含营销计划

    @SerializedName("include_dxjh")
    private String include_dxjh;//是否包含定向计划

    @SerializedName("commission_rate")
    private String commission_rate;//佣金比率

    @SerializedName("volume")
    private int volume;//30天销量

    @SerializedName("seller_id")
    private String seller_id;//卖家id

    @SerializedName("coupon_total_count")
    private int coupon_total_count;//优惠券总量

    @SerializedName("coupon_remain_count")
    private int coupon_remain_count;//优惠券剩余量

    @SerializedName("coupon_info")
    private String coupon_info;//优惠券面额

    @SerializedName("commission_type")
    private String commission_type;//佣金类型:MKT表示营销计划，SP表示定向计划，COMMON表示通用计划,

    @SerializedName("shop_title")
    private String shop_title;//店铺名称

    private String itemType;//商品类型 1：女装 2：母婴 3：化妆品 4：居家 5：鞋包配饰 6：美食 7：文体车品 8：数码家电 9：男装 10：内衣

    private String smallImages;

    private String isCode;
}