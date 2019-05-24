<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  
    
    <title>My JSP 'showtable.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<link rel="stylesheet" href="${path }/layui/css/layui.css"  media="all">   
  </head>
  
  <body>
     <table class="layui-table" lay-even="" lay-skin="row" >
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
  </body>
</html>
