<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/page/base/commons.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>${tbkCoupon.title}</title>
		<meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
		<meta name="description" content="美宁欢乐淘" />
		<meta name="keywords" content="美宁欢乐淘" />
		<link rel="stylesheet" href="${contextPath}/css/style.css" type="text/css" />
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
	        <a href="${actionPath}/manage/tbkCoupon.do" class="cate"><img src="${contextPath}/images/return.jpg"/></a>
	        <ul class="detail-btn">
				<li><p style="color: rgb(24, 24, 24); line-height: 0.5rem; text-indent: 0.24rem; font-size: 15px;color:#282828;">商品详情</p></li>
	        </ul>
		</div>
		<div class="h50"></div>
		<div class="banner" style="margin: 5px 10px 10px;">
			<img src="${tbkCoupon.pictUrl}" />
		</div>
		<div class="detail" style="margin-top:2px;">
			<p style="color: rgb(24, 24, 24); line-height: 0.5rem; text-indent: 0.24rem; font-size: 15px;color:#282828;">${tbkCoupon.title}</p>
		</div>
		<div class="detail-content" style="margin-bottom:5px;margin-top:5px;">
			<p style="text-indent: .24rem; color: #666; line-height: .5rem;font-size: 15px;color:#FFCC33;">【淘口令购买】长按框内 > 全选 > 复制</p>
		</div>
        <div class="detail-content" style="border: dashed 1px #FF0000;margin-right:15px;margin-left:15px; margin-bottom:8px;margin-top:5px;">
            <p id="tbkText" style="text-indent: .24rem; color: #FF0000; line-height: .5rem;">复制框内整段文字，打开【手机淘宝】即可【领取优惠券】并购买${tbkCode}</p>
        </div>
		<div class="detail-content" style="margin-right:100px;margin-left:110px; margin-bottom:2px;margin-top:5px;">
			<button id="updateText" class="buttonRed" onclick="cp(document.getElementById('tbkText'))">一键复制</button>
		</div>
        <div class="detail-content">
            <p style="text-indent: .24rem; color: #666; line-height: .5rem;">点击复制后，请打开【手机淘宝】购买！注：若复制失败，请手动复制淘口令。</p>
        </div>
		<div style="text-align: center;">
			<span id="imgMessage" class="buttonRed">图文详情</span>
		</div>
		<div class="detail-content" style="margin-right:5px;margin-left:5px; margin-bottom:1px;margin-top:1px;">
			<c:if test="${not empty imgs}">
				<ul>
					<c:forEach items="${imgs}" var="item" varStatus="tbkCoupon">
						<li>
							<img src="${item}" />
						</li>
					</c:forEach>
				</ul>
			</c:if>
		</div>
		<div class="title">
			<span class="text">更多同款商品</span>
		</div>
		<ul class="salse">
			<c:if test="${not empty tbkCouponList}">
				<c:forEach items="${tbkCouponList}" var="item" varStatus="tbkCouponList">
					<li>
						<a href="${actionPath}/manage/detail?title=${item.title}&couponClickUrl=${item.couponClickUrl}&smallImages=${item.smallImages}&pictUrl=${item.pictUrl}">
							<img src="${item.pictUrl}" />
							<h2>${item.itemDescription}</h2>
							<div class="infor">
								<em size="1">券后:${item.zkFinalPrice}</em>
								<em size="1">已售:${item.volume}</em>
							</div>
						</a>
					</li>
				</c:forEach>
			</c:if>
		</ul>
		<div class="h50"></div>
		<ul class="detail-footer">
			<li>
				<a href="${actionPath}/manage/tbkCoupon.do">
					<img src="${contextPath}/images/index.jpg" />
					<p>首页</p>
				</a>
			</li>

			<li>
				<a href="#">
					<img src="${contextPath}/images/member.jpg" />
					<p>淘口令购买</p>
				</a>
			</li>
		</ul>
	</body>

	<script type="text/javascript">
        function selectText(x) {
            if (document.selection) {
                var range = document.body.createTextRange();//ie
                range.moveToElementText(x);
                range.select();
            } else if (window.getSelection) {
                var selection = window.getSelection();
                var range = document.createRange();
                selection.removeAllRanges();
                range.selectNodeContents(x);
                selection.addRange(range);
            }
            document.getElementById("updateText").innerHTML="复制成功";
            document.getElementById("updateText").className="buttonOlivedrab";
        }
        function cp(x)
        {
            selectText(x);
            document.execCommand("copy");
        }
    </script>
</html>
