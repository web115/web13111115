<%@ page language="java" contentType="text/html;charset=gb2312" %>
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
<%
	String strReceiver = request.getParameter("receiver");
	if(strReceiver == null)
	{
		strReceiver = "";
	}
	strReceiver = strReceiver.trim();

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
<%  
if(session.getAttribute("user") == null)
	{
		{
		out.println("<center><font color=red size=5>未登录用户不能发送邮件！</font></center>");
		out.println("<center><input type=button name=goback value=返回 onclick=javascript:window.history.go(-1) >			                    </center>");
		}
	}
 	else
		//out.print("<script>window.location='sendMailfinal.jsp'</script>");   
	{
		session.setAttribute("receiver",strReceiver); 	

%>
    <jsp:forward page="sendMailfinal.jsp">
    <jsp:param name="re" value="100"/>   
    </jsp:forward>
<%
	}
%>    
<!--<div align="center">
<form name="FORM1" method="post" action="sendMailSave.jsp">
  <table width="90%" border="1" cellspacing="0" cellpadding="3">
    <tr>
		<td width="20%" bgcolor="#DFDFDF"><b>收件人</b></td>
		<td width="80%">
		<input type="text" name="receiver" size="40" value=<//%=codeToString(strReceiver)%>></td>
	</tr>
	 <tr>
		<td width="20%" bgcolor="#DFDFDF"><b>主题</b></td>
		<td width="80%"><input type="text" name="subject" size="40"></td>
	</tr>
	<tr>
		<td valign="top" align="center" colspan="2" bgcolor="#DFDFDF">
		邮件内容
		</td>
	</tr>
	<tr>
		<td width="95%" valign="top" align="center" colspan="2">
		
		<textarea rows="20" cols="90" name="content"></textarea>
		</td>
	</tr>
	<tr>
		<td valign="top" align="left" colspan="2">
		<input type="checkbox" name="saveMail" value="1">同时保存到已发邮件
		</td>
	</tr>
  </table>
  <p align="center">

    <input type="submit" name="btnSumbit" value="发送">
    <input type="reset" name="btnReset" value="重写" >
  </p>
</form>
</div>-->
</BODY>
</HTML>
