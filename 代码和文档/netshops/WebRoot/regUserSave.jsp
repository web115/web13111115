<%@ page contentType="text/html; charset=gb2312" language="java" %>
<%@ page import="java.sql.*,com.netshop.*,java.text.*" %>
<head>
        		<style type="text/css">
<!--
body {
	background-color: #ADBACE;
	background-image: url(images/login.jpg);
}
-->
        </style>
</head>
<jsp:useBean scope="page" id="user" class="com.netshop.user" />
<% 
	request.setCharacterEncoding("gb2312");
	user.userName = request.getParameter("userName");
	user.userPassword = request.getParameter("userPassword");
	user.sysRole = 1;
	user.email = request.getParameter("email");
	user.sex = Integer.parseInt(request.getParameter("sex"));
	user.tag = 0;
	SimpleDateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd");
	user.createDate = dateFormatter.format(new java.util.Date());

	boolean isAdd = user.add();
	if(isAdd)
	{
	%>
	<br><br><br><br>
	<p align=center>
	<font size=5><b>注册成功！</b>
	</font>
	</p>
		<p align=center>
		<input type=button name=btnlogin value=登录 onclick=javascript:window.location='userLogin.jsp' > 
		</p>
		<%
		
	}
	else
	{
		%>
		<p align=center>
		<font size=5 blue=red>
		<b>注册失败，请稍后再试！</b>
		</font>
		</p>
		<p align=center>
		<input type=button name=btnlogin value=返回 onclick=javascript:window.history.go(-1) > </p>
		<%
	}

%>