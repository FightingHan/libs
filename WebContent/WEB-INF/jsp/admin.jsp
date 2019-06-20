<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="cn.edu.swun.bnb.libs.pojo.LibUser" %>
<%@ page import="cn.edu.swun.bnb.libs.consts.SessionConstant" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理员页面</title>
</head>
<body>
<%
LibUser user = (LibUser)session.getAttribute(SessionConstant.USER_IN_SESSION); 
%>
<h4>只有管理员才能访问的页面</h4>
<p>
<b>welcome,<%=user.getNickname() %></b><br>
<a href="home">返回主页</a><br>
[<a href="logout">注销</a>]
</p>
</body>
</html>