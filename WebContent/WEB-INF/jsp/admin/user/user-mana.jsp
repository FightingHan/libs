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
<title>用户管理</title>
<link rel="stylesheet" href="../../css/admin/search.css">
<link rel="stylesheet" href="../../bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="../../css/admin/navi.css">
<script src="../../bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="../../js/jquery/jquery-1.12.4.min.js"></script>
</head>

<body>
	<nav>
		<ul class="nav nav-tabs">
			<li><h3 class="logo">@蛋白质</h3></li>
			<li><a href="manager_home.html">home</a></li>
			<li><a href="图书管理.html">图书管理</a></li>
			<li><a href="../student/liststu">学籍管理</a></li>
			<li class="active"><a href="用户管理.html">用户管理</a></li>
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
		<a href="#"><img src="../../imgs/head/001.jpeg" width="150px" class="thumbnail" alt="head"></a>
		<div class="list-group side-bar text-center">
			<a href="用户管理.html" class="list-group-item side active">用户列表</a>
			<a href="listheadpic" class="list-group-item side">头像管理</a>
		</div>
		</div>
	</div>
<p><%=request.getAttribute("flag") %></p>	
	
	<div class="col-md-10 bar1">
		<br>
		<div>
			<label>昵称</label>
			<input type="text" placeholder="输入昵称...">
			<label>学号</label>
			<input type="text" placeholder="输入学号...">
			<label>学院</label>
			<input type="text" placeholder="输入学院...">
			<button>search</button>
			<img src="../../imgs/icon-gzh/search.png" width="20px" title="search" alt="search">
		</div>
		
		<div style="float: right ;margin-right: 30px;">
			<a href="#"><img src="../../imgs/icon-ljw/disabled.png" width="35px" title="禁用选中" alt="disabledall" onClick="confirm('确定禁用已选中用户嘛？qwq')"></a>
		</div>
		
	<table class="table-striped table">
		<thead>
		<tr>
			<th><input type="checkbox" class="check" name="checkall"></th>
			<th>学号</th>
			<th>昵称</th>
			<th>性别</th>
			<th>email</th>
			<th>注册时间</th>
			<th>详情</th>
			<th>操作</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach items="${userlist }" var="user">
		<tr>
			<td><input type="checkbox" name="check"></td>
			<td>${user.id }</td>
			<td><a href="jump-info">${user.nickname }</a></td>
			<td> 
			   <c:if test="${user.male == 'f'}">女</c:if>  
			   <c:if test="${user.male == 'm'}">男</c:if>  
            </td>
			<td>${user.email }</td>
			<td>
			<fmt:formatDate value="${user.registerTime }" type="both" pattern="yyyy年MM月dd日 "/>
			</td>
			<td>
			<a href="jump-info?userId=${user.id }">查看详情</a>
			</td>
			<td>
			<c:if test="${user.enabled == false }"><a href="javascript:if(confirm('确定启用当前学生吗'))location='enabled?userId=${user.id }';"><img src="../../imgs/icon-ljw/abled.png" width="30px" class="icon"></a></c:if>
            <c:if test="${user.enabled == true }"><a href="javascript:if(confirm('确定禁用当前学生吗？'))location='enabled?userId=${user.id }';"><img src="../../imgs/icon-ljw/disabled.png" width="30px" class="icon"></a></c:if>
			</td>
		</tr>
	</c:forEach>
	</tbody>
		</table>
	</div>
	<script>
	</script>
	
	<script type="text/javascript">
			$('input[name="checkall"]').on("click",function(){
				if($(this).is(':checked')){
					$('input[name="check"]').each(function(){
						$(this).prop("checked",true);
					});
				}else{
					$('input[name="check"]').each(function(){
						$(this).prop("checked",false);
					});
				}
			});
		</script>
</body>
</html>