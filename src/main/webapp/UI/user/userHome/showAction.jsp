<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>SgpHub活动中心</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0"> 
	<link rel="stylesheet" href="${path }/layui/css/layui.css"  media="all"> 
	<!-- <script type="text/javascript" src="jquery-1.11.2.js"></script>  -->
	<script type="text/javascript" src="${pageContext.request.contextPath }/UI/admin/jquery-1.11.2.js"></script>
	<style type="text/css">
	 	body{
	  		margin: 0;
	  	    min-width: 1366px; 
	  		background-color: #CBC9C9;
	  	}
	  	.head-nav{
	  		width:100%;
	  		height: 75px;
	  		background-color: #393D49;		
	  	}
	  	.head-nav-logo{
	  		width:13%;
	  		float: left;
	  		margin-left: 60px;
	  		margin-top: 10px;
	  		
	  	}
	  	#sgphub{
	  		font-size:30px;;
	  		color: white;
	  		font-family: Comic Sans MS;
	  		position: relative;
	  		top:8px;
	  	}
	  	.head-nav-button{
	  		width:40%;
	  		height:100%;
	  		float: left;
	  		margin-left:6%;

	  	}
	  	.head-nav-buttongroup{
	  		margin-top: 25px;
	  	}
	  	.head-nav-search{
	  		width:20%;
	  		height:100%;
	  		float: left;
	  		margin-left:4%;
	  	}
	  	.head-nav-search form{	  		
	  		margin-top:25px;
	  		margin-left: 12px;
	  	}
	#myDiv{ width:500px;height: 100px; background-color:#000000; opacity:0.5; -moz-opacity:0.5; 
	filter:alpha(opacity=50);
	margin: auto;
	margin-top: -366px;
	}
	
	</style>  
	<script type="text/javascript">
	/* $(document).ready(function(){
		$("#takeAction").click(function(){
				
				var url = "${path }/user/takeAction.form?actionid=${a.id }";
				$.get(url,function(data){
					if(data =='0'){
						alert('成功');
					   
					}
				
				});
		}); 
		}); */
		function showDiv() {
			var div = document.getElementById("myDiv");
			div.style.display="block";
		}
	
	</script> 
	

  </head>
  
  <body>
  <!-- 导航栏 -->
  	<div class="head-nav">
     	 <div class="head-nav-logo">
     	 	<div class="layui-inline">
			  <img src="${path }/User-images/logo.jpg" class="layui-circle" style="width:50px">
			</div>
     	 	<span id="sgphub">SgpHub</span>
     	 </div>
     	 
     	 <div class="head-nav-search">
     	 		<form class="layui-form layui-form-pane" action="">
					  <div class="layui-form-item" >
					    <label class="layui-form-label" style="width: 60px;">
					   		<i class="layui-icon" style="font-size: 20px; color: gray;text-align: left;">&#xe615;</i>
					    </label>
					    <div class="layui-input-inline">
					      <input name="search" lay-verify="required" placeholder="输入关键字搜索" autocomplete="off" class="layui-input" type="text">
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
     
     <div id="actioncenter" style="width:70%;margin: auto;background-color: white;min-height: 680px;">
    
     	<div style="width:100%;height:40px;" ><span style="font-size: 18px;position:relative; margin-left: 28px;top: 16px;" >活动中心</span>
     	<hr style="height:2px;margin-top: 15px;" />
     	
     	</div>
	     <!--循环数据库的活动  -->
	     <div style="width:100%;" >
	    
		     <div id="action" style="width:80%;margin: auto;">
		     	<div style="width:80%;height:40px;margin-left: 34px;" ><span id="showMyAction" style="position: relative;margin-left: -20px;top: 10px;color: #E83038;">${action.name }</span> </div>
		  		<!-- 活动中心的图片 -->
		  		<div style="border: solid 1px gray;" >
		  		<div id="actionPictuer" style="width:100%;height:60%;border: solid 1px gray;">
		  			<img alt="" src="${action.imgURL }"
						>
		  		</div>
		  		<!--活动标题  -->
		  		<div id="actionTitle" style="width:100%;height:20%;">
		  			
		  			<div  style="width:80%;height:18%;margin-left: 7%;" ><span>这里是活动介绍${action.introduction }</span></div>
		  			<c:if test="${not empty actionrpeplys }">
			  			<c:forEach var='a' items="${actionrpeplys }" varStatus="vs" >
				  			<div style="width:80%;height:15%;margin-top: 1%;">
				  				<span style="margin-left: 25px;height: 14%;width:80%;color:#0C73C2; ">${a.user.username }</span><span >:${a.reply }</span><br>
				  				<hr>
				  			</div>
			  			</c:forEach>
		  			</c:if>
		  			<div style="width:20%;height:15%; float: right;margin-top: 5%;" > <a style="position:relative;margin-left: 5%;color: #0C73C2;margin-top: 5%;" href="${path }/user/takeAction.form?actionid=${action.id }">我要参加&nbsp;|</a><a style="color: #0C73C2;font-size: 13px;" >&nbsp;参与人数(${action.joinCount })</a><br>
		  			</div>
		  			
		  			<a style="position: relative;bottom: -15%;left:3%;" onclick="showDiv()">发表评论</a>
		  			 <div id="myDiv" style="display: none ;">
		  				<form action="${path }/user/addActionReply.form?actionid=${action.id }" method="post">
		  					<input type="text" name="reply" style="width:400px;height: 20px;position: relative;margin-left: 50px;margin-top: 20px;"/><br>
		  					<input type="submit" value="发表" style="position: relative;margin-left: 69px;margin-top: 10px;"/>
		  				</form>
		  			</div>
		  			
		  		</div>
		  		</div>
		  	</div>
		  	<hr/>
		  	
		  </div>	
	</div>  		
  </body>
</html>