<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
	  
	  	<blockquote class="layui-elem-quote">封禁名单</blockquote>
	  	<div class="layui-form">
		  <table class="layui-table">
		  	 <colgroup>
		      <col width="150">
		      <col width="150">
		      <col width="150">
		      <col width="200">
		      <col width="150">
		    </colgroup>
		    <thead>
		      <tr>
		        <th>封禁人</th>
		        <th>职位</th>
		        <th>被封禁人</th>
		        <th>封禁时间</th>
		        <th>操作</th>
		      </tr> 
		    </thead>
		    <tbody>
		    	<c:forEach var="m" items="${message }">
		    	  <tr>
			        <td>${m.focusTopic.user.username }</td>
			        <td>${m.focusTopic.topicPermession.permissionName }</td>
			        <td>${m.user.username }</td>
			        <td>${m.operateTime }</td>
			        <td><button class="layui-btn layui-btn-primary layui-btn-small"><i class="layui-icon">&#xe605;</i></button></td>
			      </tr> 
		    	
		    	</c:forEach>
		         
		    </tbody>
		  </table>
		</div>
	  </div>
	</fieldset>
  
	   	
	
   
   
   
   
   
   <script src="${path }/layui/layui.js" charset="utf-8"></script>
   <script>
		layui.use('form', function(){
		  var $ = layui.jquery, form = layui.form();
		  
		  //全选
		  form.on('checkbox(allChoose)', function(data){
		    var child = $(data.elem).parents('table').find('tbody input[type="checkbox"]');
		    child.each(function(index, item){
		      item.checked = data.elem.checked;
		    });
		    form.render('checkbox');
		  });
		  
		});
  </script>
  </body>
</html>
