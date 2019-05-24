<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>SgpHub</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<link rel="stylesheet" href="${path }/layui/css/layui.css" media="all">


<style>
body {
	margin: 0;
}

.post-top {
	width: 100%;
	height: 140px;
}

.post-middle {
	width: 100%;
	 background-image: url("${path }/UI/images/body_bg_page.jpg"); 
	background-repeat: no-repeat;
	 background-color: #1F160E; 
}

.post-main {
	width: 80%;
	margin-left: 10%;
}

.post-main-head {
	width: 100%;
	height: 180px;
}

.head-logo {
	width: 100%;
	height: 65%;
}

.head-nav {
	width: 100%;
	height: 35%;
}

.post-main-text {
	width: 100%;
}

.post-main-reply {
	width: 100%;
	clear: both;
	 background-color: #F9F9F9; 
}

.text {
	width: 100%;
}

.text-left {
	width: 80%;
	float: left;
	height: 990px;
	 background-color : white;
	border-right: 1px solid gray;
	border-top: 1px solid gray;
	background-color: white;
}

.text-right {
	width: 19.88%;
	background-color: white; 
	float: left;
}

#sgphub {
	font-size: 38px;;
	color: red;
	font-family: Comic Sans MS;
	position: relative;
	top: 22px;
	margin-left: 259px;
}

.focus-text {
	font-size: 18px;
	color: orange;
	position: relative;
	top: 15px;
	margin-left: 20px;
}



.count {
	font-size: 17px;
	color: orange;
}

.ordinary-post {
	border-bottom: 1px solid gray;
	width: 100%;
	height: 100px;
}

</style>

</head>

