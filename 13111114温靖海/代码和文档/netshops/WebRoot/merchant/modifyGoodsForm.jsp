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
<jsp:useBean id="goods" scope="page" class="com.netshop.goods"/>
<jsp:useBean id="goodsField" scope="page" class="com.netshop.goodsField"/>

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
<!--
body {
	background-color: #ADBACE;
	background-image: url(../images/login.jpg);
}
-->
        </style>
</head>

<%
	String strID = request.getParameter("ID");
	goods.init(strID);
	goodsField.init(goods.goodsField+"");

%>
<body>
<div align="center">
<TABLE cellSpacing=1 cellPadding=3 width="90%" align=center   border=0>
  <FORM name="form1" onReset="return confirm('确定要清空当前表单吗？');" 
        onsubmit="return infocheck();" action=modifyGoodsSave.jsp method=post enctype="multipart/form-data" >
		<input type=hidden name="ID" value=<%=strID%> >
        <TBODY>
        <TR >
          <TD align=right width="17%">商品名称：</TD>
          <TD align=left width="83%">
		  <input type="text" name="title" size="30" value=<%=codeToString(goods.title)%>>
		  </TD>
		  </TR>
        <TR >
          <TD align=right>商品类别：</TD>
          <TD align=left><%=codeToString(goodsField.name)%>  
		  </TD></TR>
        
        <TR >
          <TD vAlign=top align=right>商品介绍：</TD>
          <TD align=left><textarea name=description rows=6 id="descriptions" style="WIDTH: 233px"><%=codeToString(goods.description)%></textarea></TD>
        </TR>
		<TR >
          <TD vAlign=top align=right>是否更改图片：</TD>
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
          <TD align=left><INPUT name=price id="price" size=10 value=<%=goods.price%>> 
          RMB(单位：元) &nbsp;&nbsp;
        </TR>
        
        
        <TR >
          <TD vAlign=top align=right>联 系 人：</TD>
          <TD align=left><INPUT name=linkMan id="linkMan" maxLength=15 value=<%=codeToString(goods.linkMan)%>></TD></TR>
        <TR >
          <TD vAlign=top align=right>联系电话：</TD>
          <TD align=left><INPUT name=telephone id="telephone" maxLength=20 value=<%=goods.telephone%>></TD></TR>
        
        
        <TR>
          <TD colSpan=2>
		  <INPUT type=submit value="修改" name=submit>&nbsp;&nbsp;&nbsp;&nbsp;<INPUT type=reset value="重设" name=reset> 
		</TD></TR>
</FORM></TABLE>
</div>
</body>
</html>
