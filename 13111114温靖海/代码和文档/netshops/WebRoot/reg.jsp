<%@ page contentType="text/html; charset=gb2312" language="java"%>
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
<script language="JavaScript">

function chkFomr(obj)
{
    
	if(obj.userName.value==""){
        alert("请输入你要注册的用户名");
        obj.userName.focus();
        return false;
    }
    
    return true;
}
	
</script>
</head>

<body>
<div align="center">
<br><br>
<TABLE  width="60%" border=0 >
          <TBODY>
            <TR>
              <TD align="center">
			  <FORM name=form1 onSubmit="return chkFomr(this)" action="regCheck.jsp" method=post>
								
                  <br>
                  <!--<p align="center">请选择用户类型：
                      <input type="radio" name="userType" value="1" checked>
                      <span class="style3">普通用户</span> &nbsp;&nbsp;&nbsp;&nbsp;
                      <input type="radio" name="userType" value="2">
                      <span class="style3">商家</span></p>-->
                  <p align="center">请设定用户名：
                      <INPUT class=input1 maxLength=20 name=userName>
                      <INPUT class=button1 type=submit value=下一步 name=Submit>
                      <BR>
                     
                      </p>
              </FORM></TD>
            </TR>
            
          </TBODY>
        </TABLE>
		</div>
</body>
</html>
