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
	user.userName = new String(request.getParameter("userName").getBytes("gb2312"),"ISO-8859-1");
	user.userPassword = request.getParameter("userPassword");
	user.email = request.getParameter("email");
	user.sex = Integer.parseInt(request.getParameter("sex"));
	user.identityID = request.getParameter("identityID");
	user.shopName = new String(request.getParameter("shopName").getBytes("gb2312"),"ISO-8859-1");
	user.shopIntro = new String(request.getParameter("shopIntro").getBytes("gb2312"),"ISO-8859-1");
	user.shopper = new String(request.getParameter("shopper").getBytes("gb2312"),"ISO-8859-1");
	user.realName = new String(request.getParameter("realName").getBytes("gb2312"),"ISO-8859-1");
	user.telephone = request.getParameter("telephone");
	//user.sysRole = 2;
	user.sysRole = 2;
	user.tag = 0;
	SimpleDateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd");
	user.createDate = dateFormatter.format(new java.util.Date());
	user.mainFields = Long.parseLong(request.getParameter("mainFields"));	
	boolean isAdd = user.add();
	if(isAdd)
	{
		%>
		<br><br><br><br>
		<p align=center>
		<font size=5 color=blue>
		<b>ע��ɹ��������뾭������Ա��������ܷ�����Ʒ��</b>
		</font>
		</p>
		<p align=center>
		<input type=button name=btnlogin value=��¼ onclick=javascript:window.location='userLogin.jsp' > 
		</p>
		<%
		
	}
	else
	{
		%>
		<p align=center>
		<font size=5 blue=red>
		<b>ע��ʧ�ܣ����Ժ����ԣ�</b>
		</font>
		</p>
		<p align=center>
		<input type=button name=btnlogin value=���� onclick=javascript:window.history.go(-1) > 
		</p>
<%
	}
%>