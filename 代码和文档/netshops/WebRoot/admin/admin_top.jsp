<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
	<title>У԰������Ʒ����ƽ̨</title>
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
		<font size="9" ><b>У԰������Ʒ����ƽ̨</b></font>
		<br>
		</td>
	</tr>
	<tr>
	<td align="center"><a href="shopManagement.jsp" target="mainFrame">�̵����</a></td>
	<!--<td align="center"><a href="userManagement.jsp" target="mainFrame">�û�����</a></td>-->
    <td align="center"><a href="allUserList.jsp" target="mainFrame">�û�����</a></td>
	<td align="center"><a href="allGoodsList.jsp" target="mainFrame">��Ʒ����</a></td>
	<td align="center">
	<a href="goodsFieldManagement.jsp" target="mainFrame">��Ŀ����</a>
	</td>

	
	<td align="center"><a href="../emailManagement.jsp" target="mainFrame">�ʼ�����</a></td>
	<td align="center"><a href="../modifyPasswordForm.jsp" target="mainFrame">�޸�����</a></td>

	<td align="center">
		<font color=red>
		��ӭ����<%=((com.netshop.user)session.getAttribute("user")).userName%></td>
	</a>
	<td align="center"><a href="../logout.jsp" target="_parent">�˳�</a></td>
	</tr>
</table>
</div>
</body>
</html>
