<%@ page contentType="text/html; charset=gb2312" language="java"%>
<html>
<head>
<title>校园二手商品交易平台</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<SCRIPT language=JavaScript>
<!--
function chkForm()
{
    if(form1.userName.value == ""){
        alert("请输入用户名");
        form1.userName.focus();
        return false;
    }
   
	if(form1.userPassword.value == ""){
        alert("请输入密码");
        form1.userPassword.focus();
        return false;
    }
    if(form1.userPassword2.value == ""){
        alert("请输入确认密码");
        form1.password2.focus();
        return false;
    }
    
    if(form1.userPassword.value != form1.userPassword2.value){
        alert("你的两个密码不一样");
        form1.password.focus();
        return false;
    }
   	
    
	str1=form1.email.value;
    key=str1.match(/\@/);
      if (key==null) {
           alert( "请填写有效的Email地址" );
           form1.email.focus();
            return false;
      }
	  return true;
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

<body>
<div align="center">
<br><br>
<form name="form1" method="post" action="userAddSave.jsp" onSubmit="return chkForm()" >

    <table width="90%">
      <TBODY>
        
        <TR> 
          <TD width="30%" align="right">用 户 名：</TD>
          <TD  width="70%"><input name="userName" type="text" size=30> 
          </TD>
        </TR>
        <TR> 
          <TD  width="30%" align="right">密码：</TD>
          <TD  width="70%"><INPUT type=password size=30 name=userPassword>
            </TD>
        </TR>
        <TR> 
          <TD  width="30%" align="right">确认密码：</TD>
          <TD  width="70%"><INPUT type=password size=30 name=userPassword2> </TD>
        </TR>
		<TR> 
          <TD  width="30%" align="right">性别：</TD>
          <TD  width="70%">
		  <input type=radio name=sex value=0 checked>男&nbsp;&nbsp;<input type=radio name=sex value=1>女
            </TD>
        </TR>
        <TR> 
          <TD  width="30%" align="right">电子邮箱：</TD>
          <TD  width="70%">
		  <INPUT name=email type="text" size="30">
            </TD>
        </TR>
       
        <TR> 
		<TD  width="30%" >&nbsp;</TD>
          <TD  align="left" width="70%"> <br>
              <INPUT type=submit value="注册" name=Submit>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			  <input type="reset" name="reset" value="重填">
            </TD>
        </TR>
      </TBODY>
    </table>
  </form>
  </div>
</body>
</html>
