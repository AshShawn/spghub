<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title> post </title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<link rel="stylesheet" href="${path }/layui/css/layui.css" media="all">
	<script type="text/javascript" src="${pageContext.request.contextPath }/UI/admin/jquery-1.11.2.js"></script>

<style>
body {
	margin: 0;
}
.pjh1 {
width:90%;
display: inline-block;
background-color: #F5F79B;
margin-left: 4%;
}
.pjh2 {
color:blue;font-size: 15px;margin-left: 10%;
background-color: green;
}
.pjh3 {
color:blue;font-size: 15px;
background-color: fuchsia;
}
.pjh4 {
font-size: 15px;
background-color: pink;
}
.pjh5 {
display: inline-block;background-color: purple;margin-left: 50%;
}

.post-top {
	width: 100%;
	height: 140px;
}

.post-middle {
	width: 100%;
	background-color: #DCEFFE;
}

.post-main {
	width: 80%;
	margin-left: 10%;
	
}

.post-main-head {
	width: 100%;
	height: 180px;
	background-color: #F3F5F8;
}

.head-logo {
	width: 100%;
	height: 65%;
	/* background-image: url(${pageContext.request.contextPath }/User-images/JavaScript.jpg);
	background-repeat: no-repeat; */
}

.head-nav {
	width: 100%;
	height: 35%;
	background-color: #ECEFF2;
}

.post-main-text {
	width: 100%;
	
}

.post-main-reply {
	width: 100%;	
	clear: both;
	
	background-color: white;
}

.text-count {
	width: 100%;
	height: 50px;
	 background-color: #F3F5F8; 
	
}

.text {
	width: 100%;
	
	}

.text-left {
	width: 79.6%;	
	float: left;
	min-height: 650px;
	background-color:white;

}

.text-right {
	width: 20.15%;
	float: left;	
	background-color:white ;
	border-right:1px solid gray ;
	border-left:1px solid gray ;


}

.post-title {
	width: 100%;
	height: 58px;
}

.post-reply-louzhu {
	width: 100%;
	height: 180px; 
}
.post-reply {
	width: 100%;
}

.post-user-info {
	width: 13%;
	height: 100%;
	float: left;
}
.userImagePicture{
	border:solid 2px gray ;
	width:80px;
	height:80px;
	margin: auto;
	margin-top: 10px;
}
.mylevel{
	width:100px;
	height:20px;
	margin: auto;
	margin-top:16px;
	text-align:center;
	border:solid 1px gray ;
}
.post-user-text {
	width: 87%;
	height: 180px;
	float: left;
	
}
.post-reply-text {
	width: 87%;
	float: left;
}
#sgphub {
	font-size: 38px;;
	color: black;
	font-family: Comic Sans MS;
	position: relative;
	top: 22px;
	margin-left: 259px;
}
.focus-text {
	font-size: 18px;
	color: gray;
	position: relative;
	top: 15px;
	margin-left: 20px;
}
.repeatInput{
	position: absolute;
	/* background-color: gray; */
	bottom: 3px;
	right:6px;
	display:none;
}
.changeInput{
	position: absolute;
	/* background-color: gray; */
	bottom: 3px;
	right:6px;
	display:block;
}
.childReplyDiv{
	background-color:#F1F1F1;
	width:350px;
	float:right;
}
.childReply{
	width:100%;

}
.reply-ccc{
	width:45%;
	height:60px;
	background-color:#F5F79B;
	clear: both;
	float: right;	
}
.reply-ccc-ta{
	width:80%;	
	margin-left: 5%;
}
 .reply-aaa	{
	cursor:pointer;	
}
</style>
<script type="text/javascript">
		 
		function moveFocuse() {
			
				window.location="#test";
			
			};
 
	$(document).ready(function(){
		$("#addCollect").click(function(){
				
				var url = "${path }/user/addCollectPost.form?postId=${post.id }";
				$.get(url,function(data){
					if(data =='0'){
						alert('收藏成功');
					    var button = document.getElementById("addCollect");
						button.innerHTML="已收藏";
					}
				
				});
		}); 
		});
		
		$(document).ready(function(){
		$("#changePostStatus3").click(function(){
				
				var url = "${path }/user/changePostStatus.form?postId=${post.id }";
				$.get(url,function(data){
					if(data =='0'){
						alert("操作成功");
					}
				});
		}); 
		});
		
		$(document).ready(function(){
		$("#changePostStatus2").click(function(){
				
				var url = "${path }/user/modifyPost.form?postId=${post.id }";
				$.get(url,function(data){
					if(data =='0'){
						alert("操作成功");
					}
				});
		}); 
		});
		
		$(document).ready(function(){
		$("#changePostStatus").click(function(){
				
				var url = "${path }/user/cancePost.form?postId=${post.id }";
				$.get(url,function(data){
					if(data =='0'){
						alert("操作成功");
					}
				});
		}); 
		});
		
		$(document).ready(function(){
		$("#changePostStatus1").click(function(){
				
				var url = "${path }/user/cancePost.form?postId=${post.id }";
				$.get(url,function(data){
					if(data =='0'){
						alert("操作成功");
					}
				});
		}); 
		});
		
		$(document).ready(function(){
		$("#deletePost").click(function(){
				
				var url = "${path }/user/deletePost.form?postId=${post.id }";
				$.get(url,function(data){
					if(data =='0'){
						alert("操作成功");
					}
				});
		}); 
		});
		
		$(document).ready(function(){
		$("#focus").click(function(){
				var button = document.getElementById("focus");
				if(button.innerHTML =="关注"){
					var url = "${path }/user/focusPostUser.form?postId=${post.id }";
					$.get(url,function(data){
						if(data =='0'){
							alert("关注成功");
							button.innerHTML ="已关注";
						}
					});
				}else{
					var url = "${path }/user/cancelFocusPostUser.form?postId=${post.id }";
					$.get(url,function(data){
						if(data =='0'){
							alert("取消成功");
							button.innerHTML ="关注";
						}
					});
				}
				
		}); 
		});
		
	
		
		function showPostMaster() {
			//window.location="${path }/user/showPostMaster.form?userId=${post.user.id }";
			//alert("dfsdf");
			$("#onloadReply").load("${path }/user/showPostMaster.form?postId=${post.id }");
								
		}
