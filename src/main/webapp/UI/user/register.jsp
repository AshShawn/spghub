<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>SgpHub注册页面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
<script type="text/javascript" src="${pageContext.request.contextPath }/UI/admin/jquery-1.11.2.js"></script>	
  
  <link rel="stylesheet" href="${path }/layui/css/layui.css" media="all">
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
	color: #18A093;
}
.layui-btn{
	margin-left: -108px;
}
</style>
<script type="text/javascript">
		/* $(document).ready(function(){
		$("#selectAccount").blur(function(){
				var input = document.getElementById("selectAccount");
				alert(input.value);
				var name =input.value;
				var url ="${path }/servicer/registerTest.form?name="+name;
				$.get(url,function(data){
					if(data =='0'){
						alert('用户名已存在');
					}
				
				});
		}); 
		});
 */
</script>

</head>

  <body>
  	
		<div id="form">
		<span id="span1">用户注册</span>
			<form class="layui-form layui-form-pane" action="${path }/user/register.form" method="post">
				<div class="layui-form-item">
					<label class="layui-form-label"
							style="width:60px;text-align: left;"><i
							class="layui-icon" style="font-size: 20px; color: gray;">&#xe612;</i>
					</label>
					<div class="layui-input-inline">
						<input name="account" lay-verify="name" id="selectAccount" placeholder="请输入用户名"
							autocomplete="off" class="layui-input" type="text">
					</div>
				</div>
				
				<div class="layui-form-item">
						<label class="layui-form-label"
							style="width:60px;text-align: left;"><i
							class="layui-icon" style="font-size: 20px; color: gray">&#xe611;</i>
						</label>
					<div class="layui-input-inline">
						<input id="password" name="password" lay-verify="password" placeholder="请输入密码" autocomplete="off"
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
						<input id="passwordAgain" name="password1" lay-verify="password" placeholder="请再次输入密码" autocomplete="off"
								class="layui-input" type="password">
				  </div>
				  <div class="layui-form-mid layui-word-aux">两次密码必须一致</div>
				</div>
				
				
				
				<div class="layui-form-item">
				      <label class="layui-form-label"
							style="width:60px;text-align: left;"><i
							class="layui-icon" style="font-size: 20px; color: gray">&#xe63b;</i>
						</label>
				      <div class="layui-input-inline">
				        <input name="tel" lay-verify="phone" autocomplete="off" class="layui-input" placeholder="请输入手机号" type="tel">
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
			    
			    <!-- <div class="layui-form-item">
						<label class="layui-form-label"style="width:60px;text-align: left;">
							<i class="layui-icon" style="font-size: 20px; color: gray">&#xe637;</i>
						</label>
					<div class="layui-input-inline">
						<input name="user.birthday" id="date" lay-verify="creatTime"  placeholder="请选择您的生日"
							placeholder="yyyy-mm-dd" autocomplete="off" class="layui-input"
							onclick="layui.laydate({elem: this})" type="text">
					</div>
					<div class="layui-form-mid layui-word-aux">点击输入框选择日期</div>
				</div>
			  
				<div class="layui-form-item">
			    		<label class="layui-form-label"
							style="width:60px;text-align: left;"><i
							class="layui-icon" style="font-size: 15px; color: gray"></i>
						</label>
				    <div class="layui-input-inline">
				      <input name="user.sex" value="男" title="男" checked type="radio">
				      <input name="user.sex" value="女" title="女" type="radio">
				    </div>
			   </div>  -->
			   
			   <div class="layui-form-item">
			   
							<!-- <i class="layui-icon" style="font-size: 20px; color: gray">&#xe637;</i> -->
				    <div class="layui-input-block">
				      <button class="layui-btn" lay-submit="" lay-filter="demo1" id="ccc">立即注册</button>
				      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
				    </div>
			   </div>
				
			</form>
		</div>
	<script src="${path }/layui/layui.js" charset="utf-8"></script>
	<script>
		layui.use(['form', 'layer', 'laydate'], function(){
		  var form = layui.form()
		  ,layer = layui.layer
		  ,laydate = layui.laydate
		  ,$=layui.jquery;
		  
		  form.verify({
				 creatTime: function(value) {
					if (value.length ==0||value=="") {
						return '时间不能为空';
					}
				}
				,password : [ /(.+){4,16}$/, '密码长度4-16位' ]
			});
			
		   form.on('submit(demo1)', function(data){
		  		var p1=$(password).val();
		  		var p2= $(passwordAgain).val();
		  		if(p1==p2){
		  			layer.msg("注册成功！");
		  			return true;
		  		}else{
		  			layer.msg("两次密码不同！");
		  			return false;
		  		}
		  });
		  
		 $(document).ready(function(){
		$("#selectAccount").blur(function(){
				var input = document.getElementById("selectAccount");
				//alert(input.value);
				var name =input.value;
				var url ="${path }/servicer/registerTest.form?name="+name;
				$.get(url,function(data){
					if(data =='0'){
						layer.msg("用户名已存在");
					}
				
				});
		}); 
		});
		
			  
		});
	</script>
  
  </body>
</html>
