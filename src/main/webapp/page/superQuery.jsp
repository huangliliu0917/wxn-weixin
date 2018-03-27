<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/page/base/commons.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,minimum-scale=1,user-scalable=no">
<title>全网精选优惠券</title>

<link rel="stylesheet" type="text/css" href="../page/superquery/amazeui.min.css"/>
<link rel="stylesheet" type="text/css" href="../page/superquery/hl_style.css" />
<script type="text/javascript" src="../page/js/jquery.min.js"></script>
<script type="text/javascript" src="../page/superquery/amazeui.min.js"></script>
<script type="text/javascript" src="../page/superquery/clipboard.min.js"></script>
<link rel="stylesheet" type="text/css" href="../page/superquery/font_0cg36os498fzjjor.css">
<!-- 微信自定义接口 -->
<script src="../page/superquery/jweixin-1.1.0.js"></script>
<script type="text/javascript">
    if(navigator.appName == 'Microsoft Internet Explorer'){
        if(navigator.userAgent.indexOf("MSIE 5.0")>0 || navigator.userAgent.indexOf("MSIE 6.0")>0 || navigator.userAgent.indexOf("MSIE 7.0")>0) {
            alert('您使用的 IE 浏览器版本过低, 推荐使用 Chrome 浏览器或 IE8 及以上版本浏览器.');
        }
    }
    // jssdk config 对象
    jssdkconfig = {"appId":"wx2197a8ff9847ca8a","nonceStr":"RL9K5K7XI3AL2KK5","timestamp":"1521474913","signature":"6aef242b3b3c405a3539d9842adfd6998de62ba4"} || {};
    // 是否启用调试
    jssdkconfig.debug = false;
    jssdkconfig.jsApiList = [
        'checkJsApi',
        'onMenuShareTimeline',
        'onMenuShareAppMessage',
        'onMenuShareQQ',
        'onMenuShareWeibo',
        'hideMenuItems',
        'showMenuItems',
        'hideAllNonBaseMenuItem',
        'showAllNonBaseMenuItem'
    ];
</script>
<style>
    header{
        position: relative;
    }
    header img{
        width: 100%;
    }
    header .am-form{
        position: absolute;
        bottom: 3rem;
        width: 100%;
        display: flex;
        justify-content: center;
    }
    header .am-form input[type=text]{
        background:#EEF0FF;
        width: 86%;
        padding: 0 60px 0 30px;
        border:  none;
        outline: none;
        box-shadow: 0 2px 6px 0 rgba(134, 124, 255, .4);
        height: 40px;
        font-size: 14px;
    }
    header .am-form input[type="text"]::-webkit-input-placeholder{
        color: #9295AC;
    }
    header .icon-icon{
        display: flex;
        align-items: center;
        justify-content: center;
        position: absolute;
        left: 6%;
        top: 1px;
        color: #4c4c4c;
        width: 40px;
        height: 36px;
        line-height: 1.2;
    }
    .fq-searchbtn{
        display: flex;
        align-items: center;
        justify-content: center;
        position: absolute;
        right: 22px;
        top: 0;
        height: 40px;
        width: 60px;
        color: white;
        background: #EE7951;
        border-radius: 0 1000px 1000px 0;
        padding-right: 4px;
    }
    .fq-searchbtn:visited,
    .fq-searchbtn:hover,
    .fq-searchbtn:active,
    .fq-searchbtn:focus{
        color: white;
    }
    .fq-label{
        display: flex;
        justify-content:space-between;
        align-items:center;
        color: #4c4c4c;
    }
    .fq-hot-label{
        background: #F2F2F2;
        color: #6C6D76;
        padding: 8px 16px;
    }

    .fq-recommend a{
        width: 90%;
        position: relative;
    }

    .fq-recommend img{
        width: 100%;
    }
    .fq-coupon{
        color: white;
        background: #1fc46b;
        box-shadow: 0 0 4px rgba(41,203,110,0.36);
        padding: 0 4px;
        border-radius: 4px;

    }
    .fq-super-commend{
        background:#eee;
    }
    .fq-super-slider{
        border:none;
        box-shadow: none;
        margin-bottom:.5rem;
    }
    .fq-super-slider .am-control-nav{
        display: none;
    }
    .fq-super-slider .am-slides li{
        width: 150px!important;
    }
    .fq-super-slider .am-slides li a{
        display: block;
        width: 96%;
        background:#F6F6F6;
        border:5px;
    }
    .fq-super-slider .am-slides li a img{
        border:5px 5px 0 0;
    }
    .fq-super-messages{
        display: flex;
        justify-content: space-between;
        align-items: center;
        position: relative;
        border-radius:0 0 5px 5px;
    }
    .fq-super-slider .am-direction-nav .am-prev{
        left: -10px;
    }
    .fq-super-sale{
        position: absolute;
        top:-3rem;
        left: 0;
        border-radius: 0 100px 100px 0;
        background:rgba(255,255,255,.94);
        box-shadow: 0 2px 4px rgba(0,0,0,.1);
        color:#6C6D76;
        padding:2px 10px 2px 4px;
        line-height: 16px;
    }
