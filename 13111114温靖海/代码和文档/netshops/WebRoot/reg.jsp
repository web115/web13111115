<%@ page contentType="text/html; charset=gb2312" language="java"%>
<html>
<head>
	<title>У԰������Ʒ����ƽ̨</title>
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
        alert("��������Ҫע����û���");
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
                  <!--<p align="center">��ѡ���û����ͣ�
                      <input type="radio" name="userType" value="1" checked>
                      <span class="style3">��ͨ�û�</span> &nbsp;&nbsp;&nbsp;&nbsp;
                      <input type="radio" name="userType" value="2">
                      <span class="style3">�̼�</span></p>-->
                  <p align="center">���趨�û�����
                      <INPUT class=input1 maxLength=20 name=userName>
                      <INPUT class=button1 type=submit value=��һ�� name=Submit>
                      <BR>
                     
                      </p>
              </FORM></TD>
            </TR>
            
          </TBODY>
        </TABLE>
		</div>
</body>
</html>
