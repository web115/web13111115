<%@ page contentType="text/html; charset=gb2312" language="java" %>
<%@ page import="java.sql.*,com.netshop.*" %>
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
<jsp:useBean scope="page" id="goods" class="com.netshop.goods" />
<jsp:useBean scope="page" id="executeWay1" class="com.netshop.executeWay" />
<jsp:useBean scope="page" id="executeWay2" class="com.netshop.executeWay" />
<%
	int count=0;
	int totalPageCount=0;
	int perPageCount=5;
	int currentPage=1;
	String pageId = request.getParameter("page");
	if(pageId!=null)
		{
			currentPage=Integer.parseInt(pageId);
		}
%>
<html>
<head>
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
</head>

<body>
<div align=center>
<p align="center"><font size="5">所有商品信息</font></p>
<form name=form1 action=goodsDelete.jsp method=post>
		<input type=hidden name="page" value=<%=currentPage%> >
		<table width="90%" border=0>
			<tr bgcolor="#F0FFF0">
				<td align="center"><font size="4">类别</font></td>
				<td align="center"><font size="4">商品名</font></td>
				<td align="center"><font size="4">所属空间</font></td>
				<td align="center"><font size="4">操作</font></td>
				<td align="center"><font size="4">删除</font></td>
			</tr>
		<%
			ResultSet rs = goods.showGoods();
			rs.last();//移到末尾
			count = rs.getRow();//取得总查询数
			totalPageCount = (count + perPageCount -1)/perPageCount;
						if(currentPage > totalPageCount || currentPage<=0)
						{
							currentPage=1;
						}
			int  currentIndex = (currentPage - 1) * perPageCount +1;
			if(count>0)
				{
				rs.absolute(currentIndex);
				String strSql1 = "select name from goodsField where ID ='"+rs.getLong("goodsField")+"'";
				String strSql2 = "select * from users where ID ='"+rs.getLong("issuer")+"'";
				ResultSet rs1 = executeWay1.exeSqlQuery(strSql1);
				ResultSet rs2 = executeWay1.exeSqlQuery(strSql2);
				rs1.first();
				rs2.first();
				
				%>
			<tr>
				<td>&nbsp;<%=codeToString(rs1.getString("name"))%></td>
				<td>&nbsp;<a href=../goodsShow.jsp?ID=<%=rs.getLong("ID")%> target=_self ><%=codeToString(rs.getString("title"))%></a></td>
				<td>&nbsp;<%=codeToString(rs2.getString("shopName"))%></td>
				<td>&nbsp;<a href=goodsModifyForm.jsp?ID=<%=rs.getLong("ID")%>>修改</a></td>
				<td align=center><input type=checkbox name=deleteID value=<%=rs.getLong("ID")%>></td>
			</tr>
				
				<%
					int i=1;
					while(rs.next())
					{
						strSql1 = "select name from goodsField where ID ='"+rs.getLong("goodsField")+"'";
						strSql2 = "select * from users where ID ='"+rs.getLong("issuer")+"'";
						rs1 = executeWay1.exeSqlQuery(strSql1);
						rs2 = executeWay1.exeSqlQuery(strSql2);
						rs1.first();
						rs2.first();

				%>
					<tr>
						<td>&nbsp;<%=codeToString(rs1.getString("name"))%></td>
						<td>&nbsp;<a href=../goodsShow.jsp?ID=<%=rs.getLong("ID")%> target=_self ><%=codeToString(rs.getString("title"))%></a></td>
						<td>&nbsp;<%=codeToString(rs2.getString("shopName"))%></td>
						<td>&nbsp;<a href=goodsModifyForm.jsp?ID=<%=rs.getLong("ID")%>>修改</a></td>
						<td align=center><input type=checkbox name=deleteID value=<%=rs.getLong("ID")%>></td>
					</tr>
				<%
					i++;
					if(i >  perPageCount-1) break;
				}
			}
		%>
		</td>
		    </tr>
			<tr>
			<td colspan=5 align=center><br>
				<input type=submit name=delete value=删除所选商品> 
			</td>
		</tr>
		</table>
		</form>
<br>
		<table width="90%" border=0>
		<tr align="right" valign="top">
			 <td colspan="4" align="right">
			 <%
		String firstLink,lastLink,preLink,nextLink;
		firstLink="allGoodsList.jsp?page=1";
		lastLink="allGoodsList.jsp?page="+totalPageCount;
		if(currentPage>1)
		{
			preLink="allGoodsList.jsp?page="+(currentPage-1);
		}
		else
		{
			preLink=firstLink;
		}
		if(currentPage <= totalPageCount-1)
		{
			nextLink="allGoodsList.jsp?page="+(currentPage+1);
		}
	    else
		{
			nextLink=lastLink;
		}
	  %>
	  <form method="post" action="allGoodsList.jsp">		
		<p align=center>共<font color="#0000FF"><%= count %></font>条 第<font color="#0000FF"><%= currentPage %></font>页/共<font color="#0000FF"><%= totalPageCount %></font>页 | <a href=<%=firstLink%> >首页 </a> | <a href=<%=preLink%> > 上一页 </a> | <a href=<%=nextLink%>> 下一页 </a> | <a href=<%=lastLink%> > 尾页 </a> | 转到 
		  <input type="text" name=page  size=2> <input type="submit" name=submit value=GO> </p>
		</form>
 
			 </td>
		    </tr>
		
		</table>

		</div>

</body>
</html>
