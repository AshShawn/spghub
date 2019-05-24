<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>增加子话题</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<link rel="stylesheet" href="${pageContext.request.contextPath }/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/layui/css/userMain.css"
	type="text/css" rel="stylesheet">
	<script src="${pageContext.request.contextPath }/layui/layui.js" charset="utf-8"></script>
	<script type="text/javascript">
		function personal() {
			window.location = "${pageContext.request.contextPath}/user/userShow.form";
		}
	
		function actionCenter() {
			window.location = "${pageContext.request.contextPath}/user/queryAction.form";
		}
		
		function childTopic() {
			window.location = "${pageContext.request.contextPath}/user/childTopic.form";
		}
		
		function headPage(){
			window.location="${pageContext.request.contextPath}/user/userMain.form";
		
		}
	
	</script>
	<script type="text/javascript">
	//文本编辑器
		layui.use('layedit', function() {
			var layedit=layui.layedit,$=layui.jquery; //导航的hover效果、二级菜单等功能，需要依赖element模块
			var index = layedit.build('LAY_demo1');
			
			$("#right").height($("#left").height());
			
			layedit.sync(index);
			
			
		});
	//导航
		layui.use('element', function() {
			var element = layui.element();
			
			element.on('nav(demo)', function(elem) {
				//console.log(elem)
				layer.msg(elem.text());
				});
			
		});
		
	</script>
	<script type="text/javascript">
		function validate(){
		  
		 var fz=document.getElementById('title').value;
		 var zz=document.getElementById('select').value;
			if(fz==''){
				alert('请您先输入标题！！！');
				return false;
			}else{
				if(zz==''){
					alert('请您选择父话题');
					return false;
				}
				else{
					return true;
				}
				
			}
			
		}
	</script>
  </head>
  
  <body>
  	<div class="head-nav">
		<div class="head-nav-logo">
			<div class="layui-inline">
				<img src="${pageContext.request.contextPath }/User-images/logo.jpg" class="layui-circle"
					style="width:50px">

			</div>
			<span id="sgphub">SgpHub</span>
		</div>

		<div class="head-nav-search">
			<form class="layui-form layui-form-pane" action="${pageContext.request.contextPath }/servicer/search.form" method="post">
				<div class="layui-form-item">
					<label class="layui-form-label" style="width: 60px;"> <i
						class="layui-icon"
						style="font-size: 20px; color: gray;text-align: left;">&#xe615;</i>
					</label>
					<div class="layui-input-inline">
						<input name="search" lay-verify="required" placeholder="输入关键字搜索"
							autocomplete="off" class="layui-input" type="text">
						<input type="hidden" name="ptid">
					</div>
				</div>
			</form>
		</div>
		<div class="head-nav-button">
			<div class="head-nav-buttongroup">
				<button class="layui-btn layui-btn-primary layui-btn-radius" onclick="headPage()">首页</button>
				<button class="layui-btn layui-btn-radius" onclick="personal()">我的主页</button>
				<button class="layui-btn layui-btn-normal layui-btn-radius" onclick="childTopic()"">话题中心</button>
				<button class="layui-btn layui-btn-warm layui-btn-radius" onclick="actionCenter()">活动中心</button>
				<button class="layui-btn layui-btn-radius">我要提问</button>
			</div>
		</div>
	</div>
	<div style="background-color: #CBC9C9;width: 100%;height:100%">
		<div style="width:70%;height: 100%;margin-left: 150px; background-color: white">
			<form  action="${pageContext.request.contextPath }/user/addChildTopic.form" method="post" onSubmit="return validate()" >
				
				<div class="layui-input-block" >
					<label>请增加子话题标题</label>
					<input name="name" 
						placeholder="请输入标题" class="layui-input" type="text" id="title"
						style="width: 500px;"/>&nbsp;&nbsp;&nbsp;&nbsp;
				</div>
				
				<div style="margin-left:114px;width: 500px ">
					<label>请选择父话题</label>
					<select name="parentTopic.id" id="select">
						<option value=''>请选择</option>
						<c:forEach var='e' items='${topics }'>
							<option value='${e.id }'>${e.name }</option>
						</c:forEach>
					</select>
				</div>	
				<div style="width: 80%;margin-left: auto;margin-right: auto;margin-top:20px; ">
					<label>请添加描述</label>
					<input type="text"  class="layui-textarea" id="LAY_demo1" name="introduction"/>
				</div>
				<input class="layui-btn  layui-btn-big layui-btn-radius" style="margin-left: 760px;width:100px" type="submit" value="增加"/>
		 </form>
		</div>
	</div>
  </body>
</html>
