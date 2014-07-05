package com.netshop;

import java.sql.*;

public class goodsField extends executeWay
{
   
    
    public long ID;  
    public String name;   
    public int tag;    
    private String strSql;

     public goodsField()
    {
        super();    
        ID=0;          
        name=""; 
    	tag=0;		
   		strSql="";        
        
   }
 
   public boolean add()
   {
        
        strSql="insert into goodsField ";
        strSql=strSql + "(";     
        strSql=strSql + "name,";     
        strSql=strSql + "tag";       
        strSql=strSql + ") ";      
		strSql=strSql + "values(";	
		strSql=strSql + "'" + name + "',";
		strSql=strSql + "'" + tag + "'";
		strSql=strSql + ")";
		boolean isAdd = super.exeSqlUpdate(strSql);
		
		return isAdd;
   }
   
 
   public boolean delete(String webID)
   {
        
        strSql="delete from `goodsField` where ID='";
        strSql=strSql + webID + "'";       
        boolean isDelete = super.exeSqlUpdate(strSql);
         
		return isDelete;

   }
  
   public boolean updateField(String webID)
  {
      strSql="update goodsField set ";
      strSql=strSql + "name=" + "'" + name + "'";
      strSql=strSql + " where ID='" + webID + "'";   
      boolean updateField = super.exeSqlUpdate(strSql);
		
	  return updateField;

  }
 
   public boolean  init(String webID)
   {
    	strSql="select * from `goodsField` where ID=";
        strSql=strSql + "'" + webID + "'";        
        try
		{
   			ResultSet rs = super.exeSqlQuery(strSql);
            if (rs.next())
            {
                ID=rs.getLong("ID");                              
                name=rs.getString("name");               
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
  
 
   public ResultSet showAllFields()
   {
    	strSql="select * from `goodsField` where tag!=-1";
        ResultSet rs = null;           
        try
		{
   		 rs = super.exeSqlQuery(strSql);   			           
           
		}
		catch(Exception ex)
		{
			System.out.println(ex.toString());            
           
		}
		finally
	    {
			return rs;
		}
        
   }
   
}
