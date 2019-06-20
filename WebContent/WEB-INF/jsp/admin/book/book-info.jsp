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
<title>图书详情</title>
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
		<em><h4>图书主要信息</h4></em>
		<img src="../../imgs/head/001.jpeg" alt="图书" width="120px">
		</div>
		<div class="col-md-3 content">
			<p><strong>图书名称：</strong>${book.name }</p>
			<p><strong>书籍作者：</strong>${book.author }</p>
			<p><strong>出版社：</strong>${book.publisher }</p>
			<p><strong>ISBN：</strong>${book.isbn }</p>
			<p><strong>图书单价：</strong>${book.price }</p>
			<p><strong>在库数量：</strong>${book.totalNum }</p>
			<p><strong>所属类别：</strong>${book.typeId }</p>			
		</div>
		
		<div class="col-md-3 content-right">
			<p><strong>收藏量：</strong>233次</p>
			<p><strong>评论：</strong>233条</p>
		</div>
	</div>
	<div class="col-md-9">
		<h3>内容简介</h3>
		<p>
		《百年孤独》，是哥伦比亚作家加西亚·马尔克斯创作的长篇小说，是其代表作，也是拉丁美洲魔幻现实主义文学的代表作，被誉为“再现拉丁美洲历史社会图景的鸿篇巨著”。
		作品描写了布恩迪亚家族七代人的传奇故事，以及加勒比海沿岸小镇马孔多的百年兴衰，反映了拉丁美洲一个世纪以来风云变幻的历史。作品融入神话传说、民间故事、宗教典故等神秘因素，巧妙地糅合了现实与虚幻，展现出一个瑰丽的想象世界，成为20世纪重要的经典文学巨著之一。
		</p>
	</div>
</body>
</html>
