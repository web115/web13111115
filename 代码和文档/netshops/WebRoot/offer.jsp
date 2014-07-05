<%@ page contentType="text/html; charset=gb2312" language="java" %>
<%@ page import="java.sql.*,com.netshop.*,java.text.*" %>
<jsp:useBean scope="page" id="offer" class="com.netshop.offer" />

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
	request.setCharacterEncoding("gb2312");
	offer.userName = new String( request.getParameter("userName").getBytes("gb2312"), "ISO-8859-1");
	com.netshop.user user = (com.netshop.user)session.getAttribute("user");
	if(user != null)
	{
		offer.goodsID = Long.parseLong(request.getParameter("goodsID"));
		offer.userID = user.ID;	
		offer.price = Long.parseLong(request.getParameter("ints"));
		if(offer.add())
		{
			out.println("<center><font color=blue size=5>已报价成功！</font></center>");
			out.println("<center><input type=button name=gofirst value=确定 onclick=javascript:window.location='goodsShow.jsp?ID="+offer.goodsID+"' ></center>");
		}
		else
		{
			out.println("<center><font color=red size=5>报价失败，请稍后重试！</font></center>");
			out.println("<center><input type=button name=goback value=返回 onclick=javascript:window.history.go(-1) ></center>");
		}
	}
	else
	{
		out.println("<center><font color=red size=5>未登录用户不能报价！</font></center>");
		out.println("<center><input type=button name=goback value=返回 onclick=javascript:window.history.go(-1) ></center>");
	}
%>
</body>
</html>
