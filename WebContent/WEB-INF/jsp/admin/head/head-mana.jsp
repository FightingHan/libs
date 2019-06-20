<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<title>头像管理</title>
<link rel="stylesheet" href="../../bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="../../css/admin/search.css">
<link rel="stylesheet" href="../../css/admin/navi.css">
<script src="../../bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="../../js/jquery/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" href="../../css/admin/modi.css">
	<style>
		td{
			padding:5px;
			border-style: solid;
			border-color: rgba(5,0,0,1.00);
		}
		.add{
			float: right;
			margin-right: 100px;
		}
		.col-md-10{
			
		}
	</style>
</head>

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
	<div class="sidebar">
	<div class="col-md-2">
		<a href="#"><img src="../../imgs/icon-ljw/add.png" width="150px" class="thumbnail" alt="head"></a>
		<div class="list-group side-bar text-center">
			<a href="用户管理.html" class="list-group-item side">用户列表</a>
			<a href="#" class="list-group-item side active">头像管理</a>
		</div>
		</div>
	</div>
	
	<div class="col-md-10">
		<br>
	    <table>
	    <c:forEach items="${headlist }" var="head">
			<tr>
				<td><img src="${head.url }"  width="136px" class="thumbnail" alt="head"><p style="margin-top:0px;height:10px;">编号： 00${head.pic_id }</p></td>
			</tr>
		</c:forEach>
			<tr>
				<td><a data-toggle="modal" data-target="#addpic"><img src="../../imgs/icon-ljw/add.png" width="100px" alt="添加"></a></td>
			</tr>
		</table>
	</div>
</body>
</html>