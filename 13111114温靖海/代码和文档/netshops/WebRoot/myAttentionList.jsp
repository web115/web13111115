<%@ page language="java" contentType="text/html;charset=gb2312" %>
<%@ page import="java.sql.*,com.netshop.*" %>
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
<HTML>
<HEAD>
	<title>У԰������Ʒ����ƽ̨</title>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<script language=javascript>
<!--
	function checkDel()
	{
		if(!confirm("ȷ��Ҫɾ����ѡ����"))
		{
			return false;
		}
		else
		{
			document.all.form1.action="deleteAttention.jsp";
		}
	}
//-->
</script>
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
<jsp:useBean id="attention" scope="page" class="com.netshop.attention"/>
<jsp:useBean id="executeWay" scope="page" class="com.netshop.executeWay"/>

<div align=left>
<form name=form1 method=post target=_self id=form1 onSubmit="checkDel()">
<table width=90% border=1 cellpadding="5" cellspacing="0">
<tr>
<td colspan=4 align=center>
<font size=5>
<b>
�����ղ���Ʒ
</b>
</font>
</td>
</tr>

	<tr bgcolor="#DFDFDF">
		<td align=center width=10%>
		<b>
		ѡ��
		</b>
		</td>
		<td align=center width=20%>
		<b>
		��Ʒ��
		</b>
		</td>
		<td align=center width=20%>
		<b>
		���
		</b>
		</td>
		<td align=center width=30%>
		<b>
		�����ռ�
		</b>
		</td>
	</tr>
	<%
		String strID = ((com.netshop.user)session.getAttribute("user")).ID + "";
		ResultSet rs = attention.showAllAttentions(strID);
		while(rs.next())
		{
			
			String strSql = "select g.title,gf.name,u.shopName from goods g,goodsField gf,users u where g.goodsField = gf.ID and g.issuer = u.ID and g.ID ="+rs.getLong("goodsID");
			
			ResultSet rs1 = executeWay.exeSqlQuery(strSql);
			
			if(rs1.next())
			{
		%>
			<tr>
			<td align=left>
			<input type=checkbox name=selAttention value=<%=rs.getLong("ID")%> >
			</td>
			<td align=left>
			<a href=goodsShow.jsp?ID=<%=rs.getLong("ID")%> target=_blank>
			<%=codeToString(rs1.getString("g.title"))%>
			</a>
			</td>
			<td align=left>
			<%=codeToString(rs1.getString("gf.name"))%>
			</td>
			<td align=left>
			<%=codeToString(rs1.getString("u.shopName"))%>
			</td>
			</tr>
			

		<%
			}
		}

	%>

</table>

<input type=submit name=submit value=ɾ�� >
</form>
</div>

</body>
</html>