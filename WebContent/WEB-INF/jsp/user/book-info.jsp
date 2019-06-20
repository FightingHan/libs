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
<link rel="stylesheet" href="../../bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="../../css/user/book-info.css">
<script src="../../js/jquery/jquery-1.12.4.min.js"></script>
<script src="../../js/jquery/jquery.raty.min.js"></script>
<script src="../../bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
	var tabs = document.getElementsByClassName('lala')
     var contents = document.getElementsByClassName('la')

            function changeTab(tab) {
                for(var i = 0, len = tabs.length; i < len; i++) {
                    if(tabs[i] === tab) {
                        tabs[i].className = 'selected btn btn-default lala';
                        contents[i].className = 'show la';
                    } else {
                        tabs[i].className = 'btn btn-default lala';
                        contents[i].className = 'hidden la';
                    }
                }
            }
</script>
</head>
<% 
LibUser user = (LibUser)session.getAttribute(SessionConstant.USER_IN_SESSION);
%>
<body>
<header><h2>欢迎使用图书馆管理系统</h2></header>
<nav>
<ul class="nav nav-tabs">
<li><a href="lib主页.html">首页</a></li>
<li><a href="lib热门推荐.html">热门推荐</a></li>
<li><a href="lib图书查找.html">图书查找</a></li>
<li><a href="lib最新评论.html">最新评论</a></li>
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
<div class="col-sm-2" style="margin-top: 26px;">
<nav>
<ul class="nav text-center" data-spy="affix" data-offset-top="12">
<div class="text-center">
	<img src="../../imgs/head/001.jpeg" class="usephoto">
	<h3>耿卓涵</h3>
</div>
<li><a href="lib个人主页.html">我的首页</a></li>
<li><a href="lib借阅历史.html">借阅历史</a></li>
<li><a href="lib个人主页.html#nowlend">当前借阅</a></li>
<li><a href="lib个人主页.html#myorder">我的预约</a></li>
<li><a href="lib我的书评.html">我的书评</a></li>
<li><a href="lib我的收藏.html">我的收藏</a></li>
</ul>
</nav>
</div>
<div class="col-sm-8">
	<div class="col-sm-3">
	<h3>图书主要信息</h3>
		<img src="../../imgs/head/001.jpeg" class="img-thumbnail">
	</div>
    <div class="col-sm-5" style="margin-top:88px;">
		<label>图书名称：</label>${book.name }<br>
		<label>书籍作者：</label>${book.author }<br>
		<label>出版社：</label>${book.publisher }<br>
		<label>ISBN:</label>${book.isbn }<br>
		<label>图书单价:</label>${book.price }<br>
	    <label>在库数量：</label>${book.totalNum }<br>
	</div>
	<div class="col-sm-4" style="margin-top: 88px;">
		<label>收藏量：</label>103<label>次</label><br>
		<label>评论：</label>26<label>条</label><br>
		<label>总体评分：</label><label style="font-size: 28px;color:#565656;">3.5</label>分<br>
		<a data-toggle="modal" data-target="#collectmodal"><button class="btn btn-info">收藏此书</button></a>&nbsp;
		<a href="lib图书评论.html"><button class="btn btn-default">评论此书</button></a>
		<a href="borrow?isbn="${book.isbn }"><button class="btn btn-default">一键借书</button></a>
	</div>
	<div class="col-sm-12">
	   		<label>内容简介：</label><h5>文化大革命如火如荼地进行，天文学家叶文洁在期间历经劫难，被带到军方绝秘计划“红岸工程”。叶文洁以太阳为天线，向宇宙发出地球文明的第一声啼鸣，取得了探寻外星文明的突破性进展。三颗无规则运行的太阳主导下，四光年外的“三体文明”百余次毁灭与重生，正被逼迫不得不逃离母星，而恰在此时，他们接收到了地球发来的信息。对人性绝望的叶文洁向三体人暴露了地球的坐标，彻底改变了人类的命运。
地球的基础科学出现了异常的扰动，纳米科学家汪淼进入神秘的网络游戏《三体》，开始逐步逼近这个世界的真相。汪淼参加一次玩家聚会时，接触到了地球上应对三体人到来而形成的一个秘密组织（ETO）。地球防卫组织中国区作战中心通过“古筝计划”，一定程度上挫败了拯救派和降临派扰乱人类科学界和其他领域思想的图谋，获悉处于困境之中的三体人为了得到一个能够稳定生存的世界决定入侵地球</h5>
	</div>
    <div class="tab-head" style="float: left;">
         <button type="button" onClick="changeTab(this)" class="btn btn-default lala">馆藏信息</button>
         <button type="button" onClick="changeTab(this)" class="btn btn-default lala">最新评论</button>
    </div>
    <div class="tab-content">
        <div class="hidden la">
	      <table class="table table-hover table-striped">
		   <thead>
			<tr >
				<th>索书号</th>
				<th>书刊状态</th>
				<th>条码号</th>
			</tr>
		   </thead>
		   <tbody>
			<tr>
				<td></td>
			</tr>
		   </tbody>
	      </table>
	   </div>
      <div class="hidden la col-sm-12">
	    <div class="col-sm-12" style="margin-top: 16px;">
	   <div style="display: inline-block;float: left;" class="col-sm-1">
		<img src="../../../imgs/zui.jpeg" class="stuphoto" style="height: 56px;width: 56px;border-radius: 100px;">
		<br>
	   </div>
	   <div class="col-sm-2" style="margin-top: 8px;padding-left: 18px;">
			<label>嘴嘴</label><br>
	   </div>
      <div class="col-sm-10">
       <p>dsvrnjfjjjjjjjjj少时诵诗书所所所所所所所所所所所所所所所所所所所所所所所所所所所所所所所所所所所所所所所所所所所所所所所水水水水水水水水水水水水水水水水水水水顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶水水水水水水所所所所所所少时</p>
	  </div>
	   <div class="col-sm-11" style="padding-left: 0px;">
	    <div>
		<label style="float:left;font-weight: 100;color: #939090;">编辑于2018-12-12</label>
	   </div>
	   <a data-toggle="modal" data-target="#reportmodal"><button class="btn btn-danger btn-sm" style="float: right;">举报</button></a>
	  </div>
        </div>
       </div>
	 </div>
</div>
<div class="modal" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
<div class="modal-content" style="width:26%;height: auto;padding: 36px;">
<form role="form" id="login" action="../../login" method="post">
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
<div id="reportmodal" class="modal"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-content">
		<div class="modal-body text-center">
			<p style="font-size: 26px;">确定举报用户名为<label>嘴嘴</label>对<label>三体</label>的评价吗？此条评价将交由管理员审核，恶意举报会有账号被禁用的风险！</p>
		</div>
		<footer class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
			<button id="sure" class="btn btn-info">确定举报</button>
		</footer>
	</div>
</div>
<div id="collectmodal" class="modal"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-content">
		<div class="modal-body text-center">
			<p style="font-size: 22px;"><label>三体</label>已经成功被加入收藏夹，下次寻找该书可到个人中心中的我的收藏中寻找</p>
		</div>
           <button type="button"  data-dismiss="modal" class="btn btn-info">了解</button>
	</div>
</div>
</body>
</html>