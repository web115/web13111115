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
<SCRIPT language=javascript>
<!--

	function isReUpload_onclick()
	{
		if(form1.isReUpload[0].checked)//����
		{
			form1.file.disabled =true;
		}
		if(form1.isReUpload[1].checked)//�ϴ�
		{
			form1.file.value="";
			form1.file.disabled=false;
		}

	}

	//-->
</SCRIPT>
       		<style type="text/css">

body {
	background-color: #FFFFFF;
	background-image: url(../images/login.jpg);
}
        </style>
</head>
<jsp:useBean scope="page" id="goodsField" class="com.netshop.goodsField" />

<%
	String strGoodsID = ((com.netshop.user)session.getAttribute("user")).mainFields+"";
	goodsField.init(strGoodsID);

%>
<body>
<div align="center">
<TABLE cellSpacing=1 cellPadding=3 width="90%" align=center   border=0>
  <FORM name="form1" onReset="return confirm('ȷ��Ҫ��յ�ǰ����');" 
        onsubmit="return infocheck();" action=goodsAddSave.jsp method=post enctype="multipart/form-data" >
        <TBODY>
        <TR >
          <TD align=right width="17%">��Ʒ���ƣ�</TD>
          <TD align=left width="83%">
		  <input type="text" name="title" size="30">
		  </TD>
		  </TR>
        <TR >
          <TD align=right>��Ʒ���</TD>
          <TD align=left><%=codeToString(goodsField.name)%>  
		  </TD></TR>
        
        <TR >
          <TD vAlign=top align=right>��Ʒ���ܣ�</TD>
          <TD align=left><textarea name=description rows=6 id="descriptions" style="WIDTH: 233px"></textarea></TD>
        </TR>
		<TR >
          <TD vAlign=top align=right>�Ƿ��ϴ�ͼƬ��</TD>
          <TD align=left><input type="radio" checked=true value=0 name="isReUpload" LANGUAGE=javascript onClick="return isReUpload_onclick()">
			��
			<input type="radio"  value=1 name="isReUpload"  LANGUAGE=javascript onClick="return isReUpload_onclick()">��</TD>
        </TR>
		<TR >
          <TD vAlign=top align=right>ѡ��ͼƬ��</TD>
          <TD align=left><input type="file" disabled=true name="file"></TD>
        </TR>
        <TR id=pricearea >
          <TD vAlign=top align=right>�ۡ�����</TD>
          <TD align=left><INPUT name=price id="price" size=10> 
          RMB(��λ��Ԫ) &nbsp;&nbsp;
        </TR>
        
        
        <TR >
          <TD vAlign=top align=right>�� ϵ �ˣ�</TD>
          <TD align=left><INPUT name=linkMan id="linkMan" maxLength=15></TD></TR>
        <TR >
          <TD vAlign=top align=right>��ϵ�绰��</TD>
          <TD align=left><INPUT name=telephone id="telephone" maxLength=20></TD></TR>
        
        
        <TR>
          <TD colSpan=2>
		  <INPUT type=submit value="�� ��" name=submit>&nbsp;&nbsp;&nbsp;&nbsp;<INPUT type=reset value="�� ��" name=reset> 
		</TD></TR>
</FORM></TABLE>
</div>
</body>
</html>
