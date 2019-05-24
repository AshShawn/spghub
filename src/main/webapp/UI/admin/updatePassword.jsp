<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>SgpHub后台管理</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">   
	<link rel="stylesheet" href="${path }/layui/css/layui.css"  media="all">
	<script type="text/javascript" src="jquery-1.11.2.js"></script>
  </head>
  
  <body>
  	<blockquote class="layui-elem-quote layui-quote-nm">
		修改密码
	</blockquote>
  	<div id="body">	
	  	
	  	<div id="center">
	  		<p>
	  		<div class="layui-form-item">
	  			<form class="layui-form" action="${pageContext.request.contextPath }/admin/updatePassword.form" method="post" onsubmit="return toVaild()">
	  			<table style="height:250px;">
	  				<tr>
	  					<td><label class="layui-form-label">用 户 名：</label></td>
	  					<td>
	  						<input class="layui-input" type="text" name="name" value="${admininfo.name}" readonly>
	  					</td>
	  				</tr>
	  				<tr>
	  					<td><label class="layui-form-label">密 码：</label></td>
	  					<td>
	  						<input class="layui-input" lay-verify="password" autocomplete="off" id="password" type="password" name="password" value="">
	  						<span id="uP" style="color:red;"></span>
	  					</td>
	  				</tr>
	  				<tr>
	  					<td><label class="layui-form-label">重复密码：</label></td>
	  					<td>
	  						<input class="layui-input" lay-verify="repassword" id="repassword" type="password" name="repassword" value="">
	  						<span id="uR" style="color:red;"></span>
	  					</td>
	  				</tr>
	  				<tr>	  					
	  					<td colspan="2"><input class="layui-btn layui-btn-primary layui-btn-radius" type="submit" value="修改密码">
	  					</td>
	  				</tr>
	  			</table>
	  			</form>
	  		</div>
	  	
	  	</div>
  	</div>
  <script type="text/javascript">

	  	$("#password").blur(function(){
	  		if(document.getElementById("password").value==""){ 
	  		document.getElementById("uP").innerHTML = "密码不能为空！";

	  		}else if(document.getElementById("password").value.length<3||document.getElementById("password").value.length>12){ 
	  		document.getElementById("uP").innerHTML = "密码必须3到12位！";

	  		}else{
	  			document.getElementById("uP").innerHTML = "";
	  		}
		});
	  	$("#repassword").blur(function(){
			if (document.getElementById("password").value != document.getElementById("repassword").value) {

			  document.getElementById("uR").innerHTML = "密码不一致！";			  

			  document.getElementById("uR").innerHTML = "密码不一致！";		  

  			}else{
	  			document.getElementById("uR").innerHTML = "";
	  		}
		});
	  		function disp_confirm()
  			{
  				if(confirm('确定要执行此操作吗?')) { 
        		return true; 
    			} 
    			return false; 
  			}
	  		function photo(){
	  			var n=document.getElementById("upphoto");
	  			n.style.display="block";
	  		}
	  		function toVaild()
  			{ 			 
        		if(document.getElementById("uR").innerHTML == ""&&document.getElementById("uP").innerHTML == ""){
                     alert("校验成功，之后进行提交");
                     return true;
                 }else{
                     alert("校验失败，不能提交");
                     return false;
                 }
  			}
  			
  	</script>
  
  
  </body>
</html>
