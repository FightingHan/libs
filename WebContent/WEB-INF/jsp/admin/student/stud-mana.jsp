<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<title>学籍管理</title>
<link rel="stylesheet" href="../../bootstrap/3.3.7/css/bootstrap.min.css">
<script src="../../js/jquery/jquery-1.12.4.min.js"></script>
<script src="../../bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="../../js/jquery/jquery-1.12.4.min.js"></script>
<link rel="stylesheet" href="../../css/admin/navi.css">
<link rel="stylesheet" href="../../css/admin/modi.css">
<link rel="stylesheet" href="../../css/admin/search.css">
</head>

<body>
	<nav>
		<ul class="nav nav-tabs">
			<li><h3 class="logo">@蛋白质</h3></li>
			<li><a href="manager_home.html">home</a></li>
			<li><a href="图书管理.html">图书管理</a></li>
			<li class="active"><a href="学生管理.html">学籍管理</a></li>
			<li><a href="../user/listuser">用户管理</a></li>
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
			   <img src="../../imgs/head/001.jpeg" alt="头像" width="150px" class="thumbnail" >
                	<a href="liststu" class="list-group-item side active">学生列表</a>
                    <a href="jump-add" class="list-group-item side">录入学生</a>
                </div>      
            </div>
	</div>
	
	<div class="col-md-10 bar1">
		<br>
	<a data-toggle="collapse" href="#search"><img src="../../imgs/search.png" width="20px" title="search" alt="search"></a>
    <form action="liststu" method="post">
		<div class="collapse" id="search">
			<label>姓名</label>
			<input type="text" placeholder="输入姓名..." name="Name">
			<label>学号</label>
			<input type="text" placeholder="输入学号..." name="Id">
			<label>学院</label>
			<select class="form-control" name="ins" id="insId" style="width:360px;display:inline;">
			<option value="0">---请选择学院---</option>
			<c:forEach items="${inslist}" var="ins">
				<option value="${ins.insId }">${ins.insName}</option>
			</c:forEach>
			</select>
			<button type="submit">search</button>
		</div>
	</form>	
	<form action="batchdel" method="post" onSubmit="return del_confirm()">
	<div style="float: right ;margin-right: 30px;">
			<button type="submit"><img src="../../imgs/remove.png" width="35px" title="删除全部" alt="deleteall"></button>
	</div>
	<table class="table-striped table">
		<thead>
		<tr>
			<th><input type="checkbox" class="check" id="checkall"></th>
			<th>学号</th>
			<th>学院</th>
			<th>专业</th>
			<th>姓名</th>
			<th>操作</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach items="${studentList}" var="student">
		<tr>
			<td><input type="checkbox" name="batchdel" value="${student.studId }"></td>
			<td>${student.studId}</td>
			<td>${student.insName }</td>
			<td>${student.majorName }</td>
			<td>${student.studName }</td>
			<td>
			<a href="jumpmodi?studId=${student.studId}"><img src="../../imgs/edit.png" width="20px" title="修改"></a> 
			<a type="submit" href="javascript:if(confirm('确定删除当前学生吗'))location='del?studId=${student.studId}';"><img src="../../imgs/remove.png" width="30px" title="删除"></a>
			<input type="text" value="${student.studId}" name="studId">
			</td>
		</tr>
	</c:forEach>
	</tbody>
	</table>
	</form>
	</div>
	
<script type="text/javascript">
$(document).ready(function(){
	var major = [];
    var majorsinfo = $("#majorId");
    <c:forEach items="${majorlist}" var="major">
        major.push({
        	id:${major.majorId},
        	name:"${major.majorName}",
        	ins:${major.insId}
        });
    </c:forEach>
    $("#insId").change(function(){
    	var insid = $(this).val();
    	$("#majorId").empty();
    	if(insid == 0)
			$("#majorId").append("<option value='0'>---请选择专业---</option>");
    	else{
    		for(i = 0; i< major.length; i++){
    			if(major[i].ins == insid)
    				$("#majorId").append("<option value="+major[i].id+">"+major[i].name+"</option>");
    		}
    	}
    });
    $("#checkall").click(function(){
    	var batdel = document.getElementsByName("batchdel");
    	for(var j=0;j<batdel.length;j++){
    		if(!batdel[j].checked){
    			batdel[j].checked = true;
    		}
    		else{
    			batdel[j].checked = false;
    		}
    	} 	
    });
});
function del_confirm()
{
	var batdel = document.getElementsByName("batchdel");
	var i=0;
	for(var j=0;j<batdel.length;j++){
		if(batdel[j].checked){
			i++;
		}
	}
	if(i==0){
		alert("请至少选择一项");
		return false;
	}
	else{
		if (!confirm("确定要删除"+i+"个选中的同学吗？")) return false;
	}
}

</script>
</body>
</html>
