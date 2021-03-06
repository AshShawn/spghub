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
	  
	  		<blockquote class="layui-elem-quote">操作历史记录</blockquote>
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
		        <th>姓名</th>
		        <th>职位</th>
		        <th>操作</th>
		        <th>用户</th>
		        <th>操作时间</th>
		      </tr> 
		    </thead>
		    <tbody>
		      <c:forEach var="m" items="${history }">
		    	  <tr>
			        <td>${m.focusTopic.user.username }</td>
			        <td>${m.focusTopic.topicPermession.permissionName }</td>
			        <td>${m.operateType.operateName }</td>
			        <td>${m.user.username }</td>
			        <td>${m.operateTime }</td>
			       
			      </tr>  
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