</style>
<style>
    .suggest.dropdown .dropdown-menu {
        display: block;
        width: 6.8rem;
        margin-top: 0;
        padding: 0px 0px 0px 10px;
    }
    .suggest.dropdown .dropdown-menu {
        max-height: 330px;
        box-shadow: 0 2px 4px 0 rgba(32,32,64,.16);
    }
    .dropdown .dropdown-menu {
        border: 1px solid #d3d3db;
        position: absolute;
        top: 100%;
        margin-top: 10px;
        left: 0;
        z-index: 1000;
        display: none;
        min-width: 100%;
        max-height: 330px;
        font-size: .25rem;
        text-align: left;
        padding-left: 10px;
        background-color: #fff;
        -webkit-background-clip: padding-box;
        background-clip: padding-box;
        border-radius: 4px;
        box-sizing: border-box;
        overflow: auto;
        -moz-box-shadow: 0 1px 2px 0 rgba(32,32,64,.16);
        box-shadow: 0 1px 2px 0 rgba(32,32,64,.16);
    }
    .dropdown .dropdown-menu, .table-container .scroll-fix .table {
        -webkit-box-shadow: 0 1px 2px 0 rgba(32,32,64,.16);
        -ms-box-shadow: 0 1px 2px 0 rgba(32,32,64,.16);
        -o-box-shadow: 0 1px 2px 0 rgba(32,32,64,.16);
    }
    .dropdown {
        display: inline-block;
        position: relative;
    }

    .highlight {
        color: #f50;
    }

    .dropdown-menu a {
        color: #666;
        height: 30px;
        line-height: 30px;
        font-size: 14px;
    }
</style>
<style>
    /*新底部*/
    #nb-menu {
        position: fixed;
        border-top: #f0f0f0 1px solid;
        background: #fff;
        z-index: 99999;
        width: 100%;
        max-width:540px;
        bottom:0px;
        left:0px;
        right:0px;
        margin:auto;
    }

    #nb-menu ul {
        display: -webkit-box;
        width: 100%;
        height:46px;
        margin:0 auto;
        list-style-type: disc;
        -webkit-margin-before: 0em;
        -webkit-margin-after: 0em;
        -webkit-margin-start: 0px;
        -webkit-margin-end: 0px;
        -webkit-padding-start: 0px;
    }

    #nb-menu li {
        -webkit-box-flex: 1;
        font-size: 12px;
        padding: 4px 0;
        text-align: center;
        height: 38px;
        line-height: 15px;
        color: #999;
        width:25%;
        list-style:none;
    }

    #nb-menu li .font-div {
        color: #999999 !important;
        margin-top:-7px;
    }

    #nb-menu li .menu-inside {
    }

    #nb-menu li .menu-inside span {
        display: block;
        margin: 0 auto 3px auto;
        width: 21px;
        height: 21px;
        background-size: contain !important;
    }

    #nb-menu li .menu-inside i {
        display: block;
        margin: 0 auto 0px auto;
        width: 25px;
        height: 25px;
        font-size: 25px;
        color: #999999;
        padding-top:3px;
        margin-bottom:3px;
        background-size: contain !important;
    }
    .link-hover {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        z-index: 2;
    }

    .nb-relative {
        position: relative;
        top: 0;
        left: 0;
    }
    .go-top {
        display: block;
        width: 42px;
        height: 42px;
        position: fixed;
        right: 20px;
        bottom: 64px;
        z-index: 10000;
        background-image: url('../page/images/go_top.png');
        background-size: contain;
        opacity: 0;
        -webkit-transition: bottom .8s ease, opacity .6s ease;
    }
    .top-button-show {
        bottom: 54px;
        opacity: 1;
    }
    .top-button-hide {
        bottom: -54px;
        opacity: 0;
    }
    .go-top span {
        position: absolute;
        bottom: 9px;
        width: 100%;
        display: block;
        height: 12px;
        line-height: 12px;
        text-align: center;
        font-size: 10px;
        color: #333;
    }
    .result-img{
        position: relative;
        float: left;
        padding: .06533rem 0rem;
        width: 2.9rem;
        height: 2.9133rem;
        border-bottom: 1px #e5e5e5 solid;
        color: #999;
        background:#fff;
    }
    .result-img img {
        width: 2.88rem;
        height: 2.88rem;
        vertical-align: middle;

    }
    .result-desc {
        position: relative;
        float: right;
        padding: .06533rem .24rem .06533rem .1rem;
        width: 6.74rem;
        height: 2.9133rem;
        border-bottom: 1px #e5e5e5 solid;
        color: #999;
        background:#fff;
    }
