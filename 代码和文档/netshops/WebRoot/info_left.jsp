<%@ page contentType="text/html; charset=gb2312" language="java" %>
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
<p align=center>
	<br>
	<a href="myAttentionList.jsp" target="info_main">收藏夹</a>
	<br><br>
	<a href="myDiscussionList.jsp" target="info_main">留言记录</a>
	<br><br>
	<%
		if(((com.netshop.user)session.getAttribute("user")).sysRole == 2)
		{
	%>
		<a href="merchant/modifyShopForm.jsp" target="info_main">修改空间信息</a>
		<br><br>
	<%
		}
	%>
	<a href="modifyPasswordForm.jsp" target="info_main">修改密码</a>
	
</p>
</body>
</html>