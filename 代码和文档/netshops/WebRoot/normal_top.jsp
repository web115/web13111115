<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%!
public String codeToString(String str)
{//���������ַ����ĺ���
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
<div align="center" >
<table width="80%">
	<tr>
		<td colspan="8" align="center">
		<font size="9" ><b>У԰������Ʒ����ƽ̨</b></font>
		<br>
		</td>
	</tr>
	<tr>
	<td align="center"><a href="first.jsp" target="mainFrame">��ҳ</a></td>
	<td align="center"><a href="searchForm.jsp" target="mainFrame">��ѯ</a></td>
	<td align="center"><a href="showGoods.jsp" target="mainFrame">��Ʒ��Ϣ</a></td>
	<td align="center"><a href="showMerchant.jsp" target="mainFrame">�̵���Ϣ</a></td>
	<td align="center"><a href="emailManagement.jsp" target="mainFrame">�ʼ�����</a></td>
	<td align="center"><a href="infoManagement.jsp" target="mainFrame">���˹���</a></td>

	<td align="center">
		<font color=red>
		��ӭ����<%=codeToString(((com.netshop.user)session.getAttribute("user")).userName)%></td>
	</a>
	<td align="center"><a href="logout.jsp" target="_parent">�˳�</a></td>
	</tr>
</table>
</div>
</body>
</html>
