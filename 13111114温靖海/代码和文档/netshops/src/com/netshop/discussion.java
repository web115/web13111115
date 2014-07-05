
package com.netshop;

import java.sql.*;
import java.text.*;

public class discussion extends executeWay
{
   
    
    public long ID;  
    public long goodsID;   
    public long authorID; 
    public String authorName;
    public String content; 
    
    public String createDate;   
    public int disType;   
    public int tag;    
    private String strSql;
   
    private SimpleDateFormat dateFormatter;
    
    
     public discussion()
    {
        super();
        dateFormatter = new SimpleDateFormat("yyyy-MM-dd");
        ID=0;           
        goodsID=0;
        authorName="";  
        content="";       	      
	    authorID=0;                       
     	createDate=dateFormatter.format(new java.util.Date());
     	disType=1;
    	tag=0;		
   		strSql="";        
        
   }
   
   public boolean add()
   {
        
        strSql="insert into discussion ";
        strSql=strSql + "(";      
        strSql=strSql + "goodsID,";
        strSql=strSql + "authorID,";
        strSql=strSql + "authorName,";
        strSql=strSql + "content,";                         
        strSql=strSql + "createDate,";  
        strSql=strSql + "disType,"; 
        strSql=strSql + "tag";       
        strSql=strSql + ") ";      
		strSql=strSql + "values(";		
		strSql=strSql + "'" + goodsID + "',";
		strSql=strSql + "'" + authorID + "',";
		strSql=strSql + "'" + authorName + "',";
		strSql=strSql + "'" + content + "',";			
		strSql=strSql + "'" + createDate + "',";	
		strSql=strSql + "'" + disType + "',";	
		strSql=strSql + "'" + tag + "'";
		strSql=strSql + ")";

		boolean isAdd = super.exeSqlUpdate(strSql);
		
		return isAdd;
   }
   
   public boolean delete(String webID)
   {
        
        strSql="delete from `discussion` where ID='";
        strSql=strSql + webID + "'";       
        boolean isDelete = super.exeSqlUpdate(strSql);
         
		return isDelete;

   }
   
   public boolean  init(String webID)
   {
    	strSql="select * from `discussion` where ID=";
        strSql=strSql + "'" + webID + "'";        
        try
		{
   			ResultSet rs = super.exeSqlQuery(strSql);
            if (rs.next())
            {
                ID=rs.getLong("ID");                 
                goodsID=rs.getLong("goodsID");
                authorID=rs.getLong("authorID");
                authorName=rs.getString("authorName");
                content=rs.getString("content");                             
                createDate=rs.getString("createDate");
                disType=rs.getInt("disType");               
                tag=rs.getInt("tag");                
                return true;
            }
            else
            {
               return false;
            }         
		}
		catch(Exception ex)
		{
			System.out.println(ex.toString());            
            return false;

		}
        
   }
   
   public ResultSet showDiscussions(String authorID)
   {
    	strSql="select * from `discussion` where tag!=-1 and authorID='"+authorID+"'";
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
 
    public ResultSet showAllDiscussions()
   {
    	strSql="select * from `discussion` where tag!=-1";
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

