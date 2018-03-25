package com.wxn.weixin.pojo;

import com.google.gson.annotations.SerializedName;
import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class TbkItemSuperDO extends Page{

    @SerializedName("debugInfo")
    private String debugInfo;

    @SerializedName("tkRate")
    private double tkRate;//高佣金

    @SerializedName("leafCatId")
    private String leafCatId;

    @SerializedName("couponEffectiveStartTime")
    private String couponEffectiveStartTime;//优惠券开始时间

    @SerializedName("couponEffectiveEndTime")
    private String couponEffectiveEndTime;//优惠券结束时间

    @SerializedName("couponOriLink")
    private String couponOriLink;

    @SerializedName("couponLink")
    private String couponLink;

    @SerializedName("couponAmount")
    private int couponAmount;//优惠券金额

    @SerializedName("sellerId")
    private String sellerId;//卖家id

    @SerializedName("couponLinkTaoToken")
    private String couponLinkTaoToken;//优惠券口令

    @SerializedName("rlRate")
    private double rlRate;

    @SerializedName("tkCommFee")
    private double tkCommFee;

    @SerializedName("rootCatScore")
    private String rootCatScore;

    @SerializedName("couponActivityId")
    private String couponActivityId;//优惠券id

    @SerializedName("couponInfo")
    private String couponInfo;//优惠券信息

    @SerializedName("hasSame")
    private String hasSame;

    @SerializedName("couponTotalCount")
    private int couponTotalCount;//优惠券总数量

    @SerializedName("userTypeName")
    private String userTypeName;

    @SerializedName("userType")
    private String userType;

    @SerializedName("reservePrice")
    private double reservePrice;//商品一口价

    @SerializedName("tkCommonRate")
    private double tkCommonRate;//普通佣金

    @SerializedName("umpBonus")
    private String umpBonus;

    @SerializedName("eventCreatorId")
    private String eventCreatorId;

    @SerializedName("eventRate")
    private double eventRate;

    @SerializedName("includeDxjh")
    private String includeDxjh;

    @SerializedName("hasRecommended")
    private String hasRecommended;

    @SerializedName("title")
    private String title;//商品标题

    @SerializedName("tkFinalRate")
    private double tkFinalRate;

    @SerializedName("nick")
    private String nick;//卖家昵称

    @SerializedName("tkCommonFee")
    private double tkCommonFee;

    @SerializedName("auctionUrl")
    private String auctionUrl;//商品链接

    @SerializedName("couponLeftCount")
    private int couponLeftCount;//优惠券剩余数量

    @SerializedName("sameItemPid")
    private String sameItemPid;

    @SerializedName("biz30day")
    private String biz30day;

    @SerializedName("hasUmpBonus")
    private String hasUmpBonus;

    @SerializedName("isBizActivity")
    private String isBizActivity;

    @SerializedName("couponStartFee")
    private String couponStartFee;

    @SerializedName("tk3rdRate")
    private double tk3rdRate;

    @SerializedName("tkFinalFee")
    private String tkFinalFee;

    @SerializedName("pictUrl")
    private String pictUrl;//商品主图

    @SerializedName("rootCatId")
    private String rootCatId;//主类目

    @SerializedName("auctionId")
    private String auctionId;//商品id

    @SerializedName("zkPrice")
    private double zkPrice;//折扣价格

    @SerializedName("couponShortLink")
    private String couponShortLink;//优惠券短链接

    @SerializedName("totalFee")
    private double totalFee;

    @SerializedName("totalNum")
    private int totalNum;

    @SerializedName("shopTitle")
    private String shopTitle;//店铺名称

    @SerializedName("rootCategoryName")
    private String rootCategoryName;

    @SerializedName("tkMktStatus")
    private String tkMktStatus;

    private String isCode;//1:有口令链接 2:无口令链接
    private String isShow;//1:展示 2:不展示
    private String itemType;//1:女装 2:男装 3:内衣 4:母婴 5:化妆品 6:居家 7:鞋包 8:配饰 9:车品 10:其它

    public TbkItemSuperDO() {
    }
}
