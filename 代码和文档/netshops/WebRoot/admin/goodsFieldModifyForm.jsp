<%@ page language="java" contentType="text/html;charset=gb2312" %>
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
<jsp:useBean scope="page" id="goodsField" class="com.netshop.goodsField" />

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
<SCRIPT language=JavaScript>
<!--
function chkForm()
{
    if(form1.name.value == ""){
        alert("�����뾭Ӫ��Ŀ����");
        form1.name.focus();
        return false;
    }
   
	  return true;
 }
	  
	
//-->
</SCRIPT>
</head>
<%
	String strID = request.getParameter("ID");
	goodsField.init(strID);
%>
<body>
<div align="center">
<br><br>
<form name="form1" method="post" action="goodsFieldModifySave.jsp" onSubmit="return chkForm()" >
 <input type=hidden name="ID" value=<%=strID%> >   
	<table width="90%">
      <TBODY>
        
        <TR> 
          <td width="30%" align="right">��Ŀ���ƣ�</td>
          <td  width="70%"><input name="name" type="text" size=30 value=<%=codeToString(goodsField.name)%>> 
          </td>
        </TR>
        <tr>
		<td  width="30%" >&nbsp;</td>
          <td  align="left" width="70%"> <br>
              <INPUT type=submit value="�޸�" name=Submit>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			  <input type="reset" name="reset" value="����">
            </td>
        </TR>
      </TBODY>
    </table>
  </form>
  </div>
</body>
</html>
