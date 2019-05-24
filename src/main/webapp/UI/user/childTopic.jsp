<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	font-size: 30px;;
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
.body{
background-color: #F9F9F9;
}		
	
	</style>
<script type="text/javascript">
	function mainPage() {
		window.location = "${pageContext.request.contextPath}/user/userMain.form";
	}
	function personal() {
		window.location = "${pageContext.request.contextPath}/user/userShow.form";
	}
	function childTopic() {
		window.location = "${pageContext.request.contextPath}/user/childTopic.form";
	}

	function actionCenter() {
		window.location = "${pageContext.request.contextPath}/user/queryAction.form";
	}
	function addChildTopic() {
		window.location = "${pageContext.request.contextPath}/user/preAddChildTopic.form";
	}
</script>
  </head>
  
  <body class="body">
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
			<form class="layui-form layui-form-pane" action="${path }/servicer/search.form">
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
				<button class="layui-btn layui-btn-primary layui-btn-radius" onclick="mainPage()">首页</button>
				<button class="layui-btn layui-btn-radius" onclick="personal()">我的主页</button>
				<button class="layui-btn layui-btn-normal layui-btn-radius" onclick="childTopic()">话题中心</button>
				<button class="layui-btn layui-btn-warm layui-btn-radius" onclick="actionCenter()">活动中心</button>
				<button class="layui-btn layui-btn-radius">我要提问</button>
			</div>
		</div>
	</div>
  
  	<!-- 主界面 -->
  	<div style="width: 100%;">
  		
  		<div id="main" style="width: 60%;height: 94%;float:left;margin-left: 11%;margin-top: 1%;border: 1px solid #F1F1F1;">
  			<div style="width: 750px;margin-left: auto;margin-right: auto;margin-top: 10px;">
  				<div><legend style="float:left;"> 已关注的话题动态</legend><span style="float:right;">共关注${topicCount }个话题</span></div>
  				<hr style="clear:both;">
  				<div style="width:680px;">
  				&nbsp; 
  				<c:if test="${childTopices!=null }"> 			
  					<c:forEach var="a" items="${childTopices }"> 						
  						<input id="${a.childTopic.id }" class="layui-btn layui-btn-radius" style="width:100px;margin-top: 10px;" onclick="thisPost(this)" value="${a.childTopic.name }" />
  												
  					</c:forEach>
  				</c:if>
  				<c:if test="${childTopices==null }"> 
  					<br/><span style="font-size: 20px;color:red;">您还没有关注任何话题!</span><br/>
  				</c:if>
  				</div>
  				
  			</div>
  			 <div id="info" style="width:700px;margin-left: 5%">
  			 <br/>
  			 	<i class="layui-icon" style="font-size: 24px; color: #1E9FFF;">&#xe60c;</i>
  			 	<span style="font-size: 26px;">&nbsp;请在上方选择你想浏览的话题</span>
  			 </div> 
  			
  		</div>
  		<div style="width: 15.5%;height: 94%;float: left;margin-top: 1%;margin-left: 1%;">
  			<div style="width:100%;height:30%;background-color:#EFF6FA;">
				
				<div style="width:90%;margin-left: 5%;">
					<br/><span style="margin-top: 15px;">如何成为优秀回答者？</span><br/>
					<span>认真回答问题，平时加强自己的知识积累</span>
					
				</div>
				<input class="layui-btn layui-btn-normal layui-btn-radius" style="width:100px;margin-left:20%;margin-top: 10%;" value="添加话题" onclick="addChildTopic()">
			</div>
  			<div style="width:100%;height:70%;">
  				<hr style="color:#000000;">
				<div style="width: 100%;height:30px;">
					<span style="float:left;color:#8F6666;">其他人关注的话题</span>
					<a style="float:right;color:#698EBF;" onclick="thisChange()">换一换</a>
				</div>
				<div style="width: 100% ;">
					<div id="refresh" style="width:100%;">
						<c:forEach var="b" items="${childTopicesQT }">
							<span style="color:#225599;font-size: 18px;">${b.childTopic.name }</span><br/>
						</c:forEach>
					</div>
					<iframe src="" style="width: 100%;border: none;"></iframe>
				</div>
			</div>
  		</div>
  	</div>
  	
  	<!-- 页脚 -->
  	
  	<div style="width: 100%;height: 80px;border-top:1px solid #F1F1F1;">
  	
  	</div>
	<script src="${path }/layui/layui.js" charset="utf-8"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/UI/admin/jquery-1.11.2.js"></script>
	<script>
		layui.use(['element','layer'], function(){
		  var element = layui.element(),layer= layui.layer,$ = layui.jquery; 
		 
		 
		});
		layui.use(['element', 'layedit','layer'], function() {
			var layedit=layui.layedit,$=layui.jquery,layer=layui.layer,element = layui.element(); //导航的hover效果、二级菜单等功能，需要依赖element模块
			var index = layedit.build('LAY_demo1');
			
			$("#main").height($("#info").height());
			

		});
		 function thisPost(obj) {
		  	$("#info").load("${path }/user/infoTopic.form?cpid="+obj.id);
			}
		function thisChange() {
		 	$("iframe").attr('src',"${pageContext.request.contextPath }/user/refreshTopic.form");
		 	$("#refresh").hide();
		
		}
	</script>
	
</body>
</html>
