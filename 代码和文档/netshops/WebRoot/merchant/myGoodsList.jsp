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
<p align="center"><font size="5">已发布商品</font></p>
<form name="form1" action=deleteGoods.jsp method=post>
		<table width="90%" border=0>
			<tr bgcolor="#F0FFF0">
				<td align="center"><font size="4">选择</font></td>
				<td align="center"><font size="4">商品名</font></td>
				
				
				<td align="center"><font size="4">发布时间</font></td>
				<td align="center"><font size="4">修改</font></td>
			</tr>
		<%
			String strID = String.valueOf(((com.netshop.user)session.getAttribute("user")).ID);
			ResultSet rs = goods.showGoodsByMerchant(strID);						
	
					while(rs.next())
					{
						

				%>
					<tr>
						<td><input type=checkbox name=delID value=<%=rs.getLong("ID")%> >  </td>
						<td>&nbsp;<a href=../goodsShow.jsp?ID=<%=rs.getLong("ID")%> target=_self ><%=codeToString(rs.getString("title"))%></a></td>
						
						<td>&nbsp;<%=rs.getString("createDate")%></td></td>
						<td><a href=modifyGoodsForm.jsp?ID=<%=rs.getLong("ID")%> target=_self>修改</a></td>
					</tr>
				<%
					
					}
		%>
		</td>
		    </tr>
		</table>
		<p><input type=submit name=sub value=删除>&nbsp;&nbsp;&nbsp;&nbsp;<input type=reset name=res value=重选>
</form>
		</div>

</body>
</html>
