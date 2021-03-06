<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/page/base/commons.jsp" %>
<!DOCTYPE html>
<html>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta name="format-detection" content="telephone=no" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="apple-mobile-web-app-status-bar-style" content="black" />
    <title style="text-align: center">全网精选折扣汇</title>
    <link rel="stylesheet" type="text/css" href="../page/superquerylist/neat-min.css" />
    <link rel="stylesheet" type="text/css" href="../page/superquerylist/so.css?v=2017" />
    <script src="../page/superquerylist/index.js?v=2017"></script>
    <script src="../page/superquerylist/jquery-1.11.1.js"></script>
    <script type="text/javascript" src="../page/superquerylist/updown.js"></script>
    <script type="text/javascript" src="../page/superquerylist/jquery.scrollLoading.js"></script>
    <script type="text/javascript" src="../page/superquerylist/dropload.min.js"></script>
    <script src="../page/superquerylist/jweixin-1.2.0.js"></script>
    <link href="../page/superquerylist/layui.css" rel="stylesheet">
    <link href="../page/superquerylist/layer.css" rel="stylesheet">
    <script src="../page/superquerylist/layui.js" charset="utf-8" />
    <script type="text/javascript">
        if(navigator.appName == 'Microsoft Internet Explorer'){
            if(navigator.userAgent.indexOf("MSIE 5.0")>0 || navigator.userAgent.indexOf("MSIE 6.0")>0 || navigator.userAgent.indexOf("MSIE 7.0")>0) {
                alert('您使用的 IE 浏览器版本过低, 推荐使用 Chrome 浏览器或 IE8 及以上版本浏览器.');
            }
        }
        // jssdk config 对象
        jssdkconfig = {"appId":"wx2197a8ff9847ca8a","nonceStr":"lY6aCav8Y6zycYVf","timestamp":"1521474919","signature":"25ddac7e5af23294fca733be12eb6efb7d70ab4c"} || {};
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
        .topdh{
            animation: clipAni 0.5s;
            -moz-animation: clipAni 0.5s;	/* Firefox */
            -webkit-animation: clipAni 0.5s;	/* Safari 和 Chrome */
            -o-animation: clipAni 0.5s;	/* Opera */
        }
        @keyframes clipAni
        {
            0% {
                opacity: 0;
                -webkit-transform: translateX(40px);
            }
            100% {
                opacity: 1;
                -webkit-transform: translateX(0);
            }
        }

        @-moz-keyframes clipAni /* Firefox */
        {
            0% {
                opacity: 0;
                -webkit-transform: translateX(40px);
            }
            100% {
                opacity: 1;
                -webkit-transform: translateX(0);
            }
        }

        @-webkit-keyframes clipAni /* Safari 和 Chrome */
        {
            0% {
                opacity: 0;
                -webkit-transform: translateX(40px);
            }
            100% {
                opacity: 1;
                -webkit-transform: translateX(0);
            }
        }

        @-o-keyframes clipAni /* Opera */
        {
            0% {
                opacity: 0;
                -webkit-transform: translateX(40px);
            }
            100% {
                opacity: 1;
                -webkit-transform: translateX(0);
            }
        }
        .topdh2{
            animation: clipAni 0.8s;
            -moz-animation: clipAni 0.8s;	/* Firefox */
            -webkit-animation: clipAni 0.8s;	/* Safari 和 Chrome */
            -o-animation: clipAni 0.8s;	/* Opera */
        }
        @keyframes clipAni
        {
            0% {
                opacity: 0;
                -webkit-transform: translateX(30px);
            }
            100% {
                opacity: 1;
                -webkit-transform: translateX(0);
            }
        }

        @-moz-keyframes clipAni /* Firefox */
        {
            0% {
                opacity: 0;
                -webkit-transform: translateX(30px);
            }
            100% {
                opacity: 1;
                -webkit-transform: translateX(0);
            }
        }

        @-webkit-keyframes clipAni /* Safari 和 Chrome */
        {
            0% {
                opacity: 0;
                -webkit-transform: translateX(30px);
            }
            100% {
                opacity: 1;
                -webkit-transform: translateX(0);
            }
        }

        @-o-keyframes clipAni /* Opera */
        {
            0% {
                opacity: 0;
                -webkit-transform: translateX(30px);
            }
            100% {
                opacity: 1;
                -webkit-transform: translateX(0);
            }
        }
        .topdh3{
            animation: clipAni 1s;
            -moz-animation: clipAni 1s;	/* Firefox */
            -webkit-animation: clipAni 1s;	/* Safari 和 Chrome */
            -o-animation: clipAni 1s;	/* Opera */
        }
        @keyframes clipAni
        {
            0% {
                opacity: 0;
                -webkit-transform: translateX(20px);
            }
            100% {
                opacity: 1;
                -webkit-transform: translateX(0);
            }
        }

        @-moz-keyframes clipAni /* Firefox */
        {
            0% {
                opacity: 0;
                -webkit-transform: translateX(20px);
            }
            100% {
                opacity: 1;
                -webkit-transform: translateX(0);
            }
        }

        @-webkit-keyframes clipAni /* Safari 和 Chrome */
        {
            0% {
                opacity: 0;
                -webkit-transform: translateX(20px);
            }
            100% {
                opacity: 1;
                -webkit-transform: translateX(0);
            }
        }

        @-o-keyframes clipAni /* Opera */
        {
            0% {
                opacity: 0;
                -webkit-transform: translateX(20px);
            }
            100% {
                opacity: 1;
                -webkit-transform: translateX(0);
            }
        }
    </style>
    <style>
        .suggest.dropdown .dropdown-menu {
            display: block;
            width: 5.5rem;
            margin-top: 0;
            padding: 0px 0px 0px .15rem;
        }
        .suggest.dropdown .dropdown-menu {
            max-height: 5.5rem;
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
            max-height: 5rem;
            font-size: .25rem;

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
            height: .5rem;
            line-height: .55rem;
            font-size: .3rem;
        }
    </style>
    <style>
        /*新底部*/
        #nb-menu {
            position: fixed;
            bottom: 0;
            border-top: #f0f0f0 1px solid;
            background: #fff;
            z-index: 99999;
            width: 100%;
            max-width:7.5rem;
            display:none;
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
            bottom: 94px;
            opacity: 1;
        }
        .top-button-hide {
            bottom: -94px;
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
        .loadingbar3 {
            width: 100%;
            height: 100px;
            display: none;
            -webkit-box-pack: center;
            -webkit-box-align: center;
            position: fixed;
            top: 50%;
            left:0;
            right:0;
            margin-top: -1rem;
            z-index: 10000000;
            padding:5px;
            text-align:center;
        }
    </style>
</head>

<body>
<div class="body-wrap" style="margin:0 auto">
    <div>
        <div class="search-top-wrap" >
            <div class="search-top-wrap-inner" id="J_search_top_inner">
                <div class="search-index-container">
                    <div class="search-wrap">
                        <div class="search-rec-wrap" id="J_search_rec_wrap" style="display: block;">
                            <div class="search-box">
                                <span class="search-back" onclick="javascript:history.back(-1);">返回</span>
                                <form class="input_form" onsubmit="return false;">
                                    <input id="J_search_box_input" class="search-box-input" type="search" name="search" value="${itemName}" placeholder="输入您要搜索的宝贝" autocomplete="off"/>
                                    <div class="suggest dropdown" style="display: none; top: -.22rem; left: 0px;z-index:9999;width: 5rem;">
                                        <ul class="dropdown-menu" id="suggest">

                                        </ul>
                                    </div>
                                    <button class="search-reset f16" type="button" onclick="clkey();">×</button>
                                </form>
                                <span class="search-cancle" onclick="submitSearch_go();">搜索</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="jiage" style="display:none;">down</div>
                <div id="onlyq" style="display:none;">0</div>
                <div id="nbsite" style="display:none;">0</div>
                <div id="gotype" style="display:none">1</div>
                <div class="sort-wrap clearfix" id="J_search_sort">
                    <a href="javascript:;" class="sort-item gotype" data-id="1" style="color:#F50">综合排序</a>
                    <a href="javascript:;" class="sort-item gotype"  data-id="2"  >返利金额</a>
                    <a href="javascript:;" class="sort-item gotype" data-id="3" >30日销量</a>
                    <a href="javascript:;" class="sort-item sort-comp gotype jiage" data-id="4" >商品价格</a>
                </div>
                <div class="filter-wrap">
                    <div class="filter-line"  style="width:50%; float:left; display:inline;">
                        <img class="filter-tag" src="../page/images/quanico.png" />
                        <span class="filter-tip">仅看有券商品</span>
                        <input type="hidden" value="0">
                        <a href="javascript:;" class="nbqonly filter-toggle "><span class="filter-inner "></span></a>
                    </div>
                    <div class="filter-line"  style="width:50%; float:left; display:inline;">
                        <img class="filter-tag" src="../page/images/homeico.png" />
                        <span class="filter-tip">优先站内商品</span>
                        <input type="hidden" value="0">
                        <a href="javascript:;" class="nbsite filter-toggle filter-toggle-chose"><span class="filter-inner "></span></a>
                    </div>
                </div>
            </div>
        </div>
        <div mx-vframe="true" id="J_view_list">
            <div class="item-list-wrap">
                <ul class="item-list" id="J_rec_lists">
                    <div class="waterfall-list">
                        <div class="waterfall-column">
                            <div id="logData">
                                <div id="inData2" style="display:none;padding: 0px 0px 0px; margin: 0px 0px; border-top: 2px dashed rgb(255, 136, 0);border-bottom: 2px dashed rgb(255, 136, 0);" class="topdh3">
                                </div>
                                <div id="inData">

                                </div>
                            </div>
                            <div class="waterfall-status-loading" style="display:none"><p><span class="loading-icon"></span><span id="tbk_apan" class="loading-text">努力查询中...</span></p></div>
                        </div>
                    </div>
                </ul>
            </div>
        </div>
    </div>
</div>
<div id="loadMoreItem" style="height:50px"></div>
<div id="nb-menu" style="padding-bottom:3px">
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
                <div class="font-div" style="padding-top:0px;margin-bottom:3px;">敬请期待</div>
            </div>
        </li>
    </ul>
</div>
<div class="loadingbar3" id="loadingbar3" style="display:none">
    <div class='loading3'><img src='../page/images/loading2.gif' style="width: 45px;height: 45px;"><br>加载中，请稍后<br></div>
</div>
<div class="backTop" onclick="gotop();">
    <div class="go-top top-button-hide">
        <span>顶部</span>
    </div>
</div>
<script type="text/javascript">
    //绑定手机搜索按钮
    $('#J_search_box_input').bind('search', function () {
        var title=$('#J_search_box_input').val();
        if(title){window.location.href=""+"/manage/skipItemListPage.do?title="+title;}
    });

    function submitSearch_go(){
        var title = document.getElementById("J_search_box_input").value;//查询优惠券条件
        window.location.href=""+"/manage/skipItemListPage.do?title="+title;
    }
</script>
<script type="text/javascript">
    var pageNo = 1;
    $(".gotype").click(function() {
        $("#inData").empty();
        pageNo = 1;
        var thisid = $(this).attr('data-id');
        $('#gotype').html(thisid);
        $('.gotype').attr('style','');
        $(this).attr('style','color:#F50');
        if (thisid == 4) {
            var thisjiage = $('#jiage').html();
            $(this).removeClass('sort-comp');
            if (thisjiage == 'down') {
                $(this).removeClass('nb-before');
                $(this).addClass('nb-after');
                $('#jiage').html('up');
            } else {
                $(this).removeClass('nb-after');
                $(this).addClass('nb-before');
                $('#jiage').html('down');
            }
        } else {
            $('#jiage').html('down');
            $('.jiage').removeClass('nb-before');
            $('.jiage').removeClass('nb-after');
            $('.jiage').addClass('sort-comp');
        }
        get_list();
    });

    $(".nbqonly").click(function() {
        pageNo=1;
        $("#inData").empty();
        $(this).removeClass('filter-toggle-chose');
        var thisonlyq = $('#onlyq').html();
        if (thisonlyq == 0 || thisonlyq == '0') {
            $(this).addClass('filter-toggle-chose');
            $('#onlyq').html('1');
            window.localStorage.setItem("onlyq",'1');
            console.log('只看有券状态：'+window.localStorage.getItem("onlyq"));
        } else {
            $('#onlyq').html('0');
            window.localStorage.setItem("onlyq",'0');
            console.log('只看有券状态：'+window.localStorage.getItem("onlyq"));
        }
        get_list();
    });

    $(".nbsite").click(function() {
        pageNo = 1;
        $("#inData").empty();
        $(this).removeClass('filter-toggle-chose');
        var thisnbsite = $('#nbsite').html();
        if (thisnbsite == 0 || thisnbsite == '0') {
            $(this).addClass('filter-toggle-chose');
            $('#nbsite').html('1');
            window.localStorage.setItem("nbsite",'1');
            console.log('站内优先状态：'+window.localStorage.getItem("nbsite"));
        } else {
            $('#nbsite').html('0');
            window.localStorage.setItem("nbsite",'0');
            console.log('站内优先状态：'+window.localStorage.getItem("nbsite"));
        }
        get_list();
    });
</script>
<script>
    function gotop(){
        setTimeout('$("html,body").animate({scrollTop:$(".search-top-wrap").offset().top},500);',500);
        $(".go-top").addClass("top-button-hide").removeClass("top-button-show");
    }
    window.addEventListener("scroll", function (event) {
        if (document.body.scrollTop > 500) {
            $(".go-top").removeClass("top-button-hide").addClass("top-button-show");
        } else {
            $(".go-top").addClass("top-button-hide").removeClass("top-button-show");
        }
    });
    $(function() {
        get_list();
        $("#nb-menu").fadeIn(300);
        wx.config(jssdkconfig);
        wx.ready(function () {
            wx.hideAllNonBaseMenuItem();
            wx.showMenuItems({
                menuList: ["menuItem:openWithQQBrowser","menuItem:openWithSafari","menuItem:favorite"]
            });
        });
    });
</script>
<!-- jQuery1.7以上 或者 Zepto 二选一，不要同时都引用 -->
<script src="../page/js/jquery.min.js"></script>
<script src="../page/js/dropload.js"></script>
<script>
    var domain = "http://"+window.location.host;
    $(function(){
        $(window).scroll(function () {
            if ($(document).height() - $(this).scrollTop() - $(this).height() < 10) {
                get_list();
            }
        });
    });
    function get_list(){
        $('#loadingbar3').show();
        $('.layui-flow-more').hide();
        $('.waterfall-status-loading').show();
        var sonlyq = $('#onlyq').html();//是否查询有券商品 0：是 1：否
        var sjiage = $('#jiage').html();//按价格排序
        var title = document.getElementById("J_search_box_input").value;//查询优惠券条件
        var issite = $("#nbsite").html();//是否查询站内优惠券 0：是 1：否
        var thisid = $("#gotype").html();//排序规则
        $.ajax({
            url:""+"/manage/superQuery_list.do",
            async: false,
            data: {'pageNo':pageNo,'title':title,'gotype':thisid,'nbsite':issite,'onlyq':sonlyq,'jiage':sjiage},
            dataType:'json',
            type:"post",
            success : function(data){
                var arrLen = data.length;
                if(arrLen > 0){
                    $.each(data,function(index,item){
                        var couponAmt = 0;
                        console.log(item.coupon_info);
                        if(null != item.coupon_info  && '' != item.coupon_info){
                            var temp = item.coupon_info;
                            var temp1 = temp.replace("满","").replace("元","").replace("元","").split("减");
                            couponAmt = temp1[1];
                        }
                        var createLi = document.createElement("li");
                        createLi.className="item-detail topdh";
                        createLi.innerHTML+="<a href="+domain+"/manage/tbkItemDetail.do?num_iid="+item.num_iid+"&isCode="+item.isCode+"&item_url="+item.item_url+"><div class='item-img'><img class='J_item_image' src='"+item.pict_url+"'>" +
                            "</div><div class='item-right'><span class='item-title'>"+item.title+"</span><div class='item-line'>" +
                            "<span class='line-group'><span>现价 ￥</span>" +
                            "<span style='text-decoration:none;'>"+item.zk_final_price+"</span></span><span class='line-group'>" +
                            "<span>已售"+item.volume+"件</span></span></div><div class='item-line' style='margin-bottom: 0.2rem'>" +
                            "<span class='line-group'><span>券后 </span><span style='margin-right: -0.05rem'>￥</span>" +
                            "<span class='cl-dark' style='font-size: 0.35rem'>"+(item.zk_final_price-couponAmt).toFixed(2)+"</span></span></div>" +
                            "<div class='item-line'><div class='line-group coupon-tag-wrap'><div class='coupon-tag'>券</div>" +
                            "<div class='coupon-price'>"+couponAmt+"元</div></div></div><div class='item-handle'>" +
                            "<img class='item-handle-img' src='../page/images/more.png'><div class='item-handle-text'>" +
                            "<span style='font-size:0.24rem;color: #ff5500'>返现金</span></div></div></div></a>"
                        document.getElementById("inData").appendChild(createLi)
                    });
                }else{
                    $("#tbk_apan").html('没有更多记录');
                    $('.loadingbar3').hide();
                    lock = false;
                }
                pageNo++;
            },
            error: function(xhr, type){
                // 即使加载出错，隐藏加载框
                setTimeout("$('.loadingbar3').hide();",1000);
            }
        });
        setTimeout("$('.loadingbar3').hide();",2000);
    }
</script>
<script>
    var ckua = navigator.userAgent.toLowerCase();
    if (ckua.match(/iphone/i) == "iphone"){
        if(/iphone/gi.test(navigator.userAgent) && (screen.height == 812 && screen.width == 375)){
            console.log('X');$("#nb-menu").attr('style','padding-bottom:30px');
        }
    }
</script>
</body>
</html>