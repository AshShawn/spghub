<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'index.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<link rel="stylesheet" href="${path }/layui/css/layui.css"  media="all">

  </head>
  
  <body >
  	
  	<blockquote class="layui-elem-quote">上次登录时间：<fmt:formatDate value="${lastT }" pattern="yyyy-MM-dd HH:mm:ss" /></blockquote>
  	<blockquote class="layui-elem-quote">本次登录时间：<fmt:formatDate value="${admininfo.lastLogin }" pattern="yyyy-MM-dd HH:mm:ss" /></blockquote>			
	<fieldset class="layui-elem-field layui-field-title" >
	  <legend>问题</legend>
	</fieldset>
		  <div class="layui-collapse" lay-filter="test">
		    <div class="layui-colla-item">
		      <h2 class="layui-colla-title">如果发现与上次登陆时间不一致怎么办？</h2>
		      <div class="layui-colla-content">
		      <p>请联系我们的技术人员 ——来自@吴严钊</p>
		      </div>
	      </div>
		  <div class="layui-colla-item">
		    <h2 class="layui-colla-title">为什么吧务操作功能不能正常使用？</h2>
		    <div class="layui-colla-content">
		      <p>请联系我们的技术人员 ——来自@费铮</p>
		    </div>
		  </div>
		  <div class="layui-colla-item">
		    <h2 class="layui-colla-title">首页滚动帖出问题怎么办？</h2>
		    <div class="layui-colla-content">
		      <p>请联系我们的技术人员 ——来自@吴青松</p>
		    </div>
		  </div>	  
	</div>
<script src="${path }/layui/layui.js" charset="utf-8"></script>
<script>
layui.use(['element', 'layer'], function(){
  var element = layui.element();
  var layer = layui.layer;
  
  //监听折叠
 /*  element.on('collapse(test)', function(data){
    layer.msg('展开状态：'+ data.show);
  }); */
});
</script>
				
			
  </body>
</html>
