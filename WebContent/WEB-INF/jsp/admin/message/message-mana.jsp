<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<title>消息管理</title>
<link rel="stylesheet" href="../../bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="../../css/admin/search.css">
<link rel="stylesheet" href="../../css/admin/navi.css">
<script src="../../bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="../../js/jquery/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" href="../../css/admin/modi.css">
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
<div class="col-md-2" id="myScrollspy">
	<img src="../../imgs/head/001.jpeg" alt="touxiang" width="150px" class="thumbnail">
<ul class="nav nav-tabs nav-stacked" data-spy="affix" data-offset-top="125">
<li class="active"><a href="#section-1">管理员申请</a></li>
<!--<li><a href="#section-2">读者荐购</a></li>
<li><a href="#section-3">信息发布</a></li>-->
	</ul>
	</div>
	
	<div class="col-md-10">
		<h2 id="section-1">管理员申请</h2>
		<div class="container1">
			<table class="table-striped table">
				<thead>
					<th>申请日期</th>
					<th>申请人姓名</th>
					<th>详情</th>
					<th>申请理由</th>
					<th>操作</th>
				</thead>
				<tbody>
					<td>2018-11-27</td>
					<td>嘴嘴</td>
					<td><a href="#">点击查看</a></td>
					<td>我是一块砖，哪里需要哪里搬</td>
					<td><a href="#"><img src="../../imgs/icon-ljw/pass.png" alt="同意" title="同意" width="25px"></a> <a href="#"><img src="../../imgs/icon-ljw/nopass.png" alt="不同意" width="25px" title="不同意"></a></td>
				</tbody>
			</table>
		</div>
		<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam eu sem tempor, varius quam at, luctus dui. Mauris magna metus, dapibus nec turpis vel, semper malesuada ante. Vestibulum id metus ac nisl bibendum scelerisque non non purus. Suspendisse varius nibh non aliquet sagittis. In tincidunt orci sit amet elementum vestibulum. Vivamus fermentum in arcu in aliquam. Quisque aliquam porta odio in fringilla. Vivamus nisl leo, blandit at bibendum eu, tristique eget risus. Integer aliquet quam ut elit suscipit, id interdum neque porttitor. Integer faucibus ligula.</p>
<p>Vestibulum quis quam ut magna consequat faucibus. Pellentesque eget nisi a mi suscipit tincidunt. Ut tempus dictum risus. Pellentesque viverra sagittis quam at mattis. Suspendisse potenti. Aliquam sit amet gravida nibh, facilisis gravida odio. Phasellus auctor velit at lacus blandit, commodo iaculis justo viverra. Etiam vitae est arcu. Mauris vel congue dolor. Aliquam eget mi mi. Fusce quam tortor, commodo ac dui quis, bibendum viverra erat. Maecenas mattis lectus enim, quis tincidunt dui molestie euismod. Curabitur et diam tristique, accumsan nunc eu, hendrerit tellus.</p>
	</div>
	
<!--	<div class="col-md-10" style="float: right">
		<h2 id="section-2">读者荐购</h2>
		<div class="container2">
			<table class="table-striped table">
				<thead>
					<th>荐购日期</th>
					<th>荐购人姓名</th>
					<th>书名</th>
					<th>图书详情</th>
					<th>推荐理由</th>
					<th>操作</th>
				</thead>
				<tbody>
					<td>2018-11-27</td>
					<td>嘴嘴</td>
					<td>《百年孤独》</td>
					<td><a href="#">点击查看</a></td>
					<td>你是孤独的人</td>
					<td><a href="#"><img src="../picture/同意.png" alt="同意" title="同意" width="25px"</a> <a href="#"><img src="../picture/删除.png" alt="不同意" width="30px" title="不同意"></a></td>
				</tbody>
			</table>
			<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam eu sem tempor, varius quam at, luctus dui. Mauris magna metus, dapibus nec turpis vel, semper malesuada ante. Vestibulum id metus ac nisl bibendum scelerisque non non purus. Suspendisse varius nibh non aliquet sagittis. In tincidunt orci sit amet elementum vestibulum. Vivamus fermentum in arcu in aliquam. Quisque aliquam porta odio in fringilla. Vivamus nisl leo, blandit at bibendum eu, tristique eget risus. Integer aliquet quam ut elit suscipit, id interdum neque porttitor. Integer faucibus ligula.</p>
<p>Vestibulum quis quam ut magna consequat faucibus. Pellentesque eget nisi a mi suscipit tincidunt. Ut tempus dictum risus. Pellentesque viverra sagittis quam at mattis. Suspendisse potenti. Aliquam sit amet gravida nibh, facilisis gravida odio. Phasellus auctor velit at lacus blandit, commodo iaculis justo viverra. Etiam vitae est arcu. Mauris vel congue dolor. Aliquam eget mi mi. Fusce quam tortor, commodo ac dui quis, bibendum viverra erat. Maecenas mattis lectus enim, quis tincidunt dui molestie euismod. Curabitur et diam tristique, accumsan nunc eu, hendrerit tellus.</p>
		</div>
	</div>
	
	<div class="col-md-10" style="float: right">
		<h2 id="section-3">信息发布</h2>
		<div class="container3">
			<form>
				<label>say something...</label>
				<input type="text">
			</form>
		</div>
	</div>-->
	
</body>
</html>