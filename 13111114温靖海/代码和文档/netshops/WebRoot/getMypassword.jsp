<%@ page language="java" contentType="text/html;charset=gb2312" %>
<%@ page import="java.util.*,java.text.*,java.sql.*,javax.mail.*,javax.mail.internet.*,com.netshop.*" %>
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

<body bgcolor="#FFFFFF" text="#000000">
<jsp:useBean id="executeWay" scope="page" class="com.netshop.executeWay"/>
<jsp:useBean id="mail" scope="page" class="com.netshop.Email"/>

        <%
		String strSql="";
		String userName="";
		userName=(String)request.getParameter("txtusername");
		strSql="select * from `users` where tag != -1 and userName='" + userName + "'";
		ResultSet rs=executeWay.exeSqlQuery(strSql);
		if(rs.next())
		{
				//�������ʼ�
			try
			{
					String smtphost="www.126.com";
					String to=rs.getString("email");
					String subject="��ȡ����";
					String content="";				
					content=content + "�����û����ǣ�" + rs.getString("userName") + "<br>" ;
					content=content + "���������ǣ�" + rs.getString("userPassword") + "<br>";					
					mail.setSMTPHost(smtphost);
					mail.setFrom("youjingxuanlin@126.com");
                                        mail.setUserName("youjingxuanlin");
                                        mail.setPassword("19890806");
					mail.setTo(to);
					mail.setContent(content);
					mail.setSubject(subject);
					mail.setCC(null);
					mail.setBcc(null);
				
					mail.sendMail();
					
					out.println("<center><font size=4 color=blue>�����ѷ��͵�["+to+"]</font></center>");
					out.println("<center><input type=button name=winclose value=�ر� onclick=javascript:window.close()></center>");

			}
			catch(Exception e)
			{
				out.println("<center><font size=4 color=red>ϵͳ�������Ժ����ԣ�</font></center>");
				out.println("<center><input type=button name=goback1 value=���� onclick=javascript:window.history.go(-1)></center>");

			}
		}
		else
		{
				out.println("<center><font size=4 color=red>���û������ڣ���ȷ�ϣ�</font></center>");
				out.println("<center><input type=button name=goback value=���� onclick=javascript:window.history.go(-1)></center>");

		}
		%>

</body>
</html>
