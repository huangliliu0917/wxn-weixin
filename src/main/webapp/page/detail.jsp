<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/page/base/commons.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>${tbkitemdetail.title}</title>
    <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <link rel="stylesheet" href="${contextPath}/css/style.css" type="text/css"/>
    <link rel="stylesheet" href="${contextPath}/css/main.css" type="text/css" media="screen" charset="utf-8"/>
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="../page/js/jquery.min.js"></script>
    <script src="../page/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        !function (J) {
            function H() {
                var d = E.getBoundingClientRect().width;
                var e = (d / 7.5 > 100 * B ? 100 * B : (d / 7.5 < 42 ? 42 : d / 7.5));
                E.style.fontSize = e + "px", J.rem = e
            }

            var G, F = J.document, E = F.documentElement, D = F.querySelector('meta[name="viewport"]'), B = 0, A = 0;
            if (D) {
                var y = D.getAttribute("content").match(/initial\-scale=([\d\.]+)/);
                y && (A = parseFloat(y[1]), B = parseInt(1 / A))
            }
            if (!B && !A) {
                var u = (J.navigator.appVersion.match(/android/gi), J.navigator.appVersion.match(/iphone/gi)),
                    t = J.devicePixelRatio;
                B = u ? t >= 3 && (!B || B >= 3) ? 3 : t >= 2 && (!B || B >= 2) ? 2 : 1 : 1, A = 1 / B
            }
            if (E.setAttribute("data-dpr", B), !D) {
                if (D = F.createElement("meta"), D.setAttribute("name", "viewport"), D.setAttribute("content", "initial-scale=" + A + ", maximum-scale=" + A + ", minimum-scale=" + A + ", user-scalable=no"), E.firstElementChild) {
                    E.firstElementChild.appendChild(D)
                } else {
                    var s = F.createElement("div");
                    s.appendChild(D), F.write(s.innerHTML)
                }
            }
            J.addEventListener("resize", function () {
                clearTimeout(G), G = setTimeout(H, 300)
            }, !1), J.addEventListener("pageshow", function (b) {
                b.persisted && (clearTimeout(G), G = setTimeout(H, 300))
            }, !1), H()
        }(window);
        if (typeof(M) == 'undefined' || !M) {
            window.M = {};
        }
    </script>
    <style>
        .div_span{
            position: relative;
            padding: 5px;
        }
        .detail-footer {
            position: fixed;
            width: 100%;
            height: 1rem;
            bottom: -9px;
            left: 0;
            right: 0;
            background: #eee;
            z-index: 11;
        }
    </style>
</head>
<body>
<%--<div class="header">
    <a href="${actionPath}/manage/tbkCoupon.do" class="cate"><img src="${contextPath}/images/return.jpg"/></a>
    <ul class="detail-btn">
        <li>
            <p style="color: rgb(24, 24, 24); line-height: 0.5rem; text-indent: 0.24rem; font-size: 15px;color:#282828;">
                商品详情</p></li>
    </ul>
</div>--%>
<div class="nbleft" style="position: fixed; top: 15px; z-index: 99999; width: 100%; max-width: 53.75px; margin: 0px auto; left: 0px; right: 376.25px;">
    <a href="javascript:void(0);" onclick="window.location.href=document.referrer;">
        <img src="../page/images/return.png" style="width:35px;float:left;margin-left:15px;">
    </a>
</div>
<div class="nbright" style="position: fixed; top: 15px; z-index: 99999; width: 100%; max-width: 53.75px; margin: 0px auto; left: 300px; right: 0px;">
    <a href="${actionPath}/manage/index.do">
        <img src="../page/images/rehome.png" style="width:35px;float:right;margin-right:15px;">
    </a>
</div>
<div class="h50"></div>
<div class="banner" style="margin-top: -57px;">
    <img id="loadUrl" src="${tbkitemdetail.pictUrl}"/>
