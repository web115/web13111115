<%@ page contentType="text/html; charset=gb2312" language="java"%>
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
<html>
<head>
<title>У԰������Ʒ����ƽ̨</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<jsp:useBean scope="page" id="goodsField" class="com.netshop.goodsField" />
<jsp:useBean scope="page" id="user" class="com.netshop.user" />
<jsp:useBean scope="page" id="goods" class="com.netshop.goods" />
       		<style type="text/css">

body {
	background-color: #FFFFFF;
	background-image: url(images/login.jpg);
}
        </style>

</head>

<body>
<div align="center">
<%
	String strID = request.getParameter("ID");
	user.init(strID);
	goodsField.init(String.valueOf(user.mainFields));


%>

		<table width="70%">
          
           
            <TR > 
              <TD width=14% align=right >�ռ����ƣ�</TD>
              <TD align=left width=86%><%=codeToString(user.shopName)%> </TD>
			
            </TR>
           
            <TR > 
			<TD width=14% align=right vAlign=top >��Ӫ��Ŀ��</TD>
              <TD align=left width=86%><%=codeToString(goodsField.name)%></TD>
			  </tr>
			  <tr>
              <TD width=14% align=right vAlign=top >�ռ����ˣ�</TD>
              <TD align=left width=86%><%= codeToString(user.shopper)%> 
              </TD>
            </TR>
           
            <TR > 
              <TD width=14% align=right vAlign=top >�û�����</TD>
              <TD align=left width=86%><%=codeToString(user.userName)%></TD>
			  </tr>
			  
            <TR > 
              <TD width=14% align=right vAlign=top >�ռ���ܣ�</TD>
              <TD 
          align=left width=86%><textarea name=shopIntro rows=8 cols=50><%=codeToString(user.shopIntro)%></textarea></TD>
            </TR>
            <tr>
			<TD width=14% align=right vAlign=top >&nbsp;</TD>
			<TD align=left width=86%>	
			 <input type=button name="sendMail" value=���ռ����˷��ʼ� onClick="javascript:window.location='sendMail.jsp?receiver=<%=codeToString(user.userName)%>'" >
            </TD>
            </TR>
    
		  </table>
<br>
		 <table width=70%>
		<tr>
			<td colspan=3 align=center>
			<font size=5>
			�ռ�������Ʒ
			</font>
			</td>
		</tr>

			<tr bgcolor="#F0FFF0">
				
				<td align="center" width=40%><font size="4">��Ʒ��</font></td>						
				<td align="center" width=25%><font size="4">��Ʒ�۸�(RMB)</font></td>
				<td align="center" width=35%><font size="4">����ʱ��</font></td>
			</tr>
		<%
			ResultSet rs = goods.showGoodsByMerchant(String.valueOf(user.ID));						
	
					while(rs.next())
					{
						

				%>
					<tr>
						
						<td>&nbsp;<a href=goodsShow.jsp?ID=<%=rs.getLong("ID")%> target=_blank ><%=codeToString(rs.getString("title"))%></a></td>
						
						<td>&nbsp;<%=rs.getString("price")%></td></td>
						<td>&nbsp;<%=rs.getString("createDate")%></td>
					</tr>
				<%
					
					}
		%>
		</td>
		    </tr>
		
		 </table>
        
  </div>
</body>
</html>
