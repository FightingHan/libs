<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ page import="cn.edu.swun.bnb.libs.pojo.LibUser" %>
<%@ page import="cn.edu.swun.bnb.libs.consts.SessionConstant" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<title>无标题文档</title>
<link rel="stylesheet" href="css/home.css">
<link rel="stylesheet" href="bootstrap/3.3.7/css/bootstrap.min.css"> 
<link rel="stylesheet" href="css/me.css">
<link rel="stylesheet" href="boostrap/validator/css/bootstrapValidator.min.css">
<script src="js/jquery/jquery-1.12.4.min.js"></script>
<script src="bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="js/jqurey/jquery.raty.min.js"></script>
<script src="bootstrap/validator/js/zh_CN.js"></script>
<script src="bootstrap/validator/js/bootstrapValidator.min.js"></script>
<script src="js/me.js"></script>
</head>

<body>
<% 
LibUser user = (LibUser)session.getAttribute(SessionConstant.USER_IN_SESSION);
%>
<header>
	<h2>欢迎使用图书馆管理系统</h2>
</header>
<nav>
<ul class="nav nav-tabs">
<li><a href="lib主页.html">首页</a></li>
<li><a href="lib热门推荐.html">热门推荐</a></li>
<li><a href="lib图书查找.html">图书查找</a></li>
<li><a href="lib最新评论.html">最新评论</a></li>
<li style="float: right; margin-right: 16px;">
	<a href="lib注册.html"><img src="imgs/me.png"></a>
</li>
<%
if (user == null) {
%>
<li style="float: right; margin-right: 16px;">
	<a data-toggle="modal" data-target="#loginModal">登录</a>
</li>
<li style="float: right; margin-right: 16px;">
	<a href="jump-register">注册</a>
</li>
<%} else { %>
<li style="float: right; margin-right: 16px;">
	<a href="logout">注销</a>
</li>
<%} %>
</ul>
</nav>
<div class="col-sm-2" id="myScrollspy" style="margin-top: 26px;">
<nav>
<ul class="nav text-center" data-spy="affix" data-offset-top="12">
<div class="text-center">
	<img src="imgs/head/001.jpeg" class="usephoto">
	<h3>耿卓涵</h3>
</div>
<li><a href="lib个人主页.html">我的首页</a></li>
<li><a href="lib借阅历史.html">借阅历史</a></li>
<li><a href="#nowlend">当前借阅</a></li>
<li><a href="#myorder">我的预约</a></li>
<li><a href="lib我的书评.html">我的书评</a></li>
<li><a href="lib我的收藏.html">我的收藏</a></li>
</ul>
</nav>
</div>
	
	
<div class="col-sm-8">
       <from>
			<div class="input-group" style="margin: 30px;">
			<span class="input-group-btn">
			 <select style="width: 100px;" class="form-control">
                    <option>任意字</option>
                    <option>作者</option>
                    <option>书名</option>
                    <option>出版社</option>
				    <option>ISBN</option>
              </select>
			</span>
            <input type="text" class="form-control"   placeholder="书名/作者/ISBN/出版社">
            <span class="input-group-btn">
				<a href="lib图书查找.html"><img src="imgs/find.png"></a>
			</span>
			</div>
	  </from>
	<div class="col-sm-6 table-responsive" style="border-style:groove; border-color:antiquewhite; height: 386px;">
		<table class="table table-hover table-bordered">
		<caption><strong>热门借阅排行</strong><a href="lib热门推荐.html"><button type="button" class="btn btn-sm" style="float: right;">了解更多</button></a></caption>
		<thead>
			<tr >
				<th>图书名称</th>
				<th>书籍作者</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><a href="lib显示图书.html">三体</a></td>
				<td>刘慈欣</td>
			</tr>
		</tbody>
	</table>
	</div>
	<div class="col-sm-6 table-responsive" style="border-style:groove; border-color:antiquewhite; height: 386px;">
		<table class="table">
		<caption><strong>新书速递</strong></caption>
		<thead>
			<tr>
				<th>图书名称</th>
				<th>ISBN</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${booklist }" var="book">
			<tr>
				<td><a href="user/book/jump-info?isbn=${book.isbn }">${book.name }</a>/刘慈欣</td>
				<td>${book.isbn }</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	</div>
</div>
<div class="modal" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
<div class="modal-content" style="width:26%;height: auto;padding: 36px;">
<form role="form" id="login" action="login" method="post">
<input type="text" style="display:none" value="<%=request.getServletPath() %>" name="url">
<div class="form-group">
<label class="control-label">学号</label>
<input type="text" name="studno" class="form-control"  placeholder="请输入学号/管理员号">
</div>
<div class="form-group">
<label  class="control-label">密码</label>
<input type="password" name="studpw" class="form-control"  placeholder="请输入密码">
</div>
<div class="form-group">
<a href="lib忘记密码.html"><button type="button" class="btn btn-link">忘记密码?</button></a>
<button type="submit" class="btn btn-info" style="float: right;">登录</button>
</div>
</form>
</div>
</div>
</body>
</html>