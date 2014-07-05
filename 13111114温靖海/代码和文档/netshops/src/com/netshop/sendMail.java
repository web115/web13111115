package com.netshop;

import java.util.*;
import java.sql.*;
import java.text.*;

public class sendMail extends executeWay
{ 
    public long ID;
	public String subject;
	public String content;
	public String sender;
	public String receiver;
	public String createDatetime;
	public int mailType;
 	public int tag;
    private String strSql;   
    private SimpleDateFormat dateFormatter;

    public sendMail()
    {
        super(); 
        dateFormatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        ID=0;
    	subject="";
    	content="";
    	sender="";
    	receiver="";
    	createDatetime=dateFormatter.format(new java.util.Date());  
    	mailType=0;
		tag=0;        
        strSql="";        

   }
  
   public boolean add()
   {
        createDatetime=dateFormatter.format(new java.util.Date());
        strSql="insert into email";
        strSql=strSql + " (";
        strSql=strSql + "subject,";
        strSql=strSql + "content,";
        strSql=strSql + "sender,";
        strSql=strSql + "receiver,"; 
        strSql=strSql + "createDatetime,";
        strSql=strSql + "mailType,";
        strSql=strSql + "tag"; 
        strSql=strSql + ") ";
		strSql=strSql + "values(";
		strSql=strSql + "'" + subject + "',";
		strSql=strSql + "'" + content + "',";
		strSql=strSql + "'" + sender + "',";
		strSql=strSql + "'" + receiver + "',";
		strSql=strSql + "'" + createDatetime + "',";	
		strSql=strSql + "'" + 0 + "',";
		strSql=strSql + "'" + tag + "'";              
		strSql=strSql + ")";   
		
		boolean isAdd = super.exeSqlUpdate(strSql);
		return isAdd;
	
   }

   public boolean addSave()
   {
        createDatetime=dateFormatter.format(new java.util.Date());
       
		    strSql="insert into email ";
	        strSql=strSql + "(";
	        strSql=strSql + "subject,";
	        strSql=strSql + "content,";
	        strSql=strSql + "sender,";
	        strSql=strSql + "receiver,"; 
	        strSql=strSql + "createDatetime,";
	        strSql=strSql + "mailType,";
	        strSql=strSql + "tag"; 
	        strSql=strSql + ") ";
			strSql=strSql + "values(";
			strSql=strSql + "'" + subject + "',";
			strSql=strSql + "'" + content + "',";
			strSql=strSql + "'" + sender + "',";
			strSql=strSql + "'" + receiver + "',";
			strSql=strSql + "'" + createDatetime + "',";	
			strSql=strSql + "'" + 1 + "',";
			strSql=strSql + "'" + tag + "'";              
			strSql=strSql + ")";  
			boolean isAdd = super.exeSqlUpdate(strSql);
			return isAdd;				
   }


   public boolean deleteRec()
   {
        strSql="delete from email where receiver='";
        strSql=strSql + this.receiver + "' and mailType=0";
        
		boolean isDelete = super.exeSqlUpdate(strSql);      
		return isDelete;
       

   }
 
   public boolean deleteSender()
   {
        strSql="delete from email where sender='";
        strSql=strSql + this.sender + "' and mailType = 1";

        boolean isDelete = super.exeSqlUpdate(strSql);      
		return isDelete;

   }

   public boolean  init()
   {
    	strSql="select * from email where ID=";
        strSql=strSql + "'" + this.ID + "'";
        try
		{
			ResultSet rs = super.exeSqlQuery(strSql);
            if (rs.next())
            {
                ID=rs.getLong("ID");
                subject=rs.getString("subject");
                content=rs.getString("content");
                sender=rs.getString("sender");
                receiver=rs.getString("receiver");
                createDatetime=rs.getString("createDatetime"); 
                mailType=rs.getInt("mailType");
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

  
   public ResultSet  emailList()
   {
    	strSql="select * from email where receiver=";
        strSql=strSql + "'" + this.receiver + "' and mailType=0";
        try
		{
   			ResultSet rs = super.exeSqlQuery(strSql);                                  
            return rs;          
		}
		catch(Exception ex)
		{			
            System.out.println(ex.toString()); 
            return null;
		}
   }
  
   public ResultSet  sendEmailList()
   {
    	strSql="select * from email where sender=";
        strSql=strSql + "'" + this.sender + "' and mailType=1";
        try
		{
   			ResultSet rs = super.exeSqlQuery(strSql);                   
            return rs;  
		}
		catch(Exception ex)
		{			
            System.out.println(ex.toString()); 
            return null;
		}
   }
   
 
   public int newEmailCount()
   {
    	strSql="select count(*) as x from email where receiver=";
        strSql=strSql + "'" + this.receiver + "' and mailType=0";
        try
		{
   			ResultSet rs = super.exeSqlQuery(strSql);   
			int newEmail = 0;
            if (rs.next())
            {                  
                newEmail = rs.getInt("x");
            }                      
            return newEmail;

		}
		catch(Exception ex)
		{			            
            System.out.println(ex.toString()); 
            return -1;
		}
   }
   
   
      public boolean updateTag()
      {
	       strSql="update email set ";
	       strSql=strSql + "tag=" + "'" + 1 + "'";
	       strSql=strSql + " where ID='" + ID + "'";
	       
	       boolean updateTag = super.exeSqlUpdate(strSql);
		
	 	    return updateTag;

      }
   
  

}
