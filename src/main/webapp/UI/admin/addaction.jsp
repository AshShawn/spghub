<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>添加活动</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<link rel="stylesheet" href="${path }/layui/css/layui.css" media="all">

 <script type="text/javascript" src="jquery-1.11.2.js"></script> 

<style type="text/css">
/* 	.myclass{
		width:660px;
		height:400px;
		margin-top:50px;
		margin-left:100px;
		background-color: #DBEAF9;
		text-align: center;
		/* background-image: url(${path}/User-images/0.jpg);
		background-repeat: no-repeat;
		background-size:cover; */
}
.myinput {
	margin-top: 56px;
}

.textarea {
	margin-top: 10px;
}

.select {
	margin-top: 10px;
	margin-left: 0px;
	width: 100px;
}

a {
	margin-top: 6px;
}

#submit {
	margin-left: 140px;
	margin-top: 16px;
}

</style>


</head>

<blockquote class="layui-elem-quote layui-quote-nm">添加活动页面
</blockquote>
<body>
	 <div class="myclass">
	 <div>
		<table class="layui-table" lay-even="" lay-skin="row">
  			<thead style="text-align: center;">
			    <tr>
			    	<th>序号</th>
			    	<th>名字</th>
			    	<th>活动介绍</th>
			    	<th>创建时间</th>
			    	<th>活动状态</th>
			    	<th>操作</th>
			    </tr>
	    	</thead>
		    <c:if test="${empty lists}">
	    		<tr>
	    			<td colspan='6' style='color:red;font-size:9pt; text-align: center'>没有查到</td>
	    		</tr>
	    	</c:if>
		    <c:if test="${not empty lists}">
	    		
	    			<c:forEach var='e' items="${lists }" varStatus="vs" >
		    			<tr>
		    				<td>${vs.count }</td>
		    				<td>${e.name }</td>
		    				<td>${e.introduction }</td>
		    				<td><fmt:formatDate value="${e.creatTime }" pattern="yyyy-MM-dd " /></td>
		    				<td>${e.actionStatus.statusName }</td>
		    				<td><a href="${pageContext.request.contextPath }/admin/modifyActionStatus.form?id=${e.id}">关闭活动</a></td>
		    			</tr>
	    			</c:forEach>
	    	</c:if>
    	</table>
	</div> 
		
		<form class="layui-form"
			action="${pageContext.request.contextPath }/admin/addAction.form"
			method="post">
			<!--活动名字  -->
			<div class="layui-form-item">
				<label class="layui-form-label">活动名字:</label>
				<div class="layui-input-block">
					<input  name="name" id="actionName" lay-verify="title"
						autocomplete="off" placeholder="请输入..." class="layui-input"
						type="text" >
				</div>
			</div>
			<br>
			<!--活动介绍  -->
			<div class="layui-form-item layui-form-text">
				<label class="layui-form-label">活动介绍:</label>
				<div class="layui-input-block">
					<textarea name="introduction" id="actionDetails" placeholder="请输入内容" lay-verify="actionDetails"
						class="layui-textarea"></textarea>
				</div>
			</div>
			<br>
			<!-- 活动时间 -->
			<div class="layui-inline">
				<label class="layui-form-label">活动时间:</label>
				<div class="layui-input-inline">
					<input name="creatTime" id="date" lay-verify="creatTime"  
						placeholder="yyyy-mm-dd" autocomplete="off" class="layui-input"
						onclick="layui.laydate({elem: this})" type="text">
				</div>
			</div>
		<!--活动图片  -->
			
			 <input  name="imgURL" class="layui-upload-file"
							lay-title="上传活动配图" type="file" /> 
						
			
			<!-- 活动状态 -->
			<div class="layui-form-item">
				<label class="layui-form-label">活动状态:</label>

				<div class="layui-input-block">
					<select class="select" lay-filter="aihao" name="actionStatus.id">
						<option value="1">进行中</option>
						<option value="2">已关闭</option>
					</select>
				</div>
			</div>
			<br> <input id="submit"  lay-submit="demo1" lay-filter="demo1" style="width:60px" type="submit"
				 value="提交" />
				
		</form>
		
	</div>
	
	<script src="${path }/layui/layui.js" charset="utf-8"></script>
<script>
	layui.use([ 'form', 'layer', 'laydate' ],function() {
		var form = layui.form(), layer = layui.layer, $=layui.jquery;
		//layer.msg("表单验证");
		form.verify({
				 creatTime: function(value) {
					if (value.length ==0||value=="") {
						return '时间不能为空';
					}
				}
				,title : [ /(.+){5,120}$/, '活动不能少于5个字' ]
				,actionDetails : [ /(.+){20,120}$/, '活动介绍不能少于20个字' ]
				
			});
			layui.use('upload', function(){	
					  
			   layui.upload({
				    url: '${pageContext.request.contextPath }/admin/uploadPhoto.form' //上传接口
				    ,success: function(res){ //上传成功后的回调
				      alert(res.msg);
				    }
			   });
			  }); 
			// alert($("#date").val()); 
	/* 	   $("#actionName").blur(function() {
			if (document.getElementById("actionName").value == "") {
				document.getElementById("actionNameHint").innerHTML = "请输入活动名字！！";
				//alert(flag);
			} else {
				document.getElementById("actionNameHint").innerHTML = "";
				//document.getElementById("actionNameHint").attributes("active",1);
				//flag = true;
			}
		});	
		
		$("#actionDetails").blur(function() {
			
			if (document.getElementById("actionDetails").value == "") {
				document.getElementById("actionDetailsHint").innerHTML = "请输入活动介绍！！";

			} else {
				document.getElementById("actionDetailsHint").innerHTML = "";
			}
		}); */  
		
		
	});
</script>
</body>

</html>
