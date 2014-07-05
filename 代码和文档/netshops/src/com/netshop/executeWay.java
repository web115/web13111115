package com.netshop;

import java.sql.*;


public class executeWay extends OpenDB
{
	private Connection dbConn;
	private Statement stmt;
	private ResultSet rs;
    private int errNum;
    private String errDesc;
	
	public executeWay()
	{
		dbConn = super.getConnection();
		stmt = null;
		rs = null;
		errNum = 0;
		errDesc = "";		
	}

	public boolean exeSqlUpdate(String strSql)
	{
		try
		{
   			stmt=dbConn.createStatement();
			stmt.executeUpdate(strSql);
			this.errNum=0;
			return true;            
		}
		catch(Exception ex)
		{
			
            this.errNum=-1;
            this.errDesc=ex.toString();
			return false;
		}	
		finally
		{
				
		}
	}
	
    public ResultSet exeSqlQuery(String strSql)
	{
		
		try
		{
   			stmt=dbConn.createStatement();
			rs =stmt.executeQuery(strSql);
			this.errNum=0;
			            
		}
		catch(Exception ex)
		{
			
            this.errNum=-1;
            this.errDesc=ex.toString();
			rs = null;
		}	
		finally
		{
				
		}
		return rs;
	}

    public int getErrNum()
    {
        return errNum;

    }
  
    public String getErrDesc()
    {
        return errDesc;
    }		
	
	
}