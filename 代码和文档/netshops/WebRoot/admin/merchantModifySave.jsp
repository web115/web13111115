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
	String strID = request.getParameter("ID");
	user.init(strID);
	user.email = request.getParameter("email");
	user.sex = Integer.parseInt(request.getParameter("sex"));
	user.shopName = new String(request.getParameter("shopName").getBytes("gb2312"),"ISO-8859-1");
	user.shopIntro = new String(request.getParameter("shopIntro").getBytes("gb2312"),"ISO-8859-1");
	user.shopper = new String(request.getParameter("shopper").getBytes("gb2312"),"ISO-8859-1");
	user.realName = new String(request.getParameter("realName").getBytes("gb2312"),"ISO-8859-1");
	user.identityID = request.getParameter("identityID");
	user.telephone = request.getParameter("telephone");
	SimpleDateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd");
	user.createDate = dateFormatter.format(new java.util.Date());
	user.mainFields = Long.parseLong(request.getParameter("mainFields"));	
	boolean isModify = user.modifyUserInfo(strID);
	if(isModify)
	{
		%>
		<br><br>
		<p align=center>
		<font size=5 color=blue>
		<b>��Ϣ�޸ĳɹ���</b>
		</font>
		</p>
		<p align=center>
		<input type=button name=btnlogin value=ȷ�� onclick=javascript:window.location='merchantModifyForm.jsp?ID=<%=strID%>' > 
		</p>
		<%
		
	}
	else
	{
		%>
		<p align=center>
		<font size=5 blue=red>
		<b>��Ϣ�޸�ʧ�ܣ����Ժ����ԣ�</b>
		</font>
		</p>
		<p align=center>
		<input type=button name=btnlogin value=���� onclick=javascript:window.history.go(-1) > 
		</p>
<%
	}
%>