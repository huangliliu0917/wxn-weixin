<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/page/base/commons.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8" />
	<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
	<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache">
	<META HTTP-EQUIV="Expires" CONTENT="0">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0" />
	<meta name="viewport" content="initial-scale=1, width=device-width, maximum-scale=1, user-scalable=no" />
	<meta name="viewport" content="initial-scale=1.0,user-scalable=no,maximum-scale=1" media="(device-height: 568px)" />
	<meta name="apple-mobile-web-app-capable" content="yes" />
	<meta name="apple-touch-fullscreen" content="yes" />
	<meta name="full-screen" content="yes" />
	<meta name="apple-mobile-web-app-status-bar-style" content="black" />
	<meta name="format-detection" content="telephone=no" />
	<meta name="format-detection" content="address=no" />

	<meta name="screen-orientation" content="portrait">
	<meta name="full-screen" content="yes">
	<meta name="browsermode" content="application">
	<meta name="x5-orientation" content="portrait">
	<meta name="x5-fullscreen" content="true">
	<meta name="x5-page-mode" content="app">

	<link href="../page/itemList/style_v3_2.css" rel="stylesheet" type="text/css" />
	<link href="../page/itemList/jp.bag.css" rel="stylesheet" type="text/css" />
	<link href="../page/itemList/jp.plus.css" rel="stylesheet" type="text/css" />
	<link href="../page/itemList/iconfont.css" rel="stylesheet" type="text/css" />
	<link href="../page/itemList/nbnew.css" rel="stylesheet" type="text/css" />
	<link type="text/css" rel="stylesheet" href="../page/itemList/alert.css" />
	<link href="../page/itemList/animate.min.css" rel="stylesheet" type="text/css" />
	<style>
		.nbplus_yq{
			bottom:90px;width:100%;position:absolute;text-align:center;color:#fff;background:rgba(0,0,0,.4);font-size:12px;
		}
		.top-search {
			position:absolute;
			left:0;
			right:0;
			top:0;
			z-index:1000;
			background:rgba(255,255,255,0.0);
		}
		.search-box {
			position:relative;
		}
		.search-input {
			box-sizing:border-box;
			width:90%;
			height:30px;
			line-height:30px;
			margin:10px auto;
			padding:0 10px;
			background:rgba(255,255,255,0.8);
			border-radius:30px;
			font-size:14px;
			color:#999;
		}
		.search-input img{
			margin-left:5px;
		}
		.search-input span {
			margin-left:16px;
		}
		.topinput{
			border:0px;background-color:transparent;width:85%;height:30px;line-height:30px;vertical-align:middle;margin-left:6px;margin-bottom:5px;
			font-size:14px;
			color:#666;
		}
		.topbtn{
			border:0px;background-color:transparent;
		}
		.search-input button{
			border: 0 none;
			background: none;
			cursor: pointer;
			width: 30px;
			height: 30px;
			background: rgba(255, 255, 255, 0);
			float:right;
		}
		.suggest.dropdown .dropdown-menu {
			display: block;
			width: auto;
			min-width:16.5rem;
			max-width:22rem;
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
			font-size: 14px;

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
		/**/
		.suggest2 .dropdown2 .dropdown-menu2 {
			display: block;
			width: auto;
			min-width:16.5rem;
			max-width:22rem;
			margin-top: 0;
			padding: 0px 0px 0px 10px;
		}
		.suggest2 .dropdown2 .dropdown-menu2 {
			max-height: 330px;
			box-shadow: 0 2px 4px 0 rgba(32,32,64,.16);
		}
		.dropdown2 .dropdown-menu2 {
			border: 1px solid #d3d3db;
			position: absolute;
			top: 100%;
			margin-top: 10px;
			left: 0;
			z-index: 1000;
			display: none;
			width: 100%;
			max-width:305px;
			max-height: 330px;
			font-size: 14px;

			background-color: #fff;
			-webkit-background-clip: padding-box;
			background-clip: padding-box;
			border-radius: 0px;
			box-sizing: border-box;
			overflow: auto;
			-moz-box-shadow: 0 1px 2px 0 rgba(32,32,64,.16);
			box-shadow: 0 1px 2px 0 rgba(32,32,64,.16);
		}
		.dropdown2 .dropdown-menu2, .table-container .scroll-fix .table {
			-webkit-box-shadow: 0 1px 2px 0 rgba(32,32,64,.16);
			-ms-box-shadow: 0 1px 2px 0 rgba(32,32,64,.16);
			-o-box-shadow: 0 1px 2px 0 rgba(32,32,64,.16);
		}
		.dropdown2 {
			display: inline-block;
			position: fixed;
			width:100%;
			max-width:305px;
			top:30px;
			left:50px;
		}

		.highlight {
			color: #f50;
		}

		.dropdown-menu2 a {
			color: #666;
			height: 30px;
			line-height: 30px;
			font-size: 14px;
		}
	</style>
	<style>
		.bigautocomplete-layout{display:none;background-color:#FFFFFF;border:0px solid #BCBCBC;position:fixed;z-index:99999;max-height:auto;overflow-x:hidden;overflow-y:auto;height:100%;max-width:640px;margin:auto;}
		.bigautocomplete-layout table{border-collapse:collapse;border-spacing:0;background:none repeat scroll 0 0 #FFFFFF;width:100%;cursor:default;}
		.bigautocomplete-layout table tr{background:none repeat scroll 0 0 #FFFFFF;}
		.bigautocomplete-layout .ct{background:none repeat scroll 0 0 #D2DEE8 !important;}
		.bigautocomplete-layout div{word-wrap:break-word;word-break:break-all;padding:5px 5px;border-bottom:1px dashed #000;}
		textarea{border:0;}
		.nbplus_thisskin{background-color: lightgrey;}
		.nbplus_yq{background-color:rgba(0,0,0,0.4);color:#fff;text-align:center;font-size:12px;position:absolute;right:0px;bottom:0px;width:120px;height:20px;line-height:18px}
		#nb-menu li.active .menu-inside i{
			color: #FE4E4E;      }

		#nb-menu li.active .font-div {
			color: #FE4E4E !important;        }
		@-webkit-keyframes fadeInOut {
			0% {
				opacity:0.3;
			}
			25% {
				opacity:0.6;
			}
			50% {
				opacity: 0.8;
			}
			75% {
				opacity:1;
			}
		}
		.anim_fade_image {
			-webkit-animation-name: fadeInOut;
			-webkit-animation-timing-function: ease-in-out;
			-webkit-animation-iteration-count: 1;
			-webkit-animation-duration: 1s;
			-webkit-animation-direction: alternate;
			animation-iteration-count:1;
		}
	</style>
	<title id="title">优惠券查询中心 -
        <c:if test="${tbkItem.itemType eq '1'}">女装</c:if>
        <c:if test="${tbkItem.itemType eq '2'}">男装</c:if>
        <c:if test="${tbkItem.itemType eq '3'}">内衣</c:if>
        <c:if test="${tbkItem.itemType eq '4'}">母婴</c:if>
        <c:if test="${tbkItem.itemType eq '5'}">化妆品</c:if>
        <c:if test="${tbkItem.itemType eq '6'}">居家</c:if>
        <c:if test="${tbkItem.itemType eq '7'}">鞋包</c:if>
        <c:if test="${tbkItem.itemType eq '8'}">配饰</c:if>
        <c:if test="${tbkItem.itemType eq '9'}">车品</c:if>
        <c:if test="${tbkItem.itemType eq '10'}">其它</c:if>
    </title>
    <input type="hidden" id="titleId" name="${tbkItem.itemType}"/>
	<meta name="keywords" content="超级内部优惠券中心，每天超低价惊喜等着你！">
	<meta name="description" content="超级内部优惠券中心，每天超低价惊喜等着你！">
	<script src="../page/itemList/jquery.min.js"></script>
	<script src="../page/itemList/jq.nb.main.js?v=2017"></script>
	<script src="../page/itemList/jq.nb.plus.js"></script>
	<script type="text/javascript" src="../page/itemList/clipboard.min.js"></script>

	<script src="../page/itemList/jquery.complete.js"></script>
	<script type="text/javascript">
        $(function(){

            $("#sokey2").bigAutocomplete({
                url: "./index.php?i=4&c=entry&do=search_ajax_auto&m=bsht_tbk",
                callback:function(data){
                }
            });

            $("#sokey").bigAutocomplete({
                url: "./index.php?i=4&c=entry&do=search_ajax_auto&m=bsht_tbk",
                callback:function(data){
                }
            });
        });
	</script>
	<script>
        function closenb(){
            $('.bigautocomplete-layout').fadeOut(300);
        }
	</script>
	<!--h fix-->
	<script>
        var t = setInterval(function(){
            $('#search').css('width',$('.app').width());
            $('#xl_001').css('width',$('.app').width());
            $('#xl_002').css('width',$('.app').width());
            $('#xl_003').css('width',$('.app').width());
            $('#Fill_006').css('width',$('.app').width());
            $("#sokey").css('width',$('.app').width()*0.75);
            $(".word_div_001").css('border-bottom-width','0px');
            $(".word_div_001").css('padding-bottom','5px');
            $('.topads').css('width',$('.app').width());
            $('.fq-discount a').css('font-size','13px');
        },40);
	</script>
	<style>
		.openview {
			height: 100%;
		}

		.closeview {
			top: 100%;
			transition: top 0.3s;
			-webkit-transition: all 0.3s;
		}
		.close {
			background: url('../page/images/iclose.png') no-repeat center/30px;
			opacity: 0.8;
			display:none;
		}

		.loadingbar {
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

		.loading2 {
			width: 110px;
			height: 80px;
			opacity: 0.6;
			font-size: 12px;
			color: #fff;
			background: #000;
			text-align: center;
			border-radius: 5px;
			overflow: hidden;
			display: -webkit-box;
			-webkit-box-pack: center;
			-webkit-box-align: center;
			margin: 0px auto;
		}
		.nbnet {
			width: 7.5rem;

			position: relative;
			z-index: 1;
			-webkit-overflow-scrolling: touch;
			overflow-y: scroll;
			z-index:10000;
		}

	</style>
	<script type="text/javascript" src="../page/itemList/layer/layer.js"></script>
	<style type="text/css">*{margin:0; padding:0;}
	a{text-decoration: none;}
	img{max-width: 100%; height: auto;}
	#weixin-tip{display: none; position: fixed; left:0; top:0; bottom:0; background: rgba(0,0,0,0.8); filter:alpha(opacity=80);  height: 100%; width: 100%; z-index: 10000000;}
	#weixin-tip p{text-align: center; margin-top: 10%; padding:0 5%;}
	#weixin-tip .close{color:#fff;padding:5px;font:bold 20px/24px simsun;text-shadow:0 1px 0 #ddd;position:absolute;top:0;left:5%;}
	#weixin-tt.quanpost {position: fixed; left:0; top:0; bottom:0; background: rgba(0,0,0,0.8); filter:alpha(opacity=80);  height: 100%; width: 100%; z-index: 10000000;}
	#weixin-tt .close{color:#fff;padding:5px;font:bold 20px/24px simsun;text-shadow:0 1px 0 #ddd;position:absolute;top:0;right:5%;}
	#fixtop {max-width:640px;}
	</style>

	<script src="../page/itemList/jweixin-1.1.0.js"></script>
	<script type="text/javascript">

        if(navigator.appName == 'Microsoft Internet Explorer'){
            if(navigator.userAgent.indexOf("MSIE 5.0")>0 || navigator.userAgent.indexOf("MSIE 6.0")>0 || navigator.userAgent.indexOf("MSIE 7.0")>0) {
                alert('您使用的 IE 浏览器版本过低, 推荐使用 Chrome 浏览器或 IE8 及以上版本浏览器.');
            }
        }
        window.sysinfo = {
            'uniacid': '4',		'acid': '4',				'siteroot': 'http://wx.sskk88.cn/',
            'siteurl': 'http://wx.sskk88.cn/app/index.php?i=4&c=entry&cate_id=78&do=list_all&m=bsht_tbk',
            'attachurl': 'http://wx.sskk88.cn/attachment/',
            'attachurl_local': 'http://wx.sskk88.cn/attachment/',
            'attachurl_remote': '',
            'MODULE_URL': 'http://wx.sskk88.cn/addons/bsht_tbk/',		'cookie' : {'pre': '2d72_'}
        };
        // jssdk config 对象
        jssdkconfig = null || {};
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
            'showAllNonBaseMenuItem',
            'translateVoice',
            'startRecord',
            'stopRecord',
            'onRecordEnd',
            'playVoice',
            'pauseVoice',
            'stopVoice',
            'uploadVoice',
            'downloadVoice',
            'chooseImage',
            'previewImage',
            'uploadImage',
            'downloadImage',
            'getNetworkType',
            'openLocation',
            'getLocation',
            'hideOptionMenu',
            'showOptionMenu',
            'closeWindow',
            'scanQRCode',
            'chooseWXPay',
            'openProductSpecificView',
            'addCard',
            'chooseCard',
            'openCard',
            'openAddress'
        ];
	</script>
	<style>

		.word_input33{
			width: 64%;
			background-size: 100% 14px;
			float: left;
			background-color: #EEEEEE;
			height: 30px;
			margin-top: 7px;
			border-top-width: 0px;
			border-right-width: 0px;
			border-bottom-width: 0px;
			border-left-width: 0px;
			background-image: url('');
			background-repeat: no-repeat;
			background-size: 143px 14px;
			background-position: center center;
			text-indent: 1em;
		}

		.word_input333{
			width: 75%;
			background-size: 100% 14px;
			float: left;
			background-color: #fff;
			height: 30px;
			margin-top: 8px;
			border-top-width: 0px;
			border-right-width: 0px;
			border-bottom-width: 0px;
			border-left-width: 0px;
			background-image: url('../page/images/spike_0299.png');
			background-repeat: no-repeat;
			background-size: 143px 14px;
			background-position: center center;
			text-indent: 1em;
		}

		.word_input3333{
			width: 75%;
			background-size: 100% 14px;
			float: left;
			background-color: #fff;
			height: 30px;
			margin-top: 8px;
			border-top-width: 0px;
			border-right-width: 0px;
			border-bottom-width: 0px;
			border-left-width: 0px;
			background-image: url('');
			background-repeat: no-repeat;
			background-size: 143px 14px;
			background-position: center center;
			text-indent: 1em;
		}

		.div_Return_0011 {
			margin-top: 6px;
			margin-right: 3%;
			margin-left: 1%;
			height: 35px;
			width: 2%;
			background-image: url('../page/images/spike_0277.png');
			background-repeat: no-repeat;
			background-size: 8px 15px;
			float: left;
			padding-right: 3%;
			padding-left: 3%;
			background-position: center;
		}
		.div_Return_0022 {
			height: 19px;
			width: 21px;
			background-image: url('../page/images/spike_0288.png');
			background-repeat: no-repeat;
			background-size: 100% 100%;
			float: left;
			margin-left: 3%;
			margin-right: 3%;
			margin-top: 13px;
		}

		.div_Return_0022_so {
			height: 19px;
			width: 21px;
			background-image: url('../page/images/spike_0288_so.png');
			background-repeat: no-repeat;
			background-size: 100% 100%;
			float: left;
			margin-left: 3%;
			margin-right: 3%;
			margin-top: 13px;
		}
		.xl_div_003_22 {
			float: right;
			background-image: url('../page/images/spike_035.png');
			background-repeat: no-repeat;
			background-size: 51px 37px;
			height: 37px;
			width: 51px;
			margin-top: 9px;
		}
	</style>
</head>
<body>

<link type="text/css" rel="stylesheet" href="../page/itemList/global.css" />

<div id="nknet" class="nknet">

	<div class="loadingbar" style="display:none">
		<div class='loading2'><img src='../page/images/loading2.gif' style="width: 45px;height: 45px;"><br>加载中，请稍后<br></div>
	</div>
	<div class="main" id="mainall">
		<div class="app-other">
			<ul>
				<li class="search">
					<div id="search-box">
						<form id="search-form" action="./index.php" method="get">
							<input type="hidden" name="c" value="entry" />
							<input type="hidden" name="i" value="4" />
							<input type="hidden" name="m" value="bsht_tbk" />
							<input type="hidden" name="do" value="search" />
							<div class="box-search">
								<input type="text" id="keywords" name="keywords" x-webkit-speech="" placeholder="搜索商品" autocomplete="off" value="" />
								<a href="javascript:;" class="del"><img src="../page/images/del.png" /></a>
							</div>
							<button id="search-submit" type="submit"><img src="../page/images/search.png" /></button>
						</form>
					</div>
				</li>
				<li class="normal "><a href="./index.php?i=4&c=entry&do=index&m=bsht_tbk"> 首页</a></li>
				<li class="normal active"><a class="menua" href="./index.php?i=4&c=entry&cate_id=78&do=list_all&m=bsht_tbk">女装</a></li>
				<li class="normal "><a class="menua" href="./index.php?i=4&c=entry&cate_id=79&do=list_all&m=bsht_tbk">男装</a></li>
				<li class="normal "><a class="menua" href="./index.php?i=4&c=entry&cate_id=80&do=list_all&m=bsht_tbk">内衣</a></li>
				<li class="normal "><a class="menua" href="./index.php?i=4&c=entry&cate_id=81&do=list_all&m=bsht_tbk">母婴</a></li>
				<li class="normal "><a class="menua" href="./index.php?i=4&c=entry&cate_id=82&do=list_all&m=bsht_tbk">化妆品</a></li>
				<li class="normal "><a class="menua" href="./index.php?i=4&c=entry&cate_id=83&do=list_all&m=bsht_tbk">居家</a></li>
				<li class="normal "><a class="menua" href="./index.php?i=4&c=entry&cate_id=84&do=list_all&m=bsht_tbk">鞋包配饰</a></li>
				<li class="normal "><a class="menua" href="./index.php?i=4&c=entry&cate_id=85&do=list_all&m=bsht_tbk">美食</a></li>
				<li class="normal "><a class="menua" href="./index.php?i=4&c=entry&cate_id=86&do=list_all&m=bsht_tbk">车品</a></li>
				<li class="normal "><a class="menua" href="./index.php?i=4&c=entry&cate_id=87&do=list_all&m=bsht_tbk">数码家电</a></li>
				<li class="normal "><a class="menua" href="./index.php?i=4&c=entry&cate_id=88&do=list_all&m=bsht_tbk">其它</a></li>
			</ul>
			<%--<p class="menuleft">
				<a href="./index.php?i=4&c=entry&do=uc&m=bsht_tbk"><em class="icon-user"></em><br />个人中心</a>
				<a href="./index.php?i=4&c=entry&do=show_dan&m=bsht_tbk"><em class="icon-about"></em><br />晒单广场</a>
			</p>--%>
		</div>

		<div class="app">
			<div class="word_div_001 sotop2" id="search-box" style="border-bottom-width: 0px; padding-bottom: 5px;background:-webkit-linear-gradient(left, #FE4E4E, #FF7373);">
				<div class="div_Return_0011" onclick="javascript:history.go(-1);return false;"></div>
				<form id="search-form" action="./index.php" method="get">
					<div class="buton" id="word_Button_0022" onclick="goso();" style="width: 40px;"></div>
					<input type="hidden" name="c" value="entry" />
					<input type="hidden" name="i" value="4" />
					<input type="hidden" name="m" value="bsht_tbk" />
					<input type="hidden" name="do" value="search" />
					<input type="hidden" name="shopid" value="0" />
					<input type="text" class="word_input333 sokey" value="" placeholder="" onfocus="this.className = 'word_input3333';document.getElementById('div_Return_0022').style.display='block';document.getElementById('div_Return_002').style.display='none';" onblur="if(this.value==''){this.className = 'word_input333';document.getElementById('div_Return_0022').style.display='none';document.getElementById('div_Return_002').style.display='block';}else{}" onkeydown="if(event.keyCode==13) {}" id="sokey" name="keywords" autocomplete="off">
				</form>
				<div class="div_Return_0022" id="div_Return_002" onclick="javascript:window.location.href='./index.php?i=4&c=entry&shopid=0&do=index&m=bsht_tbk';"></div>

				<div class="div_Return_0022_so btndh" id="div_Return_0022" onclick="goso();" style="display:none"></div>
			</div>
			<style>
				.goods_nav {
					margin-top: 0px;
					background-color: #fff;
				}
				.goods_nav ul {
					padding-bottom: 0px;
					background-color: #eeecef;
					overflow: hidden;
				}
				.goods_nav li {
					background-color: #fff;
					float: left;
					list-style: none;
					width:25%;
					display:inline;
				}
				.goods_nav a {
					position: relative;
					display: inline-block;
					width: 100%;
					height: 38px;
					line-height: 38px;
					text-align: center;
					/*font-size: 22px;*/
					font-size: 14px;
					text-decoration: none;
					color: #2a2a2a;
				}
				.goods_nav li.selected a:before {
					content: "";
					position: absolute;
					left: 12%;
					bottom: 0px;
					margin-left: -11px;
					display: inline-block;
					width: 100%;
					height: 4px;
					background: url('../page/images/top_img_on.jpg') no-repeat;
					background-position: center;
				}
			</style>
			<div class="goods_nav">
				<ul>
					<li class="selected topli" onclick="topck('top_moren');" id="topmoren">
						<a href="javascript:">综合</a>
					</li>
					<li class="topli" onclick="topck('top_ishot');" id="topishot">
						<a href="javascript:">销量</a>
					</li>
					<li class="topli" onclick="topck('top_ishit');" id="topishit">
						<a href="javascript:">优惠</a>
					</li>
					<li class="topli" onclick="topck('top_isfee');" id="topisfee">
						<a href="javascript:">价格</a>
					</li>
				</ul>
			</div>
			<script>
                function topck(name){
                    alert("a")
                    window.localStorage.removeItem("min_id_last");
                    var divid = name.replace('_','');
                    var divdat = $('#'+name).attr('data-id');
                    var divhtml = $('#'+name).html();
                    //alert(divdat);
                    $("#pageCon .list_box").html('');
                    typename =  divdat;
                    $('#tmptpye').val(typename);
                    typetxt =  divhtml;
                    $('#dc_xl_002').html(typetxt);
                    $('#xl_002').css("height","0px");
                    limit = 1;
                    get_list(1);
                    $('.topli').removeClass("selected");
                    $('#'+divid).addClass("selected");
                }
			</script>
			<!--置顶导航条开始-->
			<div id="Fill_006" onclick="sq_xl()"></div>
			<div id="search" style="display:none">
				<div id="div_Float_002">
					<div class="word_div_001 sotop1" id="search-box" style="background:-webkit-linear-gradient(left, #FE4E4E, #FF7373);">
						<div class="div_Return_0011" onclick="javascript:history.go(-1);return false;"></div>
						<form id="search-form2" action="./index.php" method="get">
						<div class="buton" id="word_Button_002" onclick="goso2();"></div>
						<input type="hidden" name="c" value="entry" />
						<input type="hidden" name="i" value="4" />
						<input type="hidden" name="m" value="bsht_tbk" />
						<input type="hidden" name="do" value="search" />
						<input type="hidden" name="shopid" value="0" />
						<input type="hidden" name="cate_id" value="78" />
						<input type="text" style="padding-right: 25px;width:67.5%" class="sokey word_input333" value="" placeholder="" onfocus="this.className = 'word_input3333';document.getElementById('div_Return_00232').style.display='block';document.getElementById('div_Return_0023').style.display='none';document.getElementById('delete').style.display='block';" onblur="if(this.value==''){this.className = 'word_input333';document.getElementById('div_Return_00232').style.display='none';document.getElementById('div_Return_0023').style.display='block';document.getElementById('delete').style.display='none';}else{}" onkeydown="if(event.keyCode==13) {}" id="sokey2" name="keywords" autocomplete="off">
						<span class="clear" id="delete" onclick="$('#suggest').hide();$('#suggest2').hide();$('#sokey2').val('');document.getElementById('delete').style.display='none';$('#sokey2').focus();" style="width: 30px;height: 30px;line-height: 30px;text-align: center;padding-right: 0px;opacity: 0.8;color: #000;position:absolute;right:13%;top:8px;display:none;">&times;</span>
					</form>
						<div class="div_Return_0022" id="div_Return_0023" onclick="javascript:window.location.href='';" style="display:block"></div>
						<div class="div_Return_0022_so btndh" id="div_Return_00232" onclick="goso2();" style="display:none"></div>
					</div>
					<table width="100%" height="39" border="0" cellpadding="0" cellspacing="0" class='stable'>
						<tbody><tr align="center" valign="middle">
							<td width="29%" onclick="zksq_xl(1,320)"><span class="STYLE3" id="dc_xl_001" style="/* color: rgb(255, 95, 73); */">全部分类</span><img id="cx_xl_img1" src="../page/images/spike_030.png" width="12" height="7" class="lm_img_001"><div class="Fill_004"></div></td>
							<td width="29%" onclick="zksq_xl(2,120)"><span class="STYLE3" id="dc_xl_002" style="/* color: rgb(255, 95, 73); */">默认排序</span><img id="cx_xl_img2" src="../page/images/spike_030.png" width="12" height="7" class="lm_img_001"><div class="Fill_004"></div></td>
							<td width="29%" onclick="zksq_xl(3,287)"><span class="STYLE3" id="dc_xl_003" style="/* color: rgb(255, 95, 73); */">价格筛选</span><img id="cx_xl_img3" src="../page/images/spike_030.png" width="12" height="7" class="lm_img_001"><div class="Fill_004"></div></td>
							<td width="13%" onclick="gzcode();"><img id="cx_xl_img4" src="../page/images/spike_032.png" width="17" height="17" class="lm_img_002"><div class="Fill_005"></div></td>
						</tr>
						</tbody></table>
				</div>
			</div>
			<!--nb nav-->
			<div id="xl_001">

				<ul style="width:100%">
					<li class="xl_div_001" onclick="javascript:window.location.href='./index.php?i=4&c=entry&cate_id=78&do=list_all&m=bsht_tbk';" style="color: rgb(255, 95, 73);">女装</li>
					<li class="xl_div_001" onclick="javascript:window.location.href='./index.php?i=4&c=entry&cate_id=79&do=list_all&m=bsht_tbk';" >男装</li>
					<li class="xl_div_001" onclick="javascript:window.location.href='./index.php?i=4&c=entry&cate_id=80&do=list_all&m=bsht_tbk';" >内衣</li>
					<li class="xl_div_001" onclick="javascript:window.location.href='./index.php?i=4&c=entry&cate_id=81&do=list_all&m=bsht_tbk';" >母婴</li>
					<li class="xl_div_001" onclick="javascript:window.location.href='./index.php?i=4&c=entry&cate_id=82&do=list_all&m=bsht_tbk';" >化妆品</li>
					<li class="xl_div_001" onclick="javascript:window.location.href='./index.php?i=4&c=entry&cate_id=83&do=list_all&m=bsht_tbk';" >居家</li>
					<li class="xl_div_001" onclick="javascript:window.location.href='./index.php?i=4&c=entry&cate_id=84&do=list_all&m=bsht_tbk';" >鞋包配饰</li>
					<li class="xl_div_001" onclick="javascript:window.location.href='./index.php?i=4&c=entry&cate_id=85&do=list_all&m=bsht_tbk';" >美食</li>
					<li class="xl_div_001" onclick="javascript:window.location.href='./index.php?i=4&c=entry&cate_id=86&do=list_all&m=bsht_tbk';" >车品</li>
					<li class="xl_div_001" onclick="javascript:window.location.href='./index.php?i=4&c=entry&cate_id=87&do=list_all&m=bsht_tbk';" >数码家电</li>
					<li class="xl_div_001" onclick="javascript:window.location.href='./index.php?i=4&c=entry&cate_id=88&do=list_all&m=bsht_tbk';" >其它</li>
				</ul>
			</div>
			<div id="xl_002">
				<input value="" id="tmptpye" type="hidden">
				<div class="xl_div_002" data-id="moren" id="top_moren">默认排序</div>
				<div class="xl_div_002" data-id="ishot" id="top_ishot">销量最高</div>
				<div class="xl_div_002" data-id="ishit" id="top_ishit">优惠幅度</div>
				<div class="xl_div_002" data-id="isfee" id="top_isfee">价格最低</div>
			</div>
			<div id="xl_003">
				<div class="xl_div_004">
					<div class="xl_div_004_1">价格区间(元)</div>
					<div class="xl_div_004_2"></div>
					<input name="sx_jg2" type="number" class="xl_div_004_3" value="" placeholder="0"  id="maxfee">
					<div class="xl_div_004_4"></div>
					<input name="sx_jg1" type="number" class="xl_div_004_3" value="" placeholder="0"  id="minfee">
				</div>
				<div class="Fill_006"></div>
				<div class="xl_div_006">
					<div class="xl_div_006_3" id="topsearch">确认</div>
				</div>
			</div>
			<script>
                $(document).ready(function(){
                    $('#search').css('width',$('.app').width());
                    $('#xl_001').css('width',$('.app').width());
                    $('#xl_002').css('width',$('.app').width());
                    $('#xl_003').css('width',$('.app').width());
                    $("#sokey").css('width',$('.app').width()*0.75);
                    $(".word_div_001").css('border-bottom-width','0px');
                    $(".word_div_001").css('padding-bottom','5px');
                });
			</script>
			<script>var zz,xl_flxz,xl_pxxz,xl_sxxz,fqcid,typename,typetxt,fqtxt,minfee,maxfee,istmall,istqg,isjhs;var sx_anniu=0;
            istmall = 0;
            istqg = 0;
            isjhs = 0;
            setInterval(function(){
                $(".popw").css('top','0px');
            },10);
			</script>
			<script>
                var pageH = $(document.body).height(); //页面总高度
                var scrollT = $(window).scrollTop(); //滚动条top
                var dc_xl=0;
                //通过搜索框走这里
                function goso(){
                    alert("a");
                    var gosokey=$('#sokey').val();
                    if(gosokey){window.location.href="./index.php?i=4&c=entry&do=search&m=bsht_tbk&keywords="+gosokey;}
                }
                function zksq_xl(type,value){
                    if(dc_xl!=type){
                        document.getElementById('Fill_006').style.display='inline';
                        document.getElementById('dc_xl_00'+type).style.color="#FF5F49";
                        document.getElementById("cx_xl_img"+type).src="../page/images/spike_031.png";
                        document.getElementById("xl_00"+type).style.height= "auto";
                        document.getElementById("xl_00"+type).className='nbtbk-fadein';
                        document.getElementById("cx_xl_img"+type).className='nbtbk-dh360';

                        if(dc_xl!=0){
                            document.getElementById("xl_00"+dc_xl).style.height="0px";
                            document.getElementById("xl_00"+dc_xl).className='fadein-nav';
                            document.getElementById("cx_xl_img"+dc_xl).className='nbtbk-arrow';
                            document.getElementById("cx_xl_img"+dc_xl).src="../page/images/spike_030.png";
                            if((dc_xl==1 && xl_flxz>0) || (dc_xl==2 && xl_pxxz>0) || (dc_xl==3  && xl_sxxz>0)){
                                dc_xl = type;
                                return false;
                            }
                            document.getElementById('dc_xl_00'+dc_xl).style.color="#5F5F5F";
                        }
                        dc_xl = type;
                    }
                    else{
                        document.getElementById("cx_xl_img"+type).src="../page/images/spike_030.png";
                        document.getElementById("xl_00"+type).style.height="0px";
                        document.getElementById("xl_00"+type).className='fadein-nav';
                        document.getElementById("cx_xl_img"+type).className='nbtbk-arrow';
                        document.getElementById('Fill_006').style.display='none';
                        if((dc_xl==1 && xl_flxz>0) || (dc_xl==2 && xl_pxxz>0) || (dc_xl==3  && xl_sxxz>0)){
                            dc_xl = 0;
                            return false;
                        }
                        document.getElementById('dc_xl_00'+type).style.color="#5F5F5F";
                        dc_xl=0;
                    }
                }
                function sq_xl(){
                    document.getElementById("xl_00"+dc_xl).style.height="0px";
                    document.getElementById("xl_00"+dc_xl).className='fadein-nav';
                    document.getElementById("cx_xl_img"+dc_xl).className='nbtbk-arrow';
                    document.getElementById('Fill_006').style.display='none';
                    if((dc_xl==1 && xl_flxz>0) || (dc_xl==2 && xl_pxxz>0) || (dc_xl==3  && xl_sxxz>0)){
                        dc_xl = 0;
                        return false;
                    }
                    document.getElementById('dc_xl_00'+dc_xl).style.color="#5F5F5F";
                    dc_xl=0;
                }
			</script>
			<div id="nb-menu" style="padding-bottom:3px">
				<ul class="nb-ul">
					<li class="nb-relative ">
						<a href="http://wx.sskk88.cn/app/index.php?i=4&c=entry&do=index&m=bsht_tbk&nb_btn=11" class="link-hover"></a>
						<div class="menu-inside" style="height:38px;">
							<i id="nb_btn_11" class="nb-btn" style="margin-bottom:3px;background-image:url('../page/images/scsy.png');background-position: 50% 50%; background-repeat:no-repeat;width:25px;height:25px;border-radius: 0%;margin-bottom:8px"></i>
							<div class="font-div" style="padding-top:0px;margin-bottom:3px;">商城首页</div>
						</div>
					</li>
					<li class="nb-relative ">
						<a href="http://wx.sskk88.cn/app/index.php?i=4&c=entry&do=minifee&m=bsht_tbk&minfee=0&maxfee=50&cate_id=78&nb_btn=12" class="link-hover"></a>
						<div class="menu-inside" style="height:38px;">
							<i id="nb_btn_12" class="nb-btn" style="margin-bottom:3px;background-image:url('../page/images/nz.png');background-position: 50% 50%; background-repeat:no-repeat;width:25px;height:25px;border-radius: 0%;margin-bottom:8px"></i>
							<div class="font-div" style="padding-top:0px;margin-bottom:3px;">特惠女装</div>
						</div>
					</li>
					<li class="nb-relative ">
						<a href="http://wx.sskk88.cn/app/index.php?i=4&c=entry&do=minifee&m=bsht_tbk&minfee=0&maxfee=20&nb_btn=13" class="link-hover"></a>
						<div class="menu-inside" style="height:38px;">
							<i id="nb_btn_13" class="nb-btn" style="margin-bottom:3px;background-image:url('../page/images/zb.png');background-position: 50% 50%; background-repeat:no-repeat;width:25px;height:25px;border-radius: 0%;margin-bottom:8px"></i>
							<div class="font-div" style="padding-top:0px;margin-bottom:3px;">19.9封顶</div>
						</div>
					</li>
					<li class="nb-relative ">
						<a href="http://wx.sskk88.cn/app/index.php?i=4&c=entry&do=so&m=bsht_tbk&nb_btn=14" class="link-hover"></a>
						<div class="menu-inside" style="height:38px;">
							<i id="nb_btn_14" class="nb-btn" style="margin-bottom:3px;background-image:url('../page/images/ss.png');background-position: 50% 50%; background-repeat:no-repeat;width:25px;height:25px;border-radius: 0%;margin-bottom:8px"></i>
							<div class="font-div" style="padding-top:0px;margin-bottom:3px;">全网搜索</div>
						</div>
					</li>
					<li class="nb-relative ">
						<a href="http://wx.sskk88.cn/app/index.php?i=4&c=entry&do=uc&m=bsht_tbkdl&nb_btn=15" class="link-hover"></a>
						<div class="menu-inside" style="height:38px;">
							<i id="nb_btn_15" class="nb-btn" style="margin-bottom:3px;background-image:url('../page/images/huiyuan.png');background-position: 50% 50%; background-repeat:no-repeat;width:25px;height:25px;border-radius: 0%;margin-bottom:8px"></i>
							<div class="font-div" style="padding-top:0px;margin-bottom:3px;">个人中心</div>
						</div>
					</li>
				</ul>
			</div>
			<style type="text/css">@keyframes myfirst {0%{width: 25px;height: 25px;}75%{width: 60px;height: 60px;}100%{width: 25px;height: 25px;}}
			.btn_cur{animation: myfirst 0.5s;-webkit-animation:myfirst 0.5s;-moz-animation: myfirst 0.5s;}</style>
			<script></script>
			<script>var ckua = navigator.userAgent.toLowerCase();if (ckua.match(/iphone/i) == "iphone"){if(/iphone/gi.test(navigator.userAgent) && (screen.height == 812 && screen.width == 375)){console.log('X');$("#nb-menu").attr('style','padding-bottom:30px');}}</script>
			<style>
				.loadingbar2 {
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

				.loading3 {
					width: 120px;
					height: 80px;
					opacity: 0.6;
					font-size: 12px;
					color: #fff;
					background: #000;
					text-align: center;
					border-radius: 5px;
					overflow: hidden;
					display: -webkit-box;
					-webkit-box-pack: center;
					-webkit-box-align: center;
					margin: 0px auto;
				}
			</style>
			<div class="loadingbar3" style="display:none">
				<div class='loading3'><img src='../page/images/loading2.gif' style="width: 45px;height: 45px;"><br>加载中，请稍后<br></div>
			</div>

			<script type="text/javascript" src="../page/itemList/swiper-3.3.1.jquery.min.js"></script>
			<link rel="stylesheet" type="text/css" href="../page/itemList/swiper-3.3.1.min.css">
			<script src="../page/itemList/main.js"></script>
			<link rel="stylesheet" type="text/css" href="../page/itemList/nb_plus.css" />
			<div id="msv">
				<link rel="stylesheet" type="text/css" href="../page/itemList/newpulic.css" />
			</div>

			<div id="goods">
				<section class="goods" id="pageCon">
					<ul class="goods-list list_box clear" id="list_box">
						<div style="display:none" id="min_id">1</div>
						<div style="display:none" id="min_idck">1</div>
						<c:if test="${not empty tbkItems}">
							<c:forEach items="${tbkItems}" var="item" varStatus="tbkItems">
								<li class="picCon ">
									<a class="goods-a" href="${actionPath}/manage/tbkItemDetail.do?itemId=${item.itemId}">
										<img class="loazd" src="${item.pictUrl}" style="height: 161px;">
										<span style="background:url(http://wx.sskk88.cn/addons/bsht_tbk/res/images/tmall.png) no-repeat 0 0;height:0;overflow:hidden; padding-bottom:15px; width: 15px;position:absolute;bottom:5px; right:5px;z-index:15;">
										</span>
									</a>
									<a href="${actionPath}/manage/tbkItemDetail.do?itemId=${item.itemId}">
										<h3 class="tith3">${item.title}</h3>
										<div class="list-price buy">
											<span class="price-new">
												<i class="i-baoyou">抢购</i>
												<i class="i-quan">券10元</i>
											</span>
											<span class="good-btn" style="color:#999">销量${item.volume}</span>
										</div>
										<div class="list-price buy">
											<span class="price-new fs12">
												<span style="text-decoration: line-through;color: rgba(171, 171, 171, 1);">￥29.90</span> 券后 ${item.zkFinalPrice}<i>元</i></span>
										</div>
									</a>
									<div class="b-btndiv">
										<div class="btn-l">
											<div class="btn-wai">
												<div class="btn-nei">
													<a href="${actionPath}/manage/tbkItemDetail.do?itemId=${item.itemId}">领券</a>
												</div>
											</div>
										</div>
										<div class="btn-l">
											<div class="btn-wai">
												<div class="btn-nei2">
													<a href="${actionPath}/manage/tbkItemDetail.do?itemId=${item.itemId}">详情</a>
												</div>
											</div>
										</div>
									</div>
								</li>
							</c:forEach>
						</c:if>
					</ul>
				</section>

				<div id="list_more" class="loading" style="margin-top:10px;">
					<button onclick="getMoreItem()" id="list_more2">查看更多</button>
				</div>
			</div>
<script>
	var swiper2 = new Swiper('.swiper2', {
		slidesPerView: 'auto',
		paginationClickable: true,
		freeMode: true,
		autoplay:3000,

	});
</script>

<%--<script>
	$(function () {
		showloading();
		var page;
		if(!isNaN($("#list_box").attr("page"))) {
			page = $("#list_box").attr("page");
		} else {
			page = 1;
			get_list(page);
		}
		var lock = true;
		$(window).scroll(function () {
			if ($(document).height() - $(this).scrollTop() - $(this).height() < 10) {
				if (lock) {
					lock = false;
					page++;
					if (get_list(page)) {
						lock = true;
					}
				}
			}
		});
	});
</script>--%>

<script>
	var pageNo = 2;
	var minfee =  $('#minfee').val(); //最高价格
	var maxfee =  $('#maxfee').val(); //最低价格
	if(!typename){typename='moren';}//默认排序
	window.localStorage.removeItem("min_id_last");
    var domain = "http://"+window.location.host;

	function getMoreItem(){
		alert("假爱")
	    //获取商品类型
        var itemType = document.getElementById("titleId").name;
		var liststatus = true;

		//获取商品信息
		$.ajax({
			type : "post",
			url : ""+"/manage/loadMoreItems.do",
			data : {
                pageNo:page,
				typename:typename,
				minfee:minfee,
				maxfee:maxfee,
                itemType:itemType,
			},
			dataType : "json",
			success : function(data) {
				if(data.status==200){
					if(data.min_id>1){
						$("#min_id").html(data.min_id);
						var min_ck = window.localStorage.getItem("min_id_last");
						if(min_ck!=data.page){
							window.localStorage.setItem("min_id_last",data.page);
						}else{
							console.log('fail');
							$('.loadingbar3').hide();
							return false;
						}
					}

                    var arrLen = data.length;
                    if(arrLen > 0){
                        $.each(data,function(index,item){
                            var createLi = document.createElement("li");
                            content+="<li class='picCon '><a class='goods-a' href="+domain+"/manage/tbkItemDetail.do?itemId="+item.itemId+">" +
								"<img class='loazd' src="+item.pictUrl+" style='height: 161px;'>" +
								"<span style='background:url(http://wx.sskk88.cn/addons/bsht_tbk/res/images/tmall.png) no-repeat 0 0;height:0;overflow:hidden; padding-bottom:15px; width: 15px;position:absolute;bottom:5px; right:5px;z-index:15;'></span>" +
							    "</a><a href="+domain+"/manage/tbkItemDetail.do?itemId="+item.itemId+"><h3 class='tith3'>"+item.title+"</h3>" +
								"<div class='list-price buy'><span class='price-new'><i class='i-baoyou'>抢购</i><i class='i-quan'>券10元</i>" +
								"</span><span class='good-btn' style='color:#999'>销量+"item.volume+"</span></div>" +
							    "<div class='list-price buy'><span class='price-new fs12'><span style=text-decoration: line-through;color: rgba(171, 171, 171, 1);'>￥29.90</span> 券后 "+item.zkFinalPrice+"<i>元</i>" +
							    "</span></div></a><div class='b-btndiv'><div class='btn-l'><div class='btn-wai'><div class='btn-nei'>" +
							    "<a href="+domain+"/manage/tbkItemDetail.do?itemId="+item.itemId+">领券</a></div></div></div><div class='btn-l'>" +
							    "<div class='btn-wai'><div class='btn-nei2'><a href="+domain+"/manage/tbkItemDetail.do?itemId="+item.itemId+">详情</a></div>" +
							    "</div></div></div></li>"
                            document.getElementById("list_box").append(content);
                        });
                    }

					var aa = $(".goods-list li").innerWidth();
					$(".goods-list li img").css('height',aa);
					if(list.length==10){
						$("#list_box").attr("page", page);
						$("#list_more").html('<span onclick="get_list(2);">点击查看更多</span>');
					}else{
						$("#list_more").html('<span></span>');
						$("#list_more").fadeOut(500);
					}
                    pageNo++;
					$('.loadingbar3').hide();
					cknopic();
					lazy_img();
				}else if(data.status==-103){
					$("#list_more").show();
					$("#list_more2").html('<span onclick="location.reload();">没有更多记录，点击刷新！</span>');
					$('.loadingbar3').hide();
					liststatus = false;

				}else if(data.status==301){
					$("#list_more2").html('没有更多记录');
					$('.loadingbar3').hide();
					liststatus = false;

				}else{
					$("#list_more2").html('没有更多记录！');
					$('.loadingbar3').hide();
					liststatus = false;
				}
			},
			error : function(xhr, type) {
				$('.loadingbar3').hide();
			}
		});
		setTimeout("$('.loadingbar3').hide();",2000);
		return liststatus;
	}
</script>

<script>
	function nopic(n_iid){
		$.ajax({
			url: "https://acs.m.taobao.com/h5/mtop.taobao.detail.getdetail/6.0/?&api=mtop.taobao.detail.getdetail&v=6.0&ttid=2013%40taobao_h5_1.0.0&type=jsonp&dataType=jsonp&data=%7B%22itemNumId%22%3A%22" + n_iid + "%22%7D",
			dataType: 'jsonp',
			jsonp: 'callback',
			success: function (result) {
				var add_image = "http:" + result.data.item.images[1];
				var item_image = add_image + '_200x200.jpg';
				$('.n_'+n_iid).attr('src', item_image);
			}
		})
	}
</script>
<script>
	function cknopic(){
		$(".nopic").each(function(){
			var newnopicid = $(this).attr('data-id');
			nopic(newnopicid);
		});
	}
</script>

<style>
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
		font-size: 12px;
		color: #333;
	}
</style>
<div class="backTop" onclick="gotop();">
	<div class="go-top top-button-hide">
		<span>顶部</span>
	</div>
</div>
<div style="height:30px"></div>
</div>
</div>

	<script type="text/javascript" src="../page/itemList/swipeSlide.min.js"></script>

	<script type="text/javascript" src="../page/itemList/jp.plus.js"></script>
	<script type="text/javascript">
        $(function(){
            function hideMenu() {
                setTimeout("window.scrollTo(0, 0)", 1);
            }

            $('.alert_black_bg .close').on('click', function(){
                $('.alert_black_bg').hide();
                $('#foot').height(120);
            });
        });
        $(".go-app .closed").on("click",function(){
            $(".go-app").hide();
            return false;
        })

	</script>


	<script type="text/javascript">
        $(function(){

            $('.layui-layer-content').css('height','auto');
            $(".nav_box").css("position","fixed");
            $(".nav_box").css("bottom","0px");
            $(".nav_box").css("z-index","9999");
            wx.config(jssdkconfig);
            var $_share = {"imgUrl":"http:\/\/wx.sskk88.cn\/addons\/bsht_tbk\/res\/icon\/1.png","desc":"\u4e00\u4e2a\u80fd\u7701\u94b1\u8d2d\u7269\u8fd8\u80fd\u8d5a\u94b1\u7684\u5e73\u53f0\u3002","link":"http:\/\/wx.sskk88.cn\/app\/index.php?i=4&c=entry&do=list_all&m=bsht_tbk&cate_id=78&shopid=0","title":"\u3010\u5973\u88c5\u7cbe\u9009\u3011 - \u5148\u9886\u5238\u518d\u4e0b\u5355\uff0c\u4e00\u5e74\u72c2\u7701\u4e00\u4e07\u5143\uff01"};
            if(typeof sharedata == 'undefined'){
                sharedata = $_share;
            } else {
                sharedata['title'] = sharedata['title'] || $_share['title'];
                sharedata['desc'] = sharedata['desc'] || $_share['desc'];
                sharedata['link'] = sharedata['link'] || $_share['link'];
                sharedata['imgUrl'] = sharedata['imgUrl'] || $_share['imgUrl'];
            }
            if(sharedata.imgUrl == ''){
                var _share_img = $('body img:eq(0)').attr("src");
                if(_share_img == ""){
                    sharedata['imgUrl'] = window.sysinfo.attachurl + '../page/images/global/wechat_share.png';
                } else {
                    sharedata['imgUrl'] = util.tomedia(_share_img);
                }
            }
            if(sharedata.desc == ''){
                var _share_content = util.removeHTMLTag($('body').html());
                if(typeof _share_content == 'string'){
                    sharedata.desc = _share_content.replace($_share['title'], '')
                }
            }
            wx.ready(function () {

                wx.hideAllNonBaseMenuItem();
                wx.showMenuItems({
                    menuList: ["menuItem:openWithQQBrowser","menuItem:openWithSafari","menuItem:favorite"]
                });
                wx.onMenuShareAppMessage(sharedata);
                wx.onMenuShareTimeline(sharedata);
                wx.onMenuShareQQ(sharedata);
                wx.onMenuShareWeibo(sharedata);

                sharedata.success = function(){
                }
            });
        });
	</script>

	<script type="text/javascript">
        document.getElementById("search").style.display = "none";
        window.addEventListener("scroll", function (event) {


            if (document.body.scrollTop > 500) {
                $(".go-top").removeClass("top-button-hide").addClass("top-button-show");
            } else {
                $(".go-top").addClass("top-button-hide").removeClass("top-button-show");
            }
            if (document.body.scrollTop > 50) {
                document.getElementById("search").style.display = "block";
            }
            else {
                $('#search').fadeOut(500);
            }
        });
	</script>

	<script>
        function gotop(){
            setTimeout('$("html,body").animate({scrollTop:$("body").offset().top},500);',500);
            $(".go-top").addClass("top-button-hide").removeClass("top-button-show");
        }
	</script>



	<script>
        function gzcode(){

            layer.open({
                type: 1,
                title: '- 长按扫码 -',
                skin: 'layui-layer-demo', //样式类名
                closeBtn: 0, //不显示关闭按钮
                anim: 2,
                shadeClose: true, //开启遮罩关闭
                content: '<div id="gzcode" style="width:300px;height:300px;"><img src="http://wx.sskk88.cn/attachment/qrcode_4.jpg?time=1521564593" style="width:300px;height:300px;" id="nosp"></div>'
            });
        }
	</script>
	<script>

        function nbsosq(obj){
            var jumpnbq = obj.name;
            if(jumpnbq){
                $('.newtopkey').val(jumpnbq);
                $('#suggest').hide();
                $('.suggest').hide();
                document.getElementById("search-form-top").submit();
            }
        }

        function nbsosq2(obj){
            var jumpnbq = obj.name;
            if(jumpnbq){
                $('#sokey').val(jumpnbq);
                $('#sokey2').val(jumpnbq);
                $('#suggest2').hide();
                $('.suggest2').hide();
                document.getElementById("search-form2").submit();
            }
        }

        function gzcode_kf(){

            layer.open({
                type: 1,
                title: '- 长按扫码 -',
                skin: 'layui-layer-demo', //样式类名
                closeBtn: 0, //不显示关闭按钮
                anim: 2,
                shadeClose: true, //开启遮罩关闭
                content: '<div id="gzcode" style="width:300px;height:300px;"><img src="http://wx.sskk88.cn/attachment/qrcode_4.jpg?time=1521564593" style="width:300px;height:300px;" id="nosp"></div>'
            });
        }
	</script>
	<script src="../page/itemList/volist.js"></script>
	<div style="display:none">
	</div>
</div>
<script>;</script></body>
</html>