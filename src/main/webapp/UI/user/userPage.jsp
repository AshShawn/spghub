<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>用户主页</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/layui/css/layui.css" media="all">
	<style>
	*{
	margin:0;
	padding: 0;
    }
    .head{
	
	width:100%;
	height:135px;
	background-color: white;
    }
    .background{
	
    width:100%;
	height:1000px;
	background-color: #97D4F1;
	
    }
    .middle{
	margin-left:auto;
	margin-right:auto;
	width:1000px;
	height:920px;
    }
    .navPic{
	
	
    width:1000px;
    height:160px;
    }

    .personalImage{
	
	margin-left:60px;
	margin-top:-30px;
	width:120px;
    height:120px;
	
    }

    .form{
	position:absolute;
	margin-left:100px;
	margin-top:15px;
	width:600px;
	height:50px;
	display:inline;
	
   }

   .total{
	
	margin-top:-20px;
	width:100%;
	height:700px;
	background-color: #F4F4F4;
	border: 1px solid #E4E4E4;
	
   }

   .focus{
	position:absolute;
	margin-top:130px;
	width: 750px;
	height:570px;
	background-color: white;
	
	
   }

   .information{
	position: absolute;
	margin-left:280px;
	margin-top:30px;
	width:450px;
	height:80px;
   }

   .follow_one{
	position: absolute;
	margin-left: 765px;
	margin-top: 130px;
	width:200px;
	height:100px;
    }
   .follow_two{
	position: absolute;
	margin-left: 765px;
	margin-top: 360px;
	width:200px;
	height:100px;
   }
   .focus_one{
	position: absolute;
	margin-left: 50px;
	margin-top: 50px;
	width: 500px;
	height: 200px;
   }

   .focus_two{
	position: absolute;
	margin-left: 50px;
	margin-top: 250px;
	width: 500px;
	height: 200px;
    }

    .but{
	position: absolute;
	margin-left: 65px;
	margin-top: 40px;
	width:100px;
	height:40px;
   }
   #sgphub {
	font-size: 38px;;
	color: black;
	font-family: Comic Sans MS;
	position: relative;
	top: 22px;
	margin-left: 249px;
  }
  
  .square{
  	display: inline;
  	background-color: #F4F4F4;
  	width:100px;
  	height:30px;
  	border:#CCCCCC;
  }

	</style> 
	<script type="text/javascript" src="${pageContext.request.contextPath }/UI/admin/jquery-1.11.2.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
							$("#focus1").click(function(){
												$.ajax({
													type:"post",
													url:"${pageContext.request.contextPath }/user/focusUser.form",
													data:"focusUser.id=${user.id}&user.id=${userInfo.id}",
													success:function(data){
														if(data=='focus'){
															alert('关注成功');
															$("#focus1").css('display','none');
															$("#cancelFocus1").css('display','block');
														}
													}
													
												});
											});
											
							
							$("#cancelFocus1").click(function(){
												$.ajax({
													type:"post",
													url:"${pageContext.request.contextPath }/user/cancelFocusUser.form",
													data:"focusUser.id=${user.id}&user.id=${userInfo.id}",
													success:function(data){
														if(data=='cancel'){
															alert('取消关注成功');
															$("#focus1").css('display','block');
															$("#cancelFocus1").css('display','none');
														}
													}
													
												});
											});
											
											
							
							 $("#focus2").click(function(){
												$.ajax({
													type:"post",
													url:"${pageContext.request.contextPath }/user/focusUser.form",
													data:"focusUser.id=${user.id}&user.id=${userInfo.id}",
													success:function(data){
														if(data=='focus'){
															alert('关注成功');
															$("#focus2").css('display','none');
															$("#cancelFocus2").css('display','block');
														}
													}
													
												});
											});
											
						    $("#cancelFocus2").click(function(){
												$.ajax({
													type:"post",
													url:"${pageContext.request.contextPath }/user/cancelFocusUser.form",
													data:"focusUser.id=${user.id}&user.id=${userInfo.id}",
													success:function(data){
														if(data=='cancel'){
															alert('取消关注成功');
															$("#focus2").css('display','block');
															$("#cancelFocus2").css('display','none');
														}
													}
													
												});
											});
			             
				
			             }
			             
			            
			             
			            
		
		
		);
		
	
	</script> 
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
	</script>  
  </head>
  
  <body>
    <div class="head">
    	<div class="top-nav" style="height:12%">
			<span class="layui-breadcrumb" lay-separator="|"
				style="margin-left: 60%;font-size: 20px;"> <a href="${pageContext.request.contextPath }/user/userMain.form">首页</a>
				<a href="${pageContext.request.contextPath }/user/userHomeReply.form">个人中心</a> <a href="${pageContext.request.contextPath }/user/userShow.form">我的主页</a> <a href="${pageContext.request.contextPath}/user/childTopic.form">话题中心</a> <a
				href="${pageContext.request.contextPath}/user/queryAction.form">活动中心</a> <a href="${pageContext.request.contextPath }/user/exit.form">退出</a>
			</span>
		</div>
		<hr />
		<div class="top-search">
			<span id="sgphub">SgpHub</span>
			<form class="layui-form" action="${pageContext.request.contextPath }/servicer/search.form" style="margin-left: 300px;">
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
   	<div class="background">
        	<div class="middle">
            	<div class="navPic">
                   <img src="${pageContext.request.contextPath }/UI/images/u2.jpg" style="width:100%;height:100%;"/>            
                </div>
            	<c:if test="${user.imgURL==null }">
			    	<img class="personalImage" src="${pageContext.request.contextPath }/UI/images/u10.jpg" />
				</c:if>
				<c:if test="${user.imgURL!=null }">
					<img class="personalImage" src="${pageContext.request.contextPath }/User-images/${user.imgURL}" />
				</c:if>
                <div class="total">
                	<div class="but">
                		<c:if test="${count==0 }">
                			<button class="layui-btn layui-btn-primary layui-btn-radius" id="focus1">关注</button>
                			<button class="layui-btn layui-btn-primary layui-btn-radius" id="cancelFocus1" style="display:none">取消关注</button>
                		</c:if>
                		<c:if test="${count>0 }">
                		    <button class="layui-btn layui-btn-primary layui-btn-radius" id="focus2" style="display:none">关注</button>
                			<button class="layui-btn layui-btn-primary layui-btn-radius" id="cancelFocus2">取消关注</button>
                		</c:if>
                    </div>
                	<div class="information">
                		<span style="font-weight:bold;font-size:2em">${user.username }</span><br/><span>创建日期：${user.createDate }</span>&nbsp;&nbsp;<span>发帖：${user.postCount }</span>&nbsp;&nbsp;<span>访问次数： ${user.checkCount }</span>
                    </div>
                	<div class="focus">
                    	<div class="focus_one">
                    		<blockquote class="layui-elem-quote layui-quote-nm">		 
						             爱逛的吧
				            </blockquote>
				            <c:if test="${empty topics}">
				            	<span style="color:red">他还没有关注任何吧，快去关注吧！</span>
				            </c:if>
				            <c:if test="${not empty topics}">
				            	<c:forEach var='t' items='${topics}'>
					            	<div class="square">
					           			<a href="${pageContext.request.contextPath }/user/goPT.form?ptid=${t.parentTopic.id }">${t.parentTopic.name }</a>
					           		</div>
					           		 &nbsp;&nbsp;
				               </c:forEach> 
				            </c:if>
				           
				            <br/>
                    	</div>
                        <div class="focus_two">
                      		 <blockquote class="layui-elem-quote layui-quote-nm">热门动态 </blockquote>
                      		 <c:if test="${empty posts }">
                      		 	<span style="color:red">他还没有任何动态，快去开始SgpHub之旅吧！</span>
                      		 </c:if>
                      		 <c:if test="${not empty posts}">
                      		 	<c:forEach var='p' items='${posts }'>
		                             <div class="square">
		           		             	<a href="${pageContext.request.contextPath }/user/showPostById.form?postId=${p.post.id }">${p.post.postName }</a> 
		           		             </div>
	           		             &nbsp;&nbsp;
                               </c:forEach> 
                      		 </c:if>
                             
                        </div>
                    </div>
                    <div class="follow_one">
                    	<span>关注的人</span><br/><br/>
                    	<c:if test="${empty users }">
                    		<span></span>
                    	</c:if>
                    	<c:if test="${not empty users }">
				            <c:forEach var="u" items="${users }">
								<c:if test="${u.focusUser.imgURL!=null }">
									<c:if test="${u.focusUser.id!=userInfo.id}">
										<a href="${pageContext.request.contextPath }/user/userDisplay.form?id=${u.focusUser.id}"><img alt="" src="${pageContext.request.contextPath }/User-images/${u.focusUser.imgURL}" style="width: 45px;height:45px"/></a>
									</c:if>
									<c:if test="${u.focusUser.id==userInfo.id}">
										<a href="${pageContext.request.contextPath }/user/userShow.form"><img alt="" src="${pageContext.request.contextPath }/User-images/${u.focusUser.imgURL}" style="width: 45px;height:45px"/></a>
									</c:if>
								</c:if>
								<c:if test="${u.focusUser.imgURL==null }">
									<c:if test="${u.focusUser.id!=userInfo.id}">
										<a href="${pageContext.request.contextPath }/user/userDisplay.form?id=${u.focusUser.id}"><img alt="" src="${pageContext.request.contextPath }/UI/images/u10.jpg" style="width: 45px;height:45px"/></a>
									</c:if>
									<c:if test="${u.focusUser.id==userInfo.id}">
										<a href="${pageContext.request.contextPath }/user/userShow.form"><img alt="" src="${pageContext.request.contextPath }/UI/images/u10.jpg" style="width: 45px;height:45px"/></a>
									</c:if>
								</c:if>
				            </c:forEach>&nbsp;
			            </c:if>
                    </div>
                </div>
                
            </div>
        </div>
  </body>
</html>
