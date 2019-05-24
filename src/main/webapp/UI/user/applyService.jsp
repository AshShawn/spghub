
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
    
     	 <div style="width:100%;height:40px;" ><span style="font-size: 18px;position:relative;margin-left:450px;top: 16px;" >申请职位</span>
     	<hr style="height:2px;margin-top: 15px;" />
     	
     	</div>
	    <div style="width:400px;height:300px;margin: auto;margin-top: 100px;">
	    	<a style="font-size: 16px;margin-left: 88px;top: 36px;" >申请内容</a>
	    	<form action="${path }/user/applyService.form?ptopicid=${parenttopic.id}" >
	    		<textarea style="position:relative;margin-left: 70px;margin-top: 50px;width:260px;height: 150px; "></textarea><br>
	    		<input style="margin-left: 90px;margin-top: 8px;width:49px;" type="submit" value="提交"/>
	    	</form>
	    </div> 
	    
	</div>  		
  </body>
</html>
