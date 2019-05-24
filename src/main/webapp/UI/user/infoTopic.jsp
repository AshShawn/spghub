<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>My JSP 'team.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<link rel="stylesheet" href="${path }/layui/css/layui.css" media="all">
<style type="text/css">
.this_title{
width:100%;
height:80px;
font-size: 30px;
}
</style>
</head>

<body>
<div id="info" style="width:700px;margin-left: 4%">
	<fieldset class="layui-elem-field layui-field-title">
	<div>
		<br/>
		<i class="layui-icon" style="font-size: 30px;">&#xe623;</i>
		<span class="this_title">${cts.childTopic.name }</span>
		<br/>
	</div>
		<div class="layui-field-box">
			<c:forEach var="a" items="${posts }">
				<blockquote class="layui-elem-quote" style="font-size: 18px;">${a.postName }</blockquote>
				<blockquote class="layui-elem-quote layui-quote-nm">
					${a.user.username }<br/>${a.postText }
				</blockquote>
			</c:forEach>
		</div>
	</fieldset>
</div>






	<script src="${path }/layui/layui.js" charset="utf-8"></script>
</body>
</html>
