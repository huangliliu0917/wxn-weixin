package com.wxn.weixin.dal.model;

import com.google.gson.annotations.SerializedName;
import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class ImgBean {
    @SerializedName("string")
    private String[] string;
}
