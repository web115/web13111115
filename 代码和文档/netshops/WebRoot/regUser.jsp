<%@ page contentType="text/html; charset=gb2312" language="java"%>
<html>
<head>
<title>У԰������Ʒ����ƽ̨</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<SCRIPT language=JavaScript>

function chkForm()
{
    
    if(form1.userPassword.value == ""){
        alert("����������");
        form1.userPassword.focus();
        return false;
    }
    if(form1.userPassword2.value == ""){
        alert("������ȷ������");
        form1.password2.focus();
        return false;
    }
    
    if(form1.userPassword.value != form1.userPassword2.value){
        alert("����������벻һ��");
        form1.password.focus();
        return false;
    }
   	
    
	str1=form1.email.value;
    key=str1.match(/\@/);
      if (key==null) {
           alert( "����д��Ч��Email��ַ" );
           form1.email.focus();
            return false;
      }
	  return true;
	  }
	  
	

</SCRIPT>
        		<style type="text/css">
<!--
body {
	background-color: #ADBACE;
	background-image: url(images/login.jpg);
}
-->
        </style>
</head>

<body>
<div align="center">
<br><br>
<form name="form1" method="post" action="regUserSave.jsp" onSubmit="return chkForm()" >

    <table width="90%">
      <TBODY>
        
        <TR> 
          <TD width="50%" align="right">�� �� ����</TD>
          <TD  width="50%"><%= session.getAttribute("userName") %>&nbsp; <input name="userName" type="hidden" value="<%= session.getAttribute("userName") %>"> 
          </TD>
        </TR>
        <TR> 
          <TD  width="50%" align="right">���룺</TD>
          <TD  width="50%"><INPUT type=password size=30 name=userPassword>
            </TD>
        </TR>
        <TR> 
          <TD  width="50%" align="right">ȷ�����룺</TD>
          <TD  width="50%"><INPUT type=password size=30 name=userPassword2> </TD>
        </TR>
		<TR> 
          <TD  width="50%" align="right">�Ա�</TD>
          <TD  width="50%">
		  <input type=radio name=sex value=0 checked>��&nbsp;&nbsp;<input type=radio name=sex value=1>Ů
            </TD>
        </TR>
        <TR> 
          <TD  width="50%" align="right">�������䣺</TD>
          <TD  width="50%">
		  <INPUT name=email type="text" size="30">
            </TD>
        </TR>
       
        <TR> 
          <TD colSpan=2 align="center"> <br>
              <INPUT type=submit value="ע��" name=Submit>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			  <input type="reset" name="reset" value="����">
            </TD>
        </TR>
      </TBODY>
    </table>
  </form>
  </div>
</body>
</html>
