<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'servicer.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0"> 
	<link rel="stylesheet" href="${path }/layui/css/layui.css"  media="all">   
  </head>
    <body>
  	<fieldset class="layui-elem-field layui-field-title" >
	  <legend>后台操作记录</legend>
	</fieldset>
	<div id="showtable">
		<table class="layui-table" lay-even="" lay-skin="row">
			<thead style="text-align: center;">
				<tr>
					<th>编号</th>

					<th>管理员</th>
					<th>操作内容</th>
					<th>操作类型</th>
					<th>操作前数据</th>
					<th>操作后数据</th>
					<th>操作时间</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="s" items="${servicerHistory }" varStatus="status">
					<tr>
						<td>${status.count }</td>

						<td>${s.admin.name }</td>
						<td>${s.type }</td>
						<td>${s.operateType.operateName }</td>
						<td>${s.oldHistory }</td>
						<td>${s.newRecord }</td>
						<td>${s.operateTime}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div id="demo1"></div>

<script src="${path }/layui/layui.js" charset="utf-8"></script>

<script>
layui.use(['laypage', 'layer'], function(){
  var laypage = layui.laypage,layer = layui.layer, $ = layui.jquery;
   //每页出现的数据量
  var pages= "${pageAll }";//数据总数
  //调用分页
  laypage({
    cont: 'demo1'
    ,pages:pages//总页数
    ,groups:3 
    ,jump: function(obj,first){
	    if(!first){
	        layer.msg('第 '+ obj.curr +' 页');
	         $("#showtable").load("${path }/admin/queryAdminOperatePage.form?pageNow="+obj.curr); 
	      	 
	      }
	  } 
     	
  });
  
});
</script>
  </body>
</html>
