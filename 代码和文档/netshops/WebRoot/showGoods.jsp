<%@ page contentType="text/html; charset=gb2312" language="java" %>
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
<jsp:useBean scope="page" id="executeWay" class="com.netshop.executeWay" />

<%
	request.setCharacterEncoding("gb2312");

	int count=0;
	int totalPageCount=0;
	int perPageCount=5;
	int currentPage=1;
	String pageId = request.getParameter("page");
	if(pageId!=null)
		{
			currentPage=Integer.parseInt(pageId);	
		}

	String title = request.getParameter("title");
	String price = request.getParameter("price");
	String strGoodsField = request.getParameter("goodsField");

	long goodsField = 0;
	String strField = "";

	
	if(strGoodsField != null && strGoodsField != "")
	{
		goodsField = Long.parseLong(strGoodsField);
	}
	else
	{
		strGoodsField="";
	}
	if(goodsField > 0)
	{
		strField = " and goodsField ="+goodsField;
	}

	String strPrice = "";
	int intPrice = 0;
	if(price != null)
	{
		intPrice = Integer.parseInt(price);
	}

	switch(intPrice)
	{
		case 1: strPrice = " and price <100 ";
				break;
		case 2: strPrice = " and price <=500 and price > 100 ";
				break;
		case 3: strPrice = " and price <=2000 and price > 500 ";
				break;
		case 4: strPrice = " and price <=5000 and price > 2000 ";
				break;
		case 5: strPrice = " and price <=10000 and price > 5000 ";
				break;
		case 6: strPrice = " and price > 10000 ";
				break;
	}

	if(title == null)
	{
		title = "";
	}
	title = title.trim();
	title=new String(title.getBytes("gb2312"),"ISO-8859-1");
	String strSql = "select * from goods where title like '%"+title+"%'"+strPrice+" "+strField;

%>
<html>
<head>
	<title>У԰������Ʒ����ƽ̨</title>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
        		<style type="text/css">
<!--
body {
	background-color: #ADBACE;
	background-image: url(images/login.jpg);
}
-->
        </style>
</head>

<body>
<div align=center>
<p align="center"><font size="5">������Ʒ��Ϣ</font></p>
		<table width="90%" border=0>
			<tr bgcolor="#F0FFF0">
				<td align="center"><font size="4">���</font></td>
				<td align="center"><font size="4">��Ʒ��</font></td>
				<td align="center"><font size="4">�۸�</font></td>
				<td align="center"><font size="4">�����ռ�</font></td>
				<td align="center"><font size="4">����ʱ��</font></td>
			</tr>
		<%
			ResultSet rs = executeWay.exeSqlQuery(strSql);
			
			rs.last();//�Ƶ�ĩβ
			count = rs.getRow();//ȡ���ܲ�ѯ��
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
				ResultSet rs1 = executeWay.exeSqlQuery(strSql1);
				ResultSet rs2 = executeWay.exeSqlQuery(strSql2);
				rs1.first();
				rs2.first();
				
				%>
		<tr>
				<td>&nbsp;<%=codeToString(rs1.getString("name"))%></td>
				<td>&nbsp;<a href=goodsShow.jsp?ID=<%=rs.getLong("ID")%> target=_self ><%=codeToString(rs.getString("title"))%></a></td>
				<td>&nbsp;<%=rs.getLong("price")%></td>
				<td>&nbsp;<%=codeToString(rs2.getString("shopName"))%></td>
				<td>&nbsp;<%=rs.getString("createDate")%></td></td>
			</tr>
				
				<%
					int i=1;
					while(rs.next())
					{
						strSql1 = "select name from goodsField where ID ='"+rs.getLong("goodsField")+"'";
						strSql2 = "select * from users where ID ='"+rs.getLong("issuer")+"'";
						rs1 = executeWay.exeSqlQuery(strSql1);
						rs2 = executeWay.exeSqlQuery(strSql2);
						rs1.first();
						rs2.first();

				%>
					<tr>
						<td>&nbsp;<%=codeToString(rs1.getString("name"))%></td>
						<td>&nbsp;<a href=goodsShow.jsp?ID=<%=rs.getLong("ID")%> target=_self ><%=codeToString(rs.getString("title"))%></a></td>
						<td>&nbsp;<%=rs.getLong("price")%></td>
						<td>&nbsp;<%=codeToString(rs2.getString("shopName"))%></td>
						<td>&nbsp;<%=rs.getString("createDate")%></td></td>
					</tr>
				<%
					i++;
					if(i >  perPageCount-1) break;
				}
			}
		%>
		</td>
		    </tr>
		</table>
