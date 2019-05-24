<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>后台管理活动页面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<link rel="stylesheet" href="${path }/layui/css/layui.css"  media="all">
    <script type="text/javascript" src="jquery-1.11.2.js"></script>
    <script src="${path }/layui/layui.js" charset="utf-8"></script>
    <style type="text/css">
    
   
    	table{
    		width:666px;
    		margin-left:50px;
    		text-align: center;
    	}
    
    </style>

  </head>
  <!-- <script type="text/javascript">
  	     function queryAction() {
  	     	window.location.href="${path }/admin/queryActionByStatus.form";
			
		}
		function closeAction(id) {
			
			window.location.href="${path }/admin/modifyActionStatus.form?id="+id;
		}
		function removeAction(id) {
			//window.location.href="${path }/admin/removeAction.form?id="+id; 没有提示，
			if(confirm('确定删除吗?')){
			return true;
			}else{
			return false;
			}
		}
  </script> -->
  
  <body>
  	<fieldset class="layui-elem-field layui-field-title" >
	  <legend>历史活动</legend>
	</fieldset>
	
	
	
  	<table class="layui-table" lay-even="" lay-skin="row">
  		<thead style="text-align: center;">
		    <tr>
		    	<th>序号</th>
		    	<th>名字</th>
		    	<th>活动介绍</th>
		    	<th>创建时间</th>
		    	<th>活动状态</th>
		    	
		    </tr>
	    </thead>
	    <c:if test="${empty lists}">
    		<tr>
    			<td colspan='5' style='color:red;font-size:9pt; text-align: center'>没有查到</td>
    		</tr>
    	</c:if>
	    <c:if test="${not empty lists}">
    		
    			<c:forEach var='e' items="${lists }" varStatus="vs" >
	    			<tr>
	    				<td>${vs.count }</td>
	    				<td>${e.name }</td>
	    				<td>${e.introduction }</td>
	    				<td><fmt:formatDate value="${e.creatTime }" pattern="yyyy-MM-dd " /></td>
	    				<td>${e.actionStatus.statusName }</td>
	    				
	    			</tr>
    			</c:forEach>
    	</c:if>
    </table>
   <div id="demo1"></div>
 <script >
  layui.use(['laypage', 'layer'], function(){
  var laypage = layui.laypage,layer = layui.layer, $ = layui.jquery;
  var nums = 5; //每页出现的数据量
  var pages= "${pageAll }";//数据总数
  //调用分页
  laypage({
    cont: 'demo1'
    ,pages:pages/nums//总页数
    ,groups:8 
    ,jump: function(obj,first){
	    if(!first){
	        layer.msg('第 '+ obj.curr +' 页');
	        $("#showtable").load("${path }/admin/queryAdminOperatePage.form?pageNow="+obj.curr); 
	      	 
	      }
	  } 
     /*	var pageNow = obj.curr;
     	
     	if (first) {
			
		} */
  });
  
});
</script> 
  </body>
</html>
