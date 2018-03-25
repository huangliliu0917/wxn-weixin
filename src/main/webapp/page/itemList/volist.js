/*
function volistOn(){
	var str = "<div onclick='' data-id='0' class='volist' style='font-size:14px;display:none;position:fixed;top:18%;background:black;z-index:1000;opacity:0.75;color:white;border-radius:10px;height: 25px;overflow: hidden;'><img style='border-radius:50%;float:left;' id='headpic' src='' width='25'><span id='votips' style='margin-left:3%;line-height:25px;font-size:12px;'>牛贝下单抢券省了</span><span id='rand' style='margin-left:5%;font-size:12px;margin-right:12px;'>5秒前</span></div>";
	$(document.body).append(str);
	window.setInterval("volistFly()",12000);
}
*/

/*function volistFly(){
	var uniacid = getUniacid('i');
	$.post("../app/index.php?i=" + uniacid + "&c=entry&do=volist&m=bsht_tbk",function(dat){
		$(".volist").show();
		$("#votips").html("[抢] "+dat.username+" 下单抢券省了"+Number(dat.fee).toFixed(1)+"元");
		$("#rand").html(dat.rand+"秒前");
		$("#headpic").attr("src",dat.itempic);
		$(".volist").attr("data-id",dat.itemid);
		$(".volist").attr("onclick","jumpitem("+dat.itemid+")");
		setTimeout(hide,8000);
	},'JSON')
}*/

window.onload = volistOn;

function getUniacid(weid)
{
	var reg = new RegExp("(^|&)"+ weid +"=([^&]*)(&|$)");
     var r = window.location.search.substr(1).match(reg);
     if(r!=null)return  unescape(r[2]); return null;
}

function hide()
{
	$('.volist').hide();
}

/*function jumpitem(id)
{
	var uniacid = getUniacid('i');
	window.location.href="../app/index.php?i=" + uniacid + "&c=entry&do=show_all&m=bsht_tbk&id="+id; 
}*/