<body>
	<div class="post-middle">
		<!--  -->
		<div class="post-top">
			<div class="top-nav" style="height:20%;background-color: white">
				<span class="layui-breadcrumb" lay-separator="|"
					style="margin-left: 60%;font-size: 16px; "> <a href="">首页</a>
					<a href="">个人中心</a> <a href="">我的主页</a> <a href="">话题中心</a> <a
					href="">活动中心</a> <a href="">退出</a>
				</span>
			</div>
			<div class="top-search">
				<span id="sgphub">SgpHub</span>
				<form class="layui-form" action="${path }/servicer/search.form?ptid=${pt.id }" method="post" style="margin-left: 310px;">
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
		<!--ggg  -->

		<div class="post-main">

			<div class="post-main-head">
				<div class="head-logo">
					<%-- <img alt="" src="${path }/User-images/JavaScript.jpg"style="width: 130px;height: 130px;position: absolute;top:135px; "> --%>
					<div
						style="width: 90%;height: 100%;margin-left: 5px;padding-top: 50px;">
						<span
							style="font-weight:bold;font-size: 30px;top: 20px;position: relative;color: #E5E329;font-family: Comic Sans MS;">${pt.name }</span>
						<button class="layui-btn layui-btn-primary layui-btn-radius"
							style="margin-left: 40px;width: 100px;margin-top: 20px; background-color: #15897C;color:#FBE4E4;font-size: 16px;" onclick="focusParentTopic(${pt.id })">
							<c:if test="${not empty ft }">已关注</c:if>
							<c:if test="${ empty ft }">关注</c:if>
							</button>
						<span class="focus-text"> 关注：<span style="color: white">${pt.focusCount
								}</span></span> <span class="focus-text"> 帖子：<span style="color: white">${pt.postCount
								}</span></span>
					</div>
				</div>
				<div class="head-nav" style="background-color: white">
					<div class="layui-tab layui-tab-brief" lay-filter="demo">
						<ul class="layui-tab-title" style="color:#8BCEC6">
							<li class="layui-this">看帖</li>
							<li>精品贴</li>
							<li>返回本吧</li>
							<li>备注</li>
						</ul>
					</div>
				</div>
			</div>



			<div class="post-main-text">
				<div class="text">
				
					<div class="text-left" id="left">
						<!-- 置顶帖 -->
						<c:forEach var="upPost" items="${upPost }">
							<div
								style="width:100%;height: 40px;border-bottom: 1px solid gray;">
								<!-- 回复数 -->
								<div style="width: 10%;height: 100%;float:left;">
									<span
										style="background-color: #F7F7F7;display: block;width: 60px;height: 26px;margin-left: 30%;margin-top: 6%"><i
										class="layui-icon" style="font-size: 18px; color: #6A8BA0;">&#xe63a;
											${upPost.replyCount }</i> </span>
								</div>

								<!-- 题目 -->
								<div style="width: 65%;height: 100%;float:left;">
									<a href="${path }/user/showPostById.form?postId=${upPost.id }"><button class="layui-btn"
										style="height: 70%;float: left;position: relative;left: 2%;top: 12%;width:12%;display: block;">置顶</button>
									<span
										style="float: left;height: 100%;text-overflow:ellipsis 
										;width: 80%;overflow: hidden;white-space: nowrap;margin-left: 4%;font-size: 18px;line-height: 40px;">${upPost.postName
										} </span></a>
								</div>
								<!-- 回复人 -->
								<div style="width: 25%;height: 100%;float:left;">
									<span
										style="display: block;font-size: 17px;margin-top: 8px;color:gray;"><i
										class="layui-icon">&#xe612;</i>&nbsp;&nbsp;${upPost.user.username
										}</span>
								</div>
							</div>
						</c:forEach>





						<c:forEach var="ordinary" items="${ordinary }">
							<!-- 普通帖 -->
							<div class="ordinary-post">
								<!-- 回复数 -->
								<div style="width: 10%;height: 100%;float:left;">
									<span
										style="background-color: #F7F7F7;display: block;width: 60px;height: 26px;margin-left: 30%;margin-top: 10%;"><i
										class="layui-icon" style="font-size: 18px; color: #6A8BA0;">&#xe63a;
											${ordinary.replyCount }</i> </span> <span
										style="background-color: #F7F7F7;display: block;width: 64px;height: 24px;margin-left: 28%;margin-top: 30%;"><i
										class="layui-icon" style="font-size: 18px; color: #6A8BA0;">&#xe615;
											${ordinary.checkCount }</i> </span>
								</div>
								<!-- 正文 -->
								<div style="width: 65%;height: 100%;float:left;">
									<span
										style="display: block;font-size: 24px;color: maroon;height: 60px;cursor: pointer;margin-top: 6px;margin-left: 5px;">
										<a
										href="${path }/user/showPostById.form?postId=${ordinary.id }"
										target="_blank">${ordinary.postName }</a>
									</span> <span
										style="display: block;margin-left: 10px;text-overflow:ellipsis;width: 80%;overflow: hidden;white-space: nowrap;">${ordinary.postText
										}</span>
								</div>
								<!-- 回复人 -->
								<div style="width: 25%;height: 100%;float:left;">
									<div style="width: 60%;height: 100%;float:left;">
										<span
											style="display: block;padding-top: 20px;font-size: 17px;color: gray;"><i
											class="layui-icon">&#xe612;</i>&nbsp;&nbsp;${ordinary.user.username
											}</span> <span
											style="display: block;padding-top: 20px;font-size: 17px;color: gray;"><i
											class="layui-icon">&#xe612;</i>&nbsp;&nbsp;${ordinary.lastReplyUser.username
											}</span>
									</div>
									<div style="width: 40%;height: 100%;float:left;">
										<span
											style="display: block;padding-top: 60px;font-size: 16px;color: gray;"><fmt:formatDate
											value="${ordinary.lastReplyTime }" pattern="HH:mm" /></span>
									</div>
								</div>

							</div>
						</c:forEach>
					</div>


					<div class="text-right" id="right">
						<div class="javaScriptPicture"
							style="width: 100%;height: 200px; border-bottom: 1px solid gray;background-color: gray;">
							<br />
							<button id="intoService" class="layui-btn layui-btn-primary layui-btn-radius" id="manager">吧务后台</button>
							<br /> <br /> <br /> <br />
							<button class="layui-btn layui-btn-primary layui-btn-radius" id="applyService">申请成为小吧主</button>
						</div>
						<div
							style="width: 100%;margin-top: 15px;border-bottom: 1px solid gray;">
							<span style="font-weight:bold;font-size: 15px;margin-left: 20px;">我在本吧</span>
							<hr style="margin-left:10%; width: 80%;" />
							<c:if test="${not empty ft }">
							<img alt="" src="${userInfo.imgURL }"
								style="width:120px;height: 120px;margin-top: 16px;margin-left:22%;"><br>
							<span
								style="display: block;height: 40px;width: 100%;line-height: 40px;text-align: center;font-size: 20px;font-weight: bold;">${ft.user.username
								} </span> <span style=" font-size:15px; color: red;margin-left:35%;">好心值：<span
								class="count">${ft.experience }</span></span> <br /> <br /> <br />
							</c:if>
							
							<c:if test="${empty ft }">
							<img alt="" src="${userInfo.imgURL }"
								style="width:120px;height: 120px;margin-top: 16px;margin-left:22%;"><br>
							<span
								style="display: block;height: 40px;width: 100%;line-height: 40px;text-align: center;font-size: 20px;font-weight: bold;">${userInfo.username
								} </span> <span style=" font-size:15px; color: red;margin-left:35%;">点击关注发现更多精彩！</span></span> <br /> <br /> <br />
							</c:if>
						</div>

						<div style="width: 100%;margin-top: 15px;">
							<span style="font-weight:bold;font-size: 15px;margin-left: 20px;">本吧优秀回答者</span><br>
							<hr style="width:100%;" />
							<div style="width: 80%;">
								<table class="layui-table" lay-even="" lay-skin="nob"
									style="margin-left: 10%">
									<tbody>
										<c:forEach var="goodUsers" items="${goodUsers }">
											<tr style="height: 80px;width: 80%;">
												<td style="width: 60%;text-align: left;"><img
													src="${path }/UI/images/body_bg_page.jpg"
													style="width: 100%;height:100%;" /></td>
												<td style="width: 40%;">${goodUsers.user.username }</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>


			<div class="post-main-reply">
				<div style="width: 80%;height: 100px;">

					<span
						style="position:relative;font-size: 15px;font-weight:bold;margin-left: 36px;top: 60%;">
						<i class="layui-icon" style="font-size: 30px; color: #1E9FFF;">&#xe642;</i>
						提问题
					</span>
				</div>


				<div style="width: 80%;height: 380px;margin-left: 40px;">
					<form class="layui-form" action="${path }/user/addPost.form?ptid=${pt.id }" method="post">
						<div class="layui-form-item">
							<label class="layui-form-label">单行输入框</label>
							<div class="layui-input-block">
								<input name="postName" lay-verify="postt" autocomplete="off"
									placeholder="请输入标题" class="layui-input" type="text"
									style="width: 600px;">
							</div>
						</div>
						<div class="layui-form-item layui-form-text" style="background-color: white;">
						<textarea placeholder="请输入内容" class="layui-textarea layui-hide" id="LAY_demo1"
						style="width: 600px;display: none;" name="postText" lay-verify="content" autocomplete="off"></textarea>
						</div>
						<div class="layui-form-item">
							<div class="layui-input-block">
								<button class="layui-btn" lay-submit lay-filter="demo1">立即提交</button>
								<button type="reset" class="layui-btn layui-btn-primary">重置</button>
							</div>
						</div>
					</form>

					 


				</div>

				<div style="width: 100%;height: 100px;"></div>
			</div>

		</div>
	</div>


	<script src="${path }/layui/layui.js" charset="utf-8"></script>
	<script>
		//文本编辑器
		
		
		layui.use(['element','form','layedit','layer'], function() {
			var  $ = layui.jquery,form = layui.form(),layedit = layui.layedit,element = layui.element(),layer = layui.layer;; 
			var index = layedit.build('LAY_demo1'); 
		
			$("#right").height($("#left").height() + 1);
			layer.msg('hhhhh');
			
 			 form.verify({
				postt : function(value) {
					if (value.length < 5) {
						/* layer.alert('标题不能小于5个字',{icon: 1,offset: '200px'}); */
						return '标题不能小于5个字';
					}
				}
				,content: function(value){
			      	layedit.sync(index);
			      	if (layedit.getText(index)=="") {
						return '不可以';
					}
			    }
			}); 
		  	
			
			 form.on('submit(demo1)', function(data) {
				/* layer.msg('hello',{icon: 1,offset: '800px'}); */
				
				layer.msg("表单可以提交",{time: 1000,offset: '100px'});
				
				
			}); 
			
		
			$("#intoService").click(function() {
			
				window.location.href="${path }/servicer/userService.form?ptid=${pt.id }";
			});
			
			$("#manager").click(function () {
				var id = '${ft.topicPermession.id }';
				alert(id);
				if(id != 1 & id !=2 ){
					alert("对不起，你不是吧务！")
				}else{
					window.location.href="${path }/service/userService.jsp";
				}
			});
			
			$("#applyService").click(function() {
				var id = '${ft.topicPermession.id }'
				alert(id);
				if (id==1 || id==2) {
					//进入页面
					window.location.href="${path }/user/applyService.form?ptid=${pt.id }";
				} else {
					alert("你已经为吧务或未关注本吧")
				}
				 /* var url ="${path }/user/applyService.form";
				 $.get(url,function(data){
				 	if(data =='0'){
				 		alert("对不起，没有申请资格！");
				 	}else{
				 		window.location.href="${path }/user/applyService.form?ptid=${pt.id }";
				 	}
				 }); */
				 
			});
			
		

		});
		
		
             

	
	</script>
</body>
</html>
