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
<jsp:useBean id="goodsField" scope="page" class="com.netshop.goodsField"/>

<div align=left>
<%
	String strPage = request.getParameter("page");
	String[] deleteID = request.getParameterValues("deleteID");
	String strID = "0";
	boolean isDelete = true;
	if (deleteID!=null)
	{
		for(int i=0;i<deleteID.length;i++)
		{
			isDelete = goodsField.delete(deleteID[i]);
			if(!isDelete)
			break;
		}		
	}
	if(isDelete)
	{
		%>
			<center><font color=blue size=5>删除成功！</font></center><br><br>
			<center><input type=button name=gofirst value=确定 onclick=javascript:window.location='allGoodsFieldList.jsp?page=<%=strPage%>' ></center>
		<%
	}
	else
	{		
		%>
			<center><font color=red size=5>删除失败，请稍后重试！</font></center><br><br>
			<center><input type=button name=goback value=确定 	onclick=javascript:window.history.go(-1) ></center>
		<%
	}	
%>
</div>

</body>
</html>