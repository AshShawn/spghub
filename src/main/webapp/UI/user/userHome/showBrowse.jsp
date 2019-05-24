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
		<div id="showBrowse">
			<table class="c_table">
				<tr>
					<th class="c_th1">标题</th>
					<th class="c_th2">作者</th>
					<th class="c_th3">最后更新时间</th>
				</tr>
				<c:forEach var="a" items="${browses }">
					<tr class="c_tr">
						<td><a href="${path }/user/showPostById.form?postId=${a.post.id }"
							target="_blank">${a.post.postName }</a></td>
						<td>${a.user.username }</td>
						<td><fmt:formatDate value="${a.post.lastReplyTime }"
								pattern="yyyy-MM-dd HH:mm:ss" /></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>

</body>
</html>
