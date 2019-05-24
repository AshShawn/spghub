<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>任免吧务</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<link rel="stylesheet" href="${path }/layui/css/layui.css"  media="all">
	<script type="text/javascript" src="${pageContext.request.contextPath }/UI/admin/jquery-1.11.2.js"></script>
	<script type="text/javascript">
		
		function validateMessage(){
		    
		     var select=document.getElementById("testPermission").value;
		     var input=document.getElementById("testUser").value;
		     
		     if(select==""){
		     	document.getElementById("fzz").innerHTML="请选择";
		     	return false;
		     }
		     else if(!/^\d+$/.test(input)){
		     	document.getElementById("fz").innerHTML="请输入正确的ID";
		     	return false;
		     }
		     else{
		     	return true;
		     }
		     
		     
		     
			
		}
		
		
		function confirmAct() 
		{ 
		
			
		    if(confirm('确定要执行此操作吗?')) 
		    { 
		        return true; 
		    } 
		    return false; 
		} 
		
		
		
	
	
	</script>
  </head>
 
<body>

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

	<blockquote class="layui-elem-quote layui-quote-nm">		 
		  吧务管理
	</blockquote>


  <table class="layui-table" lay-even="" lay-skin="row" >
  <thead style="text-align: center;">
    <tr>
        <th>用户ID</th>
		<th>吧主姓名</th>
		<th>贴吧名称</th>
		<th>贴吧职位</th>
		<th>操作权限</th>	
    </tr> 
  </thead>
  <tbody>
   <c:if test="${empty lists }">
  			<tr>
    			<td colspan='5' style='color:red;font-size:9pt; text-align: center'>没有查到</td>
    		</tr>
  		</c:if>
  		<c:if test="${not empty lists }">
  			
    			<c:forEach var='e' items='${lists}'>
	    			<tr>
	    				<td>${e.user.id }</td>
	    				<td>${e.user.username }</td>
	    				<td>${e.parentTopic.name}</td>
	    				<td>${e.topicPermession.permissionName}</td>
	    				<td><a href="${path }/admin/updateServicer.form?id=${e.id }" onclick="return confirmAct();">卸任</a></td>
	    			</tr>
    			</c:forEach> 		
  		</c:if>
  </tbody>
</table> 

  <blockquote class="layui-elem-quote layui-quote-nm">		 
		  增加吧务请慎重，如因吧务任免造成的纠纷后果自负。
  </blockquote>
  <form action="${pageContext.request.contextPath }/admin/addServicer.form" method="post"  onsubmit="return validateMessage()">
  <div class="layui-form-item">
    <label class="layui-form-label">用户ID</label>
    <div class="layui-input-block" style="width:200px">
      <input lay-verify="title" autocomplete="off" placeholder="请输入用户ID" class="layui-input" type="text" name="user.id" id="testUser"><span id="fz" style="color:red"></span>
    </div>
  </div>
        <div class="layui-form-item">
	    <label class="layui-form-label">贴吧名称</label>
	    <div class="layui-input-block">
	      <select lay-filter="aihao" name="parentTopic.id" id="testPermission">
	        <option value="">请选择</option>
	        <c:forEach var='d' items='${parentTopics }'>
	    				<option value='${d.id }'>${d.name }</option>
	    	</c:forEach>
	      </select><span id="fzz" style="color:red"></span>
	      
	    </div>
        </div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit"  value="增加吧务"  class="layui-btn layui-btn-primary layui-btn-radius"/>
  	</form>
    <script>
    	$(document).ready(function(){ 
    		var info  = "${info }";
    		if (info == 1) {
				alert("该用户未关注此话题！");
			}
        $("#testUser").blur(function(){
              //Ajax调用处理
            if($("#testUser").val()!=""){
            	 $.ajax({
               type: "POST",
               url: "${pageContext.request.contextPath}/admin/testUser.form",
               data: "id="+$("#testUser").val(),
               success: function(data){
                        if(data=="none"){
                        	alert("没有此用户");
                        	document.getElementById("testUser").value="";
                        }
                  }
            });
            }
           
            
         });
         });
	
    </script>
  
  </body>
</html>