</style>
</head>

<body>
    <div class="am-modal am-modal-alert" tabindex="-1" id="fq_alert">
      <div class="am-modal-dialog">
        <div class="am-modal-hd" id="fq_alert_title"></div>
        <div class="am-modal-bd" id="fq_alert_info">
        </div>
        <div class="am-modal-footer">
          <span class="am-modal-btn">确定</span>
        </div>
      </div>
    </div>
    <div class="am-modal am-modal-confirm" tabindex="-1" id="fq_confirm">
      <div class="am-modal-dialog">
        <div class="am-modal-hd" id="fq_confirm_title"></div>
        <div class="am-modal-bd" id="fq_confirm_info"></div>
        <div class="am-modal-footer">
          <span class="am-modal-btn" data-am-modal-confirm>确定</span>
        </div>
      </div>
    </div>
    <div class="fq-whole am-text-sm" style="max-width:540px;width:100%;max-width:540px;bottom:0px;left:0px;right:0px;margin:auto;">
        <!--查询窗口-->
        <header class="head am-text-center am-center">
            <img src="../page/images/super_searchbg.png" />
            <form action="" method="get" class="am-form" onSubmit="return search()" id="search-form">
                <a class="iconfont icon-icon"></a>
                <input id="itemurl" name="title" type="text" class="am-round" placeholder="搜索粘贴商品标题抢优惠券~" value="" autocomplete="off">
                <div class="suggest dropdown" style="display: none;top: 40px;left: 40px;z-index: 9998;width: 71%;position: absolute;">
                    <ul class="dropdown-menu" id="suggest">
                    </ul>
                </div>
                <input type="hidden" name="shopid" value="0"/>
                <a class="fq-searchbtn" id="clickurl">搜索</a>
            </form>
        </header>
        <!--查询窗口-->
        <!--初始界面-->
        <!--交互界面-->
        <div class="fq-background-white am-margin-top-xs am-padding-sm am-hide" id="searching">
          <div class="am-text-center"><i class="am-icon-spinner am-icon-spin"></i> 正在为您查询<span id="search_title"></span>的商品优惠券，请稍后......</div>
        </div>
        <!--交互界面-->
        <!--初始界面-->
        <div class="fq-super-commend" id="course">
            <div class="fq-background-white am-margin-bottom-sm am-padding-sm">
                <div class="fq-label am-margin-bottom-sm am-text-default">
                    <span>热门标签</span>
                    <span class="am-text-xs fq-super-replace change_tickets">
                        <i class="am-icon-refresh am-margin-right-xs"></i>换一批</span>
                </div>
                <div class="tickets_content">
                </div>
            </div>

            <div class="fq-background-white am-padding-vertical-sm am-margin-bottom-sm am-padding-left-sm">
                <div class="fq-label am-padding-bottom-sm am-text-default">
                    边看边买
                </div>
                <div class="fq-super-slider am-slider am-slider-default am-slider-carousel" data-am-flexslider="{itemWidth:160, itemMargin: 5,animationSpeed:400, slideshow: true,playAfterPaused: 6000}">
                    <ul class="am-slides">
                     <li>
                         <a class="fq-super-goods am-text-left" href="">
                            <img src="http://img.alicdn.com/imgextra/i4/139011728/TB2pHuwaUR1BeNjy0FmXXb0wVXa_!!139011728.jpg_200x200.jpg" />
                            <div class="fq-super-messages am-padding-xs">
                                <span class="fq-super-sale am-text-xs">月销30002</span>
                                <span class="am-text-xs" style="color:#F42B45">券后￥8.8</span>
                                <span class="fq-coupon">3元券</span>
                            </div>
                         </a>
                     </li>
                    </ul>
                </div>
            </div>
            <div style="height:30px"></div>
            <div id="nb-menu" style="padding-bottom:3px;">
                <ul class="nb-ul">
                    <li class="nb-relative ">
                        <a href="${actionPath}/manage/index.do" class="link-hover"></a>
                        <div class="menu-inside" style="height:38px;">
                            <i id="nb_btn_11" class="nb-btn" style="margin-bottom:3px;background-image:url('../page/images/scsy.png');background-position: 50% 50%; background-repeat:no-repeat;width:25px;height:25px;border-radius: 0%;margin-bottom:8px"></i>
                            <div class="font-div" style="padding-top:0px;margin-bottom:3px;">商城首页</div>
                        </div>
                    </li>
                    <li class="nb-relative ">
                        <a href="${actionPath}/manage/tbkItemsByImg.do?operType=3" class="link-hover"></a>
                        <div class="menu-inside" style="height:38px;">
                            <i id="nb_btn_12" class="nb-btn" style="margin-bottom:3px;background-image:url('../page/images/nz.png');background-position: 50% 50%; background-repeat:no-repeat;width:25px;height:25px;border-radius: 0%;margin-bottom:8px"></i>
                            <div class="font-div" style="padding-top:0px;margin-bottom:3px;">特惠女装</div>
                        </div>
                    </li>

                    <li class="nb-relative ">
                        <a href="${actionPath}/manage/tbkItemsByImg.do?operType=2" class="link-hover"></a>
                        <div class="menu-inside" style="height:38px;">
                            <i id="nb_btn_13" class="nb-btn" style="margin-bottom:3px;background-image:url('../page/images/zb.png');background-position: 50% 50%; background-repeat:no-repeat;width:25px;height:25px;border-radius: 0%;margin-bottom:8px"></i>
                            <div class="font-div" style="padding-top:0px;margin-bottom:3px;">19.9封顶</div>
                        </div>
                    </li>

                    <li class="nb-relative ">
                        <a href="${actionPath}/manage/superQuery.do" class="link-hover"></a>
                        <div class="menu-inside" style="height:38px;">
                            <i id="nb_btn_14" class="nb-btn" style="margin-bottom:3px;background-image:url('../page/images/ss.png');background-position: 50% 50%; background-repeat:no-repeat;width:25px;height:25px;border-radius: 0%;margin-bottom:8px"></i>
                            <div class="font-div" style="padding-top:0px;margin-bottom:3px;">全网搜索</div>
                        </div>
                    </li>

                    <li class="nb-relative ">
                        <a href="" class="link-hover"></a>
                        <div class="menu-inside" style="height:38px;">
                            <i id="nb_btn_15" class="nb-btn" style="margin-bottom:3px;background-image:url('../page/images/huiyuan.png');background-position: 50% 50%; background-repeat:no-repeat;width:25px;height:25px;border-radius: 0%;margin-bottom:8px"></i>
                            <div class="font-div" style="padding-top:0px;margin-bottom:3px;">个人中心</div>
                        </div>
                    </li>
                </ul>
        </div>
    </div>
