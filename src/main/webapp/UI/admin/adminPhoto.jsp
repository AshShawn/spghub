<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>SgpHub后台管理</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<link rel="stylesheet" href="${path }/layui/css/layui.css" media="all">
</head>

<body>
	<blockquote class="layui-elem-quote layui-quote-nm">
		首页轮播图设置</blockquote>
	<div id="body">

		<div id="center">
			<p>
			<div>
				<table class="layui-table" lay-even="" lay-skin="row">
					<tr>
						<th>编号</th>
						<th>链接帖id</th>
						<th>帖子标题</th>
						<th>图片</th>
						<th>上传时间</th>
						<th>操作</th>
					</tr>
					<c:forEach var="a" items="${photos }" varStatus="vs">
						<tr>
							<td>${vs.count }</td>
							<td>${a.id }</td>
							<td>${a.postName }</td>
							<td><img src="${path }${a.imgURL }" style="width:120px;height: 80px"/></td>							
							<td><fmt:formatDate value="${a.creatTime }"
									pattern="yyyy-MM-dd HH:mm:ss" /></td>
							<td><a
								href="${pageContext.request.contextPath }/admin/modifyPhoto.form?id=${a.id }"
								onclick="return disp_confirm()">删除</a></td>
						</tr>
					</c:forEach>
				</table>
				<hr />
				<button class="layui-btn layui-btn-radius" onclick="photo()">添加首页帖</button>

				<form class="layui-form"
					action="${pageContext.request.contextPath }/admin/upPhoto.form"
					method="post" enctype="multipart/form-data">
					<div class="layui-form-item" id="upphoto" style="display:none;">
						<hr />
						<label class="layui-form-label">修改帖子ID</label>
						<div class="layui-input-block">
							<input name="id" lay-verify="title" autocomplete="off"
								placeholder="请输入帖子ID" class="layui-input" type="text">
						</div>
						 <br> <input name="imgURL" class="layui-upload-file"
							lay-title="上传帖子配图" type="file" /> <br /> <br /> 
						<button class="layui-btn layui-btn-primary layui-btn-radius">点击上传</button>
					</div>

				</form>
				
			</div>
		</div>
	</div>
<!--  -->
<script src="${path }/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript">

	  		function disp_confirm()
  			{
  				if(confirm('确定要执行此操作吗?')) { 
        		return true; 
    			} 
    			return false; 
  			}
	  		function photo(){
	  			var n=document.getElementById("upphoto");
	  			n.style.display="block";
	  		}
	  		layui.use('upload', function(){	
					  
			   layui.upload({
				    url: '${pageContext.request.contextPath }/admin/uploadPhoto.form' //上传接口
				    ,success: function(res){ //上传成功后的回调
				      alert(res.msg);
				    }
			   });
			});
  		</script>
	

</body>
</html>
