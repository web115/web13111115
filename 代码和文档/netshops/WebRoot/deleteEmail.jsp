<%@ page language="java" contentType="text/html;charset=gb2312" %>
<%@ page import="java.sql.*,com.netshop.*" %>
<HTML>
<HEAD>
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
</HEAD>
<BODY>
<jsp:useBean id="sendMail" scope="page" class="com.netshop.sendMail"/>
<jsp:useBean id="executeWay" scope="page" class="com.netshop.executeWay"/>

<div align=left>
<%
	String strURL = request.getParameter("toURL");
	String[] delID = request.getParameterValues("selEmail");
	String strID = "0";
	if (delID!=null)
	{
		for(int i=0;i<delID.length;i++)
		{
			strID = strID +"," + delID[i];	
		}		
	}
	String strSql = "delete from email where ID in ("+strID+")";
	if(executeWay.exeSqlUpdate(strSql))
	{
		%>
			<center><font color=blue size=5>ɾ���ɹ���</font></center><br><br>
			<center><input type=button name=gofirst value=ȷ�� onclick=javascript:window.location='<%=strURL%>' ></center>
		<%
	}
	else
	{		
		%>
			<center><font color=red size=5>ɾ��ʧ�ܣ������ԣ�</font></center><br><br>
			<center><input type=button name=goback value=ȷ�� 	onclick=javascript:window.location='<%=strURL%>' ></center>
		<%
	}	
	
	

%>
</div>

</body>
</html>