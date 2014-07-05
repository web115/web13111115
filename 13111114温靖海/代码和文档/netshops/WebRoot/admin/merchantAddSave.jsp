<%@ page contentType="text/html; charset=gb2312" language="java" %>
<%@ page import="java.sql.*,com.netshop.*,java.text.*" %>
<head>
		<style type="text/css">
<!--
body {
	background-color: #ADBACE;
	background-image: url(../images/login.jpg);
}
-->
        </style>
</head>
<jsp:useBean scope="page" id="user" class="com.netshop.user" />
<% 
	request.setCharacterEncoding("gb2312");
	String strUsername = request.getParameter("userName");
	if(!user.isExist(strUsername))
	{
		user.userName = new String(strUsername.getBytes("gb2312"),"ISO-8859-1");
		user.userPassword = request.getParameter("userPassword");
		user.email = request.getParameter("email");
		user.sex = Integer.parseInt(request.getParameter("sex"));
		user.identityID = request.getParameter("identityID");
		user.shopName = new String(request.getParameter("shopName").getBytes("gb2312"),"ISO-8859-1");
		user.shopIntro = new String(request.getParameter("shopIntro").getBytes("gb2312"),"ISO-8859-1");
		user.shopper = new String(request.getParameter("shopper").getBytes("gb2312"),"ISO-8859-1");
		user.realName = new String(request.getParameter("realName").getBytes("gb2312"),"ISO-8859-1");
		user.telephone = request.getParameter("telephone");
		user.sysRole = 2;
		user.tag = 1;
		SimpleDateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd");
		user.createDate = dateFormatter.format(new java.util.Date());
		user.mainFields = Long.parseLong(request.getParameter("mainFields"));	
		boolean isAdd = user.add();
		if(isAdd)
		{
			%>
			<br><br>
			<p align=center>
			<font size=5 color=blue>
			<b>用户添加成功</b>
			</font>
			</p>
			<p align=center>
			<input type=button name=btnlogin value=登录 onclick=javascript:window.location='allMerchantList.jsp' > 
			</p>
			<%
			
		}
		else
		{
			%>
			<br><br>
			<p align=center>
			<font size=5 blue=red>
			<b>用户添加失败，请稍后再试！</b>
			</font>
			</p>
			<p align=center>
			<input type=button name=btnlogin value=返回 onclick=javascript:window.history.go(-1) > 
			</p>
	<%
		}
	}
	else
	{
		%>
			<br><br>
			<p align=center>
			<font size=5 blue=red>
			<b>该用户名已经存在！</b>
			</font>
			</p>
			<p align=center>
			<input type=button name=btnlogin value=返回 onclick=javascript:window.history.go(-1) > 
			</p>
	<%
	}
	%>