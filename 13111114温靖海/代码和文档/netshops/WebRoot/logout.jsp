<%@ page contentType="text/html; charset=gb2312" language="java"  %>
<% 	
		session.removeAttribute("user");		
		response.sendRedirect("index.jsp"); 
		
%>