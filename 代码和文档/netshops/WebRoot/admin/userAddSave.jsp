<%@ page contentType="text/html; charset=gb2312" language="java" %>
<%@ page import="java.sql.*,com.netshop.*,java.text.*" %><head>
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
		
<br><br>
		<p align=center>
		<font size=5><b>��ӳɹ���</b>
		</font>
		</p>
			<p align=center>
			<input type=button name=btnlogin value=��¼ onclick=javascript:window.location='allUserList.jsp' > 
			</p>
			<%
			
		}
		else
		{
			%>
			<p align=center>
			<font size=5 blue=red>
			<b>���ʧ�ܣ����Ժ����ԣ�</b>
			</font>
			</p>
			<p align=center>
			<input type=button name=btnlogin value=���� onclick=javascript:window.history.go(-1) > </p>
			<%
		}
	}
	else
	{
		%>
			<br><br>
			<p align=center>
			<font size=5 blue=red>
			<b>���û����Ѿ����ڣ�</b>
			</font>
			</p>
			<p align=center>
			<input type=button name=btnlogin value=���� onclick=javascript:window.history.go(-1) > 
			</p>
	<%
	}
	%>