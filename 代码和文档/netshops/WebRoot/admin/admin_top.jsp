<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
	<title>校园二手商品交易平台</title>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    		<style type="text/css">
<!--
body {
	background-color: #ADBACE;
	background-image: url(../images/login.jpg);
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
	<td align="center"><a href="shopManagement.jsp" target="mainFrame">商店管理</a></td>
	<!--<td align="center"><a href="userManagement.jsp" target="mainFrame">用户管理</a></td>-->
    <td align="center"><a href="allUserList.jsp" target="mainFrame">用户管理</a></td>
	<td align="center"><a href="allGoodsList.jsp" target="mainFrame">商品管理</a></td>
	<td align="center">
	<a href="goodsFieldManagement.jsp" target="mainFrame">项目管理</a>
	</td>

	
	<td align="center"><a href="../emailManagement.jsp" target="mainFrame">邮件管理</a></td>
	<td align="center"><a href="../modifyPasswordForm.jsp" target="mainFrame">修改密码</a></td>

	<td align="center">
		<font color=red>
		欢迎您：<%=((com.netshop.user)session.getAttribute("user")).userName%></td>
	</a>
	<td align="center"><a href="../logout.jsp" target="_parent">退出</a></td>
	</tr>
</table>
</div>
</body>
</html>