</div>
<div class="detail" style="margin-top:2px;">
    <p style="color: rgb(24, 24, 24); line-height: 0.5rem; text-indent: 0.24rem; font-size: 15px;color:#282828;">${tbkitemdetail.title}</p>
</div>
<div class="detail-content" style="margin-bottom:5px;margin-top:5px;">
    <p style="text-indent: .24rem; color: #666; line-height: .5rem;font-size: 15px;color:#FFCC33;">【淘口令购买】长按框内 > 全选 >
        复制</p>
</div>
<div class="detail-content"
     style="border: dashed 1px #FF0000;margin-right:15px;margin-left:15px; margin-bottom:8px;margin-top:5px;">
    <p id="tbkText" style="text-indent: .24rem; color: #FF0000; line-height: .5rem;">
        复制框内整段文字，打开【手机淘宝】即可【领取优惠券】并购买${token}</p>
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
                    <img src="${item}"/>
                </li>
            </c:forEach>
        </ul>
    </c:if>
</div>
<div class="title">
    <span class="text">更多同款商品</span>
</div>
<ul class="salse">
    <c:if test="${not empty tbkItems}">
        <c:forEach items="${tbkItems}" var="item" varStatus="tbkItems">
            <li>
                <a href="${actionPath}/manage/detail?">
                    <img src="${item.pictUrl}"/>
                    <h2>${item.title}</h2>
                    <div class="infor">
                        <em size="1">折后:${item.zkPrice}</em>
                        <em size="1">已售:${item.totalNum}</em>
                    </div>
                </a>
            </li>
        </c:forEach>
    </c:if>
</ul>
<!-- 模态框（Modal） -->
<div style="text-align:center;"class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div style="width:320px;height:200px;margin: auto;margin-top: 100px;" class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <div class="header-img" style="margin-left: 108px;margin-top: -50px;border-radius: 50%;width: 65px;height: 65px;box-shadow: 3px 4px 6px rgba(34, 25, 25, 0.2);">
                    <img id="imgurl1" style="margin:0 auto;border-radius:50%;width:65px;height:65px;display:inline-block;"/>
                </div>
            </div>
            <div style="margin:auto;border:3px dashed #e35132;width:300px;height:80px;" class="modal-body">
                <p id="modalText" style="color:#e35132;"></p>
            </div>
            <div class="modal-footer" style="text-align: center">
                <button id="modelButto" onclick="cp1(document.getElementById('modalText'))" type="button" class="btn btn-primary">
                    一键复制
                </button>
            </div>
            <div class="taokaobox"><a href="javascript:;" class="taokao taokaocopy"><img src="../page/images/androidcopy.png" style="width:100%;max-width:650px"></a></div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<div class="h50"></div>
<ul class="detail-footer">
    <li>
        <a href="${actionPath}/manage/index.do">
            <img src="${contextPath}/images/index.jpg"/>
            <p>首页</p>
        </a>
    </li>
    <li>
        <a data-toggle="modal" data-target="#myModal" >
            <img src="${contextPath}/images/member.jpg"/>
            <p>淘口令购买</p>
        </a>
    </li>
</ul>
</body>

<script type="text/javascript">
    //调用模态框时动态传入参数
    $('#myModal').on('show.bs.modal', function () {
        var imgUrl = document.getElementById("loadUrl").src;
        document.getElementById("imgurl1").src=imgUrl;

        document.getElementById("modalText").innerHTML = document.getElementById("tbkText").innerHTML;
        // 执行一些动作...
        document.getElementById("modelButto").className = "modelButtonRed";
    })

    function selectText1(x) {
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
        document.getElementById("modelButto").innerHTML = "复制成功";
        document.getElementById("modelButto").className = "modelButtonOlivedrab";
    }

    function cp1(x) {
        selectText1(x);
        document.execCommand("copy");
    }



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
        document.getElementById("updateText").innerHTML = "复制成功";
        document.getElementById("updateText").className = "buttonOlivedrab";
    }

    function cp(x) {
        selectText(x);
        document.execCommand("copy");
    }
</script>
</html>