</script>

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
			<form class="layui-form" action="" style="margin-left: 310px;">
				<div class="layui-form-item">
					<div class="layui-input-block">
						<input name="search" lautocomplete="off" placeholder="请输入搜索内容"
							class="layui-input" type="text"
							style="margin-top:-20px;width: 600px;float: left;"> <a
							href="#" class="layui-btn" target="_blank"
							style="float: left;margin-top:-20px;margin-left: 20px;">点此搜索</a>
					</div>

				</div>
			</form>
		</div>

	</div>

	<div class="post-middle">
		<div class="post-main">

			<div class="post-main-head">
				<div class="head-logo">
					<img alt="" src="${path }/User-images/JavaScript.jpg"
						style="width: 60px;height: 60px;margin-left: 65px;margin-top: 30px;">
					<span
						style="font-weight:bold;font-size: 30px;top: 30px;position: relative;">${post.parentTopic.name }</span>
					<button class="layui-btn layui-btn-primary layui-btn-radius" id="focus"
						style="margin-left: 40px;width: 100px;margin-top: 20px; background-color: #FF7A7A;color:#FBE4E4;font-size: 16px;">
						<c:if test="${not empty userfocustopic }">已关注</c:if>
						<c:if test="${ empty userfocustopic }">关注</c:if>
					</button>
					<span class="focus-text"> 关注：<span style="color: red">${post.parentTopic.focusCount  }</span></span> <span
						class="focus-text"> 帖子：<span style="color: red">${post.parentTopic.postCount  }</span></span>
				</div>
				<div class="head-nav" style="">
					<div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
					  <ul class="layui-tab-title">
					    <li class="layui-this">看帖</li>
					    <li>精品贴</li>
					    <li>返回本吧</li>
					    <li>备注</li>
					  </ul>
					</div>
				</div>
			</div>


		
			<div class="post-main-text">

				<div class="text-count">
					<span class="focus-text"> 回复贴：<span>${post.replyCount }</span></span> <span
						class="focus-text"> 页数：<span>2345</span></span>
						<c:if test="${userfocustopic.topicPermession.id == 3|| userfocustopic.topicPermession.id ==4}">  
						<div style="display: block;margin-top: -2%;">
						<span id="deletePost"	class="focus-text"
							style="float:right;color: blue;font-size: 15px;margin-right: 300px;margin-top: 4px;">删除本帖</span>
						<ul class="layui-nav"
							style="width:140px;background-color: #F3F5F8;float: right;height: 100%;">
							<li class="layui-nav-item "><a href="javascript:;"
								style="color: blue">帖子管理</a>
								<dl class="layui-nav-child">
									<dd>
										<a id="changePostStatus3">设为置顶</a>
									</dd>
									<dd>
										<a id="changePostStatus1">取消置顶</a>
									</dd>
									<dd>
										<a id="changePostStatus2">设为精品帖</a>
									</dd>
									<dd>
										<a id="changePostStatus">取消精华帖</a>
									</dd>
								</dl></li>
						</ul>
						</div>
					 </c:if> 
				</div>

				<div class="text">

					<div id="left" class="text-left">

						<div class="post-title">
							<div style="float:left; width: 70%;height: 100%;">
								<span style="color: #E50D76;font-size: 26px;margin-left: 15px;margin-top: 10px;display: inline-block;">${post.postName }</span>
							</div>
							<div class="layui-btn-group" style="float:left;margin-left: 0;margin-top: 1.8%;">
								<button class="layui-btn" onclick="showPostMaster()">只看楼主</button>
								<button class="layui-btn " id="addCollect" >收藏</button>
								<button class="layui-btn" onclick="moveFocuse()">回复</button>
							</div>
							
						</div>
						<hr />
						<!-- 楼主 -->
						<div class="post-reply-louzhu">
							<div class="post-user-info">
								<div class="userImagePicture">
								<img alt="" src="${post.user.imgURL }"
									style="width: 80px;height: 80px;">
									</div><br />
								<span style="margin-left: 36px;color: #A766DD;font-size: 16px;position:relative;top:8px;text-decoration:underline">${post.user.username }</span><br />
								<div class="mylevel">
								 	<span style="margin: auto;" >经验值:${focustopic.experience }</span><br />
								 </div>
							</div>
							
							<div class="post-user-text" style="background-color: gray;">
								<span >${post.postText }</span><br /> 
								<span style="display: inline-block;margin-left: 68%;margin-top: 16%;">1楼&nbsp;<fmt:formatDate value="${post.creatTime }" pattern="yyyy-MM-dd HH:mm:ss"/>&nbsp;&nbsp;&nbsp;<a href="#test">回复</a></span> 
							</div>		
						</div>
						<hr />
						<!-- 回复 -->
						<c:if test="${not empty replys }">
						<c:forEach var='r' items="${replys }" varStatus="vs" >
						<div class="post-reply"  id="onloadReply" >
							<!--此回复的用户信息  -->
							<div class="post-user-info" style="height: 200px;" id='${r.user.username }' >
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
							<div id="${r.id }" name="${r.user.id }" class="post-reply-text" >
								<div id="1" class="reply-bbb" style="width:100%;background-color: pink">
									<span id="3" class="">${r.replyText }</span><br> 
									<span class="reply-bbb" id="4" style="display: inline-block;margin-left: 68%;margin-top: 16%;">${r.floor }楼<fmt:formatDate value="${r.creatTime }" pattern="yyyy-MM-dd HH:mm:ss"/>&nbsp;&nbsp;&nbsp;
									<a  name="reply-ccc" style="cursor: pointer;">回复</a></span> 
								</div>
							
								<!-- 子回复 -->
								<div class="childReplyDiv">
								    <c:forEach var='c' items="${lists }" >
										<c:if test="${r.id == c.reply.id }">
											<div class="childReply">
												<span class="pjh1">
													<span name='${c.reUser.username }' id='${c.reUser.id }' style="color:blue;font-size: 15px;margin-left: 10%;">${c.reUser.username }</span>
													回复<span style="color:blue;font-size: 15px;">&nbsp;${c.toUser.username }</span>:&nbsp;
													<span style="font-size: 15px;">${c.text }</span> 
													<br>
													<span style="display: inline-block;background-color: purple;margin-left: 40%;"><fmt:formatDate value="${c.creatTime }" pattern="yyyy-MM-dd HH:mm:ss"/>&nbsp;&nbsp;
														<a name='reply-ccc' href="javascript:void(0)">回复</a>
													</span>
												</span>		
											</div>											
										</c:if>
									</c:forEach>
								<!-- 发表新的回复之后在这里 -->	
							   </div>
							   <!--  添加回复模块-->
							  
							   
								
							</div>	
							<hr>						
						</div>						
						</c:forEach>
						</c:if> 
					</div>
					

					<div id="right" class="text-right">
						<div class="javaScriptPicture"style="width: 100%;height: 250px; " ><img src="${path }/User-images/ja.jpg" width="228px" height="250px"/></div>
						
						<div style="width: 100%;height: 400px;text-align: center;" >
							<span style="position:relative; font-weight:bold;font-size: 15px;margin-left:- 18px;top: 18px;">我在本吧</span><br>
							<div style="width:100px;height:100px; margin: auto;margin-top: 20px;border: solid 2px gray;">
								<img alt="" src="${userInfo.imgURL }" width="100px" height="100px"><br>
							</div>
							<div style="width:120px;height:20px;border: solid 1px gray;margin: auto;margin-top: 10px;">
							<c:if test="${not empty userfocustopic }">
								<span style="position:relative; font-size:15px; color: #A766DD; ">好心值：${userfocustopic.experience }</span>
							</c:if>
							<c:if test="${ empty userfocustopic }">
							<span style="position:relative; font-size:15px; color: #A766DD; ">你还未关注此吧！</span>						
							</c:if>
							
							</div>
						</div>
				  </div>
				 
				</div>


			<div class="post-main-reply" id="test" >
				<div style="width: 100%;height: 100px;">
					<hr />
					<span style="position:relative;font-size: 15px;font-weight:bold;margin-left: 36px;top: 28px;">发表回复</span>
				</div>
				<form class="layui-form" action="${path }/user/addReply.form?ptid=${post.id}" method="post" >
					<div style="width: 80%;height: 360px;">
						<textarea type="text" class="layui-textarea" id="LAY_demo1" name="replyText"  ></textarea>
					</div>
				 <button class="layui-btn  layui-btn-big layui-btn-radius" style="margin-left: 28px;">回复</button>
				 </form>
				 <div style="width: 100%;height: 100px;" ></div>
			</div>

		</div>
	</div>
