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


<html>
<head>
	<title>У԰������Ʒ����ƽ̨</title>
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
<p align="center"><font size="5">�ѷ�����Ʒ</font></p>
<form name="form1" action=deleteGoods.jsp method=post>
		<table width="90%" border=0>
			<tr bgcolor="#F0FFF0">
				<td align="center"><font size="4">ѡ��</font></td>
				<td align="center"><font size="4">��Ʒ��</font></td>
				
				
				<td align="center"><font size="4">����ʱ��</font></td>
				<td align="center"><font size="4">�޸�</font></td>
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
						<td><a href=modifyGoodsForm.jsp?ID=<%=rs.getLong("ID")%> target=_self>�޸�</a></td>
					</tr>
				<%
					
					}
		%>
		</td>
		    </tr>
		</table>
		<p><input type=submit name=sub value=ɾ��>&nbsp;&nbsp;&nbsp;&nbsp;<input type=reset name=res value=��ѡ>
</form>
		</div>

</body>
</html>
