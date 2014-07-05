
package com.netshop;

import java.sql.*;
import java.text.*;

public class goods extends executeWay
{
       public long ID;
    public String title;
    public String description;   
    public long issuer;   
    public long goodsField; 
    public String linkMan;
    public String goodsURL; 
    public long price;
    public String telephone;
    public String createDate;       
    public int goodsType;   
    public int tag;    
    private String strSql;
   
    private SimpleDateFormat dateFormatter;
    
    
     public goods()
    {
        super();
        dateFormatter = new SimpleDateFormat("yyyy-MM-dd");
        ID=0;
        title="";
        description="";           
        issuer=0;
        linkMan="";  
        goodsURL="";       
	    telephone="";	    
	    goodsField=0; 
	    price = 0;                      
     	createDate=dateFormatter.format(new java.util.Date());
     	goodsType=1;
    	tag=0;		
   		strSql="";        
        
   }
   
  
   public boolean add()
   {
        
        strSql="insert into goods ";
        strSql=strSql + "(";
        strSql=strSql + "title,";
        strSql=strSql + "description,";       
        strSql=strSql + "issuer,";
        strSql=strSql + "goodsField,";
        strSql=strSql + "linkMan,";
        strSql=strSql + "goodsURL,";      
        strSql=strSql + "price,";                 
        strSql=strSql + "telephone,"; 
        strSql=strSql + "createDate,";  
        strSql=strSql + "goodsType,"; 
        strSql=strSql + "tag";       
        strSql=strSql + ") ";      
		strSql=strSql + "values(";
		strSql=strSql + "'" + title + "',";
		strSql=strSql + "'" + description + "',";	
		strSql=strSql + "'" + issuer + "',";
		strSql=strSql + "'" + goodsField + "',";
		strSql=strSql + "'" + linkMan + "',";
		strSql=strSql + "'" + goodsURL + "',";	
		strSql=strSql + "'" + price + "',";	
		strSql=strSql + "'" + telephone + "',";
		strSql=strSql + "'" + createDate + "',";	
		strSql=strSql + "'" + goodsType + "',";	
		strSql=strSql + "'" + tag + "'";
		strSql=strSql + ")";

		boolean isAdd = super.exeSqlUpdate(strSql);
		
		return isAdd;
   }
 
   public boolean modifyGoodsInfo(String webID)
   {
   		strSql="update goods set";
		strSql=strSql + " title=" + "'" + title + "',";		
		strSql=strSql + " description=" + "'" + description + "',";
		strSql=strSql + " issuer=" + "'" + issuer + "',";
		strSql=strSql + " goodsField=" + "'" + goodsField + "',";		
		strSql=strSql + " linkMan=" + "'" + linkMan + "',";
		strSql=strSql + " goodsURL=" + "'" + goodsURL + "',";
		strSql=strSql + " price=" + "'" + price + "',";		
		strSql=strSql + " telephone=" + "'" + telephone + "',";		
		strSql=strSql + " createDate=" + "'" + createDate + "',";
		strSql=strSql + " goodsType=" + "'" + goodsType + "',";
		strSql=strSql + " tag=" + "'" + tag + "'";
		strSql=strSql + " where ID='" + webID + "'";
		System.out.println(strSql);
		boolean isUpdate = super.exeSqlUpdate(strSql);		
		return isUpdate;

   }

 
   public boolean delete(String webID)
   {
        strSql="delete from `goods` where ID='";
        strSql=strSql + webID + "'";
        boolean isDelete1 = super.exeSqlUpdate(strSql);
        System.out.println(strSql);
        
        strSql="delete from `discussion` where goodsID='";
        strSql=strSql + webID + "'";       
        boolean isDelete2 = super.exeSqlUpdate(strSql);
        System.out.println(strSql);
        
        strSql="delete from `attention` where goodsID='";
        strSql=strSql + webID + "'";        
        boolean isDelete3 = super.exeSqlUpdate(strSql);
        System.out.println(strSql);
        
		boolean isDelete = isDelete3&&isDelete2&&isDelete1;
        
		return isDelete;

   }
   
  
   public boolean  init(String webID)
   {
    	strSql="select * from `goods` where ID=";
        strSql=strSql + "'" + webID + "'";        
        try
		{
   			ResultSet rs = super.exeSqlQuery(strSql);
            if (rs.next())
            {
                ID=rs.getLong("ID");
                title=rs.getString("title");
                description=rs.getString("description");             
                issuer=rs.getLong("issuer");
                goodsField=rs.getLong("goodsField");
                linkMan=rs.getString("linkMan");
                goodsURL=rs.getString("goodsURL");
                price=rs.getLong("price");               
                telephone=rs.getString("telephone");
                createDate=rs.getString("createDate");
                goodsType=rs.getInt("goodsType");               
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
 
   public ResultSet showGoodsByMerchant(String webID)
   {
    	strSql="select * from `goods` where tag!=-1 and issuer="+webID;
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
  
   public ResultSet showGoods()
   {
    	strSql="select * from `goods` where tag!=-1 and goodsType=2";
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

