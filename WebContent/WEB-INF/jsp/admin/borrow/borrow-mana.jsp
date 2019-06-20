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
<title>借阅日志</title>
<link rel="stylesheet" href="../../bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="../../css/admin/search.css">
<link rel="stylesheet" href="../../css/admin/navi.css">
<script src="../../bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="../../js/jquery/jquery-1.12.4.min.js"></script>
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
	<br>
	<div class="sidebar">
      <div class="col-sm-2">
           <div class="list-group side-bar text-center">
			   <img class="thumbnail" src="../../imgs/head/001.jpeg" width="150px">
                	<a href="图书管理.html" class="list-group-item side">图书列表</a>
			   		<a href="录入图书.html" class="list-group-item side">录入图书</a>
                    <a href="借阅日志.html" class="list-group-item side active">借阅日志</a>
		            <a href="评分管理.html" class="list-group-item side">评论管理</a>
			        <a href="类别管理.html" class="list-group-item side">类别管理</a>
                </div>      
            </div>
	</div>
	<div class="col-md-10">
		<h4 style="float: right">共有${brolist.size() }条记录</h4>
	<table class="table-striped table">
	<thead>
		<tr>
			<th>日期</th>
			<th>isbn</th>
			<th>借/还人姓名</th>
			<th>应还日期</th>
			<th>实际归还日期</th>
			<th>是否有续借</th>
		</tr>
	</thead>
		<tbody>
		<c:forEach items="${brolist }" var="bro">
			<tr>
			    <td>
			       <fmt:formatDate value="${bro.borrowDay}" type="both" pattern="yyyy年MM月dd日 "/>
			    </td>
				<td>${bro.ISBN }</td>
				<td>${bro.studId }</td>
				<td>
				<fmt:formatDate value="${bro.shouldReturn}" type="both" pattern="yyyy年MM月dd日 "/>
				</td>
				<td>
				   <fmt:formatDate value="${bro.actualReturn }" type="both" pattern="yyyy年MM月dd月"/>
				</td>
				<td>
				<c:if test="${bro.renew == false }">无</c:if>
				<c:if test="${bro.renew == true }">有</c:if>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	</div>
</body>
</html>
