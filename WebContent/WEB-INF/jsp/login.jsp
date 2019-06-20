<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>系统登陆</title>
<link rel="stylesheet" href="../../bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="../../css/user/book-info.css">
<script src="../../js/jquery/jquery-1.12.4.min.js"></script>
<script src="../../js/jquery/jquery.raty.min.js"></script>
<script src="../../bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="../../bootstrap/validator/js/zh_CN.js"></script>
<script src="../../bootstrap/validator/js/bootstrapValidator.min.js"></script>
<script src="../../js/me.js"></script>
</head>
<body>
<div>
<div class="modal-content" style="width:26%;height: auto;padding: 36px;">
<form role="form" id="login">
<input type="text" style="display:none" value="<%=request.getServletPath() %>" name="url">
<div class="form-group">
<label class="control-label">学号</label>
<input type="text" name="studno" id="studId" class="form-control"  placeholder="请输入学号/管理员号">
</div>
<p>sdvsfdbvfrb</p>
<div class="form-group">
<label  class="control-label">密码</label>
<input type="password" name="studpw" id="password" class="form-control"  placeholder="请输入密码">
</div>
<div class="form-group">
<a href="lib忘记密码.html"><button type="button" class="btn btn-link">忘记密码?</button></a>
<button id="submit" class="btn btn-info" style="float: right;">登录</button>
</div>
</form>
</div>
</div>
<script>
 $("#submit").click(function(){
	 var studId = $("#studId").val();
	 var password = $("#password").val();
	 $.ajax({
		 type :'post',
		 url:"/logins",
		 data : {studId:studId,password:password},
		 dataType :"json",
		 success : function(data){
			 alert(data);
		 },
		 error : function(){
			 alert("连接失败");
		 }
	 });

 });
</script>
</body>
</html>