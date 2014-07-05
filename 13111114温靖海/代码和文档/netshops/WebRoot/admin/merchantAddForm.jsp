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
		<style type="text/css">
<!--
body {
	background-color: #ADBACE;
	background-image: url(../images/login.jpg);
}
-->
        </style>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<jsp:useBean scope="page" id="goodsField" class="com.netshop.goodsField" />
<script language=javascript>
  

 
function checkinfo() {
	if(form1.userName.value == "") {
		alert('请填写用户名！');
		form1.userName.focus();
		return false;
	}
	if(form1.shopName.value == "") {
		alert('请填写空间名称！');
		form1.shopName.focus();
		return false;
	}
	
	if(form1.userPassword.value == "") {
		alert('请填写密码！');
		form1.userPassword.focus();
		return false;
	}
	if(form1.userPassword.value != form1.userPassword2.value) {
		alert('请确认两次填写的密码是否一样。');
		form1.userPassword2.focus();
		return false;
	}
	
	if(form1.shopper.value == "") {
		alert('请填写空间主人名！');
		form1.shopper.focus();
		return false;
	}
	if(form1.shopIntro.value == "") {
		alert('请填写空间介绍！');
		form1.shopIntro.focus();
		return false;
	}
	
	
	if(form1.realName.value == "") {
		alert('请填写真实姓名！');
		form1.realName.focus();
		return false;
	}
	if(form1.telephone.value == "") {
		alert('请填写联系电话！');
		form1.telephone.focus();
		return false;
	}
	

	
	if(form1.identityID.value == "") {
		alert('请填写身份证号码！');
		form1.identityID.focus();
		return false;
	}
	if(form1.email.value == "") {
		alert('请填写电子邮件！');
		form1.email.focus();
		return false;
	}

	if(!chkEmail(form1.email.value))
        {
            alert("你填写有效的Email地址");
            form1.email.focus();
            return false;
        }
	
return true;
	
}
function chkEmail(str)
{
    return str.search(/[\w\-]{1,}@[\w\-]{1,}\.[\w\-]{1,}/)==0?true:false
}
</script>
</head>

<body>
<div align="center">

<FORM name=form1 onReset="return confirm('确定要清空当前表单吗？');" action=merchantAddSave.jsp         method=post target=_self>
		<table width="70%">
          <TR > 
              <TD align=right>用户名：</TD>
              <TD align=left><INPUT maxLength=100 name=userName size=30> </TD>
            </TR>
            <TR > 
              
		  <TD width="20%" align=right vAlign=top>主营项目：</TD>
              <TD width="80%" align=left>
			  <select style="WIDTH: 150px" id=mainFields name="mainFields" >
                 <%
							ResultSet rs = goodsField.showAllFields();
							while(rs.next())
							{
						%>
								<option value=<%=rs.getLong("ID")%>><%=codeToString(rs.getString("name"))%></option>
						<%
							}			

					   %>
                  </select> 
			  </TD>
            </TR>
            <TR > 
              <TD align=right>空间名称：</TD>
              <TD align=left><INPUT maxLength=100 name=shopName size=30> </TD>
            </TR>
            
            <TR > 
              <TD align=right>密 码：</TD>
              <TD align=left><INPUT type=password maxLength=50 name=userPassword size=30></TD>
            </TR>
            <TR > 
              <TD align=right>确认密码：</TD>
              <TD align=left><INPUT  type=password maxLength=50 name=userPassword2 size=30></TD>
            </TR>
            <TR > 
              <TD align=right>空间主人名：</TD>
              <TD align=left><INPUT   type=text maxLength=100 name=shopper size=30></TD>
            </TR>
            <TR > 
              <TD vAlign=top align=right>空间介绍：</TD>
              <TD 
          align=left><TEXTAREA name=shopIntro rows=8 cols=50></TEXTAREA></TD>
            </TR>
            <TR > 
              <TD vAlign=top align=right>真实姓名：</TD>
              <TD align=left><INPUT maxLength=50 name=realName></TD>
            </TR>
			<TR> 
			 <TD vAlign=top align=right>性别：</TD>
			 <TD  align=left>
					<input type=radio name=sex value=0 checked>男&nbsp;&nbsp;
					<input type=radio name=sex value=1>女
            </TD>
        </TR>
            <TR > 
              <TD vAlign=top align=right>联系电话：</TD>
              <TD align=left><INPUT maxLength=100 name=telephone></TD>
            </TR>
            <TR > 
              <TD vAlign=top align=right>身份证号码：</TD>
              <TD align=left><INPUT maxLength=50 name=identityID> <FONT 
          color=#ff0000>&nbsp;</FONT></TD>
            </TR>
            <TR > 
              <TD vAlign=top align=right>电子邮件：</TD>
              <TD align=left><INPUT maxLength=100 name=email> <FONT 
          color=#ff0000>&nbsp;</FONT></TD>
            </TR>
            
           
            <TR > 
              <TD colSpan=2 align="center">
			  <INPUT type=submit value="注 册" name=submit onClick="return checkinfo()">
                　　　　 
                <INPUT type=reset value="重填" name=reset> </TD>
            </TR>
          
		  </table>
        </FORM>
  </div>
</body>
</html>
