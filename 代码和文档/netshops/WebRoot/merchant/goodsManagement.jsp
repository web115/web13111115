<%@ page language="java" contentType="text/html;charset=gb2312" %>
<head>
                		<style type="text/css">
<!--
body {
	background-color: #ADBACE;
	background-image: url(../images/login.jpg);
}
-->
        </style>
</head>
<jsp:useBean id="user" scope="page" class="com.netshop.user"/>
<%
	String strID = String.valueOf(((com.netshop.user)session.getAttribute("user")).ID);
    user.init(strID);
	if(user.tag == 1)
	{

%>

  <frameset cols="140,*" frameborder="NO" border="1" framespacing="1" rows="*"> 
    <frame name="goods_left" scrolling="AUTO" src="goods_left.jsp" >
    <frame name="goods_main" src="goodsAddForm.jsp" scrolling="AUTO">
  </frameset>
<noframes> 
<center><font size="5" color="#FF0000"><b>��ҳ��Ҫ�������֧�ֿ�ܼ�!</b></font></center>
</noframes> 
<%
	}
	else
	{
		out.println("<p align=center>��δͨ������Ա�����������ܷ�����Ʒ��</p>");
	}
%>
