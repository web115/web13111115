<%@ page contentType="text/html; charset=gb2312" language="java" %>
<%@ page import="java.sql.*,com.netshop.*" %>
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
<jsp:useBean scope="page" id="goods" class="com.netshop.goods" />
<jsp:useBean scope="page" id="user" class="com.netshop.user" />
<jsp:useBean scope="page" id="executeWay" class="com.netshop.executeWay" />

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
<table width="100%">
	<tr>
		<td width="50%" align="center" valign="top">
		<p align="center"><font size="5">������Ʒ��Ϣ</font></p>
		<table width="98%" border=0>
			<tr bgcolor="#F0FFF0">
				<td align="center"><font size="4">���</font></td>
				<td align="center"><font size="4">��Ʒ��</font></td>
				<td align="center"><font size="4">�۸�</font></td>
				<td align="center"><font size="4">�����ռ�</font></td>
			</tr>
		<%
			ResultSet rs = goods.showGoods();
			int i = 0;
			while(rs.next() && i<10)
			{
				String strSql1 = "select name from goodsField where ID ='"+rs.getLong("goodsField")+"'";
				String strSql2 = "select * from users where ID ='"+rs.getLong("issuer")+"'";
				ResultSet rs1 = executeWay.exeSqlQuery(strSql1);
				ResultSet rs2 = executeWay.exeSqlQuery(strSql2);
				rs1.first();
				rs2.first();

		%>
			<tr>
				<td>&nbsp;<%=codeToString(rs1.getString("name"))%></td>
				<td>&nbsp;<a href=goodsShow.jsp?ID=<%=rs.getLong("ID")%> target=_self ><%=codeToString(rs.getString("title"))%></a></td>
				<td>&nbsp;<%=rs.getLong("price")%></td>
				<td>&nbsp;<%=codeToString(rs2.getString("shopName"))%></td>
			</tr>
		<%
			i++;	
		}
		if(i == 10)
		{
		%>

		<tr>
				
				<td colspan=3 align=right><a href=showGoods.jsp target=_self>����</></td>
				
			</tr>
		<%}%>
		</table>
		</td>
		
		<td width="50%" valign="top">
		<p align="center"><font size="5">���¿ռ���Ϣ</font></p>
		<table width="98%">
			<tr bgcolor="#F0FFF0">
				<td align="center"><font size="4">�ռ�����</font></td>
				<td align="center"><font size="4">�ռ�����</font></td>
				<td align="center"><font size="4">��Ӫ��Ŀ</font></td>
			</tr>
	
		<%
			rs = user.showAllMerchants("1");
			i=0;
			while(rs.next() && i<10)
			{
				
				String strSql1 = "select name from goodsfield where ID = '"+rs.getLong("mainFields")+"'";
				ResultSet rs1 = executeWay.exeSqlQuery(strSql1);
				rs1.first();

		%>
			<tr>
				<td>&nbsp;<a href=shopShow.jsp?ID=<%=rs.getLong("ID")%> target=_self><%=codeToString(rs.getString("shopName"))%></a></td>
				<td>&nbsp;<%=codeToString(rs.getString("shopper"))%></td>
				<td>&nbsp;<%=codeToString(rs1.getString("name"))%></td>
				
			</tr>
		<%
			i++;
			}
			if(i==10)
			{
			
		%>	<tr>
				
				<td colspan=3 align=right>
				<br>
				<a href=showMerchant.jsp target=_self>����</a>
				</td>
				
			</tr>
			<%}%>
			</table>
		</td>
		</td>
	
	</tr>

</table>

</body>
</html>
