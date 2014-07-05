package com.netshop;

import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;
public  class Email{
 	private String smtphost=null;
 	private String from=null;
 	private String username=null;
 	private String password=null;
 	private String to=null;
 	private String cc=null;
 	private String bcc=null;
 	private String subject=null;
 	private String content=null;
       private String attachfile=null;
       private String attachname=null;
       

 	public Email()
 		{}

 	public void setSMTPHost(String smtphost)
 		{
 		this.smtphost=smtphost;
 		}
 	public String getSMTPHost()
 		{
 		return this.smtphost;
 		}

 	public void setFrom(String from)
 		{
 		this.from=from;
 		}
 	public String getFrom()
 		{
 		return this.from;
 		}

 	public void setUserName(String username)
 		{
 		this.username=username;
 		}
 	public String getUserName()
 		{
 		return this.username;
 		}

 	public void setPassword(String password)
 		{
 		this.password=password;
 		}
 	public String getPassword()
 		{
 		return this.password;
 		}

 	public void setTo(String  to)
 		{
 		this.to=to;
 		}
 	public String getTo()
 		{
 		return this.to;
 		}

 	public void setCC(String cc)
 		{
 		this.cc=cc;
 		}
 	public String getCC()
 		{
 		return this.cc;
 		}

 	public void setBcc(String bcc)
 		{
 		this.bcc=bcc;
 		}
 	public String getBcc()
 		{
 		return bcc;
 		}

 	public void setSubject(String subject)
 		{
 		this.subject=subject;
 		}
 	public String getSubject()
 		{
 		return this.subject;
 		}

 	public void setContent(String content)
 		{
 		this.content=content;
 		}
 	public String getContent()
 		{
 		return this.content;
 		}
       public void setattachfile (String attachfile)
                 {
                this.attachfile=attachfile;
                  }
       public String getattachfile()
                  {
                 return this.attachfile;
                   }
    
 
 	public void sendMail() throws Exception
{
 		
 		Properties props = System.getProperties();

 		
 		props.put("mail.smtp.host",smtphost);
 	
 		props.put("mail.smtp.sendpartial","true");

 		if(username !=null)
 			props.put("mail.smtp.auth", "true");
 		
		Session session = Session.getDefaultInstance(props,null);     
        MimeMessage message = new MimeMessage(session);
        message.setFrom(new InternetAddress(from));
        message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
        if( cc !=null)
        	message.addRecipient(Message.RecipientType.CC, new InternetAddress(cc));
        if( bcc !=null)
        	message.addRecipient(Message.RecipientType.BCC, new InternetAddress(bcc));
        message.setHeader("Content-Type","text/html;charset=gb2312");        
        message.setSubject(subject);        
	    BodyPart messageBodyPart = new MimeBodyPart();    
        messageBodyPart.setText(content);
        
        Multipart multipart = new MimeMultipart();
        multipart.addBodyPart(messageBodyPart);
 
    	if (attachfile!=null)
        {
          messageBodyPart = new MimeBodyPart();
          DataSource source = new FileDataSource(attachfile);
          messageBodyPart.setDataHandler(new DataHandler(source));
          messageBodyPart.setFileName(source.getName());
          multipart.addBodyPart(messageBodyPart);
        }
      
		message.setContent(multipart);
        message.saveChanges(); 
        
        Transport transport = session.getTransport("smtp");
        transport.connect(smtphost, username, password);
        transport.sendMessage(message, message.getAllRecipients());
        transport.close();

 		}
 	}

