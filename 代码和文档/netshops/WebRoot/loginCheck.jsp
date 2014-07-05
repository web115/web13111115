<%@ page language="java" contentType="text/html;charset=gb2312" %>
<%@ page import="java.sql.*,com.netshop.*" %>
<HTML>
<HEAD>
	<title>校园二手商品交易平台</title>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    		<style type="text/css">
<!--
body {
	background-color: #ADBACE;
	background-image: url(images/login.jpg);
}
-->
        </style>
</HEAD>
<BODY>
<jsp:useBean id="user" scope="session" class="com.netshop.user" />
<%
    String userName=request.getParameter("txtloginName");
    String userPassword=request.getParameter("txtpassword");
	String sysRole=request.getParameter("userType");
	if (user.isValidUser(userName,userPassword,sysRole))
    {
		if(0 == sysRole.compareTo("0"))
		{
			response.sendRedirect("admin/admin_index.jsp");
		}
		//if(0 == sysRole.compareTo("1"))
		//{
		//	response.sendRedirect("normal_index.jsp");
		//}
		//if(0 == sysRole.compareTo("2"))
		if(0 == sysRole.compareTo("2"))
		{
			response.sendRedirect("merchant/merchant_index.jsp");
		}
		
	}
    else
    {
	%>
		<center><font size="5" color="#FF0000"><b>登陆失败，请检查您的用户名和密码</b></font></center>
		<br><br>
	  	<center><input type="button" name="goback" value="返回" onClick="javascript:window.history.go(-1)"></center>
	<%
    }
	%>
</BODY>
</HTML>
