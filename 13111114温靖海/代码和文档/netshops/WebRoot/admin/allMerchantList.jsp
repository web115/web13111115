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
<jsp:useBean scope="page" id="user" class="com.netshop.user" />
<jsp:useBean scope="page" id="executeWay" class="com.netshop.executeWay" />
<%
	int count=0;
	int totalPageCount=0;
	int perPageCount=5;
	int currentPage=1;
	String pageId = request.getParameter("page");
	if(pageId!=null)
		{
			currentPage=Integer.parseInt(pageId);
			//out.println(pageId);

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
<p align="center"><font size="5">空间信息</font></p>
		<table width="90%" border=0>
		<form name=form1 action=userDelete.jsp method=post>
		<input type=hidden name="page" value=<%=currentPage%> >
		<input type=hidden name="toURL" value="allMerchantList.jsp" >
			<tr bgcolor="#F0FFF0">
				<td align="center"><font size="4">空间名</font></td>
				<td align="center"><font size="4">空间主人</font></td>
				<td align="center"><font size="4">经营项目</font></td>
				<td align="center"><font size="4">
				操作</font></td>
				<td align="center"><font size="4">删除</font></td>

			</tr>
		<%
			ResultSet rs = user.showAllMerchants("1");
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
				String strSql1 = "select name from goodsField where ID = '"+rs.getLong("mainFields")+"'";
				ResultSet rs1 = executeWay.exeSqlQuery(strSql1);
				rs1.first();
				
				%>
			<tr>
				<td>&nbsp;<%=codeToString(rs.getString("shopName"))%></td>
				<td>&nbsp;<%=codeToString(rs.getString("shopper"))%></td>
				<td>&nbsp;<%=codeToString(rs1.getString("name"))%></td>
				<td>&nbsp;<a href=merchantModifyForm.jsp?ID=<%=rs.getLong("ID")%>>修改</a></td>
				<td align=center><input type=checkbox name=deleteID value=<%=rs.getLong("ID")%>></td>

			</tr>
				
				<%
					int i=1;
					while(rs.next())
					{
						strSql1 = "select name from goodsField where ID = '"+rs.getLong("mainFields")+"'";
						rs1 = executeWay.exeSqlQuery(strSql1);
						rs1.first();

				%>
					<tr>
						<td>&nbsp;<%=codeToString(rs.getString("shopName"))%></td>
						<td>&nbsp;<%=codeToString(rs.getString("shopper"))%></td>
						<td>&nbsp;<%=codeToString(rs1.getString("name"))%></td>
						<td>&nbsp;<a href=merchantModifyForm.jsp?ID=<%=rs.getLong("ID")%>>修改</a></td>
						<td align=center><input type=checkbox name=deleteID value=<%=rs.getLong("ID")%>></td>

					</tr>
				<%
					i++;
					if(i >  perPageCount-1) break;
				}
			}
		%>
		<tr>
			<td colspan=5 align=center><br>
				<input type=submit name=delete value=删除所选空间> 
			</td>
		</tr>

			</form>
		</table>
<br>
		<table width="90%" border=0>
		<tr align="right" valign="top">
			 <td colspan="4" align="right">
			 <%
		String firstLink,lastLink,preLink,nextLink;
		firstLink="allMerchantList.jsp?page=1";
		lastLink="allMerchantList.jsp?page="+totalPageCount;
		if(currentPage>1)
		{
			preLink="allMerchantList.jsp?page="+(currentPage-1);
		}
		else
		{
			preLink=firstLink;
		}
		if(currentPage <= totalPageCount-1)
		{
			nextLink="allMerchantList.jsp?page="+(currentPage+1);
		}
	    else
		{
			nextLink=lastLink;
		}
	  %>
	  <form method="post" action="allMerchantList.jsp">		
		<p align=center>共<font color="#0000FF"><%= count %></font>条 第<font color="#0000FF"><%= currentPage %></font>页/共<font color="#0000FF"><%= totalPageCount %></font>页 | <a href=<%=firstLink%> >首页 </a> | <a href=<%=preLink%> > 上一页 </a> | <a href=<%=nextLink%>> 下一页 </a> | <a href=<%=lastLink%> > 尾页 </a> | 转到 
		  <input type="text" name=page  size=2> <input type="submit" name=submit value=GO> </p>
		</form>
 
			 </td>
		    </tr>
		
		</table>
		</div>

</body>
</html>
