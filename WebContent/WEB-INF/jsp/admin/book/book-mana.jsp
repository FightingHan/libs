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
<title>图书管理</title>
<link rel="stylesheet" href="../../css/admin/modi.css">
<link rel="stylesheet" href="../../bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="../../css/admin/search.css">
<link rel="stylesheet" href="../../css/admin/navi.css">
<script src="../../js/jquery/jquery-1.12.4.min.js"></script>
<script src="../../bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
			   		<a href="jump-add" class="list-group-item side">录入图书</a>
                    <a href="../borrow/listbor" class="list-group-item side">借阅日志</a>
		            <a href="评分管理.html" class="list-group-item side">评论管理</a>
			        <a href="类别管理.html" class="list-group-item side">类别管理</a>
                </div>      
            </div>
	</div>
	
	<div class="col-md-10 bar1">
		<br>
		<a data-toggle="collapse" href="#search"><img src="../../imgs/search.png" width="20px" title="search" alt="search"></a>
		<div class="collapse" id="search">
			<label>书名</label>
			<input type="text" placeholder="输入书名...">
			<label>出版社</label>
			<input type="text" placeholder="输入出版社...">
			<label>作者</label>
			<input type="text" placeholder="输入作者...">
			<button>search</button>
		</div>
		
	<h4 style="float: right">共有 3 条记录</h4>
	<table class="table-striped table">
		<thead>
		<tr>
			<th><input type="checkbox" class="check"></th>
			<th>书名</th>
			<th>作者</th>
			<th>ISBN</th>
			<th>出版社</th>
			<th>可借/在库</th>
			<th>价格</th>
			<th>详情</th>
			<th>操作</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach items="${booklist }" var ="book">
		<tr>
			<td><input type="checkbox"></td>
			<td>${book.name }</td>
			<td>${book.author }</td>
			<td>${book.isbn }</td>
			<td>${book.publisher }</td>
			<td>${book.availableNum }/${book.totalNum }</td>
			<td>${book.price }</td>
			<td><a href="info?isbn=${book.isbn }">点击查看</a></td>
			<td>
			<a href="jump-modify?isbn=${book.isbn }"><img src="../../imgs/edit.png" width="20px" title="修改" alt="修改" class="icon"></a> 
			<a href="javascript:if(confirm('确定删除当前书籍吗'))location='del?isbn=${book.isbn }';"><img src="../../imgs/remove.png" width="30px" title="删除"></a>
			<a data-toggle="modal" data-target="#myModal"><img src="../../imgs/icon-ljw/number.png" alt="修改数量" title="修改数量" width="25px" class="icon"></a>
			</td>
		   </tr>
	</c:forEach>
	</tbody>
		</table>
	</div>
	
	<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-	hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					修改图书数量
				</h4>
			</div>
			<div class="modal-body">
				<p><strong>书名：</strong>百年孤独</p>
				<p><strong>ISBN：</strong>2333-3232</p>
				<p><strong>作者：</strong>马尔克斯</p>
				<div class="gw_num">
           			<em class="jian">-</em>
   					<input type="text" value="1" class="num"/>
  					 <em class="add">+</em>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
				<a href="图书管理.html"><button type="button" class="btn btn-primary">
					提交更改
				</button></a>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
	
</body>
</html>
