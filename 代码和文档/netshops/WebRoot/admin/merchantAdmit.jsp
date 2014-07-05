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
			<center><font color=blue size=5>所选空间已审批通过！</font></center><br><br>
			<center><input type=button name=gofirst value=确定 onclick=javascript:window.location='newMerchantList.jsp' ></center>
		<%
	}
	else
	{		
		%>
			<center><font color=red size=5>审批空间失败，请稍后重试！</font></center><br><br>
			<center><input type=button name=goback value=确定 	onclick=javascript:window.history.go(-1) ></center>
		<%
	}	
	
	

%>
</div>

</body>
</html>