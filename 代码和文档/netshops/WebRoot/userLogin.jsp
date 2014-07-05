<%@ page language="java" contentType="text/html;charset=gb2312" %>
<html>
<head>


	<title>校园二手商品交易平台</title>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
        		<style type="text/css">
<!--
body {
	background-color: #ADBACE;
	background-image: url(images/login.jpg);
}
-->
        </style>
<SCRIPT ID=clientEventHandlersJS LANGUAGE=javascript>
<!--
function form1_onsubmit()
{

	if (form1.txtloginName.value =="")
	{
		alert("请填写用户名！");
		form1.txtloginName.focus();
		return false;
	}
	if (form1.txtpassword.value =="")
	{
		alert("请填写密码！");
		form1.txtpassword.focus();
		return false;
	}
}
function userRegister()
{
	window.open("userRegister.jsp");

}
function getmypassword()
{
	window.open("getPassword.jsp");

}

//-->
</SCRIPT>

</head>
<table border="0" width="100%" height="299">
  <tr>
    <td width="10%" height="183"></td>
    <td width="80%" height="183" align=center valign="middle">
      <form name=form1 method="post" target="_top" action="loginCheck.jsp" onSubmit="return form1_onsubmit()">
        <div align="center">
          
          <table width="346" height="68" border="0">
            <tr>
              <td width="100"> 
			  <font color="#000099" size="3" face="Arial, Helvetica, sans-serif"><strong>用户名：</strong></font>
			  </td>
              <td width="155">
			  <input name="txtloginName" style="HEIGHT: 20px; WIDTH: 150px" size="50" maxlength="50">
             </td>
              <td width="77" valign="middle">
                
              </td>
            </tr>
            <tr>
              <td height="39">
			  <font color="#000099" size="3" face="Arial, Helvetica, sans-serif"><strong>密码：</strong></font>
			  </td>
              <td>
                <input name="txtpassword" style="HEIGHT: 20px; WIDTH: 150px" size="20" maxlength="20" type="password">
              </td>
              <td>
			   <input type="button" name="btnGetPassword" value="获取密码"  language=javascript onClick="return getmypassword()">
			  </td>
            </tr>
			<tr>
				<td>
				<font color="#000099" size="3" face="Arial, Helvetica, sans-serif"><strong>用户类型：</strong></font>
				</td>
				<td colspan="2">
					<select name="userType">
						<!--<option value="1" selected>普通用户</option>
						<option value="2">商家</option>-->
                        <option value="2">普通用户</option>
						<option value="0">管理员</option>
					</select>
				</td>
			</tr>
          </table>
                
          <br>
          <br>
          <input type="submit" name="btnSubform" value="登录">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		  <input type="reset" name="reset" value="重填">
          </div>
       
      </form>


</td>
    <td width="10%" height="183"></td>
  </tr>
</table>
</html>
