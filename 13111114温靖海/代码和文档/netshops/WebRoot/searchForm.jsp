<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ page import="java.sql.*,com.netshop.*" %>
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
		查询商品
		</font><br>
		</td>
	</tr>
	<tr>
		<td width="40%" align="right">商品类别：</td>
		<td width="60%" align="left">
		<select name="goodsField">
			<option value="0" selected>请选择</option>
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
		<td width="40%" align="right">商品名称：</td>
		<td width="60%" align="left"><input type="text" name="title" size="30"></td>
	</tr>
	<tr>
		<td width="40%" align="right">价格：</td>
		<td width="60%" align="left">
		<select name="price">
		<option value="0" selected>请选择</option>
		<option value="1">0--100</option>
		<option value="2">100--500</option>
		<option value="3">500--2000</option>
		<option value="4">2000--5000</option>
		<option value="5">5000--10000</option>
		<option value="6">10000--</option>
		</select>（RMB）</td>
	</tr>
	
	<tr>
		<td colspan="2" align="center"><br>
		<input type="submit" name="submit1" value="查询">&nbsp;&nbsp;&nbsp;
		<input type="reset" name="reset1" value="重填">
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
			查询空间
			</font><br>
			</td>
		</tr>
		<tr>
			<td width="40%" align="right">空间名称：</td>
			<td width="60%" align="left"><input type="text" name="shopName" size="30"></td>
		</tr>
		<tr>
		<td width="40%" align="right">商品类别：</td>
		<td width="60%" align="left">
		<select name="mainFields">
				<option value="0" selected>请选择</option>
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
			<td width="40%" align="right">空间主人：</td>
			<td width="60%" align="left"><input type="text" name="shopper" size="30"></td>
		</tr>
		<tr>
		<td colspan="2" align="center"><br>
		<input type="submit" name="submit1" value="查询">&nbsp;&nbsp;&nbsp;
		<input type="reset" name="reset1" value="重填">
		</td>
	</tr>
	</form>
	</table>
	
	</td>
</tr>
</table>

</body>
</html>
