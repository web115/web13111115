package com.netshop;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;
import java.text.*;
public class FileUpload extends HttpServlet
{
    int max_size=10240000;
    int errNum=0;
    String errDesc="";
    String filePath="";
    String[] fieldNames=new String[100];
    String[] fieldValues=new String[100];
    String fileName="";

    String fileStr=null;//
    DataInputStream in=null;
    FileOutputStream fileOut=null;
    String fileContent;

  
    public void setMax_size(int max_size)
    {
        this.max_size=max_size;
    }

    
    public int getMax_size()
    {
        return this.max_size;
    }

    public int getErrNum()
    {
        return this.errNum;
    }
  
    public String getErrDesc()
    {
        return this.errDesc ;
    }

  
    public void setFilePath(String filepath)
    {
        this.filePath=filepath ;
    }

  
    public String getFormFields(String strField)
    {
        String fieldValue="";
         for(int i=0;i<fieldNames.length;i++)
        {
            if(fieldNames[i].equals(strField))
            {
                fieldValue=fieldValue + "," + fieldValues[i];
            }
        }
        if (fieldValue.length()>=1)
        {
            fieldValue=fieldValue.substring(1,fieldValue.length());
        }
        return fieldValue;

    }

  
    public void saveFile(String fileName)
    {
        this.fileName=fileName;
        saveFile();
    }

  
    public void saveFile()
    {
       if(fileName=="" || fileName==null)
       {
            fileName=getFileName();
       }
       
        try
        {
            fileOut=new FileOutputStream(filePath + fileName);
            fileOut.write(fileContent.getBytes("ISO8859_1"),0,fileContent.length());
            fileOut.close() ;
        }
        catch(Exception ex)
        {
            this.errNum =-1;
            this.errDesc=ex.toString();
        }
        finally
        {
            fileOut=null;
        }

    }

 
    public String getFileName()
    {
        int firstIndex=fileStr.indexOf("filename=\"");
        String tempStr=fileStr.substring(firstIndex+10);
        tempStr=tempStr.substring(0,tempStr.indexOf("\n"));
        tempStr=tempStr.substring(tempStr.lastIndexOf("\\")+1,tempStr.indexOf("\""));
        try
        {
            return new String(tempStr.getBytes("ISO-8859-1") ,"Gb2312");
        }
        catch(Exception e)
        {
             return tempStr;
        }
    }
   
    private String getBoundary(String contentType)
    {
	    int lastIndex=contentType.lastIndexOf("=");
	    String boundary=contentType.substring(lastIndex+1,contentType.length());
	    return boundary;

    }

  
    private String getFileContent(String fileStr,String boundary)
    {
	  int pos;

	  pos=fileStr.indexOf("filename=\"");

	  pos=fileStr.indexOf("\n",pos)+1;

	  pos=fileStr.indexOf("\n",pos)+1;

	  pos=fileStr.indexOf("\n",pos)+1;

	  int boundaryLocation=fileStr.indexOf(boundary,pos)-4;
	  fileStr=fileStr.substring(pos,boundaryLocation);
	  return fileStr;
    }

   
    public void initialize(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException
    {
        for(int i=0;i<fieldNames.length;i++)
        {
            fieldNames[i]="";
            fieldValues[i]="";
        }
        filePath="/" ;
       
        response.setContentType("text/plain");
        String contentType=request.getContentType();
	    in=new DataInputStream(request.getInputStream());
	    int formDataLength=request.getContentLength();
	    byte dataBytes[]=new byte[formDataLength];
        int bytesRead=0;
	    int totalBytesRead=0;
	    int sizeCheck=0;
	    while(totalBytesRead<formDataLength)
	    {
	  	    sizeCheck=totalBytesRead+in.available();
		    if(sizeCheck>this.max_size )
		    {
			  
                this.errNum=-1;
                this.errDesc="sorry,this file is too large. this max size is:" + this.max_size + " bytes";
			    return;
		    }
	  	    bytesRead=in.read(dataBytes,totalBytesRead,formDataLength);
		    totalBytesRead+=bytesRead;
	    }

        fileStr=new String(dataBytes,"ISO8859_1");
        dataBytes=null;
        String boundary=getBoundary(contentType);
        fileContent=getFileContent(fileStr,boundary);

      
        int m=0;
        int temppos=0;
        while(temppos>=0)
        {
            temppos=fileStr.indexOf("; name=\"",temppos+1);
            if (temppos>=0)
            {
                temppos=temppos+8;
                fieldNames[m]=new String(fileStr.substring(temppos,fileStr.indexOf("\"",temppos+1)));
                temppos=fileStr.indexOf("\n",temppos)+1;
                temppos=fileStr.indexOf("\n",temppos)+1;
                fieldValues[m]=new String(fileStr.substring(temppos,fileStr.indexOf(boundary,temppos)-4));
                m=m+1;
            }
        }

    }

}
