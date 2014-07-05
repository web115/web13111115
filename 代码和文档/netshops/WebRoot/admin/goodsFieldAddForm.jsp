<%@ page language="java" contentType="text/html;charset=gb2312" %>

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
<SCRIPT language=JavaScript>
<!--
function chkForm()
{
    if(form1.name.value == ""){
        alert("请输入经营项目名称");
        form1.name.focus();
        return false;
    }
   
	  return true;
 }
	  
	
//-->
</SCRIPT>
</head>

<body>
<div align="center">
<br><br>
<form name="form1" method="post" action="goodsFieldAddSave.jsp" onSubmit="return chkForm()" >
    <table width="90%">
      <TBODY>
        
        <TR> 
          <td width="30%" align="right">项目名称：</td>
          <td  width="70%"><input name="name" type="text" size=30> 
          </td>
        </TR>
        <tr>
		<td  width="30%" >&nbsp;</td>
          <td  align="left" width="70%"> <br>
              <INPUT type=submit value="添加" name=Submit>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			  <input type="reset" name="reset" value="重填">
            </td>
        </TR>
      </TBODY>
    </table>
  </form>
  </div>
</body>
</html>
