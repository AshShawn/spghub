<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>后台管理界面</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <link rel="stylesheet" href="${path }/layui/css/layui.css"  media="all">
  <script type="text/javascript" src="jquery-1.11.2.js"></script>
  <style type="text/css">
 	 /* {} */
  	body{
  		margin: 0;
  		min-width: 1366px;
  		max-height: 768px;
  	}
  	#nav{
  		width:100%;	

  		height:80px;
  		background-color:#006666;	

  		height:60px;
  		background-color: #23262E;	

  	}
  	
  	#title{
  		font-family:Comic Sans MS;
  		line-height:60px;
  		font-size: 35px;
  		color: white;
  		margin-left: 40px;
  		
  	} 
  	#left{
  		width:200px;
  		height:556px;
  		background-color: #393D49;
  		float: left;
  	}
  	.empty{
  		width:200px;
  		height:60px;
  		background-color: #393D49;
  	}
	#middle{
		width: 966px;
		height:536px;
		
		float: left;
	}
	#right{
		width: 200px;
		height:536px;
	}
	iframe{
		width: 900px;
		height:506px;
		border-style:none;
		margin-left: 33px;
		
	}
  	
  </style>
</head>
<body>
	<div id="nav">
		 <span id="title">SgpHub</span>		 
	</div>
	<div id="left">
		<div class="empty"></div>
		<ul class="layui-nav layui-nav-tree" lay-filter="demo">

		  <li class="layui-nav-item"><a href="javascript:void(0)" id="index">首页</a></li>

		    <li class="layui-nav-item">
		    <a href="javascript:;">基本设置</a>
		    <dl class="layui-nav-child">
		      <dd><a href="javascript:;">个人信息</a></dd>
		      <dd><a href="javascript:;" id="updatePassword">修改密码</a></dd>
		    </dl>
		  </li>
		  <li class="layui-nav-item">
		    <a href="javascript:;">后台管理</a>
		    <dl class="layui-nav-child">
		      <dd><a href="javascript:;" id="photo">设置首页轮播图</a></dd>
		      <dd><a href="javascript:void(0)" id="action">发起活动</a></dd>
		      <dd><a href="javascript:;" id="leader">吧务任免</a></dd>
		      <dd><a href="javascript:void(0)" id="queryaction">查询历史活动</a></dd>
		    </dl>
		  </li>
		  <li class="layui-nav-item"><a href="">吧务操作记录</a></li>
		  <li class="layui-nav-item"><a href="javascript:void(0)" id="servicer">后台操作记录</a></li>
		  <li class="layui-nav-item"><a href="javascript:void(0)"  id="contact">联系我们</a></li>
		  <li class="layui-nav-item"><a href="javascript:void(0)"  id="exit">退出</a></li>
		</ul>
	</div>
	
	
	<div id="middle">
		<fieldset class="layui-elem-field layui-field-title">
		  <legend>SgpHub技术支持</legend>
		  <div class="layui-field-box">
		  	  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ArIrelia团队为您提供服务
		  </div>
		</fieldset>
		<iframe src="${path }/UI/admin/index.jsp"></iframe>		 		
	</div>
	
	
	<div id="right"></div>

          
<script src="${path }/layui/layui.js" charset="utf-8"></script>
	<script>
		layui.use('element', function(){
		  var element = layui.element(); //导航的hover效果、二级菜单等功能，需要依赖element模块
		  
		  //监听导航点击
		  element.on('nav(demo)', function(elem){
		    //console.log(elem)
		    layer.msg(elem.text());
		  });
		});
	</script>

<script type="text/javascript">
	$(document).ready(function() {
		$("#photo").click(function() {			
			$("iframe").attr("src","${pageContext.request.contextPath }/admin/showPhoto.form");		
		});
		
		$("#leader").click(function() {				
			$("iframe").attr("src","${pageContext.request.contextPath}/admin/queryService.form");		
		});
		$("#servicer").click(function() {				
			$("iframe").attr("src","${path }/admin/queryAdminOperate.form");		
		});
		$("#updatePassword").click(function() {				
			$("iframe").attr("src","${pageContext.request.contextPath}/UI/admin/updatePassword.jsp");		
		});
		$("#index").click(function() {				
			$("iframe").attr("src","${pageContext.request.contextPath}/UI/admin/index.jsp");		
		});
		$("#contact").click(function() {				
			$("iframe").attr("src","${pageContext.request.contextPath}/UI/admin/contact.jsp");		
		});
	});

	
	$(document).ready(function() {
		$("#action").click(function() {			
			$("iframe").attr("src","${pageContext.request.contextPath}/admin/queryActionByStatus.form");//查询正在进行的活动		
		});
		
	});
	
	$(document).ready(function() {
		$("#queryaction").click(function() {
				
			$("iframe").attr("src","${path }/admin/queryColsedAction.form");		
		});
		
	});
	$(document).ready(function() {
		$("#exit").click(function() {	
  				if(confirm('确定要退出吗?')) {
 				location.href = "${pageContext.request.contextPath}"; 
        		return true; 
    			} 
    			return false; 	
		});
		
	});
	

</script>
</body>
</html>