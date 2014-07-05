<%@ page language="java" contentType="text/html;charset=gb2312" %>
<%@ page import="java.sql.*,com.netshop.*,java.text.*" %>
<HTML>
<HEAD>
	<title>校园二手商品交易平台</title>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
                		<style type="text/css">
<!--
body {
	background-color: #ADBACE;
	background-image: url(../images/login.jpg);
}
-->
        </style>
</HEAD>
<BODY>
<jsp:useBean id="goods" scope="page" class="com.netshop.goods"/>
<%
    String strTime;
    SimpleDateFormat dateFormatterfile = new SimpleDateFormat("yyyyMMddHHmmss");
    strTime=dateFormatterfile.format(new java.util.Date());
    String fileName="";
    FileUpload myUpload=new FileUpload();
    myUpload.initialize(request,response);
    if(myUpload.getFormFields("isReUpload").equals("1"))
    {
        myUpload.setMax_size(10240000);
		myUpload.setFilePath("E:\\netshop\\uploadPhotos\\");
		//myUpload.setFilePath("/home/netshop/uploadPhotos/");
        fileName=myUpload.getFileName();
		fileName=strTime+fileName.substring(fileName.lastIndexOf("."),fileName.length());
        myUpload.saveFile(fileName);
        if(myUpload.getErrNum()!=0 )
        {
            out.println(myUpload.getErrDesc() );
        }
    }

    if(myUpload.getFormFields("isReUpload").equals("1"))
    {
        goods.goodsURL =fileName;
    }
    SimpleDateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd");
    goods.createDate =dateFormatter.format(new java.util.Date());
    goods.title =myUpload.getFormFields("title");
    goods.description =myUpload.getFormFields("description");
	goods.goodsField = ((com.netshop.user)session.getAttribute("user")).mainFields;
	goods.price = Integer.parseInt(myUpload.getFormFields("price"));
    goods.linkMan =myUpload.getFormFields("linkMan");
	goods.telephone =myUpload.getFormFields("telephone");
    goods.issuer =((com.netshop.user)session.getAttribute("user")).ID;
    goods.goodsType =2;
	goods.tag=0;
	if(goods.add())
	{
		out.println("<center><font color=blue size=5>商品发布成功！</font></center>");
		out.println("<center><input type=button name=gofirst value=确定 onclick=javascript:window.location='myGoodsList.jsp' ></center>");
		
	}
	else
	{
		out.println("<center><font color=red size=5>商品发布失败，请重试！</font></center>");
    	out.println("<center><input type=button name=goback value=返回 onclick=javascript:window.history.go(-1) ></center>");
	}

 %>
</BODY>
</HTML>
