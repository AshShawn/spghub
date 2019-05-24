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
	<!-- 回复我的 -->
	<div class="layui-tab-item layui-show">
		<div id="showReply">
			<c:forEach var="a" items="${replies }">
				<div class="post">
					<div class="replyMessage">
						<span class="username">${a.user.username }:</span> <span
							class="talking">${a.replyText}</span>
					</div>
					<span class="time"><fmt:formatDate value="${a.creatTime}"
							pattern="yyyy-MM-dd HH:mm:ss" /></span><br />
					<div class="replyTitle">
						<span class="title">回复我的主题:</span> <span class="titleName">${a.post.parentTopic.name}>${a.post.childTopic.name
							}</span>
					</div>
					<a class="reply"
						href="${path }/user/showPostById.form?postId=${a.id }"
						target="_blank">回复</a>
				</div>
			</c:forEach>
		</div>
	</div>

</body>
</html>
