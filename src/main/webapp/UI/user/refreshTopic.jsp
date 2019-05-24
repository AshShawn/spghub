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
<link rel="stylesheet" href="${pageContext.request.contextPath }/layui/css/layui.css" media="all">

</head>

<body>
	<div id="refresh" style="width:100%;">
		<c:forEach var="b" items="${childTopicesQT }">
			<span>${b.childTopic.name }</span>
			<br />
		</c:forEach>
	</div>


</body>
</html>
