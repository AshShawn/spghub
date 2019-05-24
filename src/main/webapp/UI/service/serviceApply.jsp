<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>申请</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<link rel="stylesheet" href="${path }/layui/css/layui.css" media="all">
	<script type="text/javascript" src="${pageContext.request.contextPath }/UI/admin/jquery-1.11.2.js"></script>
  </head>
  <script type="text/javascript">
  		function changeStatus(obj) {
			var id = obj;
			window.location="${path }/service/modifyApplyStatus.form?id="+id;
		}
  
  </script>
  
  <body>
  <fieldset class="layui-elem-field layui-field-title">
	  <legend>${service_pt.name } 吧务后台</legend>
	  <div class="layui-field-box">
	  
	  	<blockquote class="layui-elem-quote">申请列表</blockquote>
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
		        <th>申请话题</th>
		        <th>申请内容</th>
		        <th>申请日期</th>
		        <th>受理状态</th>
		        <th>操作</th>
		      </tr> 
		    </thead>
		    <tbody>
		    	 <c:forEach var="a" items="${applys }"> 
		    	  <tr>
			        <td>${a.focusTopic.parentTopic.name }</td>
			        <td>${a.text }</td>
			        <td>${a.date }</td>
			        <td>${a.adviceStatus.statusname }</td>
			        <td><i class="layui-icon" onclick="changeStatus(${a.id })" >&#xe618;</i></td>
			        <!-- <td><button class="layui-btn layui-btn-primary layui-btn-small"><i class="layui-icon">&#xe605;</i></button></td> -->
			      </tr> 
		    	
		    	</c:forEach> 
		         
		    </tbody>
		  </table>
		</div>
	  </div>
	</fieldset>
  
  <%--  <script src="${path }/layui/layui.js" charset="utf-8"></script>
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
  </script> --%>
  </body>
</html>

