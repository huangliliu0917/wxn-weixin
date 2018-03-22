package com.wxn.weixin.dal.model;


import com.wxn.weixin.pojo.Page;

/**
 * 商品列表
 */
public class TbkItemDO extends Page {
    private String itemId;//商品ID
    private String title;//商品名称
    private String pictUrl;//商品主图
    private String smallImages;//商品小图列表
    private String reservePrice;//商品一口价
    private String zkFinalPrice;//商品折扣价
    private Long userType;//卖家类型，0表示集市，1表示商城
    private String provcity;//宝贝所在地
    private String itemUrl;//商品地址
    private String nick;//卖家昵称
    private String sellerId;//卖家Id
    private long volume;//30天销量
    private String rateType;//佣金类型 1高佣 2普通佣金
    private String isCode;//1:有口令链接 2:无口令链接
    private String isShow;//1:展示 2:不展示
    private int operType;//1全网购 2,9.9专区 3小编力推 4今日上新
    private String itemType;//1:女装 2:男装 3:内衣 4:母婴 5:化妆品 6:居家 7:鞋包 8:配饰 9:车品
    private String typename;//排序类型
    private String minfee;//最小价格
    private String maxfee;//最高价格

    public String getTypename() {
        return typename;
    }

    public void setTypename(String typename) {
        this.typename = typename;
    }

    public String getMinfee() {
        return minfee;
    }

    public void setMinfee(String minfee) {
        this.minfee = minfee;
    }

    public String getMaxfee() {
        return maxfee;
    }

    public void setMaxfee(String maxfee) {
        this.maxfee = maxfee;
    }

    public String getItemType() {
        return itemType;
    }

    public void setItemType(String itemType) {
        this.itemType = itemType;
    }

    public int getOperType() {
        return operType;
    }

    public void setOperType(int operType) {
        this.operType = operType;
    }

    public String getItemId() {
        return itemId;
    }

    public void setItemId(String itemId) {
        this.itemId = itemId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getPictUrl() {
        return pictUrl;
    }

    public void setPictUrl(String pictUrl) {
        this.pictUrl = pictUrl;
    }

    public String getSmallImages() {
        return smallImages;
    }

    public void setSmallImages(String smallImages) {
        this.smallImages = smallImages;
    }

    public String getReservePrice() {
        return reservePrice;
    }

    public void setReservePrice(String reservePrice) {
        this.reservePrice = reservePrice;
    }

    public String getZkFinalPrice() {
        return zkFinalPrice;
    }

    public void setZkFinalPrice(String zkFinalPrice) {
        this.zkFinalPrice = zkFinalPrice;
    }

    public Long getUserType() {
        return userType;
    }

    public void setUserType(Long userType) {
        this.userType = userType;
    }

    public String getProvcity() {
        return provcity;
    }

    public void setProvcity(String provcity) {
        this.provcity = provcity;
    }

    public String getItemUrl() {
        return itemUrl;
    }

    public void setItemUrl(String itemUrl) {
        this.itemUrl = itemUrl;
    }

    public String getNick() {
        return nick;
    }

    public void setNick(String nick) {
        this.nick = nick;
    }

    public String getSellerId() {
        return sellerId;
    }

    public void setSellerId(String sellerId) {
        this.sellerId = sellerId;
    }

    public long getVolume() {
        return volume;
    }

    public void setVolume(long volume) {
        this.volume = volume;
    }

    public String getRateType() {
        return rateType;
    }

    public void setRateType(String rateType) {
        this.rateType = rateType;
    }

    public String getIsCode() {
        return isCode;
    }

    public void setIsCode(String isCode) {
        this.isCode = isCode;
    }

    public String getIsShow() {
        return isShow;
    }

    public void setIsShow(String isShow) {
        this.isShow = isShow;
    }
}
