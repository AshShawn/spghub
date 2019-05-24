<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>忘记密码</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<script src="${pageContext.request.contextPath }/layui/layui.js" charset="utf-8"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/layui/css/layui.css" media="all">
<style type="text/css">
#form{
	width:388px;
	margin: auto;
	margin-top: 188px;
}
#span1{
	position:relative;
	top:-66px;
	right:-62px;
	font-size: 26px;
	color: #19A093;
}
.layui-btn{
	margin-left: -108px;
}
</style>
</head>
	<body>	
		<div id="form">
		<span id="span1">找回密码</span>
			<form class="layui-form layui-form-pane" action="${path }/UI/user/resetPassword.jsp" method="post">
				<div class="layui-form-item">
					<label class="layui-form-label"
							style="width:60px;text-align: left;"><i
							class="layui-icon" style="font-size: 20px; color: gray;">&#xe612;</i>
					</label>
					<div class="layui-input-inline">
						<input name="name" lay-verify="name" placeholder="请输入用户名"
							autocomplete="off" class="layui-input" type="text">
					</div>
				</div>
				
				<div class="layui-form-item">
				      <label class="layui-form-label"
							style="width:60px;text-align: left;"><i
							class="layui-icon" style="font-size: 20px; color: gray">&#xe63b;</i>
						</label>
				      <div class="layui-input-inline">
				        <input name="phone" lay-verify="phone" autocomplete="off" class="layui-input" placeholder="请输入手机号" type="tel">
				      </div>
				      <div class="layui-form-mid layui-word-aux">请正确填写手机号</div>
    		  	</div>
				
				<div class="layui-form-item">
			      		<label class="layui-form-label"
							style="width:60px;text-align: left;"><i
							class="layui-icon" style="font-size: 20px; color: gray">&#x1002;</i>
						</label>
				      <div class="layui-input-inline">
				        <input name="email" lay-verify="email" autocomplete="off" class="layui-input" placeholder="请填写邮箱" type="text">
				      </div>
				      <div class="layui-form-mid layui-word-aux">请正确填写邮箱</div>
			    </div>
			    
			  <!--   <div class="layui-form-item">
						<label class="layui-form-label"style="width:60px;text-align: left;">
							<i class="layui-icon" style="font-size: 20px; color: gray">&#xe637;</i>
						</label>
					<div class="layui-input-inline">
						<input name="creatTime" id="date" lay-verify="creatTime"  placeholder="请选择您的生日"
							placeholder="yyyy-mm-dd" autocomplete="off" class="layui-input"
							onclick="layui.laydate({elem: this})" type="text">
					</div>
					<div class="layui-form-mid layui-word-aux">点击输入框选择日期</div>
				</div> -->
			  
			<!-- 	<div class="layui-form-item">
			    		<label class="layui-form-label"
							style="width:60px;text-align: left;"><i
							class="layui-icon" style="font-size: 15px; color: gray"></i>
						</label>
				    <div class="layui-input-inline">
				      <input name="sex" value="男" title="男" checked type="radio">
				      <input name="sex" value="女" title="女" type="radio">
				    </div>
			   </div>  -->
			   
			   <div class="layui-form-item">
			   
				    <div class="layui-input-block">
				      <button style="width:100px;" class="layui-btn" lay-submit="" lay-filter="demo1">提交</button>
				      
				    </div>
			   </div>
				
			</form>
		</div>
	<script src="${pageContext.request.contextPath }/layui/layui.js" charset="utf-8"></script>
	<script>
		layui.use(['form', 'layedit', 'laydate'], function(){
		  var form = layui.form()
		  
		  ,$=layui.jquery;
		  
		  form.verify({
				 creatTime: function(value) {
					if (value.length ==0||value=="") {
						return '时间不能为空';
					}
				}
				
				
			});
			

		});
	</script>
  	</body>
</html>
