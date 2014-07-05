<%@ page language="java" contentType="text/html;charset=gb2312" %>
<HTML>
<HEAD>
	<title>校园二手商品交易平台</title>
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
		alert("旧密码不能为空." );
		FORM1.txtoldpasswd.focus();
		return false;
	}
	if(FORM1.txtnewpasswd.value=="")
	{
		alert("新密码不能为空." );
		FORM1.txtnewpasswd.focus();
		return false;
	}

	if (FORM1.txtnewpasswd.value!=FORM1.txtcfpasswd.value) 
	{
			
			alert("两次输入密码不一致." );
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
        <p align=center><font size=5>修改密码</font></p>
      </td>
    </tr>
    
    <tr>
      <td  width=50% align=right>旧密码：</td>
      <td width=50%>
        <input name=txtoldpasswd size=23 type=password>
         </td>
    </tr>
    <tr>
      <td  width=50% align=right>新密码：</td>
      <td width=50%>
        <input name=txtnewpasswd size=23 type=password>
        </td>
    </tr>
    <tr>
      <td  width=50% align=right>确认新密码：</td>
      <td width=50%>
        <input name=txtcfpasswd size=23 type=password>
        </td>
    </tr>
    
    <tr>
      <td colspan=2>
        <p align=center>
          <input name=submit type=submit value=修改>
          <input name=reset type=reset value=重填>
        </p>
      </td>
    </tr>
    </tbody>
  </table>
  </div>
</form>
</body>
</html>
