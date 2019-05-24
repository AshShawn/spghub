<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>用户主页</title>


<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<link rel="stylesheet" href="${path }/layui/css/layui.css" media="all">
<link rel="stylesheet" href="${path }/layui/css/userMain.css"
	type="text/css" rel="stylesheet">

<script type="text/javascript">
	function personal() {
		window.location = "${pageContext.request.contextPath}/user/userShow.form";
	}
</script>
<script type="text/javascript">
	function personal() {
		window.location = "${pageContext.request.contextPath}/user/userShow.form";
	}
	function childTopic() {
		window.location = "${pageContext.request.contextPath}/user/childTopic.form";
	}

	function actionCenter() {
		window.location = "${pageContext.request.contextPath}/user/queryAction.form";
	}
</script>
</head>

<body>
	<!--导航栏  -->
	<div class="head-nav">
		<div class="head-nav-logo">
			<div class="layui-inline">
				<img src="${path }/User-images/logo.jpg" class="layui-circle"
					style="width:50px">

			</div>
			<span id="sgphub">SgpHub</span>
		</div>

		<div class="head-nav-search">
			<form class="layui-form layui-form-pane" action="${path }/servicer/search.form" method="post">
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
				<button class="layui-btn layui-btn-primary layui-btn-radius">首页</button>
				<button class="layui-btn layui-btn-radius" onclick="personal()">我的主页</button>
				<button class="layui-btn layui-btn-normal layui-btn-radius" onclick="childTopic()">话题中心</button>
				<button class="layui-btn layui-btn-warm layui-btn-radius" onclick="actionCenter()">活动中心</button>
				<button class="layui-btn layui-btn-radius">我要提问</button>
			</div>
		</div>
	</div>

	<!--滚动图  -->
	<div class="scroll-img" id="scroll-bg">
		<div class="scroll-img-left">
			<div id="toggle-left"
				style="width:20%;height: 40%;margin-left: 70%;margin-top: 40%; cursor: pointer;">
				<div style="padding-top: 80%;">
					<i class="layui-icon"
						style="font-size: 40px; color: white;width: 100%;">&#xe603;</i>
				</div>
			</div>

		</div>
		<div class="scroll-img-middle">
			<a href="#" target="_blank"><img id="scrollimg" alt="" src="${path }/UI/images/556.jpg"
				style="width: 78%;height: 100%;float: left"></a> <img alt=""
				src="${path }/UI/images/action.jpg"
				style="width: 22%;height: 100%;float: left">
		</div>
		<div class="scroll-img-right">
			<div id="toggle-right"
				style="width:20%;height: 40%;margin-left: 10%;margin-top: 40%;cursor: pointer;">
				<div style="padding-top: 80%;">
					<i class="layui-icon" style="font-size: 40px; color: white;">&#xe602;</i>
				</div>
			</div>
		</div>
	</div>
	<!--body  -->
	<div class="body">
		<!--左侧留白 -->
		<div class="left-blank"></div>
		<!--主页面 -->
		<div class="show">
			<!--导航栏  -->
			<div class="show-nav">
				<ul class="layui-nav" style="height:100%">
					<!--   <li class="layui-nav-item"><a href="" style="height:100%;font-size:14px;>">最新活动</a></li> -->
					<c:forEach var="pt" items="${parentTopics }">
						<li class="layui-nav-item"><a
							href="${path }/user/goPT.form?ptid=${pt.id }" target="_blank"
							style="height:100%;font-size:16px;">${pt.name }</a></li>
					</c:forEach>
				</ul>
			</div>
			<!--帖子 -->
			<div class="show-left">
				<!--热门 -->
				<div class="show-left-hot">
					<div class="post_all">
						<div class="post_tab">
							<img class="img"
								src="${pageContext.request.contextPath }/UI/images/u44.png">
							<div class="post_tab_title">
								<p>
									<span>热门帖子</span>
								</p>
							</div>
						</div>
						<div class="line_post">
							<hr>
						</div>
						<div class="post_Message">
							<c:forEach var="a" items="${hots }">
								<div class="this_post">
									<div class="type_parent">
										<span><a
							href="${path }/user/goPT.form?ptid=${a.parentTopic.id}" target="_blank"
							>${a.parentTopic.name }</a></span>
									</div>
									<div class="post_title">
										<span><a
											href="${path }/user/showPostById.form?postId=${a.id }"
											target="_blank">${a.postName }</a></span>
									</div>
									<div class="post_context">
										<span>${a.postText }</span>
									</div>
									<div class="post_replyCount">
										<c:if test="${a.replyCount<300 }">
											<span>热评数${a.replyCount}</span>
										</c:if>
										<c:if test="${a.replyCount>300 }">
											<span>热评数300+</span>
										</c:if>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
				<!-- 推荐 -->
				<div class="show-left-recommend">
					<hr style="border-top:1px solid #000000;">
					<div class="post_all">
						<div class="post_tab">
							<img class="img"
								src="${pageContext.request.contextPath }/UI/images/u44.png">
							<div class="post_tab_title">
								<p>
									<span>最新推荐</span>
								</p>
							</div>
						</div>
						<div class="line_post">
							<hr>
						</div>
						<div class="post_Message">
							<c:forEach var="a" items="${recommendations }">
								<div class="this_post">
									<div class="type_parent">
										<span><a
							href="${path }/user/goPT.form?ptid=${a.parentTopic.id}" target="_blank"
							>${a.parentTopic.name }</a></span>
									</div>
									<div class="post_title">
										<span><a
											href="${path }/user/showPostById.form?postId=${a.id }"
											target="_blank">${a.postName }</a></span>
									</div>
									<div class="post_context">
										<span>${a.postText }</span>
									</div>
									<div class="post_replyCount">
										<c:if test="${a.replyCount<300 }">
											<span>热评数${a.replyCount}</span>
										</c:if>
										<c:if test="${a.replyCount>300 }">
											<span>热评数300+</span>
										</c:if>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
				<!-- 猜你喜欢 -->
				<div class="show-left-like">
					<hr style="border-top:1px solid #000000;">
					<div class="post_all">
						<div class="post_tab">

							<img class="img"
								src="${pageContext.request.contextPath }/UI/images/u44.png">
							<div class="post_tab_title">
								<p>
									<span>猜你喜欢</span>
								</p>
							</div>
						</div>
						<div class="line_post">
							<hr>
						</div>
						<div class="post_Message">
							<c:forEach var="a" items="${likes }">
								<div class="this_post">
									<div class="type_parent">
										<span><a
							href="${path }/user/goPT.form?ptid=${a.parentTopic.id}" target="_blank"
							>&spades;${a.parentTopic.name }</a></span>
									</div>
									<div class="post_title">
										<span><strong>&hearts;<a
												href="${path }/user/showPostById.form?postId=${a.id }"
												target="_blank">${a.postName }</a></strong></span>
									</div>
									<div class="post_context">
										<span>&diams;${a.postText }</span>
									</div>
									<div class="post_replyCount">
										<c:if test="${a.replyCount<300 }">
											<span>热评数${a.replyCount}</span>
										</c:if>
										<c:if test="${a.replyCount>300 }">
											<span>热评数300+</span>
										</c:if>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
			<!--个人信息  -->
			<div class="show-right">
				<!-- 个人信息 -->
				<div class="show-right-info">
					<div class="p_message">
						<div class="p_message_ms">
							<div class="photo">
								<img class="imgs "
									src="${pageContext.request.contextPath }/UI/images/u29.jpg">
							</div>
							<div class="user_username">${userInfo.username}</div>
							<div class="note">
								<span class="message_Count">粉丝：${userInfo.fansCount}</span> <span
									class="line_middle">|</span> <span class="message_Count2">关注：${userInfo.focusPostCount}</span>
							</div>
						</div>
					</div>
				</div>
				<!-- 消息列表 -->
				<div class="show-right-message">
					<ul class="layui-nav layui-nav-tree" lay-filter="demo"
						style="width: 100%;background-color: #404650; height:400px;">
						<li class="layui-nav-item"><a
							href="${pageContext.request.contextPath }/user/userHomeReply.form">个人中心</a></li>
						<li class="layui-nav-item"><c:if test="${rnote!='0' }">
								<a
									href="${pageContext.request.contextPath }/user/userHomeReply.form">回复我的${rnote
									}</a>
							</c:if> <c:if test="${rnote=='0' }">
								<a
									href="${pageContext.request.contextPath }/user/userHomeReply.form">回复我的</a>
							</c:if></li>
						<li class="layui-nav-item"><c:if test="${fnote!='0' }">
								<a
									href="${pageContext.request.contextPath }/user/userHomeFocus.form">我关注的${fnote
									}</a>
							</c:if> <c:if test="${fnote=='0' }">
								<a
									href="${pageContext.request.contextPath }/user/userHomeFocus.form">我关注的</a>
							</c:if></li>
						<li class="layui-nav-item"><a href="">活动提醒</a></li>
						<li class="layui-nav-item"><a href="${pageContext.request.contextPath }/UI/user/advice.jsp">建议与反馈</a></li>
						<li class="layui-nav-item">
							<c:if test="${funote!='0' }">
								<a href="${pageContext.request.contextPath }/user/UHFriends.form">好友提醒${funote }</a>
							</c:if>
							<c:if test="${funote=='0' }">
								<a href="${pageContext.request.contextPath }/user/UHFriends.form">好友提醒</a>
							</c:if>
						</li>
						<li class="layui-nav-item"><a href="${pageContext.request.contextPath }/user/myBrowsePost.form">近期浏览</a></li>
					</ul>
				</div>
			</div>


		</div>
		<!--右侧留白 -->
		<div class="right-blank"></div>
	</div>

	<!--页脚 -->
	<div class="foot"></div>


	<script src="${path }/layui/layui.js" charset="utf-8"></script>
	<script>
		layui.use('element', function() {
			var element = layui.element(), $ = layui.jquery; //导航的hover效果、二级菜单等功能，需要依赖element模块,
			/* alert($("#scrollimg").attr("src"));  var scrollposts = ${scrollPosts };*/
			var sp = ${scrollPosts }
			;
			var i = 1;
			setTimeout(function() {
				$("#scrollimg").attr("src", '${path }' + sp[0].imgURL);
				$("#scrollimg").parent().attr("href",
						'${path }/user/showPostById.form?postId=' + sp[0].id);
				$("#scroll-bg").css("background", sp[0].scrollbg);
			}, 0)

			/* $("#scrollimg").attr("src",getImg(i)); */
			setInterval(function() {
				if (i >= sp.length) {
					i = 0;
				}
				$("#scrollimg").attr("src", getImg(i));
				$("#scrollimg").parent().attr("href",
						'${path }/user/showPostById.form?postId=' + sp[i].id);
				$("#scroll-bg").css("background", sp[i].scrollbg);
				i++;
			}, 6000);

			function getImg(i) {

				return '${path }' + sp[i].imgURL;
			}
			;
			$("#toggle-left").hover(function() {
				$(this).css("background", "#3E3E3E");
			}, function() {
				$(this).css("background", "");
			});
			$("#toggle-right").hover(function() {
				$(this).css("background", "#3E3E3E");
			}, function() {
				$(this).css("background", "");
			});

			$("#toggle-right").click(
					function() {
						i++;
						if (i >= sp.length) {
							i = 0;
						}
						$("#scrollimg").attr("src", getImg(i));
						$("#scrollimg").parent().attr(
								"href",
								'${path }/user/showPostById.form?postId='
										+ sp[i].id);
						$("#scroll-bg").css("background", sp[i].scrollbg);
					});
			$("#toggle-left").click(
					function() {
						i--;
						if (i < 0) {
							i = sp.length - 1;
						}
						$("#scrollimg").attr("src", getImg(i));
						$("#scrollimg").parent().attr(
								"href",
								'${path }/user/showPostById.form?postId='
										+ sp[i].id);
						$("#scroll-bg").css("background", sp[i].scrollbg);
					});
		});
	</script>
</body>
</html>
