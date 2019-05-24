<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'team.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<link rel="stylesheet" href="${path }/layui/css/layui.css" media="all">
  </head>
  
  <body>
	<fieldset class="layui-elem-field layui-field-title">
	  <legend>${service_pt.name } 吧务后台</legend>
	  <div class="layui-field-box">
	  <blockquote class="layui-elem-quote">本吧介绍：${service_pt.introduction }</blockquote>
	  	<blockquote class="layui-elem-quote layui-quote-nm">
		  本吧关注人数：${service_pt.focusCount }位<br>
		  帖子数量：${service_pt.postCount }条<br>
		  大吧主：${bigCount }位<br>
		  小吧主：${smallCount }位<br>
		  用户：${userCount }位<br>
		  优秀回答者：${goodUserCount }位
		  <br>——Arirelia
		</blockquote>
	  </div>
	</fieldset>
	
   
   
   
   
   
   
   <script src="${path }/layui/layui.js" charset="utf-8"></script>
  </body>
</html>