<!--今日优选-->
<%--<script>
    $('.fq-ad-slider').flexslider({
        playAfterPaused: 6000,
        before: function(slider) {
            if (slider._pausedTimer) {
            window.clearTimeout(slider._pausedTimer);
            slider._pausedTimer = null;
            }
        },
        after: function(slider) {
            var pauseTime = slider.vars.playAfterPaused;
            if (pauseTime && !isNaN(pauseTime) && !slider.playing) {
            if (!slider.manualPause && !slider.manualPlay && !slider.stopped) {
                slider._pausedTimer = window.setTimeout(function() {
                slider.play();
                }, pauseTime);
            }
            }
        }
    });
</script>--%>
<script>
    $('#clickurl').click(function(){
        var itemurl = $('#itemurl').val().match(/[a-zA-z]+:\/\/[^\s]*/);
        if(itemurl){
            $('#fq_alert_info').text('请使用商品标题搜索');
            $('#fq_alert').modal();
            return false;
        }
        if($('#itemurl').val()==''){
            $('#fq_alert_info').text('请输入商品标题');
            $('#fq_alert').modal();
            return false;
        }
        var title = $('#itemurl').val().replace('/','^');
        window.location.href=""+"/manage/skipItemListPage.do?title="+title;
    });

    function search(){
        var itemurl = $('#itemurl').val().match(/[a-zA-z]+:\/\/[^\s]*/);
        if(itemurl){
            $('#fq_alert_info').text('请使用商品标题搜索');
            $('#fq_alert').modal();
            return false;
        }
        var title = $('#itemurl').val().replace('/','^');
        //默认查询站内有优惠券的商品，综合排序
        var jumpurl = ""+"/manage/skipItemListPage.do?title="+title;
        window.location.href=jumpurl;
        return false;
    }
