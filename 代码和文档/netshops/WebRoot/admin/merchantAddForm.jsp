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
		alert('����д�û�����');
		form1.userName.focus();
		return false;
	}
	if(form1.shopName.value == "") {
		alert('����д�ռ����ƣ�');
		form1.shopName.focus();
		return false;
	}
	
	if(form1.userPassword.value == "") {
		alert('����д���룡');
		form1.userPassword.focus();
		return false;
	}
	if(form1.userPassword.value != form1.userPassword2.value) {
		alert('��ȷ��������д�������Ƿ�һ����');
		form1.userPassword2.focus();
		return false;
	}
	
	if(form1.shopper.value == "") {
		alert('����д�ռ���������');
		form1.shopper.focus();
		return false;
	}
	if(form1.shopIntro.value == "") {
		alert('����д�ռ���ܣ�');
		form1.shopIntro.focus();
		return false;
	}
	
	
	if(form1.realName.value == "") {
		alert('����д��ʵ������');
		form1.realName.focus();
		return false;
	}
	if(form1.telephone.value == "") {
		alert('����д��ϵ�绰��');
		form1.telephone.focus();
		return false;
	}
	

	
	if(form1.identityID.value == "") {
		alert('����д���֤���룡');
		form1.identityID.focus();
		return false;
	}
	if(form1.email.value == "") {
		alert('����д�����ʼ���');
		form1.email.focus();
		return false;
	}

	if(!chkEmail(form1.email.value))
        {
            alert("����д��Ч��Email��ַ");
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

<FORM name=form1 onReset="return confirm('ȷ��Ҫ��յ�ǰ����');" action=merchantAddSave.jsp         method=post target=_self>
		<table width="70%">
          <TR > 
              <TD align=right>�û�����</TD>
              <TD align=left><INPUT maxLength=100 name=userName size=30> </TD>
            </TR>
            <TR > 
              
		  <TD width="20%" align=right vAlign=top>��Ӫ��Ŀ��</TD>
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
              <TD align=right>�ռ����ƣ�</TD>
              <TD align=left><INPUT maxLength=100 name=shopName size=30> </TD>
            </TR>
            
            <TR > 
              <TD align=right>�� �룺</TD>
              <TD align=left><INPUT type=password maxLength=50 name=userPassword size=30></TD>
            </TR>
            <TR > 
              <TD align=right>ȷ�����룺</TD>
              <TD align=left><INPUT  type=password maxLength=50 name=userPassword2 size=30></TD>
            </TR>
            <TR > 
              <TD align=right>�ռ���������</TD>
              <TD align=left><INPUT   type=text maxLength=100 name=shopper size=30></TD>
            </TR>
            <TR > 
              <TD vAlign=top align=right>�ռ���ܣ�</TD>
              <TD 
          align=left><TEXTAREA name=shopIntro rows=8 cols=50></TEXTAREA></TD>
            </TR>
            <TR > 
              <TD vAlign=top align=right>��ʵ������</TD>
              <TD align=left><INPUT maxLength=50 name=realName></TD>
            </TR>
			<TR> 
			 <TD vAlign=top align=right>�Ա�</TD>
			 <TD  align=left>
					<input type=radio name=sex value=0 checked>��&nbsp;&nbsp;
					<input type=radio name=sex value=1>Ů
            </TD>
        </TR>
            <TR > 
              <TD vAlign=top align=right>��ϵ�绰��</TD>
              <TD align=left><INPUT maxLength=100 name=telephone></TD>
            </TR>
            <TR > 
              <TD vAlign=top align=right>���֤���룺</TD>
              <TD align=left><INPUT maxLength=50 name=identityID> <FONT 
          color=#ff0000>&nbsp;</FONT></TD>
            </TR>
            <TR > 
              <TD vAlign=top align=right>�����ʼ���</TD>
              <TD align=left><INPUT maxLength=100 name=email> <FONT 
          color=#ff0000>&nbsp;</FONT></TD>
            </TR>
            
           
            <TR > 
              <TD colSpan=2 align="center">
			  <INPUT type=submit value="ע ��" name=submit onClick="return checkinfo()">
                �������� 
                <INPUT type=reset value="����" name=reset> </TD>
            </TR>
          
		  </table>
        </FORM>
  </div>
</body>
</html>
