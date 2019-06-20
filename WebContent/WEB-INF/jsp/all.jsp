<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="cn.edu.swun.bnb.libs.pojo.LibUser"%>
<%@ page import="cn.edu.swun.bnb.libs.consts.SessionConstant" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>系统主页</title>
</head>
<body>
<h4>所有用户都能访问的页面</h4>
<p>
<%
    LibUser user = (LibUser)session.getAttribute(SessionConstant.USER_IN_SESSION);
%>
<b>Welcome, </b>
<%
   if(user == null) {
%>
访客[<a href="login">登录</a>]
<%}
   else{
%>
<%=user.getId() %>
[<a href="logout">注销</a>]
<%} %>
<br>
   <%
    if(user != null){
   %>
<a href="user">登录用户页面</a><br>
   <%
   if(user.getUserType()==1){
  %>
<a href="admin">管理员页面</a><br>
  <%} %>
  <%} %>
</p>
</body>
</html>