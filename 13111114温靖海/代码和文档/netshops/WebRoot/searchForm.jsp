<%@ page contentType="text/html; charset=gb2312" language="java"%>
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
<html>
<head>
<title>У԰������Ʒ����ƽ̨</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<jsp:useBean scope="page" id="goodsField" class="com.netshop.goodsField" />
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
<table width="90%" border="0">
<tr>
	<td width="50%" valign="top">
	<table width="98%">
	<form name="form1" action="showGoods.jsp" method="post">
	<tr>
		<td colspan="2" align="center">
		<font size="4">
		��ѯ��Ʒ
		</font><br>
		</td>
	</tr>
	<tr>
		<td width="40%" align="right">��Ʒ���</td>
		<td width="60%" align="left">
		<select name="goodsField">
			<option value="0" selected>��ѡ��</option>
		<%
			ResultSet rs = goodsField.showAllFields();
			while(rs.next())
			{
		%>
				<option value=<%=rs.getLong("ID")%> ><%=codeToString(rs.getString("name"))%></option>
		<%
			}
		%>
		</select>
		</td>
	</tr>
	<tr>
		<td width="40%" align="right">��Ʒ���ƣ�</td>
		<td width="60%" align="left"><input type="text" name="title" size="30"></td>
	</tr>
	<tr>
		<td width="40%" align="right">�۸�</td>
		<td width="60%" align="left">
		<select name="price">
		<option value="0" selected>��ѡ��</option>
		<option value="1">0--100</option>
		<option value="2">100--500</option>
		<option value="3">500--2000</option>
		<option value="4">2000--5000</option>
		<option value="5">5000--10000</option>
		<option value="6">10000--</option>
		</select>��RMB��</td>
	</tr>
	
	<tr>
		<td colspan="2" align="center"><br>
		<input type="submit" name="submit1" value="��ѯ">&nbsp;&nbsp;&nbsp;
		<input type="reset" name="reset1" value="����">
		</td>
	</tr>
	</form>
	</table>
	
	</td>
	<td width="50%" valign="top">
	<table width="98%">
	<form name="form2" action="showMerchant.jsp" method="post">
		<tr>
			<td colspan="2" align="center">
			<font size="4">
			��ѯ�ռ�
			</font><br>
			</td>
		</tr>
		<tr>
			<td width="40%" align="right">�ռ����ƣ�</td>
			<td width="60%" align="left"><input type="text" name="shopName" size="30"></td>
		</tr>
		<tr>
		<td width="40%" align="right">��Ʒ���</td>
		<td width="60%" align="left">
		<select name="mainFields">
				<option value="0" selected>��ѡ��</option>
		<%
			rs.beforeFirst();
			while(rs.next())
			{
		%>
				<option value=<%=rs.getLong("ID")%> ><%=codeToString(rs.getString("name"))%></option>
		<%
			}
		%>
		</select>
		</td>
		</tr>
		<tr>
			<td width="40%" align="right">�ռ����ˣ�</td>
			<td width="60%" align="left"><input type="text" name="shopper" size="30"></td>
		</tr>
		<tr>
		<td colspan="2" align="center"><br>
		<input type="submit" name="submit1" value="��ѯ">&nbsp;&nbsp;&nbsp;
		<input type="reset" name="reset1" value="����">
		</td>
	</tr>
	</form>
	</table>
	
	</td>
</tr>
</table>

</body>
</html>
