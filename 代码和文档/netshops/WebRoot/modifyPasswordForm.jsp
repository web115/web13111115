<%@ page language="java" contentType="text/html;charset=gb2312" %>
<HTML>
<HEAD>
	<title>У԰������Ʒ����ƽ̨</title>
    		<style type="text/css">
<!--
body {
	background-color: #ADBACE;
	background-image: url(images/login.jpg);
}
-->
        </style>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<SCRIPT language=javascript>
<!--
function checkform()
{
	if(FORM1.txtoldpasswd.value=="")
	{
		alert("�����벻��Ϊ��." );
		FORM1.txtoldpasswd.focus();
		return false;
	}
	if(FORM1.txtnewpasswd.value=="")
	{
		alert("�����벻��Ϊ��." );
		FORM1.txtnewpasswd.focus();
		return false;
	}

	if (FORM1.txtnewpasswd.value!=FORM1.txtcfpasswd.value) 
	{
			
			alert("�����������벻һ��." );
			FORM1.txtnewpasswd.focus();
			return false;
	}
	return true ;
}
//-->
</SCRIPT>
</HEAD>
<BODY>
<form name=FORM1 method=post action=modifyPasswordSave.jsp  onSubmit="return checkform()">
<div align=center>
  <table border=0 width=60%>
    <tbody>
    <tr>
      <td colspan=2 height=50 >
        <p align=center><font size=5>�޸�����</font></p>
      </td>
    </tr>
    
    <tr>
      <td  width=50% align=right>�����룺</td>
      <td width=50%>
        <input name=txtoldpasswd size=23 type=password>
         </td>
    </tr>
    <tr>
      <td  width=50% align=right>�����룺</td>
      <td width=50%>
        <input name=txtnewpasswd size=23 type=password>
        </td>
    </tr>
    <tr>
      <td  width=50% align=right>ȷ�������룺</td>
      <td width=50%>
        <input name=txtcfpasswd size=23 type=password>
        </td>
    </tr>
    
    <tr>
      <td colspan=2>
        <p align=center>
          <input name=submit type=submit value=�޸�>
          <input name=reset type=reset value=����>
        </p>
      </td>
    </tr>
    </tbody>
  </table>
  </div>
</form>
</body>
</html>
