<%@page import="com.database.Database"%>
<%@page import="com.database.Database"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page import="java.sql.*"%>
<%@ include file="connect.jsp" %>
<%@ page import="com.oreilly.servlet.*,java.lang.*,java.text.SimpleDateFormat,java.io.*,javax.servlet.*, javax.servlet.http.*" %>
<%@page import ="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec"%>
<%@ page import="org.bouncycastle.util.encoders.Base64"%>
<%@ page import="java.util.Random,java.io.PrintStream, java.io.FileOutputStream, java.io.FileInputStream, java.security.DigestInputStream, java.math.BigInteger, java.security.MessageDigest, java.io.BufferedInputStream" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title> Cloud Server </title>
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
.style1 {font-size: 16px}
.style2 {font-size: 14px}
.style3 {font-size: 24}
.style3 {font-size: 26px; }
.style4 {	font-size: 24;
	font-weight: bold;
	color: #666666;
}
-->
</style>
</head>
<body>
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="searchform">
        <form id="formsearch" name="formsearch" method="post" action="#">
          <span>
          <input name="editbox_search" class="editbox_search" id="editbox_search" maxlength="80" value="Search our ste:" type="text" />
          </span>
          <input name="button_search" src="images/search.gif" class="button_search" type="image" />
        </form>
      </div>
      <div class="menu_nav">
        <ul>
          <li class="active"></li>
          <li class="style2">
            <div align="left"><a href="User.html"><span>USER</span></a></div>
          </li>
          <li><a href="Register.html"><span>REGISTER</span></a></li>
          <li><a href="DataOwner.html"><span>DATA OWNER</span></a></li>
          <li><a href="CloudServer.html"><span>CLOUD SERVER</span></a></li>
          <li><a href="About.html"><span>ABOUT SYSTEM</span></a></li>
          </li>
        </ul>
      </div>
      <div class="clr"></div>
      <div class="logo">
        <h1><a href="index.html">Endas<span></span><small>Efficient Encrypted Data Search as a Mobile Cloud Service</small></a></h1>
      </div>
      <div class="clr"></div>
      <div class="slider">
        <div id="coin-slider"> <a href="#"><img src="images/slide1.jpg" width="960" height="320" alt="" /></a> <a href="#"><img src="images/slide2.jpg" width="960" height="320" alt="" /></a> <a href="#"><img src="images/slide3.jpg" width="960" height="320" alt="" /></a> </div>
        <div class="clr"></div>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="content">
    <div class="content_resize">
      <div class="mainbar">
        <div class="article">
          <h2><span>View All Files  ::</span></h2>
          <p>&nbsp;</p>
          <div class="clr"></div>
          <table width="960" border="1" align="center">
  <tr>
    <td width="178" height="31"><div align="center"><span class="style3">Id </span></div></td>
      <td width="252"><div align="center"><span class="style3">File Name </span></div></td>
    <td width="223"><div align="center"><span class="style3">Encryption </span></div></td>
    <td width="279"><div align="center"><span class="style3">Decryption</span></div></td>
  </tr>

<%

	
	String s1="",s2="",s3="",s4="",s5="",s6="",s7="",s8,s9="",s10,s11,s12,s13;
	int i=0,j=0,k=0;

      	try 
	{
        
          
      		
      		 
      		
      	String query="select distinct fname from ed_file" ;
                 ResultSet r=Database.getExecuteQuery(query);
                 String fname=null;
                 while(r.next()){
                      fname=r.getString("fname");
                 }
                 ResultSet rr=Database.getExecuteQuery("select * from ed_file where fname='"+fname+"'");
                 while(rr.next()){
                  %>
                  
		

  <tr>
    <td height="29"><div align="center"><%=rr.getString("id")%></div></td>
    <td><div align="center"><%=rr.getString("fname")%></div></td>
    
    <td><div align="center"><a href="ViewEncryption.jsp?id=<%=rr.getString("id")%>">View Graph</a></div></td>
	 <td><div align="center"><a href="ViewDecryption.jsp?id=<%=rr.getString("id")%>">View Graph</a></div></td>

  </tr>

<%
	   
}
           connection.close();
          }
         
          catch(Exception e)
          {
            out.println(e.getMessage());
          }
%>
</table>
          </p>
    <p> BACK <a href="CloudServerMain.html">CLOUD SERVER MENU</a></p>     
        </div>
      </div>
      <div class="sidebar">
        <div class="searchform">
          
        </div>
      </div>
       
          <div class="clr"></div>
          <ul class="ex_menu">
            <li></li>
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
        <p class="style4">The efficient search algorithm proposed by EnDAS relies
          on a binary search tree structure to accelerate indexing.
          This paper introduce the conventional
        privacy-preserving index construction procedures, including index construction.</p>
        <p class="contact_info style2">&nbsp;</p>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="footer">
    <div class="footer_resize">
      <div style="clear:both;"></div>
    </div>
  </div>
</div>
</body>
</html>
