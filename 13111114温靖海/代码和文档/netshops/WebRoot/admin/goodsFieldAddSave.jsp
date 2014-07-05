<%@ page language="java" contentType="text/html;charset=gb2312" %>
<%@ page import="java.util.*,java.text.*,java.sql.*,com.netshop.*" %>
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
<jsp:useBean id="goodsField" scope="page" class="com.netshop.goodsField"/>
<div align="center">
<table width="60%" border="0" cellpadding="0" cellspacing="0" >        

<%
    request.setCharacterEncoding("gb2312");
	goodsField.name = new String(request.getParameter("name").getBytes("gb2312"),"ISO-8859-1");
	goodsField.tag=0;
	if(goodsField.add())
	{
%>
		<tr>
			<td colspan="2" align="center">
			<br>
			<font color="#0000FF" size="5"><b>经营项目添加成功</b></font>
			<br>
			<br>
			</td>
		</tr>
		<tr>
			<td align="center" colspan=2>
			<br>
			<input type=button nnetshope=closewin value="继续添加" onClick="javascript:window.location='goodsFieldAddForm.jsp'">
			</td>
		</tr>	
<%			
	}
	else
	{
%>
		 <tr>
			<td colspan="2" align="center"><font color="red"><b>经营项目添加失败，请重试！</b></font></td>
		</tr>
		<tr>
			<td align="center" colspan="2">
			<br>
			<br>
			<input type=button nnetshope=Goback1 value="返回" onClick="javascript:window.history.go(-1)">
			</td>
		</tr>	
<%	
	}
	
%>
  
</table>
</div>
</BODY></HTML>