<br>
		<!--<table width="90%" border=0>
			<TR height="20">
			<TD  width="25%"  height="20" align="center" valign="top">
			��<font color="#0000FF"><%= count %></font>�� 
			��<font color="#0000FF"><%= currentPage %></font>ҳ/��
			<font color="#0000FF"><%= totalPageCount %></font>ҳ
			</TD>
			<TD  width="10%" height="20"  align="center" valign="top">
			<form name="form1" action="showGoods.jsp" method="post">
			<input type="hidden" name="title" value="<%=title%>">
			<input type="hidden" name="price" value="<%=intPrice%>">
			<input type="hidden" name="goodsField" value="<%=strGoodsField%>">
			<input type="hidden" name="page" value="1">
			<input type="submit" name="sub1" value="��ҳ">
			</form>
			</TD>
			<TD  width="10%"  height="20" align="center" valign="top">
			<form name="form2" action="showGoods.jsp" method="post">
			<input type="hidden" name="title" value="<%=title%>">
			<input type="hidden" name="price" value="<%=intPrice%>">
			<input type="hidden" name="goodsField" value="<%=strGoodsField%>">	
			<input type="hidden" name="page" value="<%=currentPage-1%>">
			<input type="submit" name="sub2" value="��һҳ">
			</form>
			</TD>
			<TD  width="10%"  height="20" align="center" valign="top">
			<form name="form3" action="showGoods.jsp" method="post">
			<input type="hidden" name="title" value="<%=title%>">
			<input type="hidden" name="price" value="<%=intPrice%>">
			<input type="hidden" name="goodsField" value="<%=strGoodsField%>">
			<input type="hidden" name="page" value="<%=currentPage+1%>">
			<input type="submit" name="sub3" value="��һҳ" >
			</form>
			</TD >
			<TD width="10%"  height="20" align="center" valign="top">
			<form name="form4" action="showGoods.jsp" method="post">
			<input type="hidden" name="title" value="<%=title%>">
			<input type="hidden" name="price" value="<%=intPrice%>">
			<input type="hidden" name="goodsField" value="<%=strGoodsField%>">
			<input type="hidden" name="page" value="<%=totalPageCount%>">
			<input type="submit" name="sub4" value="βҳ" >
			</form>
			</TD>
			<TD  width="20%" height="20" valign="top" align="center">	
			<form name="form5" action="showGoods.jsp" method="post">
			<input type="hidden" name="title" value="<%=title%>">
			<input type="hidden" name="price" value="<%=intPrice%>">
			<input type="hidden" name="goodsField" value="<%=strGoodsField%>">		
			����<input type="text" name="page" size="3">ҳ&nbsp;
			<input type="submit" name="sub5" value="GO">
			</form>
			</TD>
			
			
			</TR>
 		</form>
		</table>-->
		<table width="90%" border=0>
		<tr align="center" valign="top">
			 <td colspan="4" align="center">
			 <%
		String firstLink,lastLink,preLink,nextLink;
		firstLink="showGoods.jsp?page=1";
		lastLink="showGoods.jsp?page="+totalPageCount;
		if(currentPage>1)
		{
			preLink="showGoods.jsp?page="+(currentPage-1);
		}
		else
		{
			preLink=firstLink;
		}
		if(currentPage <= totalPageCount-1)
		{
			nextLink="showGoods.jsp?page="+(currentPage+1);
		}
	    else
		{
			nextLink=lastLink;
		}
	  %>
		<table width="90%" border=0>
		<tr align="center" valign="top">
			 <td colspan="4" align="center"><form method="post" action="showGoods.jsp">
			   <p align=center>��<font color="#0000FF"><%= count %></font>�� ��<font color="#0000FF"><%= currentPage %></font>ҳ/��<font color="#0000FF"><%= totalPageCount %></font>ҳ | <a href=<%=firstLink%> >��ҳ </a> | <a href=<%=preLink%> > ��һҳ </a> | <a href=<%=nextLink%>> ��һҳ </a> | <a href=<%=lastLink%> > βҳ </a> | ת�� 
		  <input type="text" name=page  size=2> <input type="submit" name=submit value=GO> </p>
		</form>
 
		  </td>
	      </tr>
		
		</table>
		</div>

</body>
</html>
