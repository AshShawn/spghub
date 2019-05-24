<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>


<title>用户登录界面</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<link rel="stylesheet" href="${path }/layui/css/layui.css" media="all">
<style type="text/css">
body {
	margin: 0px;
	background-image: url(${path }/User-images/mainBg0.jpg);
	background-repeat: no-repeat;
	background-size: 100% 100%;
	min-height: 100%;
	min-width: 100%;
	
	
}

#name-logo {
	width: 860px;
	height: 60px;
	margin-left: 80px;
	margin-top: 40px;
}

#logo {
	border-radius: 120%;
	height: 60px;
	float: left;
}

#left {
	float: left;
	width: 64%;	
	z-index: 1;
	
}

.right {
	float: left;
	width:36% ;
	height:100%;
	background-size: 100% 100%;
	background-repeat:no-repeat;
	background-image: url(${path }/User-images/mainBg0.jpg);
	filter: blur(10px);
	z-index: 1;
	
}

#title {
	font-family: Comic Sans MS;
	letter-spacing: -3px;
	font-size: 40px;
	color: #AFC1CE;
	margin-left: 10px;
}

#text {
	width: 860px;
	height: 350px;
}

#p1 {
	margin-left: 350px;
	margin-top: 140px;
	font-size: 70px;
	color: white;
	font-weight: bolder;
	font-family: STKaiti;
}

#p2 {
	margin-left: 400px;
	font-size: 30px;
	color: white;
	font-family: Microsoft JhengHei;
}

#copyright {
	width: 100%;
}

#login {
	position: absolute;
	width: 480px;
	height: 650px;
	z-index: 22;
	margin-left: 67%;
}

.icon {
	height: 30px;
	text-align: right;
	margin-top: 80px;
	
}

#form {
	margin-top: 50px;
}

#span1 {
	color: white;
	font-size: 16px;
	font-weight: bold;
	margin-left: 80px;
	position: relative;
	top: 14px;
}

#language {
	color: white;
	font-size: 14px;
	margin-left: 100px;
	position: relative;
	top: 14px;
}

form {
	margin-top: 40px;
}

div [class=layui-form-item] {
	margin-left: 80px;
	margin-top: 20px;
}

a {
	font-size: 14px;
	color: white;
	position: relative;
}

#forget {
	margin-left: 80px;
}

#register {
	margin-left: 120px;
}
</style>

</head>


<body>
	<div id="left">

		<div id="name-logo">
		<img alt="" id="logo"
				src="${path }/User-images/logo.jpg">
			<span id="title">SgpHub</span> 
		</div>

		<div id="text">
			<p id="p1">这里</p>
			<p id="p2">不仅仅是技术论坛</p>
		</div>
		<div id="copyright">
			<div style="width:100%;height:70px;"></div>
			<p style="height: 30px;
	font-size: 15px;
	margin-left: 30px;
	font-family: Comic Sans MS;
	color: white;">SgpHub.copy;Copyright 2016-2017 deserved</p>
		</div>
	</div>

	<div class="right"></div>
	<div id="login">
		<div class="icon">
			<i class="layui-icon"
				style="font-size: 20px; color: white;margin-right:20px;">&#xe600;</i>&nbsp;
			<i class="layui-icon"
				style="font-size: 20px; color: white;margin-right:80px;">&#xe641;</i>
		</div>
		<div class="loginAction">
			<div id="form">
				<span id="span1">用户登录</span><span id="language">Language:简体中文</span>
				<form class="layui-form layui-form-pane" action="${path }/user/userLogin.form" method="post">

					<div class="layui-form-item">
						<label class="layui-form-label"
							style="width:60px;text-align: left;"><i
							class="layui-icon" style="font-size: 20px; color: gray;">&#xe612;</i>
						</label>
						<div class="layui-input-inline">
							<input name="account" lay-verify="name" placeholder="请输入用户名"
								autocomplete="off" class="layui-input" type="text">
						</div>
					</div>



					<div class="layui-form-item">
						<label class="layui-form-label"
							style="width:60px;text-align: left;"><i
							class="layui-icon" style="font-size: 20px; color: gray">&#xe611;</i>
						</label>
						<div class="layui-input-inline">
							<input name="password" lay-verify="password" placeholder="请输入密码" autocomplete="off"
								class="layui-input" type="password">
						</div>
						<div class="layui-form-mid layui-word-aux">请务必填写用户名</div>
					</div>
						<div class="layui-input-block" style="margin-left: 70px;">
							<input name="like[game]" title="记住密码" type="checkbox"  >
						</div>
					
					<div class="layui-form-item">
						<button class="layui-btn" lay-submit="demo1" lay-filter="demo1"
							style="width:250px;">登录</button>
					</div>
					<a id="forget" href="${path }/UI/user/lostPassword.jsp">忘记密码</a><a id="register" href="${path }/UI/user/register.jsp">点击注册</a>

				</form>
			</div>
		</div>

	</div>






	<script src="${path }/layui/layui.js" charset="utf-8"></script>
	<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
	<script>
		layui.use([ 'form', 'layer' ], function() {
			var form = layui.form(), layer = layui.layer, $=layui.jquery;
			var info = "${info }";
			//自定义验证规则
			if (info==1) {
				layer.msg("用户名或密码不正确");
			} 
			form.verify({
				name : function(value) {
					if (value.length < 4) {
						return '用户名至少得4个字符啊';
					}
				}
				,password : [ /(.+){3,12}$/, '密码必须3到12位' ]
				
			});

		

			//监听提交
			/* form.on('submit(demo1)', function(data) {
				
				
				layer.msg("用户名或密码不正确");
				return true;
			}); */

		});
	</script>




</body>
</html>
