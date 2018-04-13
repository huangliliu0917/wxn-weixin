<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/page/base/commons.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title style="text-align: center">妈咪有券</title>
    <link rel="stylesheet" href="${contextPath}/css/style.css" type="text/css" />
    <link rel="stylesheet" href="${contextPath}/css/main.css" type="text/css" media="screen" charset="utf-8" />
    <meta name="viewport" content="initial-scale=1, user-scalable=0, minimal-ui" charset="UTF-8">
    <title>加载底部</title>
    <!-- UC强制全屏 -->
    <meta name="full-screen" content="yes">
    <!-- QQ强制全屏 -->
    <meta name="x5-fullscreen" content="true">
    <link rel="stylesheet" href="../page/css/dropload.css">
    <script type="text/javascript">
        !function(J){function H(){var d=E.getBoundingClientRect().width;var e=(d/7.5>100*B?100*B:(d/7.5<42?42:d/7.5));E.style.fontSize=e+"px",J.rem=e}var G,F=J.document,E=F.documentElement,D=F.querySelector('meta[name="viewport"]'),B=0,A=0;if(D){var y=D.getAttribute("content").match(/initial\-scale=([\d\.]+)/);y&&(A=parseFloat(y[1]),B=parseInt(1/A))}if(!B&&!A){var u=(J.navigator.appVersion.match(/android/gi),J.navigator.appVersion.match(/iphone/gi)),t=J.devicePixelRatio;B=u?t>=3&&(!B||B>=3)?3:t>=2&&(!B||B>=2)?2:1:1,A=1/B}if(E.setAttribute("data-dpr",B),!D){if(D=F.createElement("meta"),D.setAttribute("name","viewport"),D.setAttribute("content","initial-scale="+A+", maximum-scale="+A+", minimum-scale="+A+", user-scalable=no"),E.firstElementChild){E.firstElementChild.appendChild(D)}else{var s=F.createElement("div");s.appendChild(D),F.write(s.innerHTML)}}J.addEventListener("resize",function(){clearTimeout(G),G=setTimeout(H,300)},!1),J.addEventListener("pageshow",function(b){b.persisted&&(clearTimeout(G),G=setTimeout(H,300))},!1),H()}(window);
        if (typeof(M) == 'undefined' || !M){
            window.M = {};
        }
    </script>
    <style>
        *{
            margin: 0;
            padding:0;
            -webkit-tap-highlight-color:rgba(0,0,0,0);
            -webkit-text-size-adjust:none;
        }
        .flush{
            max-width: 640px;
            margin: 0 auto;
            background-color: #fff;
        }
        .flush .item img{
            display: block;
            width: 40px;
            height: 40px;
            border:1px solid #ddd;
        }
        .flush .item h3{
            display: block;
            -webkit-box-flex: 1;
            -webkit-flex: 1;
            -ms-flex: 1;
            flex: 1;
            width: 100%;
            max-height: 40px;
            overflow: hidden;
            line-height: 20px;
            margin: 0 10px;
            font-size: 1.2rem;
        }
        @-webkit-keyframes opacity {
            0% {
                opacity:0;
            }
            100% {
                opacity:1;
            }
        }
        @keyframes opacity {
            0% {
                opacity:0;
            }
            100% {
                opacity:1;
            }
        }
        .salse li h2{ font-size: .30rem; color: #858585; height: 18px;padding: 0 .1rem; overflow: hidden;line-height: .4rem; margin-bottom: .1rem;}
        .salse .infor1 span{ color: #ff3334; display: block; float: right;line-height: 2;font-size: .25rem;}
        .salse .infor1 em{ font-style: normal; color: #ff3334;line-height: 2; font-size: .25rem;}

        #tab { overflow:hidden; width:100%;}
        #tab>a:not(:first-child){ display:none; }

        .showNav{
            position: absolute;
            bottom: 55%;
            text-align: center;
            font-size: 12px;
            line-height: 25px;
            left: 80%;
        }
         .showNav span{
            cursor: pointer;
            display: block;
            float: left;
            width: 20px;
            height: 20px;
            background: #ff5a28;
            margin-left: 2px;
            color: #fff;
        }
        #category-head{width:100%;display: inline;white-space: nowrap;overflow-x:scroll;float:left;overflow-y:hidden}
        #category-head li{display:inline-block;margin-left: 12px;height:30px;padding-left:5px;padding-top: 15px;font-size: 15px;}
    </style>
</head>
<body>
<div class="header">
    <div class="search">
        <input  type="search" name="title" id="title" placeholder="请输入您需要的商品" />
    </div>
    <a href="" class="sao">
        <img src="${contextPath}/images/share.png"/>
    </a>
</div>
<div class="h50"></div>
<div>
    <ul class="flex-layout category-head" id="category-head" style="">
        <li  onclick="javascript:window.location.href='${actionPath}/manage/tbkItemsByImg.do?itemType=1';" style="color: rgb(255, 95, 73);">全部</li>
        <li  onclick="javascript:window.location.href='${actionPath}/manage/tbkItemsByImg.do?itemType=10';" >女装</li>
        <li  onclick="javascript:window.location.href='${actionPath}/manage/tbkItemsByImg.do?itemType=10';" >内衣</li>
        <li  onclick="javascript:window.location.href='${actionPath}/manage/tbkItemsByImg.do?itemType=2';" >母婴</li>
        <li  onclick="javascript:window.location.href='${actionPath}/manage/tbkItemsByImg.do?itemType=3';" >化妆品</li>
        <li  onclick="javascript:window.location.href='${actionPath}/manage/tbkItemsByImg.do?itemType=4';" >居家</li>
        <li  onclick="javascript:window.location.href='${actionPath}/manage/tbkItemsByImg.do?itemType=5';" >鞋包配饰</li>
        <li  onclick="javascript:window.location.href='${actionPath}/manage/tbkItemsByImg.do?itemType=6';" >美食</li>
        <li  onclick="javascript:window.location.href='${actionPath}/manage/tbkItemsByImg.do?itemType=7';" >文体车品</li>
        <li  onclick="javascript:window.location.href='${actionPath}/manage/tbkItemsByImg.do?itemType=8';" >数码家电</li>
        <li  onclick="javascript:window.location.href='${actionPath}/manage/tbkItemsByImg.do?itemType=9';" >男装</li>
        <li  onclick="javascript:window.location.href='${actionPath}/manage/tbkItemsByImg.do?itemType=10';" >其它</li>
    </ul>
</div>
<div id="tab">
    <a  name="img_01" href="${actionPath}/manage/tbkItemsByImg.do?operType=1">
        <img style="width: 100%;height: 200px;"  src="${contextPath}/images/1.jpg"/>
    </a>
    <a  name="img_01" href="${actionPath}/manage/tbkItemsByImg.do?operType=1">
        <img style="width: 100%;height: 200px;" src="${contextPath}/images/2.jpg"/>
    </a>
    <a  name="img_01" href="${actionPath}/manage/tbkItemsByImg.do?operType=1">
        <img style="width: 100%;height: 200px;" src="${contextPath}/images/3.jpg"/>
    </a>
</div>
<div class="showNav">
    <span name="span_01">1</span>
    <span name="span_01">2</span>
    <span name="span_01">3</span>
</div>
<ul class="nav">
    <li>
        <a href="${actionPath}/manage/tbkItemsByImg.do?itemType=1">
            <img src="${contextPath}/images/girl.png" />
            <p>女装</p>
        </a>
    </li>
    <li>
        <a href="${actionPath}/manage/tbkItemsByImg.do?itemType=9">
            <img src="${contextPath}/images/boy.png" />
            <p>男装</p>
        </a>
    </li>
    <li>
        <a href="${actionPath}/manage/tbkItemsByImg.do?itemType=10">
            <img src="${contextPath}/images/4.png" />
            <p>内衣</p>
        </a>
    </li>
    <li>
        <a href="${actionPath}/manage/tbkItemsByImg.do?itemType=2">
            <img src="${contextPath}/images/5.png" />
            <p>母婴</p>
        </a>
    </li>
    <li>
        <a href="${actionPath}/manage/tbkItemsByImg.do?itemType=3">
            <img src="${contextPath}/images/6.png" />
            <p>化妆品</p>
        </a>
    </li>
    <li>
        <a href="${actionPath}/manage/tbkItemsByImg.do?itemType=4">
            <img src="${contextPath}/images/7.png" />
            <p>居家</p>
        </a>
    </li>
    <li>
        <a href="${actionPath}/manage/tbkItemsByImg.do?itemType=5">
            <img src="${contextPath}/images/3.png" />
            <p>鞋包配饰</p>
        </a>
    </li>
    <li>
        <a href="${actionPath}/manage/tbkItemsByImg.do?itemType=6">
            <img src="${contextPath}/images/10.png" />
            <p>美食</p>
        </a>
    </li>
    <li>
        <a href="${actionPath}/manage/tbkItemsByImg.do?itemType=7">
            <img src="${contextPath}/images/9.png" />
            <p>文体车品</p>
        </a>
    </li>
    <li>
        <a href="${actionPath}/manage/tbkItemsByImg.do?itemType=8">
            <img src="${contextPath}/images/10.png" />
            <p>数码家电</p>
        </a>
    </li>
</ul>
<div class="title">
    <span class="text">精品推荐</span>
</div>
<ul class="salse" id="indexUl">

</ul>
<div class="flush"></div>
<div class="h50"></div>
<ul class="footer">
   <%-- <li>
        <a href="${actionPath}/manage/index.do">
            <img src="${contextPath}/images/index.jpg" />
            <p>首页</p>
        </a>
    </li>--%>
    <li>
        <a href="${actionPath}/manage/tbkItemsByImg.do?operType=1">
            <img src="${contextPath}/images/red99.jpg" />
            <p>9.9专区</p>
        </a>
    </li>
    <li>
        <a href="${actionPath}/manage/superQuery.do">
            <img src="${contextPath}/images/12.png" />
            <p>超级搜索</p>
        </a>
    </li>
    <li>
        <a href="#">
            <img src="${contextPath}/images/member.jpg" />
            <p>敬请期待</p>
        </a>
    </li>
</ul>
<!-- jQuery1.7以上 或者 Zepto 二选一，不要同时都引用 -->
<script src="../page/js/jquery.min.js"></script>
<script src="../page/js/dropload.js"></script>
<script>
    var pageNo=1;
    var pageSize=30;
    var domain = "http://"+window.location.host;

    //绑定手机搜索按钮
    $('#title').bind('search', function () {
        var title = document.getElementById("title").value;
        if(title == ''){
            window.location.reload();
            return false;
        }
        if(title){window.location.href="../manage/skipItemListPage.do?title="+title;}
    });
    $(function(){
        $(window).scroll(function () {
            if ($(document).height() - $(this).scrollTop() - $(this).height() < 10) {
                get_list();
            }
        });
    });

    $(function () {
        window.onload = function(){
            var images = document.getElementsByName("img_01");
            var _span = document.getElementsByName("span_01");
            var pos = 0;
            var len = images.length;
            setInterval(function(){
                images[pos].style.display = 'none';
                _span[pos].style.cssText = "background: #ff5a28;";
                pos = ++pos == len ? 0 : pos;
                images[pos].style.display = 'inline';
                _span[pos].style.cssText = "background: #b63e1a;";
            },3000);
        };
        get_list();
    })

    function get_list() {
        $.ajax({
            url:""+"/manage/loadMoreItems.do",
            async:false,
            data: {'pageNo':pageNo,'pageSize':pageSize},
            dataType:'json',
            type:"post",
            success:function(data){
                var arrLen = data.length;
                if(arrLen > 0){
                    $.each(data,function(index,item){
                        var couponAmt = 0;
                        if(null != item.coupon_info  && '' != item.coupon_info){
                            var temp = item.coupon_info;
                            var temp1 = temp.replace("满","").replace("元","").replace("元","").split("减");
                            couponAmt = temp1[1];
                        }
                        var createLi = document.createElement("li");
                        createLi.innerHTML+="<a href="+domain+"/manage/tbkItemDetail.do?num_iid="+item.num_iid+'&isCode=1'+">\n" +
                        "\t\t\t\t\t<img src="+item.pict_url+" />\n" +
                        "\t\t\t\t\t<h2>"+item.title+"</h2>\n" +
                        "\t\t\t\t\t<div class='infor'>\n" +
                        "\t\t\t\t\t\t<em size='1\'>现价￥"+item.zk_final_price+"</em>\n" +
                        "\t\t\t\t\t\t<span size='1'>已售￥"+item.volume+"件</span>\n" +
                        "\t\t\t\t\t</div><hr style='BORDER-TOP-STYLE: dotted; color: #ddd;'>" +
                        "<div class='infor1'><em size='1'>券后￥"+(item.zk_final_price-couponAmt).toFixed(2)+"</em>" +
                        "<span size='1'>返现金</span></div>" +
                        "\t\t\t\t</a>"
                        document.getElementById("indexUl").appendChild(createLi);
                    });
                    pageNo++;
                }
            }
        });
    }
</script>
</body>
</html>