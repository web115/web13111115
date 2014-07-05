<%@ page language="java" contentType="text/html;charset=gb2312" %>
<%@ page import="java.sql.*,com.netshop.*" %>
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
<BODY width=90%>
<jsp:useBean id="sendMail" scope="page" class="com.netshop.sendMail"/>
<jsp:useBean id="user" scope="page" class="com.netshop.user"/>
<table width=90%>
	<tr>
	<td align=center>
<%
	request.setCharacterEncoding("gb2312");
	String strUserName = new String(request.getParameter("receiver").getBytes("gb2312"),"ISO-8859-1");
	if(!user.isExist(strUserName))
	{
		%>			 
					<font color="red" size=4><b>收件人已经不存在，请检查！</b></font>
					<br><br>
					<input type=button name=Goback value="返回" onClick="javascript:window.history.go(-1)">
		<%
		
	}
	else
	{
		sendMail.sender = ((com.netshop.user)session.getAttribute("user")).userName;
		sendMail.receiver = new String(request.getParameter("receiver").getBytes("gb2312"),"ISO-8859-1");
		sendMail.subject = new String(request.getParameter("subject").getBytes("gb2312"),"ISO-8859-1");
		sendMail.content = new String(request.getParameter("content").getBytes("gb2312"),"ISO-8859-1");
		sendMail.tag=0;

		String strSave = request.getParameter("saveMail");
		boolean isSave = false;
			if(strSave != null)
			{
				if(0==strSave.compareTo("1"))
				{
					isSave = true;
				}
			}		
		
		sendMail.add();
		
		if(isSave)
		{
			sendMail.addSave();
		}	
		
		if(sendMail.getErrNum()!=0)
		{
			out.println(sendMail.getErrDesc());
		}
		else
		{
			out.println("<center><font size=4>邮件已发出！</font></center><br><br>");
			out.println("<center><input type=button name=gofirst value=回收件箱 onclick=javascript:window.location='myReceiveBox.jsp' ></center>");
		}
		
		
	}
	
 %>

	</td>
	</tr>
</table>


</BODY>
</HTML>
