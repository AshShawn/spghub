<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>吧务后台</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">   
	<link rel="stylesheet" href="${path }/layui/css/layui.css" media="all"> 
	<style type="text/css">
body {
	margin: 0;
	min-width: 1366px;
}
.head-nav {
	width: 100%;
	height: 75px;
	background-color: #393D49;
}

.head-nav-logo {
	width: 13%;
	float: left;
	margin-left: 60px;
	margin-top: 10px;
}

#sgphub {
	font-size: 30px;
	color: white;
	font-family: Comic Sans MS;
	position: relative;
	top: 8px;
}

.head-nav-button {
	width: 40%;
	height: 100%;
	float: left;
	margin-left: 6%;
}

.head-nav-buttongroup {
	margin-top: 25px;
}

.head-nav-search {
	width: 20%;
	height: 100%;
	float: left;
	margin-left: 4%;
}

.head-nav-search form {
	margin-top: 25px;
	margin-left: 12px;
}
.service-name {
	display: inline-block;
	font-size: 16px;
	margin-left: 16px;	
	
}
		
	
	</style>

  </head>
  
  <body>
  		<!--导航栏  -->
	<div class="head-nav">
		<div class="head-nav-logo">
			<div class="layui-inline">
				<img src="${path }/User-images/logo.jpg" class="layui-circle"
					style="width:50px">

			</div>
			<span id="sgphub">SgpHub</span>
		</div>

		<div class="head-nav-search">
			<form class="layui-form layui-form-pane" action="">
				<div class="layui-form-item">
					<label class="layui-form-label" style="width: 60px;"> <i
						class="layui-icon"
						style="font-size: 20px; color: gray;text-align: left;">&#xe615;</i>
					</label>
					<div class="layui-input-inline">
						<input name="search" lay-verify="required" placeholder="输入关键字搜索"
							autocomplete="off" class="layui-input" type="text">
					</div>
				</div>
			</form>
		</div>
		<div class="head-nav-button">
			<div class="head-nav-buttongroup">
				<button class="layui-btn layui-btn-primary layui-btn-radius">首页</button>
				<button class="layui-btn layui-btn-radius" onclick="personal()">我的主页</button>
				<button class="layui-btn layui-btn-normal layui-btn-radius">话题中心</button>
				<button class="layui-btn layui-btn-warm layui-btn-radius">活动中心</button>
				<button class="layui-btn layui-btn-radius">我要提问</button>
			</div>
		</div>
	</div>
  
  	<!-- 主界面 -->
  	<div style="width: 100%;height: 536px;background-color: #F1F1F1">
  		<div style="width: 12.5%;height: 94%;float: left;margin-left: 10%;margin-top: 1%;">
  		
  			<ul class="layui-nav layui-nav-tree" lay-filter="demo" style="height: 100%;width:100%;padding-top: 20px;">
			  <li class="layui-nav-item layui-this"><a id="info" href="javascript:void(0)"> <i class="layui-icon" style="font-size: 24px;">&#xe620;</i><span class="service-name">本吧信息</span></a></li>
			  <li class="layui-nav-item"><a id="team" href="javascript:void(0)"> <i class="layui-icon" style="font-size: 18px;">&#xe613;</i><span class="service-name">吧务团队</span></a></li>
			  <li class="layui-nav-item"><a id="message" href="javascript:void(0)"> <i class="layui-icon" style="font-size: 24px;">&#xe612;</i><span class="service-name">封禁名单</span></a></li>
			  <li class="layui-nav-item"><a id="history" href="javascript:void(0)"> <i class="layui-icon" style="font-size: 24px;">&#xe60e;</i><span class="service-name">吧务操作记录</span></a></li>
<<<<<<< .mine
			  <li class="layui-nav-item"><a id="showApply" href="javascript:void(0)"> <i class="layui-icon" style="font-size: 24px;">&#xe603;</i><span class="service-name">查看申请</span></a></li>
			  <li class="layui-nav-item"><a id="back" href="javascript:void(0)"> <i class="layui-icon" style="font-size: 24px;">&#xe603;</i><span class="service-name">吧务操作记录</span></a></li>
=======
			  <li class="layui-nav-item"><a id="back" href="javascript:void(0)"> <i class="layui-icon" style="font-size: 24px;">&#xe603;</i><span class="service-name">返回本吧</span></a></li>
>>>>>>> .r177
			  
			</ul>
  		
  		</div>
  		<div style="width: 60%;height: 94%;float:left;margin-left: 1%;margin-top: 1%;border: 1px solid #F1F1F1;;background-color: white">
  			<iframe src="${path }/UI/service/info.jsp" style="border: none;width: 90%;height: 90%;background-color: white;margin-left: 3%;"></iframe>
  		</div>
  	</div>
  	
  	<!-- 页脚 -->
  	
  	<div style="width: 100%;height: 80px;border-top:1px solid #F1F1F1;">
  	
  	</div>
	<script src="${path }/layui/layui.js" charset="utf-8"></script>
	<script>
		layui.use(['element','layer'], function(){
		  var element = layui.element(),layer= layui.layer,$ = layui.jquery; 
		 
		  $("#info").click(function() {
			$("iframe").attr("src","${path }/servicer/info.form?ptid=${service_pt.id }");
	      });
	      $("#team").click(function() {
			$("iframe").attr("src","${path }/servicer/team.form?ptid=${service_pt.id }");
	      });
	      $("#message").click(function() {
			$("iframe").attr("src","${path }/servicer/message.form?ptid=${service_pt.id }");
	      });
	      $("#history").click(function() {
			$("iframe").attr("src","${path }/servicer/history.form?ptid=${service_pt.id }");
	      });
	      $("#back").click(function() {
			window.location.href="${path }/user/goPT.form?ptid=${service_pt.id }"
	      });
	      $("#showApply").click(function() {
			window.location.href="${path }/servicer/queryApplyServicer.form"
	      });
		});
	</script>
</body>
</html>
