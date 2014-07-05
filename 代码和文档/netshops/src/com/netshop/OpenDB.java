package com.netshop;

import java.sql.*;

public class OpenDB
{
    
    String userName="root";
    String userPassword="1234";  
    private String driverName = "org.gjt.mm.mysql.Driver";
    private String url = "jdbc:mysql://localhost/netshops?useUnicode=true&characterEncoding=UTF-8";

    Connection dbConn;
    public OpenDB()
    {

    }
    public Connection getConnection()
    {
        try
        {
            Class.forName(driverName);
            dbConn=DriverManager.getConnection(url,userName,userPassword);
        }
        catch(Exception ex)
        {
            System.out.println(ex.toString());
            dbConn = null;
        }
       
        return dbConn;
    }

}
