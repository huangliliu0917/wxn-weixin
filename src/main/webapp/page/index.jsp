<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/page/base/commons.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>美宁欢乐淘</title>
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
    </style>
</head>
<body>
<div class="header">
	<a href="index.jsp" class="logo"><img src="${contextPath}/images/logo.jpg"/></a>
	<div class="search">
		<input  type="search" name="title" id="title" placeholder="请输入您需要的商品" />
		<a href="${actionPath}/manage/queryTbkCoupon.do"><img src="${contextPath}/images/search.jpg"/></a>
	</div>
	<a href="/manage/queryTbkCoupons.do" class="sao">
		<img src="${contextPath}/images/feilei.jpg"/>
		<p>分类</p>
	</a>
</div>
<div class="h50"></div>
<div class="banner">
	<a href=""><img src="${contextPath}/images/banner.jpg"/></a>
</div>
<ul class="nav">
	<li>
		<a href="${actionPath}/manage/tbkItemsByImg.do?itemType=1">
			<img src="${contextPath}/images/girl.png" />
			<p>女装</p>
		</a>
	</li>
	<li>
		<a href="${actionPath}/manage/tbkItemsByImg.do?itemType=2">
			<img src="${contextPath}/images/boy.png" />
			<p>男装</p>
		</a>
	</li>
	<li>
		<a href="${actionPath}/manage/tbkItemsByImg.do?itemType=3">
			<img src="${contextPath}/images/4.png" />
			<p>内衣</p>
		</a>
	</li>
    <li>
        <a href="${actionPath}/manage/tbkItemsByImg.do?itemType=4">
            <img src="${contextPath}/images/5.png" />
            <p>母婴</p>
        </a>
    </li>
	<li>
		<a href="${actionPath}/manage/tbkItemsByImg.do?itemType=5">
			<img src="${contextPath}/images/6.png" />
			<p>化妆品</p>
		</a>
	</li>
    <li>
        <a href="${actionPath}/manage/tbkItemsByImg.do?itemType=6">
            <img src="${contextPath}/images/7.png" />
            <p>居家</p>
        </a>
    </li>
    <li>
        <a href="${actionPath}/manage/tbkItemsByImg.do?itemType=7">
            <img src="${contextPath}/images/3.png" />
            <p>鞋包</p>
        </a>
    </li>
    <li>
        <a href="${actionPath}/manage/tbkItemsByImg.do?itemType=8">
            <img src="${contextPath}/images/10.png" />
            <p>配饰</p>
        </a>
    </li>
    <li>
        <a href="${actionPath}/manage/tbkItemsByImg.do?itemType=9">
            <img src="${contextPath}/images/9.png" />
            <p>车品</p>
        </a>
    </li>
    <li>
        <a href="${actionPath}/manage/superQuery.do">
            <img src="${contextPath}/images/12.png" />
            <p>超级搜索</p>
        </a>
    </li>
</ul>
<div class="title">
	<span class="text">精品推荐</span>
</div>
<ul class="salse" id="indexUl">
	<c:if test="${not empty tbkItems}">
		<c:forEach items="${tbkItems}" var="item" varStatus="tbkItems">
			<li>
				<a href="${actionPath}/manage/tbkItemDetail.do?itemId=${item.itemId}">
					<img src="${item.pictUrl}" style="height: 150px"/>
					<h2>${item.title}</h2>
					<div class="infor">
						<em size="1">券后:${item.zkFinalPrice}</em>
						<span size="1">已售:${item.volume}</span>
					</div>
				</a>
			</li>
		</c:forEach>
	</c:if>
</ul>
<div class="flush"></div>
<div class="h50"></div>
<ul class="footer">
	<li>
		<a href="${actionPath}/manage/tbkItems.do">
			<img src="${contextPath}/images/index.jpg" />
			<p>首页</p>
		</a>
	</li>
	<li>
		<a href="${actionPath}/manage/tbkItemsByImg.do?operType=2">
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
			<p>个人中心</p>
		</a>
	</li>
</ul>
<!-- jQuery1.7以上 或者 Zepto 二选一，不要同时都引用 -->
<script src="../page/js/jquery.min.js"></script>
<script src="../page/js/dropload.js"></script>
<script>
    var pageNo=2;
    var pageSize=50;
    var domain = "http://"+window.location.host;

    //绑定手机搜索按钮
    $('#title').bind('search', function () {
        var title = document.getElementById("title").value;
        window.location.href=domain+"/manage/tbkItems.do?title="+title+"&pageNo="+pageNo+"&pageSize="+pageSize;
    });

    $(function(){
        // dropload
        $('.flush').dropload({
            scrollArea : window,
            loadDownFn : function(me){
                pageNo++;
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
                                var createLi = document.createElement("li");
                                createLi.innerHTML+="<a href="+domain+"/manage/tbkItemDetail.do?itemId="+item.itemId+">\n" +
                                    "\t\t\t\t\t<img src="+item.pictUrl+" />\n" +
                                    "\t\t\t\t\t<h2>"+item.title+"</h2>\n" +
                                    "\t\t\t\t\t<div class='infor'>\n" +
                                    "\t\t\t\t\t\t<em size='1\'>券后:"+item.zkFinalPrice+"</em>\n" +
                                    "\t\t\t\t\t\t<span size='1'>已售:"+item.volume+"</span>\n" +
                                    "\t\t\t\t\t</div>\n" +
                                    "\t\t\t\t</a>"
                                document.getElementById("indexUl").appendChild(createLi);
                            });
						}else{
                            // 锁定
                            me.lock();
                            // 无数据
                            me.noData();
                        }
						me.resetload();
                    },
                    error: function(xhr, type){
                        // 即使加载出错，也得重置
                        me.resetload();
                    }
                });
            }
        });
    });
</script>
</body>
</html>