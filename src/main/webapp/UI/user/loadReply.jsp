<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'loadReply.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<script type="text/javascript" src="${pageContext.request.contextPath }/UI/admin/jquery-1.11.2.js"></script>
	

  </head>
  
  <body>
    <!-- 回复 -->
		<c:if test="${not empty replys }">
		
		<c:forEach var='r' items="${replys }" varStatus="vs" >
		
			<div class="post-reply"   >
				<!--此回复的用户信息  -->
				<div class="post-user-info" style="height: 200px;"  >
					<div class="userImagePicture">
						<img alt="" src="${r.user.imgURL }"
									style="width: 80px;height: 80px;">
					</div><br />
					<span style="margin-left: 36px;color: #A766DD;font-size: 16px;position:relative;top:8px;text-decoration:underline">${r.user.username }</span><br />
					<div class="mylevel">
								<span style="margin: auto;" >经验值:<c:forEach var="f" items="${focusTopics }">
								 							<c:if test="${f.user.id == r.user.id }">${f.experience }</c:if>
								 							</c:forEach>  </span><br />
					 </div>
					</div>
					<!-- 回复内容 -->
					<div class="post-reply-text" style="background-color: green">
						<div style="width:100%;background-color: maroon;">
							<span class="">${r.replyText }</span><br> 
							<span style="display: inline-block;margin-left: 68%;margin-top: 16%;">${r.floor }楼<fmt:formatDate value="${r.creatTime }" pattern="yyyy-MM-dd HH:mm:ss"/>&nbsp;&nbsp;&nbsp;<a class="" onclick="changeDiv()">回复</a></span> 
						</div>
						<!-- 子回复 -->
						<div id="childReplyDiv">
						<c:forEach var='c' items="${lists }" varStatus="vs" >
							<c:if test="${r.id == c.reply.id }">
								<div class="childReply" >
								<div style="height:20px;background-color: yellow;">${c.text } </div>
								<div style="height:20px;background-color: blue;"><span style="position: relative;left:68%;"><fmt:formatDate value="${c.creatTime }" pattern="yyyy-MM-dd HH:mm:ss"/>&nbsp;&nbsp;<a onclick="addChildReply()">回复</a></span></div>
								</div>
							</c:if>
							</c:forEach>   
						</div>
					</div>	
					<hr>						
					</div>
					
					</c:forEach>
					
		</c:if> 
  </body>
</html>
