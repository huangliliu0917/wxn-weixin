package com.wxn.weixin.controller;

import javax.servlet.http.HttpServletResponse;

public class BaseAction {
    /**
     * 功能 :发送页面消息
     * 开发：wangjun 2014-11-19
     * @param response
     * @param json
     */
    public void sendMessages(HttpServletResponse response, String json) {
        response.setCharacterEncoding("UTF-8");
        try{
            response.getWriter().print(json);
        } catch (Exception e){
            e.printStackTrace();
        }
    }
}
