<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<title>用户注册</title>
<link rel="stylesheet" href="css/register.css">
<link rel="stylesheet" href="bootstrap/3.3.7/css/bootstrap.min.css"> 
<link rel="stylesheet" href="bootstrap/validator/css/bootstrapValidator.min.css">
<script src="js/jquery/jquery-1.12.4.min.js"></script>
<script src="js/register.js"></script>
<script src="bootstrap/validator/js/bootstrapValidator.min.js"></script>
<script src="bootstrap/validator/js/zh_CN.js"></script>
<script src="bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<c:if test="${hint != null }">
<p>${hint }</p>
</c:if>
<form id="register" class="content col-md-offset-2 col-md-8" action="confirm" method="post">
<div class="col-sm-6">
<div class="form-group">
	<label class="control-label">学号</label>
	 <input type="text" name="studno" class="form-control"  placeholder="请输入准确的学号">
</div>
<div class="form-group">
	<label class="control-label">密码</label>
    <input type="password"  name="studpw" class="form-control"  placeholder="请输入密码">
</div>
<div class="form-group">
   <label class="control-label">确认密码</label>
   <input type="password" name="cfstudpw" class="form-control"  placeholder="请再次输入密码">
</div>
<div class="form-group">
   <label class="control-label">姓名</label>
   <input type="text" name="studname" class="form-control"  placeholder="请输入真实姓名">
</div>
</div>
<div class="col-sm-6">
<div class="form-group">
     <label class="control-label">昵称</label>
     <input type="text" name="username" class="form-control" placeholder="请输入想设置的昵称">
</div>
<div class="form-group">
   <label class="control-label">E-mail</label>
   <input type="text" name="emails" class="form-control"  placeholder="请输入邮箱地址">
</div>
<div class="form-group col-sm-6">
		<img src="imgs/head/001.jpeg" class="img-thumbnail" style="height: 118px;">
</div>
<div class="form-group col-sm-6">
<a data-toggle="modal" data-target="#userpic"><button class="btn btn-info" style="margin-bottom:16px;">选择头像</button></a>
<br>
   <label class="control-label">性别</label>
	<div>
    <button type="button" class="btn btn-default" style="width: 60px;" id="boy">男</button>
    <button type="button" class="btn btn-default" style="width: 60px;" id="girl">女</button>
    <input type="text" style="display:none;" name="male" id="male" value="">
   </div>
</div>
</div>
<div class="col-sm-12">
	<label class="control-label">班级详细信息</label>
</div>
<div class="form-group col-sm-6">
<select class="form-control" name="studins" id="insId">
    <option value="0">---请选择学院---</option>
    <c:forEach items="${inslist}" var="ins">
	<option value="${ins.insId }">${ins.insName}</option>
    </c:forEach>
</select>
</div>
<div class="form-group col-sm-6">
<select class="form-control" name="studmajor" id="majorId" >
    <option value="0">---请选择专业---</option>
</select>
</div>
<div class="form-group col-sm-12" style="margin-top: 18px;">
<a href="lib主页.html"><button class="btn btn-default">取消</button></a>
<button type="submit" class="btn btn-info" style="float:right;">确认提交信息</button>
</div>
</form>
<div id="userpic" class="modal"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-content">
		<h3>头像选择</h3>
		<div class="modal-body">
		<c:forEach items="${headlist }" var="head">
			<div class="col-sm-2" style="margin-bottom: 16px;">
				<img class="userpic" src="${head.url }" name="head">
			</div>
		</c:forEach>
		</div>
		<footer class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			<a href="register"><button id="sure" class="btn btn-info">完成</button></a>
		</footer>
	</div>
</div>
<script type="text/javascript">
$(document).ready(function(){
	var major = [];
    var majorsinfo = $("#majorId");
    <c:forEach items="${majorlist}" var="major">
        major.push({
        	id:${major.majorId},
        	name:"${major.majorName}",
        	ins:${major.insId}
        });
    </c:forEach>
    $("#insId").change(function(){
    	var insid = $(this).val();
    	$("#majorId").empty();
    	if(insid == 0)
			$("#majorId").append("<option value='0'>---请选择专业---</option>");
    	else{
    		for(i = 0; i< major.length; i++){
    			if(major[i].ins == insid)
    				$("#majorId").append("<option value="+major[i].id+">"+major[i].name+"</option>");
    		}
    	}
    });
    $("#boy").click(function(){  
        $("#male").val("m"); //设置 
    });  
    $("#girl").click(function(){  
        $("#male").val("f"); //设置  
    });  
});
</script>
<script type="text/javascript">
function addbor(var i){
	var head = document.getElementsByName("head");
	alert("evdfv");
}
$("#submits").click(function(){
})

</script>
</body>
</html>