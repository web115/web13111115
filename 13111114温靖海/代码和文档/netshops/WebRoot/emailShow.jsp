<%@ page language="java" contentType="text/html;charset=gb2312" %>
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
<HTML>
<HEAD>
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
</HEAD>
<BODY >
<jsp:useBean id="sendMail" scope="page" class="com.netshop.sendMail"/>
<div align="center">
<%
	String strID = request.getParameter("ID");
	sendMail.ID = Integer.parseInt(strID);
	if(sendMail.init())
	{
		if(sendMail.tag == 0)
		{
			sendMail.updateTag();
		}
	%>
<table width="90%" border="1" cellspacing="0" cellpadding="3">
    <tr>
		<td width="20%" bgcolor="#DFDFDF"><b>发件人</b></td>

		<td width="80%">&nbsp;<%=codeToString(sendMail.sender)%>
		</td>
	</tr>
	<tr>
		<td width="20%" bgcolor="#DFDFDF"><b>收件人</b></td>

		<td width="80%">&nbsp;<%=codeToString(sendMail.receiver)%>
		</td>
	</tr>
	 <tr>
		<td width="20%" bgcolor="#DFDFDF"><b>主题</b></td>
		<td width="80%">&nbsp;<%=codeToString(sendMail.subject)%></td>
	</tr>
	<tr>
		<td width="20%" bgcolor="#DFDFDF"><b>发送时间</b></td>
		<td width="80%">&nbsp;<%=sendMail.createDatetime%></td>
	</tr>
	<tr>
		<td valign="top" align="center" colspan="2" bgcolor="#DFDFDF">
		邮件内容
		</td>
	</tr>
	<tr>
		<td width="95%" valign="top" align="center" colspan="2">
		
		<textarea rows="20" cols="90" name="content"><%=codeToString(sendMail.content)%></textarea>
		</td>
	</tr>
	
  </table>

	<%
		
	}

	
%>

</div>
</BODY>
</HTML>
