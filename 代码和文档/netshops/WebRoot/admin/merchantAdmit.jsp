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
	background-image: url(../images/login.jpg);
}
-->
        </style>
</HEAD>
<BODY>
<jsp:useBean id="executeWay" scope="page" class="com.netshop.executeWay"/>

<div align=left>
<%
	String[] admitID = request.getParameterValues("admitID");
	String strID = "0";
	if (admitID!=null)
	{
		for(int i=0;i<admitID.length;i++)
		{
			strID = strID +"," + admitID[i];	
		}		
	}
	String strSql = "update users set tag=1  where ID in ("+strID+")";
	if(executeWay.exeSqlUpdate(strSql))
	{
		%>
			<center><font color=blue size=5>��ѡ�ռ�������ͨ����</font></center><br><br>
			<center><input type=button name=gofirst value=ȷ�� onclick=javascript:window.location='newMerchantList.jsp' ></center>
		<%
	}
	else
	{		
		%>
			<center><font color=red size=5>�����ռ�ʧ�ܣ����Ժ����ԣ�</font></center><br><br>
			<center><input type=button name=goback value=ȷ�� 	onclick=javascript:window.history.go(-1) ></center>
		<%
	}	
	
	

%>
</div>

</body>
</html>