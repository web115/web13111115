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
<script language=javascript>
<!--
	function checkDel()
	{
		if(!confirm("确定要删除所选邮件吗？"))
		{
			return false;
		}
		else
		{
			document.all.form1.action="deleteEmail.jsp";
		}
	}
//-->
</script>
		<style type="text/css">
<!--
body {
	background-color: #ADBACE;
	background-image: url(images/login.jpg);
}
-->
        </style>
</HEAD>
<BODY>
<jsp:useBean id="sendMail" scope="page" class="com.netshop.sendMail"/>
<div align=left>
<form name=form1 method=post target=_self id=form1 onsubmit="checkDel()">
<input type=hidden name=toURL value=sendMailBox.jsp>
<table width=90% border=1 cellpadding="5" cellspacing="0">
<tr>
<td colspan=4 align=center>
<font size=5>
<b>
已发邮件列表
</b>
</font>
</td>
</tr>

	<tr bgcolor="#DFDFDF">
		<td align=center width=10%>
		<b>
		选择
		</b>
		</td>
		<td align=center width=40%>
		<b>
		邮件主题
		</b>
		</td>
		<td align=center width=20%>
		<b>
		收信人
		</b>
		</td>
		<td align=center width=30%>
		<b>
		发送时间
		</b>
		</td>
	</tr>
	<%
		sendMail.sender = ((com.netshop.user)session.getAttribute("user")).userName;
		ResultSet rs = (ResultSet) sendMail.sendEmailList();
		while(rs.next())
		{
		%>
			<tr>
			<td align=left>
			<input type=checkbox name=selEmail value=<%=rs.getLong("ID")%> >
			</td>
			<td align=left>
			<a href=emailShow.jsp?ID=<%=rs.getLong("ID")%> target=_self>
			<%=codeToString(rs.getString("subject"))%>
			</a>
			</td>
			<td align=left>
			<%=codeToString(rs.getString("receiver"))%>
			</td>
			<td align=left>
			<%=rs.getString("createDatetime")%>
			</td>
			</tr>
			

		<%
			
		}

	%>

</table>

<input type=submit name=submit value=删除 >
</div>

</body>
</html>