<%@ page contentType="text/html; charset=gb2312" language="java" %>
<%@ page import="java.sql.*,com.netshop.*" %>
<head>
        		<style type="text/css">
<!--
body {
	background-color: #ADBACE;
	background-image: url(images/login.jpg);
}
-->
        </style>
</head>
<jsp:useBean scope="page" id="user" class="com.netshop.user" />
<% 
	String userName = "";
	String userName1="";
	int sysRole = 2;
	//int sysRole=2;
	
	boolean isExist = true;
	
	userName1 = new String(request.getParameter("userName").getBytes("gb2312"),"ISO-8859-1");
	userName =request.getParameter("userName");
	//sysRole = Integer.parseInt(request.getParameter("userType"));    


	isExist = user.isExist(userName1);

	if(isExist)
	{
		out.println("<script language=javascript>alert('该用户名已经存在！');window.history.go(-1);</script>");
	}
	else
	{
		session.setAttribute("userName",userName);
		//switch(sysRole)
		//{
		//	case 1: 
				
		//			response.sendRedirect("regUser.jsp"); 						
		//	break;
		//	case 2:  
				
					response.sendRedirect("regMerchant.jsp"); 
									
		//	break;
		//	default:
		//	   response.sendRedirect("regero.jsp"); 
		//	   break;
		
		//}
	}
%>