</script>
<script>
/*    $('.item_list').on('click','.click_video',function(){
        $('#fq-video').modal();
        var vid = $(this).attr('data-vid');
        if(vid>0){
            var a = 'http://cloud.video.t';
            var b = 'aobao.co';
            var src = a+b+'m/play/u/1/p/1/e/6/t/1/'+vid+'.mp4';
            $('#video_url').attr('src',src);
        }
    })*/
</script>
</body>
</html>

<script>
//热门标签
$('.change_tickets').click(function(){
        change();
})
</script>

<%--<script>
function change(){
$('.change_tickets').css('display','none'); 
        $.ajax({
            url:"http://wx.sskk88.cn/addons/bsht_tbkquan/rand.php",
            success:function(data){         
                 $('.change_tickets').css('display','block');        
				 data = JSON.parse(data);
				 var tickets_array = data.tickets;
                 var tickets_list_array = data.tickets_list;
                 var str = '';
				 //console.log(data);
                 for(var i=0;i<9;i++){
                     var key = tickets_array[i];
                     var tickets_name = tickets_list_array[key];
                     var agent_pname = "";
                      
                          var jumpurl = "http://wx.sskk88.cn/app/index.php?c=entry&i=4&m=bsht_tbkquan&do=so&itemid=&sid=&itemfee=&itempic=&nb_shopid=0&keyword="+tickets_name+"&shopid=0&actid=&openid=";
						  str += '<a href="'+jumpurl+'"><button type="button" class="am-btn fq-hot-label am-round am-margin-right-xs am-text-sm hot_label am-margin-bottom-sm">'+tickets_name+'</button></a>';
                      
                     
                 }
                 $('.tickets_content').html(str);
                
            }
});
}--%>

<%--$(function() {
change();

$('#itemurl').on('input propertychange', function() {
    //
	var livekey = $('#itemurl').val();
	$('.suggest').hide();
	$('#suggest').hide();
	if(livekey){
	     $.ajax({
             type: "get",
             async: false,
             url: "http://suggest.taobao.com/sug?&code=utf-8&q="+livekey,
             dataType: "jsonp",
             jsonp: "callback",
             success: function(json){
                 if(json.result){
				 var qarrLen = json.result.length;
				 //alert(qarrLen);
				 if(qarrLen<1 || qarrLen==0){
				 $('.suggest').hide();
				 $('#suggest').hide();
				 return;
				 }
				 //alert(qarrLen);
				 var resultq = '';
				 for (var i = 0; i < qarrLen; i++) {
				    resultq += '<a href="javascript:;" onclick="nbsosq(this)" name="'+json.result[i][0]+'"><li class="">'+json.result[i][0]+'</li></a>';
				 }
				 $('#suggest').html(resultq);
				 $('.suggest').show();
				 $('#suggest').show();
				 }else{
				 $('.suggest').hide();
				 $('#suggest').hide();
				 }
				 //alert(json.result);
				 //$('.suggest').show();
             },
             error: function(){
                 $('.suggest').hide();
				 $('#suggest').hide();
             }
         });
	}
});

wx.config(jssdkconfig);
wx.ready(function () {
wx.hideAllNonBaseMenuItem();
});
});
</script>--%>
<%--<script>
    var ckua = navigator.userAgent.toLowerCase();
        if (ckua.match(/iphone/i) == "iphone"){
            if(/iphone/gi.test(navigator.userAgent) && (screen.height == 812 && screen.width == 375)){
                console.log('X');$("#nb-menu").attr('style','padding-bottom:30px');
            }
}
</script>--%>
