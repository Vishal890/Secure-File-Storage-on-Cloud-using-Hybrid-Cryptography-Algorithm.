
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title> Cloud Server </title>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import ="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
    <%@ page import="java.sql.*,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream" %>
<%@ include file="connect.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/coin-slider.css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/cufon-yanone.js"></script>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/coin-slider.min.js"></script>
<style type="text/css">
<!--
.style1 {font-size: 14px}
.style2 {font-size: 24}
.style3 {font-size: 26px; }
.style4 {
	font-size: 24;
	font-weight: bold;
	color: #666666;
}
.style5 {font-size: 16px}
.style6 {font-size: 16px; font-weight: bold; color: #666666; }
.style9 {color: #666666; font-size: 18px;}
-->
</style>
</head>
<body>
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="searchform">
      </div>
      <div class="menu_nav">
        <ul>
          <li class="active"></li>
          <li class="style1">
           <div align="left"><a href="User.html"><span>USER</span></a></div>
		  <li><a href="Register.html"><span>REGISTER</span></a></li>
		  <li><a href="DataOwner.html"><span>DATA OWNER</span></a></li>
		  <li><a href="CloudServer.html"><span>CLOUD SERVER</span></a></li>
          <li><a href="about.html"><span>ABOUT SYSTEM</span></a></li>
          </li>
        </ul>
      </div>
      <div class="clr"></div>
      <div class="logo">
       <h1><a href="index.html">Secure File storage in Cloud Computing using Hybrid Cryptography Algorithm</a></h1>
      </div>
      <div class="clr"></div>
      <div class="slider">
        <div id="coin-slider"> <a href="#"><img src="images/slide1.jpg" width="960" height="320" alt="" /></a> <a href="#"><img src="images/slide2.jpg" width="960" height="320" alt="" /></a></div>
        <div class="clr"></div>
      </div>
      <div class="clr"></div>
    </div>
  </div>
 <div class="content">
    <div class="content_resize">
      <div class="mainbar">
        <div class="article">
          <h2><span>End User  Privilages  </span> :: </h2>
          <p>&nbsp;</p>
          <table width="625" border="1" align="center">
            <tr>
              <td width="97"><div align="center"><span class="style6">User Name </span></div></td>
              <td width="126"><div align="center"><span class="style6">Search Permission </span></div></td>
              <td width="160"><div align="center"><span class="style6">Download Permission </span></div></td>
              <td width="148"><div align="center"><span class="style6">Owner Permission</span></div></td>
            </tr>
            <%	  
			  
			  
	String s1="",s2="",s3="",s4="",s5="",s6="",s7="",s8,s9="",s10,s11,s12,s13;
	

      	try 
	{		
			
		
			
			
      		String query="select * from request"; 
           	Statement st=connection.createStatement();
           	ResultSet rs=st.executeQuery(query);
			while ( rs.next() )
			   {
				s2=rs.getString(2);
				s3=rs.getString(3);
				s4=rs.getString(4);
				s5=rs.getString(5);
				
				
				%>
			<tr>
              <td><div align="center"><%=s2%></div></td>
              <td><div align="center"><%=s3%></div></td>
              <td><div align="center"><%=s4%></div></td>
              <td><div align="center"><%=s5%></div></td>
            </tr>
             <%
			 
	  }
	  
	  
	  
	  		String user = request.getParameter("usr");
			String search = request.getParameter("select");
			String download = request.getParameter("select2");
					
			
				
					String query1="update request set search='"+search+"',download='"+download+"' where user='"+user+"'"; 
					Statement st1=connection.createStatement();
					st1.executeUpdate(query1);
					
				   	connection.close();
				  }
				 
				  catch(Exception e)
				  {
					out.println(e.getMessage());
				  }
		%>
          </table>
            <p><a href="CloudServerMain.html">BACK</a></p>
          <p>&nbsp;</p>
	    </div>
      </div>
      <div class="sidebar">
        <div class="gadget">
          <h2 class="star"><span>Cloud Server  Menu</span></h2>
          <div class="clr"></div>
          <ul class="sb_menu">
            <li><a href="CloudGrant.jsp">GIVE PRIVILEGES TO USERS </a></li>
            <li><a href="ViewServerFiles.jsp">VIEW CLOUD SERVER FILES </a></li>
            <li><a href="ViewAttackers.jsp">VIEW ATTACKERS </a></li>
            <li><a href="ViewTransaction.jsp">VIEW TRANSACTION </a></li>
            <li><a href="ViewEndUsers.jsp">VIEW END USERS </a></li>
            <li><a href="index.html">LOG OUT</a></li>
            </ul>
        </div>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="fbg">
    <div class="fbg_resize">
      <div class="col c1">
        <h2><span>Image</span> Gallery</h2>
        <a href="#"><img src="images/gal1.jpg" width="75" height="75" alt="" class="gal" /></a> <a href="#"><img src="images/gal2.jpg" width="75" height="75" alt="" class="gal" /></a> <a href="#"><img src="images/gal3.jpg" width="75" height="75" alt="" class="gal" /></a> <a href="#"><img src="images/gal4.jpg" width="75" height="75" alt="" class="gal" /></a> <a href="#"><img src="images/gal5.jpg" width="75" height="75" alt="" class="gal" /></a> <a href="#"><img src="images/gal6.jpg" width="75" height="75" alt="" class="gal" /></a> </div>
      <div class="col c2">
        <h2><span>Trapdoor generation process</span></h2>
        <p>The trapdoor
          is traditionally generated by the provider to provide
        data security. To perform a search
        request, the user first authenticates with the provider.          During authentication, the provide would send its secret
        key to the user to decrypt the documents stored in cloud.</p>
      </div>
      <div class="col c3">
        <h2 class="style3">Efficient Search Algorithm</h2>
        <p>The efficient search algorithm proposed by EnDAS relies
          on a binary search tree structure to accelerate indexing.
          This paper introduce the conventional
        privacy-preserving index construction procedures, including index construction.</p>
        <p class="contact_info style2">&nbsp;</p>
      </div>
      <div class="clr style2"></div>
    </div>
  </div>
  <div class="footer style2">
    <div class="footer_resize">
     
      <div style="clear:both;"></div>
    </div>
  </div>
</div>
<div align=center class="style2"></div>
</body>
</html>
