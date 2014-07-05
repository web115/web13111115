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
<jsp:useBean scope="page" id="goodsField" class="com.netshop.goodsField" />
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
<p align="center"><font size="5">空间经营项目</font></p>
		<table width="90%" border=0>
		<form name=form1 action=goodsFieldDelete.jsp method=post>
		<input type=hidden name="page" value=<%=currentPage%> >

			<tr bgcolor="#F0FFF0">
				<td align="center"><font size="4">项目名</font></td>
				<td align="center"><font size="4">操作</font></td>
				
				<td align="center"><font size="4">删除</font></td>

			</tr>
		<%
			ResultSet rs = goodsField.showAllFields();
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
				
				%>
			<tr>
				<td>&nbsp;<%=codeToString(rs.getString("name"))%></td>
				<td>&nbsp;<a href=goodsFieldModifyForm.jsp?ID=<%=rs.getLong("ID")%> target=_self>修改</a></td>
				<td align=center>
				<input type=checkbox name=deleteID value=<%=rs.getLong("ID")%>>
				</td>

			</tr>
				
				<%
					int i=1;
					while(rs.next())
					{
						

				%>
					<tr>
						<td>&nbsp;<%=codeToString(rs.getString("name"))%></td>
						<td>&nbsp;<a href=goodsFieldModifyForm.jsp?ID=<%=rs.getLong("ID")%> target=_self>修改</a></td>						
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
				<input type=submit name=delete value=删除所选项目> 
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
		firstLink="allGoodsFieldList.jsp?page=1";
		lastLink="allGoodsFieldList.jsp?page="+totalPageCount;
		if(currentPage>1)
		{
			preLink="allGoodsFieldList.jsp?page="+(currentPage-1);
		}
		else
		{
			preLink=firstLink;
		}
		if(currentPage <= totalPageCount-1)
		{
			nextLink="allGoodsFieldList.jsp?page="+(currentPage+1);
		}
	    else
		{
			nextLink=lastLink;
		}
	  %>
	  <form method="post" action="allGoodsFieldList.jsp">		
		<p align=center>共<font color="#0000FF"><%= count %></font>条 第<font color="#0000FF"><%= currentPage %></font>页/共<font color="#0000FF"><%= totalPageCount %></font>页 | <a href=<%=firstLink%> >首页 </a> | <a href=<%=preLink%> > 上一页 </a> | <a href=<%=nextLink%>> 下一页 </a> | <a href=<%=lastLink%> > 尾页 </a> | 转到 
		  <input type="text" name=page  size=2> <input type="submit" name=submit value=GO> </p>
		</form>
 
			 </td>
		    </tr>
		
		</table>
		</div>

</body>
</html>
