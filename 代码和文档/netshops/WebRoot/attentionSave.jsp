<%@ page contentType="text/html; charset=gb2312" language="java" %>
<%@ page import="java.sql.*,com.netshop.*,java.text.*" %>
<jsp:useBean scope="page" id="attention" class="com.netshop.attention" />

<html>
<head>
	<title>У԰������Ʒ����ƽ̨</title>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
            		<style type="text/css">
<!--
body {
	background-color: #ADBACE;
	background-image: url(images/login.jpg);
}
-->
        </style>    
</head>

<body>
<%
	com.netshop.user user = (com.netshop.user)session.getAttribute("user");
	if(user != null)
	{
		attention.goodsID = Long.parseLong(request.getParameter("ID"));
		attention.userID = user.ID;	
		attention.tag = 0;
		if(attention.add())
		{
			out.println("<center><font color=blue size=5>�ѽ���Ʒ���뵽�ղؼУ�</font></center>");
			out.println("<center><input type=button name=gofirst value=ȷ�� onclick=javascript:window.location='goodsShow.jsp?ID="+attention.goodsID+"' ></center>");
		}
		else
		{
			out.println("<center><font color=red size=5>�ղ���Ʒʧ�ܣ����Ժ����ԣ�</font></center>");
			out.println("<center><input type=button name=goback value=���� onclick=javascript:window.history.go(-1) ></center>");
		}
	}
	else
	{
		out.println("<center><font color=red size=5>δ��¼�û������ղ���Ʒ��</font></center>");
		out.println("<center><input type=button name=goback value=���� onclick=javascript:window.history.go(-1) ></center>");
	}
%>
</body>
</html>
