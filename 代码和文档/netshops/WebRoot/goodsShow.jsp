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
    <script language="javascript">
	<!--
	function checkdata()
	{
		var txt=form2.ints.value;
		if(txt.search("^-?\\d+$")!=0)
		{
			alert("������һ����������");
			form2.ints.select();
			return false;
		}
		return true;
	}
    -->
	</script>
    		<style type="text/css">
<!--
body {
	background-color: #ADBACE;
	background-image: url(images/login.jpg);
}
-->
        </style>
</head>
<jsp:useBean scope="page" id="goodsField" class="com.netshop.goodsField" />
<jsp:useBean scope="page" id="goods" class="com.netshop.goods" />
<jsp:useBean scope="page" id="user" class="com.netshop.user" />
<jsp:useBean scope="page" id="executeWay" class="com.netshop.executeWay" />

<%
	String strID = request.getParameter("ID");
	goods.init(strID);
	goodsField.init(goods.goodsField+"");
	user.init(String.valueOf(goods.issuer));

%>
<body>
<div align="center">
	<%
		if(goods.goodsURL.indexOf(".")>0)
		{
		%>
		<p align="center">
		<a href=showPhoto.jsp?photo=<%=goods.goodsURL%> target=_self>
		<img width="200" height="150" src="E:\\netshop\\uploadPhotos\\/<%=goods.goodsURL%>"  border="1"></a></p>
		
		<%
		}
	%>
<TABLE cellSpacing=1 cellPadding=3 width="40%" align=center   border=1>
        <TBODY>
        <tr >
          <td align=right width="40%">��Ʒ���ƣ�</td>
          <td align=left width="60%"><%=codeToString(goods.title)%></td>
		  </tr>
        <tr >
          <td align=right>��Ʒ���</td>
          <td align=left><%=codeToString(goodsField.name)%>  
		  </td></tr>
        <tr >
          <td align=right>�����ռ䣺</td>
          <td align=left><%=codeToString(user.shopName)%>  
		  </td></tr>
        <tr >
          <td vAlign=top align=right>��Ʒ���ܣ�</td>
          <td align=left><input name="description" type="text" id="descriptions" style="WIDTH: 233px" value="<%=codeToString(goods.description)%>" readonly="readonly"></td>
        </tr>
		<tr>
          <td vAlign=top align=right>�ۡ�����</td>
          <td align=left><font color="#0000FF"><%=goods.price%></font> RMB(��λ��Ԫ) &nbsp;&nbsp;
        </tr>
        
        
        <tr >
          <td vAlign=top align=right>�� ϵ �ˣ�</td>
          <td align=left><%=codeToString(goods.linkMan)%></td></tr>
        <tr >
          <td vAlign=top align=right>��ϵ�绰��</td>
          <td align=left><%=goods.telephone%></td></tr>
		  <tr >
          <td colspan="2" align=center vAlign=top><form name="form2" method="post" action="offer.jsp" onSubmit="return checkdata()">
            ���ı���Ϊ����
                <input type="text" name="ints">
            <input type="submit" value="���ڱ��ۣ�">
            <input type=hidden name="goodsID" value=<%=strID%> >
            <input type=hidden name="userName" 
			<%
			com.netshop.user user1 = (com.netshop.user)session.getAttribute("user");		
			if(user1 != null)
			out.println(" value="+codeToString(user1.userName));%>>
          </form></td>
          </tr>
        
       </TABLE>
<input type=button name=attention value="������Ʒ�����ղؼ�" onClick=javascript:window.location='attentionSave.jsp?ID=<%=strID%>'>
<p>

<h3><p align="left"> <strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�����б�(�����۸ߵ�����)��</strong></p></h3>
  <%
	   String strSql1 = "select * from `offer` where goodsID='"+strID+"' order by price desc";
		ResultSet rs1 = executeWay.exeSqlQuery(strSql1);
		while(rs1.next())
		{
		%>
  </p>
  <table cellSpacing=0 cellPadding=3 width="40%" align=center   border=1>
			<tr >
			<td width="40%" vAlign=top align=right>�����ˣ�</span></td>
			<td width="60%"align=left><a href=sendMail.jsp?receiver=<%=codeToString(rs1.getString("userName"))%>><%= codeToString(rs1.getString("userName")) %></a></td>
	</tr>
			<tr>
			<td width="40%" vAlign=top align=right><blockquote>
			  <p>����ʱ�䣺</span></p>
			  </blockquote></td>
			<td width="60%"align=left><%= rs1.getString("createDate") %></td>
		  </tr>
		  <tr >
			<td width="40%" vAlign=top align=right >�����۸�</span> </td>
			<td width="60%"align=left><font color="#0000FF">��<%=rs1.getString("price") %></td>
		  </tr>
		  
  </table>
<%}%>


<h3><p align="left"> <strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;���԰壺</strong></p></h3>
  <%
	   String strSql = "select * from `discussion` where tag!=-1 and goodsID='"+strID+"' order by createDate desc";
		ResultSet rs = executeWay.exeSqlQuery(strSql);
		while(rs.next())
		{
		%>
  </p>
  <table cellSpacing=1 cellPadding=3 width="40%" align=center   border=1>
			<tr >
			<td width="40%" vAlign=top align=right>�����ˣ�</span></td>
			<td width="60%"align=left><%= codeToString(rs.getString("authorName")) %></td>
	</tr>
			<tr>
			<td width="40%" vAlign=top align=right>����ʱ�䣺</span></td>
			<td width="60%"align=left><%= rs.getString("createDate") %></td>
		  </tr>
		  <tr >
			<td width="40%" vAlign=top align=right >�������ݣ�</span> </td>
			<td width="60%"align=left><%= codeToString(rs.getString("content")) %></td>
		  </tr>
		  
  </table>


		<%}%>
		<form name=form1 method="post" action="discussionSave.jsp">
		<table cellSpacing=1 cellPadding=3 width="60%" align=center   border=1>
		<input type=hidden name="goodsID" value=<%=strID%> >

			<tr>
			<td width="20%" vAlign=top align=right>�����ˣ�</span></td>
			<td width="80%" align=left>
			<input type="text" name="authorName" 
			<%
			com.netshop.user user2 = (com.netshop.user)session.getAttribute("user");		
			if(user2 != null)
			out.println(" value="+codeToString(user2.userName)+" readonly=true");%>>
			</td>
			
		  </tr>
		  <tr>
			<td width="40%" vAlign=top align=right>�������ݣ�</span> </td>
			<td width="60%" align=left><TEXTAREA name="content" rows=6 cols=40></TEXTAREA></td>
		  </tr>
		  
		  </table>
			<p align=center><input type="submit" name=submit1 value="����"></p>
</form>
		<br>
		<p align=center>
		<input type=button name=closewin onClick="javascript:window.close()" value="�رմ���"></p>
		
		
</div>
</body>
</html>
