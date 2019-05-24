<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>My JSP 'userhome.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">

<link href="${pageContext.request.contextPath }/layui/css/userHome.css"
	type="text/css" rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/layui/css/layui.css"
	media="all">
<script type="text/javascript" src="jquery-1.11.2.js"></script>
</head>

<body>
	<div class="post-top">
		<div class="top-nav" style="height:12%">
			<span class="layui-breadcrumb" lay-separator="|"
				style="margin-left: 60%;font-size: 20px;"> <a href="">首页</a>
				<a href="">个人中心</a> <a href="">我的主页</a> <a href="">话题中心</a> <a
				href="">活动中心</a> <a href="">退出</a>
			</span>
		</div>
		<hr />
		<div class="top-search">
			<span id="sgphub">SgpHub</span>
			<form class="layui-form" action="${path }/servicer/search.form" style="margin-left: 300px;">
				<div class="layui-form-item">
					<div class="layui-input-block">
						<input name="search" lautocomplete="off" placeholder="请输入搜索内容"
							class="layui-input" type="text"
							style="margin-top:-20px;width: 600px;float: left;"> <a
							href="#" class="layui-btn" target="_blank"
							style="float: left;margin-top:-20px;margin-left: 10px;">点此搜索</a>
					</div>

				</div>
			</form>
		</div>
	</div>
	<div class="d_bar">
		<div class="d_bars">
			<ul class="v_bars">
				<li><a class="index"
					href="${pageContext.request.contextPath }/user/userMain.form">贴吧首页</a></li>
				<li><a href="" style="background-color: #1E54A9;">我的帖子</a></li>
			</ul>
		</div>
	</div>
	<div class="bodyHome">
		<div class="whole">
			<div class="left">
				<div class="this_s_form">
					<form
						action="${pageContext.request.contextPath }/user/setUserMessage.form"
						method="post" class="layui-form">
						<div class="layui-form-item">
							<label class="layui-form-label">昵称</label>
							<div class="layui-input-block">
								<input type="text" name="username" value="${userInfo.username }"
									required lay-verify="username" autocomplete="off"
									class="layui-input"> <input type="hidden" name="id"
									value="${userInfo.id }">
							</div>
						</div>
						<div class="layui-inline">
							<label class="layui-form-label">生日:</label>
							<div class="layui-input-inline">
								<input name="birthday" value="${userInfo.birthday}" id="date"
									lay-verify="birthday" placeholder="yyyy-mm-dd"
									autocomplete="off" class="layui-input"
									onclick="layui.laydate({elem: this})" type="text">
							</div>
						</div>  
						 <div class="layui-form-item">
							<label class="layui-form-label">性别</label>
							<div class="layui-input-block">
								<c:if test="${userInfo.sex=='男'}">
									<input type="radio" name="sex" value="男" title="男" checked>
									<input type="radio" name="sex" value="女" title="女">
								</c:if>
								<c:if test="${userInfo.sex=='女'}">
									<input type="radio" name="sex" value="男" title="男">
									<input type="radio" name="sex" value="女" title="女" checked>
								</c:if>
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">手机号</label>
							<div class="layui-input-block">
								<input type="text" name="account.tel" value="${userInfo.account.tel}"
									required lay-verify="required" placeholder="请输入手机号"
									autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">邮箱</label>
							<div class="layui-input-block">
								<input type="text" name="account.email"
									value="${userInfo.account.email}" required
									lay-verify="required" placeholder="请输入邮箱" autocomplete="off"
									class="layui-input">
							</div>
						</div>
						<br/>
						<div class="layui-form-item">
							<div class="layui-input-block">
							<input class="layui-btn"   style="width:60px" type="submit"
				 value="保存" />
							<input class="layui-btn layui-btn-primary"   style="width:60px" type="reset"
				 value="取消" />	
								
							</div>
						</div>
					</form>
				</div>
			</div>
			<div class="right">
				<div>
					<span class="message">个人信息</span> <a href="${pageContext.request.contextPath }/UI/user/setUserMessage.jsp" class="edit">[编辑]</a><br />
					<hr class="line_first">
					<div class="p_message">
						<div class="photo">
							<img class="img "
								src="${pageContext.request.contextPath }/UI/images/u29.jpg">
						</div>
						<div class="note">
							<span class="message">${userInfo.username}</span><br /> <span
								class="message">粉丝：${userInfo.fansCount}</span><br /> <span
								class="message">关注：${userInfo.focusPostCount}</span><br />
						</div>
					</div>
				</div>

				<hr class="line_second">
				<div class="d_check">
					<a href="${pageContext.request.contextPath }/user/userShow.form">首页</a>
				</div>
				<div class="d_check">
					<a
						href="${pageContext.request.contextPath }/user/userHomeReply.form"
						style="color:black;">我的帖子</a>
				</div>
				<div class="d_check">
					<a
						href="${pageContext.request.contextPath }/user/UHcollectPost.form">我的收藏</a>
				</div>
				<div class="d_check">
					<a href="${pageContext.request.contextPath }/user/UHFriends.form">好友申请</a>
				</div>
				<div class="d_check">
					<a href="">个人设置</a>
				</div>
			</div>
		</div>
	</div>
	<script src="${pageContext.request.contextPath }/layui/layui.js"
		charset="utf-8"></script>
	<script>
		//文本编辑器
		layui.use('layedit', function() {
			var layedit = layui.layedit, $ = layui.jquery; //导航的hover效果、二级菜单等功能，需要依赖element模块
			var index = layedit.build('LAY_demo1');

		});
		//导航
		layui.use('element', function() {
			var element = layui.element();
			//监听导航点击

			element.on('nav(demo)', function(elem) {
				//console.log(elem)
				layer.msg(elem.text());
			});

		});

		layui.use([ 'form', 'layer', 'laydate' ],function() {
							var form = layui.form(), layer = layui.layer, $ = layui.jquery;
							//layer.msg("表单验证");
							form.verify({
								birthday : function(value) {
									if (value.length == 0 || value == "") {
										return '时间不能为空';
									}
								}

							});
							
						});
	</script>
</body>
</html>
