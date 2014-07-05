package com.netshop;

import java.sql.*;
import java.text.*;

public class user extends executeWay
{
   
    public long ID;
    public String userName;
    public String userPassword; 
    public String email;  
    public int sex;   
    public String identityID; 
    public String shopName;
    public String shopIntro; 
    public String shopper;    
    public String realName;
    public long mainFields;  
    public String telephone;
    public String createDate;   
    public int sysRole;           
    public int tag;    
    private String strSql;
   
    private SimpleDateFormat dateFormatter;
    
    
     public user()
    {       
        dateFormatter = new SimpleDateFormat("yyyy-MM-dd");
        ID=0;
        userName="";
        userPassword="";        
        realName="";
        sex=0;
        shopName="";
        shopper="";
        mainFields=0;
        shopIntro="";       
	    telephone="";	    
	    identityID="";
	    sysRole=0;        
        email="";                      
     	createDate=dateFormatter.format(new java.util.Date());
    	tag=0;		
   		strSql="";        
        
   }
   
  
   public boolean add()
   {
        
        strSql="insert into users ";
        strSql=strSql + "(";
        strSql=strSql + "userName,";
        strSql=strSql + "userPassword,";
        strSql=strSql + "email,";
        strSql=strSql + "sex,";
        strSql=strSql + "identityID,";
        strSql=strSql + "shopName,";
        strSql=strSql + "shopIntro,";        
        strSql=strSql + "shopper,";
        strSql=strSql + "realName,";        
        strSql=strSql + "mainFields,";    
        strSql=strSql + "telephone,"; 
        strSql=strSql + "createDate,";  
        strSql=strSql + "sysRole,";    
        strSql=strSql + "tag";       
        strSql=strSql + ") ";
        
		strSql=strSql + "values(";
		strSql=strSql + "'" + userName + "',";
		strSql=strSql + "'" + userPassword + "',";
		strSql=strSql + "'" + email + "',";
		strSql=strSql + "'" + sex + "',";
		strSql=strSql + "'" + identityID + "',";
		strSql=strSql + "'" + shopName + "',";
		strSql=strSql + "'" + shopIntro + "',";
		strSql=strSql + "'" + shopper + "',";
		strSql=strSql + "'" + realName + "',";
		strSql=strSql + "'" + mainFields + "',";
		strSql=strSql + "'" + telephone + "',";
		strSql=strSql + "'" + createDate + "',";
		strSql=strSql + "'" + sysRole + "',";
		strSql=strSql + "'" + tag + "'";
		strSql=strSql + ")";

		System.out.println(strSql);
		boolean isAdd = super.exeSqlUpdate(strSql);
		
		return isAdd;
   }
   
  
   public boolean modifyUserInfo(String webID)
   {
   		strSql="update users set";
		strSql=strSql + " userName=" + "'" + userName + "',";		
		strSql=strSql + " email=" + "'" + email + "',";
		strSql=strSql + " sex=" + "'" + sex + "',";
		strSql=strSql + " identityID=" + "'" + identityID + "',";		
		strSql=strSql + " shopName=" + "'" + shopName + "',";
		strSql=strSql + " shopIntro=" + "'" + shopIntro + "',";
		strSql=strSql + " shopper=" + "'" + shopper + "',";		
		strSql=strSql + " realName=" + "'" + realName + "',";
		strSql=strSql + " mainFields=" + "'" + mainFields + "',";
		strSql=strSql + " telephone=" + "'" + telephone + "',";		
		strSql=strSql + " createDate=" + "'" + createDate + "',";
		strSql=strSql + " sysRole=" + "'" + sysRole + "',";
		strSql=strSql + " tag=" + "'" + tag + "'";
		strSql=strSql + " where ID='" + webID + "'";
		System.out.println(strSql);
		boolean isUpdate = super.exeSqlUpdate(strSql);
		
		return isUpdate;

   }

    public boolean updatekey(String webID,String webUserPassword)
   {
       strSql="update users set ";
       strSql=strSql + "userPassword=" + "'" + webUserPassword + "'";
       strSql=strSql + " where ID='" + webID + "'";
       
       	boolean isUpdatekey = super.exeSqlUpdate(strSql);
		
		return isUpdatekey;

   }
 
