<%@ page contentType="text/html; charset=gb2312" language="java" %>
<%@ page import="java.sql.*,com.netshop.*,java.text.*" %>
<jsp:useBean scope="page" id="attention" class="com.netshop.attention" />

<html>
<head>
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
			out.println("<center><font color=blue size=5>已将商品加入到收藏夹！</font></center>");
			out.println("<center><input type=button name=gofirst value=确定 onclick=javascript:window.location='goodsShow.jsp?ID="+attention.goodsID+"' ></center>");
		}
		else
		{
			out.println("<center><font color=red size=5>收藏商品失败，请稍后重试！</font></center>");
			out.println("<center><input type=button name=goback value=返回 onclick=javascript:window.history.go(-1) ></center>");
		}
	}
	else
	{
		out.println("<center><font color=red size=5>未登录用户不能收藏商品！</font></center>");
		out.println("<center><input type=button name=goback value=返回 onclick=javascript:window.history.go(-1) ></center>");
	}
%>
</body>
</html>
