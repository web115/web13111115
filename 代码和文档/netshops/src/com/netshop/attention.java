
package com.netshop;

import java.sql.*;
import java.text.*;
import com.netshop.*;

public class attention extends executeWay
{
   
    
    public long ID;  
    public long goodsID;   
    public long userID; 
    public int tag;    
    private String strSql;
   
    private SimpleDateFormat dateFormatter;
    
    
     public attention()
    {
        super();
       
        ID=0;            
        goodsID=0;          	      
	    userID=0;                            	
    	tag=0;		
   		strSql="";                
   }
   
   public boolean add()
   {
        
        strSql="insert into attention ";
        strSql=strSql + "(";     
        strSql=strSql + "goodsID,";
        strSql=strSql + "userID,";   
        strSql=strSql + "tag";       
        strSql=strSql + ") ";      
		strSql=strSql + "values(";	
		strSql=strSql + "'" + goodsID + "',";
		strSql=strSql + "'" + userID + "',";	
		strSql=strSql + "'" + tag + "'";
		strSql=strSql + ")";

		boolean isAdd = super.exeSqlUpdate(strSql);		
		return isAdd;
   }

   public boolean delete(String webID)
   {
        
        strSql="delete from `attention` where ID='";
        strSql=strSql + webID + "'";       
        boolean isDelete = super.exeSqlUpdate(strSql);
         
		return isDelete;

   }
   
 
   public ResultSet showAllAttentions(String userID)
   {
    	strSql="select * from `attention` where tag!=-1 and userID='"+userID+"'";
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