   public boolean delete(String webID)
   {
        strSql="delete from `users` where ID='";
        strSql=strSql + webID + "'";
        boolean isDelete1 = super.exeSqlUpdate(strSql);
        
        strSql="delete from `goods` where issuer='";
        strSql=strSql + webID + "'";
        boolean isDelete2 = super.exeSqlUpdate(strSql);
		
        strSql="delete from `discussion` where authorID='";
        strSql=strSql + webID + "'";       
        boolean isDelete3 = super.exeSqlUpdate(strSql);
        
        strSql="delete from `attention` where userID='";
        strSql=strSql + webID + "'";       
        boolean isDelete4 = super.exeSqlUpdate(strSql);
        
        boolean isDelete = isDelete1&&isDelete2&&isDelete3&&isDelete4;
        
        
        
		return isDelete;

   }
   
 
   public boolean  init(String webID)
   {
    	strSql="select * from `users` where ID=";
        strSql=strSql + "'" + webID + "'";        
        try
		{
   			ResultSet rs = super.exeSqlQuery(strSql);
            if (rs.next())
            {
                ID=rs.getLong("ID");
                userName=rs.getString("userName");
                userPassword=rs.getString("userPassword");
                realName=rs.getString("realName");
                sex=rs.getInt("sex");
                identityID=rs.getString("identityID");
                shopName=rs.getString("shopName");
                shopIntro=rs.getString("shopIntro");
                email=rs.getString("email"); 
                shopper=rs.getString("shopper");
                mainFields=rs.getLong("mainFields");
                telephone=rs.getString("telephone");
                createDate=rs.getString("createDate");
                sysRole=rs.getInt("sysRole");
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

  
   public boolean isValidUser(String webUserName,String webUserPassword,String webRole)
   {
        strSql="select * from `users` ";
		strSql=strSql + " where userName='" + webUserName + "'";
		strSql=strSql + "  and userPassword='"+ webUserPassword + "'"; 
		strSql=strSql + "  and sysRole='"+ webRole + "'";        
        
        
        try
        {
   			ResultSet rs = super.exeSqlQuery(strSql);  			
			
            if (rs.next())
            {
            	sysRole=rs.getInt("sysRole");
            	ID=rs.getLong("ID");
            	userName=rs.getString("userName");
                userPassword=rs.getString("userPassword");
                if(0 == sysRole){
                	
                }
                else{
                	//ID=rs.getLong("ID");
                    //userName=rs.getString("userName");
                    //userPassword=rs.getString("userPassword");
                    realName=rs.getString("realName");
                    sex=rs.getInt("sex");
                    identityID=rs.getString("identityID");
                    shopName=rs.getString("shopName");
                    shopIntro=rs.getString("shopIntro");
                    email=rs.getString("email"); 
                    shopper=rs.getString("shopper");
                    mainFields=rs.getLong("mainFields");
                    telephone=rs.getString("telephone");
                    createDate=rs.getString("createDate");
                    //sysRole=rs.getInt("sysRole");
                    tag=rs.getInt("tag");
                }
                return true;
            }
            else
            {
                
                return false;

            }

		}
		catch(Exception ex)
		{
            
            return false;

		}
        finally
        {
           
            
        }

   }
   
 
   public boolean isExist(String webUserName)
   {
        strSql="select * from `users` ";
		strSql=strSql + " where userName='" + webUserName + "'";   
        
        try
        {
   			ResultSet rs = super.exeSqlQuery(strSql);  			
			
            if (rs.next())
            {
                return true;
            }
            else
            {
                
                return false;

            }
		
		}
		catch(Exception ex)
		{
            
            return false;

		}
        finally
        {
           
            
        }

   }
 
   public boolean enable(String webID)
   {
        strSql="update users set tag=1 where ID='";
        strSql=strSql  + webID + "'";

        boolean isEnable = super.exeSqlUpdate(strSql);
		
		return isEnable;

   }

   public boolean  disable(String webID)
   {
        strSql="update users set tag=-1 where ID='";
        strSql=strSql + webID + "'";

        boolean isDisable = super.exeSqlUpdate(strSql);
		
		return isDisable;

   }
   
   public ResultSet showAllUsers()
   {
    	strSql="select * from `users` where tag!=-1 and sysRole=2";
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
  
   public ResultSet showAllMerchants(String webTag)
   {
    	strSql="select * from `users` where tag='"+webTag+"' and sysRole=2 order by ID desc";
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

