<%@ page contentType="text/html; charset=gb2312" language="java" %>
<%@ page import="java.sql.*,com.netshop.*,java.text.*" %>
<%!
public String codeToString(String str)
{//���������ַ����ĺ���
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
<jsp:useBean scope="page" id="discussion" class="com.netshop.discussion" />

<html>
<head>
	<title>У԰������Ʒ����ƽ̨</title>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    <meta http-equiv='refresh' content='5;url=first.jsp'> 
                		<style type="text/css">
<!--
body {
	background-color: #ADBACE;
	background-image: url(images/login.jpg);
}
-->
        </style>
<script type='text/javascript'> 
var i=5; 
function getTime(){ 
document.getElementById('num').innerHTML="<font color='red'>"+i+"</font>"; 
i-=1; 
var x=setTimeout('getTime()',1000) 
if(i<=0){ 
clearTimeout(x); 
} 
} 
window.onload=getTime; 
</script> 
</head>

<body>
<%
	String name ="�ο�";
	request.setCharacterEncoding("gb2312");
	discussion.authorName = new String( request.getParameter("authorName").getBytes("gb2312"), "ISO-8859-1");
	discussion.goodsID = Long.parseLong(request.getParameter("goodsID"));
    discussion.content = new String( request.getParameter("content").getBytes("gb2312"), "ISO-8859-1");

	
	com.netshop.user user = (com.netshop.user)session.getAttribute("user");
	if(user!= null)
	{
		discussion.disType = user.sysRole;
		discussion.authorID = user.ID;
	}
	else
	{
		discussion.authorName =new String( name.getBytes("gb2312"), "ISO-8859-1");

		discussion.disType = 3;
		discussion.authorID = 0;
	}
	discussion.tag = 0;
	if(discussion.add())
	{
		out.println("<center><font color=blue size=5>�����ѷ���ɹ���</font></center>");
		//out.println("<center><input type=button name=gofirst value=ȷ�� onclick=javascript:window.location='goodsShow.jsp?ID="+discussion.goodsID+"' ></center>");%>
	<CENTER><p>ע��!!ҳ�潫��<div id='num' style='display=inline;'>5</div> �����ת����ҳ
        <p>���δ����ת���뵥��ȷ��</CENTER>
<table align="center">
<tr>
	<td width="57" ><form name="form4" id="form4" method="post" action="first.jsp">
	  <p>
	    <input type="submit" name="Submit2" value="ȷ��" />
	    </p>
	</form></td>
</tr>
</table>
<p>
  <%}
	
	else
	{
		out.println("<center><font color=red size=5>���Է���ʧ�ܣ����Ժ����ԣ�</font></center>");
    	out.println("<center><input type=button name=goback value=���� onclick=javascript:window.history.go(-1) ></center>");
	}%>
	

</body>
</html>
