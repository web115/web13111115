package com.netshop;

import java.sql.*;
import java.text.*;
import com.netshop.*;

public class offer extends executeWay
{
   
    
    public long ID;  
    public long goodsID;   
    public long userID; 
    public long price;
    public String createDate;  

     public String userName;
    private String strSql;
   
    private SimpleDateFormat dateFormatter;
    
    
     public offer()
    {
        super();
       dateFormatter = new SimpleDateFormat("yyyy-MM-dd");
	userName="";  
        ID=0;            
        goodsID=0;          	      
        userID=0;   
	price=0;                         		
        strSql="";  
	createDate=dateFormatter.format(new java.util.Date());              
   }
   
   public boolean add()
   {
        
        strSql="insert into offer ";
        strSql=strSql + "(";     
        strSql=strSql + "goodsID,";
        strSql=strSql + "userID,"; 
 	strSql=strSql + "userName,"; 
	strSql=strSql + "createDate,"; 
        strSql=strSql + "price";       
        strSql=strSql + ") ";      
		strSql=strSql + "values(";	
		strSql=strSql + "'" + goodsID + "',";
		strSql=strSql + "'" + userID + "',";
		strSql=strSql + "'" + userName + "',";
		strSql=strSql + "'" + createDate + "',";
		strSql=strSql + "'" + price+ "'";
		strSql=strSql + ")";

		boolean isAdd = super.exeSqlUpdate(strSql);		
		return isAdd;
   }

   public boolean delete(String webID)
   {
        
        strSql="delete from `offer` where ID='";
        strSql=strSql + webID + "'";       
        boolean isDelete = super.exeSqlUpdate(strSql);
         
		return isDelete;

   }
   
 
   public ResultSet showAllOffers(String goodsID)
   {
    	strSql="select * from `attention` where goodsID='"+goodsID+"'";
        ResultSet rs = null;
              
        try
		{
			rs = super.exeSqlQuery(strSql);   			           
           
		}
		catch(Exception ex)
		{
			System.out.println(ex.toString());            
           
		}
		return rs;
        
   }
   
}
