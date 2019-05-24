<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>个人中心</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">

<link href="${pageContext.request.contextPath }/layui/css/userHome.css"
	type="text/css" rel="stylesheet">
<link rel="stylesheet" href="${path }/layui/css/layui.css" media="all">
<script type="text/javascript" src="jquery-1.11.2.js"></script>
</head>

<body>
	<div class="post-top">
		<div class="top-nav" style="height:12%">
			<span class="layui-breadcrumb" lay-separator="|"
				style="margin-left: 60%;font-size: 20px;"> 
				<a href="${pageContext.request.contextPath }/user/userMain.form">首页</a>
				<a href="${pageContext.request.contextPath }/user/userHomeReply.form">个人中心</a> 
				<a href="${pageContext.request.contextPath }/user/userShow.form">我的主页</a> 
				<a href="${pageContext.request.contextPath}/user/childTopic.form">话题中心</a> 
				<a href="">活动中心</a> 
				<a href="${pageContext.request.contextPath }/user/exit.form">退出</a>
			</span>
		</div>
		<hr />
		<div class="top-search">
			<span id="sgphub">SgpHub</span>
			<form class="layui-form" action="" style="margin-left: 300px;">
				<div class="layui-form-item">
					<div class="layui-input-block">
						<input name="search" lautocomplete="off" placeholder="请输入搜索内容"
							class="layui-input" type="text"
							style="margin-top:-20px;width: 600px;float: left;"> 
							<button class="layui-btn" style="float: left;margin-top:-20px;margin-left: 10px;" lay-submit="" lay-filter="demo1">搜素</button>
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
				<div class="advertisement">
					<img class="img "
						src="${pageContext.request.contextPath }/UI/images/u25.png">
				</div>
				<div class="layui-tab">
					<ul class="layui-tab-title" style="margin-left: 10px;">
						<li class="layui-this" lay-id="11"><a
							href="${pageContext.request.contextPath }/user/MyHMReply.form">我回复的</a></li>
						<li lay-id="22"><a
							href="${pageContext.request.contextPath }/user/myUHPost.form">我发过的</a></li>
						<li lay-id="33"><a
							href="${pageContext.request.contextPath }/user/myBrowsePost.form">近期浏览</a></li>
					</ul>
					<div class="layui-tab-content">
						<!-- 回复我的 -->
						<div class="layui-tab-item layui-show">
							<div>按主题查看</div>
							<hr>
							<div id="showMyReply">
								<c:forEach var="a" items="${replies }">
									<div class="post">
										<div class="replyMessage">
											<span class="talking">我的回复：${a.replyText}</span>
										</div>
										<span class="time"><fmt:formatDate
												value="${a.creatTime}" pattern="yyyy-MM-dd HH:mm:ss" /></span><br />
										<div class="replyTitle">
											<span class="title">我回复的主题:</span> <span class="titleName"><a
											href="${path }/user/showPostById.form?postId=${a.post.id }"
											target="_blank">${a.post.parentTopic.name}>${a.post.childTopic.name
												}</a></span>
										</div>
									</div>
								</c:forEach>
							</div>
							<div id="demo1"></div>
						</div>
					</div>
				</div>
			</div>
			<div class="right">
				<div>
					<span class="message">个人信息</span> <a
						href="${pageContext.request.contextPath }/UI/user/setUserMessage.jsp"
						class="edit">[编辑]</a><br />
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
					<a href="${pageContext.request.contextPath }/user/UHFriends.form">关注我的</a>
				</div>
				<div class="d_check">
					<a
						href="${pageContext.request.contextPath }/user/userHomeFocus.form">我关注的</a>
				</div>
				<div class="d_check" style="background-color: white;">
					<a
						href="${pageContext.request.contextPath }/user/MyHMReply.form">我回复的</a>
				</div>
				<div class="d_check">
					<a
						href="${pageContext.request.contextPath }/user/myUHPost.form">我发过的</a>
				</div>
				<div class="d_check">
					<a
						href="${pageContext.request.contextPath }/user/myBrowsePost.form">近期浏览</a>
				</div>
			</div>
		</div>
	</div>
	<script src="${path }/layui/layui.js" charset="utf-8"></script>
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
		layui.use([ 'laypage', 'layer' ], function() {
			var laypage = layui.laypage, layer = layui.layer, $ = layui.jquery;
			//每页出现的数据量
			var pages = "${pageAll }";//数据总数
			//调用分页
			laypage({
				cont : 'demo1',
				pages : pages//总页数
				,
				groups : 2,
				jump : function(obj, first) {
					if (!first) {
						layer.msg('第 ' + obj.curr + ' 页');
						$("#showMyReply").load(
								"${path }/user/MyHMReplyPage.form?pageNow="
										+ obj.curr);

					}
				}

			});

		});
	</script>
</body>
</html>
