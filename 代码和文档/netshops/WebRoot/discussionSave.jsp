<%@ page contentType="text/html; charset=gb2312" language="java" %>
<%@ page import="java.sql.*,com.netshop.*,java.text.*" %>
<%!
public String codeToString(String str)
{//处理中文字符串的函数
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
	<title>校园二手商品交易平台</title>
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
	String name ="游客";
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
		out.println("<center><font color=blue size=5>留言已发表成功！</font></center>");
		//out.println("<center><input type=button name=gofirst value=确定 onclick=javascript:window.location='goodsShow.jsp?ID="+discussion.goodsID+"' ></center>");%>
	<CENTER><p>注意!!页面将在<div id='num' style='display=inline;'>5</div> 秒后跳转回首页
        <p>如果未能跳转，请单击确定</CENTER>
<table align="center">
<tr>
	<td width="57" ><form name="form4" id="form4" method="post" action="first.jsp">
	  <p>
	    <input type="submit" name="Submit2" value="确定" />
	    </p>
	</form></td>
</tr>
</table>
<p>
  <%}
	
	else
	{
		out.println("<center><font color=red size=5>留言发表失败，请稍后重试！</font></center>");
    	out.println("<center><input type=button name=goback value=返回 onclick=javascript:window.history.go(-1) ></center>");
	}%>
	

</body>
</html>
