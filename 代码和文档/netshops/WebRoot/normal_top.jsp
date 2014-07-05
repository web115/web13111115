<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%!
public String codeToString(String str)
{//处理中文字符串的函数
  String s=str;
  try
    {
    byte tempB[]=s.getBytes("ISO-8859-1");
    s=new String(tempB);
    return s;
}
catch(Exception e)
{
  return s;
}
}
%>
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
<div align="center" >
<table width="80%">
	<tr>
		<td colspan="8" align="center">
		<font size="9" ><b>校园二手商品交易平台</b></font>
		<br>
		</td>
	</tr>
	<tr>
	<td align="center"><a href="first.jsp" target="mainFrame">首页</a></td>
	<td align="center"><a href="searchForm.jsp" target="mainFrame">查询</a></td>
	<td align="center"><a href="showGoods.jsp" target="mainFrame">商品信息</a></td>
	<td align="center"><a href="showMerchant.jsp" target="mainFrame">商店信息</a></td>
	<td align="center"><a href="emailManagement.jsp" target="mainFrame">邮件管理</a></td>
	<td align="center"><a href="infoManagement.jsp" target="mainFrame">个人管理</a></td>

	<td align="center">
		<font color=red>
		欢迎您：<%=codeToString(((com.netshop.user)session.getAttribute("user")).userName)%></td>
	</a>
	<td align="center"><a href="logout.jsp" target="_parent">退出</a></td>
	</tr>
</table>
</div>
</body>
</html>
