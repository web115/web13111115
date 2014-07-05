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
<jsp:useBean id="user" scope="page" class="com.netshop.user"/>
<center>
<%
    String strID = String.valueOf(((com.netshop.user)session.getAttribute("user")).ID);
    user.init(strID);
	if(0 == user.userPassword.compareTo(request.getParameter("txtoldpasswd")))
	{
		String strUserpassword =request.getParameter("txtnewpasswd");  
		if(user.updatekey(strID,strUserpassword))
		{
			%>
				<font color="blue" size=4><b>密码修改成功！</b></font>
					<br><br>
				<input type=button name=Goback value="确定" onClick="javascript:window.history.go(-1)">
			<%
		}
		else
		{
			%>
			<font color="red" size=4><b>密码修改失败，请稍后再试！</b></font>
					<br><br>
			<input type=button name=Goback value="返回" onClick="javascript:window.history.go(-1)">
			<%
		}
	}
	else
	{
		%>

		<font color="red" size=4><b>密码错误，请输入正确旧密码！</b></font>
					<br><br>
		<input type=button name=Goback value="返回" onClick="javascript:window.history.go(-1)">
			<%
	}
%>
</center>
</body>
</html>
