<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<title>个人主页</title>

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
<header><h2>欢迎使用图书馆管理系统</h2></header>
<nav>
<ul class="nav nav-tabs">
<li><a href="lib主页.html">首页</a></li>
<li><a href="lib热门推荐.html">热门推荐</a></li>
<li><a href="lib图书查找.html">图书查找</a></li>
<li><a href="lib最新评论.html">最新评论</a></li>
<li style="float: right; margin-right: 16px;">
	<a href="lib注册.html"><img src="imgs/me.png"></a>
</li>
<li style="float: right; margin-right: 16px;">
	<a data-toggle="modal" data-target="#loginModal">登录</a>
</li>
<li style="float: right; margin-right: 16px;">
	<a href="lib注册.html">注册</a>
</li>
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
<div class="col-sm-10 allbox" style="margin-top: 26px;">
<div class="col-sm-3">
		<br>
		<label>昵称：</label>包子<br>
		<label>学号：</label>201731104111<br>
		<label>姓名：</label>耿卓涵<br>
		<label>email:</label>1062657085@qq.com<br>	
</div>
<p><%=request.getAttribute("flag") %></p>
<div class="col-sm-2">
		<br>
		<a href="../stud/lib修改信息.html"><button type="button" class="btn btn-info">修改信息</button></a>
		<br>
		<br> 
		<a data-toggle="modal" data-target="#modal"><button type="button" class="btn btn-info" id="showMo">申请管理员</button></a>
</div>
<div class="col-sm-2 boxtwo">
	在借图书：
	<br>
	<span class="number" style="color: #337AB7;">4</span>
</div>
<div class="col-sm-2 boxtwo">
	超期图书：
    <br>
	<span class="number" style="color:#EE7779;">2</span>
</div>
<div class="col-sm-2 boxtwo">
	预约图书：
    <br>
	<span class="number" style="color:#73FB93;">1</span>
</div>
    <div class="col-sm-12">
		<p style="float: left;">我的借阅管理</p>
	</div>
	<div class="col-sm-4 box" id="box1">
		在借图书
		<ul>
			<li>三体</li>
			<li>三体：黑暗森林</li>
		    <li>人间失格</li>
		     <li>无声告白</li>
		</ul>
	</div>
	<div class="col-sm-3 box" id="box2">
		超期图书
		<ul>
			<li>三体：黑暗森林</li>
			<li>无声告白</li>
		</ul>
	</div>
	<div class="col-sm-3 box" id="box3">
		预约到书
		<ul>
			<li>福尔摩斯探案全集</li>
		</ul>
	</div>
<div>
	<br>
	<br>
	<br>
	<table class="table">
	   <caption id="nowlend">当前借阅</caption>
			<thead class="text-center">
				<tr>
					<th>图书名称/作者</th>
					<th>借书日期</th>
					<th>应还日期</th>
					<th>续借</th>
				</tr>
			</thead>
		<tbody>
			<tr>
				<td><a>三体</a>/刘慈欣著</td>
				<td>2018-10-15</td>
				<td>2018-12-14</td>
				<td><button type="button" class="btn btn-info btn-sm">续借</button></td>
			</tr>
			<tr class="warning">
				<td><a>三体</a>/刘慈欣著</td>
				<td>2018-10-15</td>
				<td style="color:#E10003;">2018-12-29</td>
				<td><button type="button" class="btn btn-sm">缴费</button></td>
			</tr>
		</tbody>
  </table>
<div class="col-sm-11" style="margin-left: 20px;">
		<button class="btn btn-info" style="float: right;margin-left: 10px;">一键续借</button>
		<a data-toggle="modal" data-target="#finemodal"><button class="btn btn-danger" style="float: right;">一键缴费</button></a>
	</div>
	
<table class="table">
		<caption id="myorder">我的预约</caption>
			<thead>
				<tr>
					<th>图书名称/作者</th>
					<th>预约日期</th>
					<th>到书日期</th>
					<th>操作</th>
				</tr>
			</thead>
	        <tbody>
				<tr>
				<td><a>三体</a>/刘慈欣著</td>
				<td>2018-10-15</td>
				<td>2018-12-14</td>
					<td><a data-toggle="modal" data-target="#ordermodal"><button class="btn btn-default">取消预约</button></a></td>
				</tr>
			</tbody>
  </table>
</div>
</div>
<div id="ordermodal" class="modal"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-content">
		<div class="modal-body">
			<p>确认取消对图书<label>三体</label>的预约吗，该书预计在日期<label>2018-12-12</label>就会被归还，你将可以借阅！</p>
		</div>
		<footer class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			<a href="#"><button id="sure" class="btn btn-info">确定取消预约</button></a>
		</footer>
	</div>
</div>
<div class="modal" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
<div class="modal-content" style="width:26%;height:auto;padding:36px;">
<form role="form" id="login" action="login" method="post">
<div class="form-group">
<input type="text" style="display:none" value="<%=request.getServletPath() %>" name="url">
<label class="control-label">学号</label>
<input type="text" name="studno" class="form-control"  placeholder="请输入学号/管理员号">
</div>
<div class="form-group">
<label class="control-label">密码</label>
<input type="password" name="studpw" class="form-control"  placeholder="请输入密码">
</div>
<div class="form-group">
<a href="lib忘记密码.html"><button type="button" class="btn btn-link">忘记密码?</button></a>
<button type="submit" class="btn btn-info" style="float: right;">登录</button>
</div>
</form>
</div>
</div>
<div id="modal" class="modal"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-content">
		<header class="modal-header">
			<h3>再加把油吧！</h3>
		</header>
		<div class="modal-body">
			<p>总借阅量（大于200本书）：<label>100</label>本</p>
			<p>逾期次数（不超过6次）：<label>2</label>次</p>
			<p>账号注册时间(1年以上)：<label>2017年6月8号</label></p>
		</div>
		<footer class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
			<a href="#"><button class="btn btn-info">确定提交申请</button></a>
		</footer>
	</div>
</div>
<div id="finemodal" class="modal"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-content">
		<header class="modal-header">
			<h3>缴费清单</h3>
		</header>
		<div class="modal-body">
			<p>本次产生欠费的书目有<label>2</label>本</p>
			<p><label>三体</label>:<label>0.8</label>元<br>
			<label>无声告白</label>:<label>0.8</label>元<br>
			<label>一共为<label>1.6</label>元</label>
			</p>
		</div>
		<footer class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
			<a href="../studjsp/lib个人主页.html"><button class="btn btn-info">确定缴费</button></a>
		</footer>
	</div>
</div>

</body>
</html>