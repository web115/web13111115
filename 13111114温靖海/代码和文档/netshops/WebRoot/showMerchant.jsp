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
<jsp:useBean scope="page" id="goods" class="com.netshop.goods" />
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

	String shopName = request.getParameter("shopName");
	String shopper = request.getParameter("shopper");
	String strMainFields = request.getParameter("mainFields");
	long mainFields = 0;
	String strField = "";
	if(strMainFields != null)
	{
		mainFields = Long.parseLong(strMainFields);
	}
	if(mainFields > 0)
	{
		strField = " and mainFields ="+mainFields;
	}

	if(shopName == null)
	{
		shopName = "";
	}
	shopName = shopName.trim();
    shopName=new String(shopName.getBytes("gb2312"),"ISO-8859-1");
	if(shopper == null)
	{
		shopper = "";
	}
	shopper = shopper.trim();
	shopper=new String(shopper.getBytes("gb2312"),"ISO-8859-1");
	String strSql= "select * from users where sysRole=2 and tag != -1 and shopName like '%"+shopName+"%' and shopper like '%"+shopper+"%'"+strField;
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
<script language=javascript>
function submitForm(subPage)
{
	document.all.page=subPage;
	document.all.form1.action="showMerchant.jsp";
	document.all.form1.submit();
}
</script>
</head>

<body>
<div align=center>
<p align="center"><font size="5">�ռ���Ϣ</font></p>
		<table width="90%" border=0>
			<tr bgcolor="#F0FFF0">
				<td align="center"><font size="4">�ռ���</font></td>
				<td align="center"><font size="4">�ռ�����</font></td>
				<td align="center"><font size="4">��Ӫ��Ŀ</font></td>
				<td align="center"><font size="4">�ռ����</font></td>
				
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
				String strSql1 = "select name from goodsField where ID = '"+rs.getLong("mainFields")+"'";
				ResultSet rs1 = executeWay.exeSqlQuery(strSql1);
				rs1.first();
				
				%>
				<tr>
				<td>&nbsp;
				<a href=shopShow.jsp?ID=<%=rs.getLong("ID")%> target=_self>
				<%=codeToString(rs.getString("shopName"))%>
				</a></td>
				<td>&nbsp;<%=codeToString(rs.getString("shopper"))%></td>
				<td>&nbsp;<%=codeToString(rs1.getString("name"))%></td>
				<td>&nbsp;<%=codeToString(rs.getString("shopIntro"))%></td>
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
						<td>&nbsp;
						<a href=shopShow.jsp?ID=<%=rs.getLong("ID")%> target=_self>
			<%=codeToString(rs.getString("shopName"))%>
						</a></td>
			<td>&nbsp;<%=codeToString(rs.getString("shopper"))%></td>
				<td>&nbsp;<%=codeToString(rs1.getString("name"))%></td>
				<td>&nbsp;<%=codeToString(rs.getString("shopIntro"))%></td>
					</tr>
				<%
					i++;
					if(i >  perPageCount-1) break;
				}
			}
		%>
			
		</table>
		<br>
		<!--<table width="90%" border=0>
		
			<form name="form1" method="post" id="form1">
			<input type="hidden" name="shopName" id="shopName" value="<%=shopName%>"> 
			<input type="hidden" name="mainFields" id="mainFields" value="<%=strMainFields%>">
			<input type="hidden" name="shopper" id="shopper" value="<%=shopper%>">	
			<input type="hidden" name="page" id="page">	
			<TR height="20">
			<TD  width="25%"  height="20" align="center" valign="top">
			��<font color="#0000FF"><%= count %></font>�� 
			��<font color="#0000FF"><%= currentPage %></font>ҳ/��
			<font color="#0000FF"><%= totalPageCount %></font>ҳ
			</TD>
			<TD  width="10%" height="20"  align="center" valign="top">
			<input type="submit" name="sub1" value="��ҳ" onClick="submitForm(1)">
			</form>
			</TD>
			<TD  width="10%"  height="20" align="center" valign="top">
			<input type="submit" name="sub2" value="��һҳ" onClick="submitForm(<%=currentPage-1%>)">
			</TD>
			<TD  width="10%"  height="20" align="center" valign="top">			
			<input type="submit" name="sub3" value="��һҳ" onClick="submitForm(<%=currentPage+1%>)">
			</form>
			</TD >
			<TD width="10%"  height="20" align="center" valign="top">
				<input type="submit" name="sub4" value="βҳ" onclick=submitForm(<%= totalPageCount%>)>
			</TD>
			<TD  width="20%" height="20" valign="top" align="center">					
			����<input type="text" name="page1" size="3">ҳ&nbsp;<input type="submit" name="sub5" value="GO" onClick="submitForm(document.all.page1.value)">			
			</TD>
			
			
			</TR>
 		</form>
		</table>-->
<table width="90%" border=0>
		<tr align="center" valign="top">
			 <td colspan="4" align="center">
			 <%
		String firstLink,lastLink,preLink,nextLink;
		firstLink="showMerchant.jsp?page=1";
		lastLink="showMerchant.jsp?page="+totalPageCount;
		if(currentPage>1)
		{
			preLink="showMerchant.jsp?page="+(currentPage-1);
		}
		else
		{
			preLink=firstLink;
		}
		if(currentPage <= totalPageCount-1)
		{
			nextLink="showMerchant.jsp?page="+(currentPage+1);
		}
	    else
		{
			nextLink=lastLink;
		}
	  %>
		<table width="90%" border=0>
		<tr align="center" valign="top">
			 <td colspan="4" align="center"><form method="post" action="showMerchant.jsp">
			   <p align=center>��<font color="#0000FF"><%= count %></font>�� ��<font color="#0000FF"><%= currentPage %></font>ҳ/��<font color="#0000FF"><%= totalPageCount %></font>ҳ | <a href=<%=firstLink%> >��ҳ </a> | <a href=<%=preLink%> > ��һҳ </a> | <a href=<%=nextLink%>> ��һҳ </a> | <a href=<%=lastLink%> > βҳ </a> | ת�� 
		  <input type="text" name=page  size=2> <input type="submit" name=submit value=GO> </p>
		</form>
 
		  </td>
	      </tr>
		
		</table>
		</div>

</body>
</html>
