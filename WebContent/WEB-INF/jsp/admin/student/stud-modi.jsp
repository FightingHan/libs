<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="cn.edu.swun.bnb.libs.pojo.Student"%>
<%@ page import="cn.edu.swun.bnb.libs.pojo.Ins"%>
<%@ page import="java.util.List" %>
<%@ page import="cn.edu.swun.bnb.libs.pojo.Major"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<title>Insert title here</title>
<link rel="stylesheet" href="../../bootstrap/3.3.7/css/bootstrap.min.css">
<script src="../../js/jquery/jquery-1.12.4.min.js"></script>
<script src="../../bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../../css/admin/navi.css">
<link rel="stylesheet" href="../../css/admin/modi.css">
<style>
		.col-md-4{
			margin-left: 200px;
			margin-top: 100px;
		}
		.list-group{
			width: 150px;
		}
	</style>
</head>
<% 
Student stud =(Student)request.getAttribute("stud");
%>
<body>
	<nav>
		<ul class="nav nav-tabs">
			<li><h3 class="logo">@蛋白质</h3></li>
			<li><a href="manager_home.html">home</a></li>
			<li><a href="图书管理.html">图书管理</a></li>
			<li class="active"><a href="学生管理.html">学籍管理</a></li>
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
			   <img src="../../imgs/head/001.jpeg" alt="头像" width="150px" class="thumbnail" >
                	<a href="liststu" class="list-group-item side">学生列表</a>
                    <a href="jump-add" class="list-group-item side">录入学生</a>
                </div>      
            </div>
	</div>
	
	<div class="col-md-4">
	<form  action="modi" method="post" name="form">
		<div class="form-group">
			<label>姓名</label>
			<input type="text" class="form-control"
			   placeholder="请输入姓名..." value="<%=stud.getStudName() %>" name="studName">
			<label>学号</label>
			<input type="text" class="form-control"  
			   placeholder="请输入学号..." value="<%=stud.getStudId() %>" name="studId" readonly>
			<label>学院</label>		
			<select class="form-control" name="studins" id="insId">
			<c:forEach items="${inslist}" var="ins">
				<option value="${ins.insId }"<c:if test="${stud.insId == ins.insId }">selected="true"
				</c:if>>${ins.insName}</option>
			</c:forEach>
			</select>
			<label>专业</label>
			<select class="form-control" name="studmajor" id="majorId">	
			</select>
		</div>
		<button type="submit" class="btn btn-default" style="float: right;">确认修改</button>
	</form>
	</div>
</body>
<script> 
function findMajor(){
	alert("sdvfdb");
	var insId = $("#ins").attr("value");
	$.ajax({
		url:"findMajor",
		type:"get",
		timeout:"1000",
		data:{insId:insId},
		success:function(data){
			$("#majorId option").remove();
			$("#majorId").append("<option value='0'>请选择</option>");
			if (data != 0) {
				for ( var i = 0; i < data.length; i++) {
					var majorId = data[i].majorId;
					var majorName = data[i].majorName;
					$("#majorId").append(
							"<option value="+majorId+">"
									+ majorName + "</option>");
				}
			}
		},
		error : function(XMLResponse) {
			alert(XMLResponse.responseText);
		}
	});
}
   
</script>
<script type="text/javascript">
$(document).ready(function(){
	var major = [];
    var majorsinfo = $("#majorId");
    <c:forEach items="${majorlist}" var="major">
        major.push({
        	id: ${major.majorId},
        	name: "${major.majorName}",
        	ins:${major.insId}
        });
    </c:forEach>
    for(i = 0;i<major.length;i++){
    	if(major[i].ins == ${stud.insId}){
    		if(major[i].id != ${stud.majorId})
			    $("#majorId").append("<option value="+major[i].id+">"+major[i].name+"</option>");
    		else
			    $("#majorId").append("<option value="+major[i].id+" selected='true'>"+major[i].name+"</option>");
    	}  		
    }
    $("#insId").change(function(){
    	var insid = $(this).val();
    	$("#majorId").empty();
    	if(insid == 0)
			$("#majorId").append("<option value='0'>---请选择专业---</option>");
    	else{
    		for(i = 0; i< major.length; i++){
    			if(major[i].ins == insid && major[i].id != ${stud.majorId})
    				$("#majorId").append("<option value="+major[i].id+">"+major[i].name+"</option>");
    		}
    	}
    });
});

</script>
</html>