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
		function showMyAction(obj) {
			var id= obj;
			alert(id);
			window.location.href="${path }/user/showOneAction.form?actionid="+id;
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
     
     <div id="actioncenter" style="width:70%;margin: auto;background-color: white;min-height: 650px;">
    
     	<div style="width:100%;height:40px;" ><span style="font-size: 18px;position:relative; margin-left: 28px;top: 16px;" >活动中心</span>
     	<hr style="height:2px;margin-top: 15px;" />
     	
     	</div>
	     <!--循环数据库的活动  -->
	     <div style="width:100%;" >
	     <c:forEach var='a' items="${actions }" varStatus="vs" >
		     <div id="action" style="width:80%;height:70%;margin: auto;">
		     	<div style="width:80%;height:40px;margin-left: 34px;" ><span onclick="showMyAction(${a.id})" style="position: relative;margin-left: -20px;top: 10px;color: #E83038;">${a.name }</span> </div>
		  		<!-- 活动中心的图片 -->
		  		<div style="border: solid 1px gray;" >
		  		<div id="actionPictuer" style="width:100%;height:60%;border: solid 1px gray;">
		  			<img alt="" src="${a.imgURL }"
						>
		  		</div>
		  		<!--活动标题  -->
		  		<div id="actionTitle" style="width:100%;height:20%;">
		  			
		  			<div  style="width:80%;height:18%;margin-left: 7%;" ><span>这里是活动介绍${a.introduction }</span></div>
		  			<div style="width:20%;height:15%; float: right;margin-top: 5%;" > <a style="position:relative;margin-left: 5%;color: #0C73C2;margin-top: 5%;" href="${path }/user/takeAction.form?actionid=${a.id }">我要参加&nbsp;|</a><a style="color: #0C73C2;font-size: 13px;" >&nbsp;参与人数(${a.joinCount })</a></div>
		  		</div>
		  		</div>
		  	</div>
		  	<hr/>
		  	</c:forEach>
		  </div>	
	</div>  		
  </body>
</html>
