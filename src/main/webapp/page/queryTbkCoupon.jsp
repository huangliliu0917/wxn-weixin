<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/page/base/commons.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<title>美宁欢乐淘</title>
	<meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
	<meta name="description" content="美宁欢乐淘" />
	<meta name="keywords" content="美宁欢乐淘" />
	<link rel="stylesheet" href="${contextPath}/css/style.css" type="text/css" />
	<script src="${contextPath}/js/jquery-1.3.2.min.js" type="text/javascript"></script>
	<link rel="stylesheet" href="${contextPath}/css/main.css" type="text/css" media="screen" charset="utf-8" />
	<script type="text/javascript">
        !function(J){function H(){var d=E.getBoundingClientRect().width;var e=(d/7.5>100*B?100*B:(d/7.5<42?42:d/7.5));E.style.fontSize=e+"px",J.rem=e}var G,F=J.document,E=F.documentElement,D=F.querySelector('meta[name="viewport"]'),B=0,A=0;if(D){var y=D.getAttribute("content").match(/initial\-scale=([\d\.]+)/);y&&(A=parseFloat(y[1]),B=parseInt(1/A))}if(!B&&!A){var u=(J.navigator.appVersion.match(/android/gi),J.navigator.appVersion.match(/iphone/gi)),t=J.devicePixelRatio;B=u?t>=3&&(!B||B>=3)?3:t>=2&&(!B||B>=2)?2:1:1,A=1/B}if(E.setAttribute("data-dpr",B),!D){if(D=F.createElement("meta"),D.setAttribute("name","viewport"),D.setAttribute("content","initial-scale="+A+", maximum-scale="+A+", minimum-scale="+A+", user-scalable=no"),E.firstElementChild){E.firstElementChild.appendChild(D)}else{var s=F.createElement("div");s.appendChild(D),F.write(s.innerHTML)}}J.addEventListener("resize",function(){clearTimeout(G),G=setTimeout(H,300)},!1),J.addEventListener("pageshow",function(b){b.persisted&&(clearTimeout(G),G=setTimeout(H,300))},!1),H()}(window);
        if (typeof(M) == 'undefined' || !M){
            window.M = {};
        }
	</script>
</head>
<body>
<div class="header">
	<a href="index.jsp" class="logo"><img src="${contextPath}/images/logo.jpg"/></a>
	<div class="search">
		<input  type="search" id="couponName" name="couponName" id="queryCoupons" placeholder="请输入您需要的商品" />
		<a href="${actionPath}/manage/queryTbkCoupon.do"><img src="${contextPath}/images/search.jpg"/></a>
	</div>
	<a href="/manage/queryTbkCoupons.do" class="sao">
		<img src="${contextPath}/images/feilei.jpg"/>
		<p>分类</p>
	</a>
</div>
<div class="h50"></div>
<ul class="salse" id="indexUl">
	<c:if test="${not empty tbkCoupon}">
		<c:forEach items="${tbkCoupon}" var="item" varStatus="tbkCoupon">
			<li>
				<a href="${actionPath}/manage/detail?title=${item.title}&couponClickUrl=${item.couponClickUrl}&smallImages=${item.smallImages}&pictUrl=${item.pictUrl}">
					<img src="${item.pictUrl}" />
					<h2>${item.itemDescription}</h2>
					<div class="infor">
						<em size="1">券后:${item.zkFinalPrice}</em>
						<span size="1">已售:${item.volume}</span>
					</div>
				</a>
			</li>
		</c:forEach>
	</c:if>
</ul>
<div style="text-align: center;margin-top: 2px; margin-bottom: 10px;">
	<button id="loadMoerItem" class="buttonRed" onclick="loadMoerCoupon()">点击获取更多商品</button>
</div>
<div class="h50"></div>
<ul class="footer">
	<li>
		<a href="${actionPath}/manage/tbkCoupon.do">
			<img src="${contextPath}/images/index.jpg" />
			<p>首页</p>
		</a>
	</li>
	<li>
		<a href="${actionPath}/manage/tbkCoupon.do">
			<img src="${contextPath}/images/red99.jpg" />
			<p>9.9专区</p>
		</a>
	</li>
	<li>
		<a href="${actionPath}/manage/tbkCoupon.do">
			<img src="${contextPath}/images/icon4.jpg" />
			<p>人气榜</p>
		</a>
	</li>
	<li>
		<a href="#">
			<img src="${contextPath}/images/member.jpg" />
			<p>个人中心</p>
		</a>
	</li>
</ul>
</body>
<script type="text/javascript">
    var pageNo=2;
    var domain = "http://"+window.location.host;

    function loadMoerCoupon() {
        var couponName = document.getElementById("couponName").value;
        $.ajax({
            url:""+"/manage/queryTbkCoupons.do",
            async:false,
            data: {'pageNo':pageNo,'couponName':couponName},
            dataType:'json',
            type:"post",
            success:function(data){
                $.each(data,function(index,item){
                    var createLi = document.createElement("li");
                    createLi.innerHTML+="<a href="+domain+"/manage/detail?title="+item.title+"&couponClickUrl="+item.couponClickUrl+"&smallImages="+item.smallImages+"&pictUrl="+item.pictUrl+">\n" +
                        "\t\t\t\t\t<img src="+item.pictUrl+" />\n" +
                        "\t\t\t\t\t<h2>"+item.itemDescription+"</h2>\n" +
                        "\t\t\t\t\t<div class='infor'>\n" +
                        "\t\t\t\t\t\t<em size='1\'>券后:"+item.zkFinalPrice+"</em>\n" +
                        "\t\t\t\t\t\t<span size='1'>已售:"+item.volume+"</span>\n" +
                        "\t\t\t\t\t</div>\n" +
                        "\t\t\t\t</a>"
                    document.getElementById("indexUl").appendChild(createLi);
                });
            }
        })
        pageNo++;
    }
</script>
</html>