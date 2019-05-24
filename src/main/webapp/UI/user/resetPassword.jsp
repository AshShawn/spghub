<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    
    <title>My JSP 'resetPassword.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<link rel="stylesheet" href="${pageContext.request.contextPath }/layui/css/layui.css" media="all">
<script src="${pageContext.request.contextPath }/layui/layui.js" charset="utf-8"></script>
	<style type="text/css">
	
	  #mydiv{
	  margin: auto;
	  width:300px;
	  height:400px;
	  margin-top: 100px;
	  
	  }
	  #span1{
	  	font-size: 16px;
	  	color: #19A093;
	  	
	  }
	  .layui-btn{
	  	margin-left: -58px;
	  }
	</style>


  </head>
  
  
  <body >
  	<div id="mydiv">
  	<span id="span1">找回密码</span>
	  	<form class="layui-form layui-form-pane" action="${path }/UI/user/login.jsp" method="post">
	  		<div class="layui-form-item">
							<label class="layui-form-label"
								style="width:60px;text-align: left;"><i
								class="layui-icon" style="font-size: 20px; color: gray">&#xe611;</i>
							</label>
						<div class="layui-input-inline">
							<input name="password" lay-verify="password" placeholder="请输入新密码" autocomplete="off"
									class="layui-input" type="password">
					  </div>
					  <div class="layui-form-mid layui-word-aux">密码长度4-16位</div>
					</div>
					
					<div class="layui-form-item">
							<label class="layui-form-label"
								style="width:60px;text-align: left;"><i
								class="layui-icon" style="font-size: 20px; color: gray">&#xe611;</i>
							</label>
						<div class="layui-input-inline">
							<input name="password" lay-verify="passwordAgain" placeholder="请再次输入密码" autocomplete="off"
									class="layui-input" type="password">
					  </div>
					  <div class="layui-form-mid layui-word-aux">两次密码必须一致</div>
					</div>
					
					<div class="layui-form-item">
				   
					    <div class="layui-input-block">
					      <button class="layui-btn" style="width:88px;" lay-submit="" lay-filter="demo1">修改</button>
					      
					    </div>
				   </div>
	  </form>
  </div>
  
  </body>
</html>
