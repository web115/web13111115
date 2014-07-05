<%@ page contentType="text/html; charset=gb2312" language="java" %>
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
<%@ page import="java.sql.*,com.netshop.*" %>
<jsp:useBean scope="page" id="user" class="com.netshop.user" />
<jsp:useBean scope="page" id="executeWay" class="com.netshop.executeWay" />

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
<div align=center>
<p align="center"><font size="5">未审批空间信息</font></p>
<form name=form1 action=merchantAdmit.jsp method=post>
		<table width="90%" border=0>
			<tr bgcolor="#F0FFF0">
				<td align="center" width="15%"><font size="4">选择</font></td>
				<td align="center" width="30%"><font size="4">空间名</font></td>
				<td align="center" width="20%"><font size="4">空间主人</font></td>
				<td align="center" width="20%"><font size="4">经营项目</font></td>
				<td align="center" width="15%"><font size="4">操作</font></td>
			</tr>
		<%
			ResultSet rs = user.showAllMerchants("0");
			while(rs.next())
			{
				String strSql1 = "select name from goodsField where ID = '"+rs.getLong("mainFields")+"'";
				ResultSet rs1 = executeWay.exeSqlQuery(strSql1);
				rs1.first();

				%>
					<tr>
						<td align="center"><input type=checkbox name=admitID value=<%=rs.getLong("ID")%>></td>
						<td>&nbsp;<%=codeToString(rs.getString("shopName"))%></td>
						<td>&nbsp;<%=codeToString(rs.getString("shopper"))%></td>
						<td>&nbsp;<%=codeToString(rs1.getString("name"))%></td>
						<td>&nbsp;<a href='../sendMail.jsp?receiver=<%=codeToString(rs.getString("userName"))%>' target="_self" >发邮件</a></td>
					</tr>
				<%
					
			}
		%>
		
		</table>
		<p align=center><input type=submit name=pass value="审批通过"></p>

		</div>

</body>
</html>
