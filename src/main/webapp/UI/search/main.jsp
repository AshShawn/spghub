<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'main.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<link rel="stylesheet" href="${path }/layui/css/layui.css" media="all"> 

  </head>
  
  <body style="background-color: #F1F1F1">
<div style="width:80%;margin-left: 10%;background-color: white">
	<div style="width:80%;margin-left: 10%;">
  	<div style="margin-left: 35%;padding-top: 20px;">
			<form class="layui-form layui-form-pane" action="${path }/servicer/search.form?ptid=${pt.id }">
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
  	 
	<blockquote class="layui-elem-quote">为您检索到以下内容</blockquote>
	 
	<fieldset class="layui-elem-field layui-field-title" style="width:80%;margin-left: 10%">
	  <legend>${search }</legend>
	</fieldset>
	 <div style="width:80%;margin-left: 10%;">
	 	<c:if test="${empty posts }">
	 		没有查到数据！
	 	
	 	</c:if>
	 	
	 	<c:if test="${not empty posts }">
	 		<c:forEach var="p" items="${posts }">
		 		<a style="cursor: pointer;" href="${path }/user/showPostById.form?postId=${p.id } "><blockquote class="layui-elem-quote layui-quote-nm">
				 ${p.postName }
				 <br>——${p.parentTopic.name } <br>${p.postText } 
				</blockquote></a>
				<hr>
			
		 	
	 		</c:forEach>
	 	
	 	</c:if>
	 	
		
		
		
	</div>
		
		
		
    </div>
    
    
    
    
</div>
   <script src="${path }/layui/layui.js" charset="utf-8"></script>
   <script type="text/javascript">
 	
   	 layui.use('layer', function() {
   	 	var layer = layui.layer,$=layui.jquery;
		layer.msg('本论坛检索系统很多不足，望谅解！');
		$("a").hover(function() {
			$(this).css("background",red);
		});
		
		/** 
		*	 ${p.postName }
				  <br>——${p.postText } 
		 	?postId=${p.id }  
		*/
	 });
   
   
   </script>
  </body>
</html>
