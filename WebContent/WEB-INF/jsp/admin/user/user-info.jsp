<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="cn.edu.swun.bnb.libs.pojo.Student"%>
<%@ page import="cn.edu.swun.bnb.libs.pojo.LibUser"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<title>用户详情</title>
<link rel="stylesheet" href="../../bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="../../css/admin/search.css">
<link rel="stylesheet" href="../../css/admin/navi.css">
<script src="../../bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="../../js/jquery/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" href="../../css/admin/modi.css">
<style>
.content{
	margin-top: 40px;
}
.content-right{
	float: right;
	margin-top: 40px;
}</style>
</head>
<%
LibUser user = (LibUser)request.getAttribute("user");
Student stu = (Student)request.getAttribute("stu");
%>
<body>
	<nav>
		<ul class="nav nav-tabs">
			<li><h3 class="logo">@蛋白质</h3></li>
			<li><a href="manager_home.html">home</a></li>
			<li class="active"><a href="图书管理.html">图书管理</a></li>
			<li><a href="学生管理.html">学籍管理</a></li>
			<li><a href="用户管理.html">用户管理</a></li>
			<li><a href="消息管理.html">消息管理</a></li>
			<li><a href="缴费管理.html">缴费管理</a></li>
			<ul class="nav nav-tabs navbar-right">
			<li><a href="#"><img src="../../imgs/switch.png" width="20px" alt="切换"></a></li>
	        <li><a href="manager_home.html">退出</a></li>
	        <li><a href="">个人中心</a></li>
            </ul>
		</ul>
	</nav>
	<br>
	<div class="sidebar">
      <div class="col-sm-2">
           <div class="list-group side-bar text-center">
			   <img class="thumbnail" src="../../imgs/head/001.jpeg" width="150px">
                	<a href="图书管理.html" class="list-group-item side active">图书列表</a>
			   		<a href="录入图书.html" class="list-group-item side">录入图书</a>
                    <a href="借阅日志.html" class="list-group-item side">借阅日志</a>
		            <a href="评分管理.html" class="list-group-item side">评论管理</a>
			        <a href="类别管理.html" class="list-group-item side">类别管理</a>
                </div>      
            </div>
	</div>
	
	<div class="col-md-10">
		<div class="col-md-3">
		<em><h4>用户主要信息</h4></em>
		<img src="../../imgs/me.png" alt="头像" width="150px" class="thumbnail">
		</div>
		<div class="col-md-3 content">
			<p><strong>昵称：</strong><%=user.getNickname() %></p>
			<p><strong>性别：</strong>
			<c:if test="${user.male == 'f'}">女</c:if>  
		    <c:if test="${user.male == 'm'}">男</c:if>  
			</p>
			<p><strong>学号：</strong><%=stu.getStudId() %></p>
			<p><strong>姓名：</strong><%=stu.getStudName() %></p>
			<p><strong>学院：</strong><%=stu.getInsName() %></p>
			<p><strong>专业：</strong><%=stu.getMajorName() %></p>
			<p><strong>邮箱：</strong><%=user.getEmail() %></p>
			<p><strong>权限：</strong>
			<c:if test="${user.userType == 1 }">管理员</c:if>
			<c:if test="${user.userType == 0 }">读者</c:if>
			</p>
		</div>
		
		<div class="col-md-3 content-right">
			<p><strong>注册时间：</strong><%=user.getRegisterTime() %></p>
			<p><strong>借阅量：</strong>233本</p>
		</div>
	</div>
</body>
</html>