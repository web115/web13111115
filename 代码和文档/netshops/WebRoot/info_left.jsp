<%@ page contentType="text/html; charset=gb2312" language="java" %>
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
<p align=center>
	<br>
	<a href="myAttentionList.jsp" target="info_main">�ղؼ�</a>
	<br><br>
	<a href="myDiscussionList.jsp" target="info_main">���Լ�¼</a>
	<br><br>
	<%
		if(((com.netshop.user)session.getAttribute("user")).sysRole == 2)
		{
	%>
		<a href="merchant/modifyShopForm.jsp" target="info_main">�޸Ŀռ���Ϣ</a>
		<br><br>
	<%
		}
	%>
	<a href="modifyPasswordForm.jsp" target="info_main">�޸�����</a>
	
</p>
</body>
</html>