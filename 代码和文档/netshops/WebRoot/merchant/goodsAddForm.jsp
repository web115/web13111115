<%@ page contentType="text/html; charset=gb2312" language="java"%>
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
<html>
<head>
	<title>校园二手商品交易平台</title>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<SCRIPT language=javascript>
<!--

	function isReUpload_onclick()
	{
		if(form1.isReUpload[0].checked)//不传
		{
			form1.file.disabled =true;
		}
		if(form1.isReUpload[1].checked)//上传
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
  <FORM name="form1" onReset="return confirm('确定要清空当前表单吗？');" 
        onsubmit="return infocheck();" action=goodsAddSave.jsp method=post enctype="multipart/form-data" >
        <TBODY>
        <TR >
          <TD align=right width="17%">商品名称：</TD>
          <TD align=left width="83%">
		  <input type="text" name="title" size="30">
		  </TD>
		  </TR>
        <TR >
          <TD align=right>商品类别：</TD>
          <TD align=left><%=codeToString(goodsField.name)%>  
		  </TD></TR>
        
        <TR >
          <TD vAlign=top align=right>商品介绍：</TD>
          <TD align=left><textarea name=description rows=6 id="descriptions" style="WIDTH: 233px"></textarea></TD>
        </TR>
		<TR >
          <TD vAlign=top align=right>是否上传图片：</TD>
          <TD align=left><input type="radio" checked=true value=0 name="isReUpload" LANGUAGE=javascript onClick="return isReUpload_onclick()">
			否
			<input type="radio"  value=1 name="isReUpload"  LANGUAGE=javascript onClick="return isReUpload_onclick()">是</TD>
        </TR>
		<TR >
          <TD vAlign=top align=right>选择图片：</TD>
          <TD align=left><input type="file" disabled=true name="file"></TD>
        </TR>
        <TR id=pricearea >
          <TD vAlign=top align=right>价　　格：</TD>
          <TD align=left><INPUT name=price id="price" size=10> 
          RMB(单位：元) &nbsp;&nbsp;
        </TR>
        
        
        <TR >
          <TD vAlign=top align=right>联 系 人：</TD>
          <TD align=left><INPUT name=linkMan id="linkMan" maxLength=15></TD></TR>
        <TR >
          <TD vAlign=top align=right>联系电话：</TD>
          <TD align=left><INPUT name=telephone id="telephone" maxLength=20></TD></TR>
        
        
        <TR>
          <TD colSpan=2>
		  <INPUT type=submit value="保 存" name=submit>&nbsp;&nbsp;&nbsp;&nbsp;<INPUT type=reset value="重 填" name=reset> 
		</TD></TR>
</FORM></TABLE>
</div>
</body>
</html>