</div>

	<script src="${path }/layui/layui.js" charset="utf-8"></script>
	<script>	
		layui.use(['element', 'layedit','layer'], function() {
			var layedit=layui.layedit,$=layui.jquery,layer=layui.layer,element = layui.element(); //导航的hover效果、二级菜单等功能，需要依赖element模块
			var index = layedit.build('LAY_demo1');
			var div = "<div class='reply-ccc'><textarea class='reply-ccc-ta' /><a class='reply-aaa'>回复</a></div>"
			$("#right").height($("#left").height());

			
			/* form.verify({
				 LAY_demo1: function(value) {
					if (value.length ==0||value=="") {
						return '内容不能为空';
					}
				}
				
			}); */
			

			
			
			

			var reName = null;
			
			$("a[name='reply-ccc']").click(function() {
				var niu = $(this).parents("div[class='post-reply-text']").children().last().attr('class');
		
			reName = null;
			reID = null;
			if ($(this).text()=='回复') {
				if (niu == 'reply-ccc') {
					return;
				}
				$(this).parents("div[class='post-reply-text']").append($(div).attr('name','wu'));
				$(this).text('收起回复');
				
			}else {
				$(this).parents("div[class='post-reply-text']").children().last().remove();
				$(this).text('回复');
			}
				$("#right").height($("#left").height());
				reName = $(this).parent().siblings().first().attr('name');	
				reID =  $(this).parent().siblings().first().attr('id');	
							
			});
			
			$("div[class='post-reply-text']").on('click','a[class="reply-aaa"]',function() {
				var user = '${userInfo.username }';
				 if ($(this).prev().val()=='') {
					alert('回复不能为空');
					return;
				} else {
	
					var text = $(this).prev().val();
					var toID =$(this).parents("div[class='post-reply-text']").attr('name');
					var replyId = $(this).parents("div[class='post-reply-text']").attr('id');
					var toUser= $(this).parents("div[class='post-reply-text']").prev().attr('id');
					var str;
					if (reName==null) {
						 str ="<div class='childReply'><span class='pjh1'><span class='pjh2'>"+user+"</span>回复<span class='pjh3'>&nbsp;"+toUser+"</span>:&nbsp;<span class='pjh4'>"+text+"</span><br/><span class='pjh5' />1秒前</span></span></div>";
						  var url = "${path }/user/addChildReply.form?toUser.id="+toID+"&text="+text+"&reply.id="+replyId;
						  $.get(url,function(data) {
							 alert('回复成功！');
						  });
					} else {
						 //楼中楼
						 str = "<div class='childReply'><span class='pjh1'><span class='pjh2'>"+user+"</span>回复<span class='pjh3'>&nbsp;"+reName+"</span>:&nbsp;<span class='pjh4'>"+text+"</span><br/><span class='pjh5' />1秒前</span></span></div>";
						 var url = "${path }/user/addChildReply.form?toUser.id="+reID+"&text="+text+"&reply.id="+replyId;
						 $.get(url,function(data) {
							alert('回复成功！');
						 });
					}
					
																																																																																												
					$(this).parents("div[class='post-reply-text']").children("div[class='childReplyDiv']").append($(str));
					$("a:contains('收起')").text('回复');
					$(this).parent().remove();
					$("#right").height($("#left").height());
					
				} 
			});
			
			
			

		}); 
			  

		

		
	</script>
</body>
</html>
