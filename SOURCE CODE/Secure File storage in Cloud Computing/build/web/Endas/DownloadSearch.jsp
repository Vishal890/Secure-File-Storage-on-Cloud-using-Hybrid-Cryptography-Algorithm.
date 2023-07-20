<%@page import ="java.util.*"%>
<%@page import ="java.sql.*"%>
<%@page import ="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
<%@ page import="java.sql.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream" %>
<%@ page import ="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
<%@page import ="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>
<%@ include file="connect.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>ENDAS :: User </title>
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
          <input name="editbox_search" class="editbox_search" id="editbox_search" maxlength="80" value="Search our site:" type="text" />
          </span>
          <input name="button_search" src="images/search.gif" class="button_search" type="image" />
        </form>
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
       <h1><a href="index.html">ENDAS<span></span> <small>Efficient Encrypted Data Search as a Mobile Cloud Service</small></a></h1>
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
          <h2><span class="style2">Request For Trapdoor &amp; Secret Key </span>:: </h2>
          <div class="clr"></div>
          <p>&nbsp;</p>
		  <%
		  
		  	String fname = request.getParameter("uid");
			String uname=(String)application.getAttribute("uname");
			String yes="Yes";
			
			String query1="select * from request  where user='"+uname+"' and download='"+yes+"'"; 
       		Statement st1=connection.createStatement();
       		ResultSet rs1=st1.executeQuery(query1);
		   
			if ( rs1.next() )
	 		{
	   	%>
				<form action="Download1.jsp" method="post" name="form1" id="form1">
            <table width="478" border="0" align="center">
              <tr>
                <td width="223"><span class="style1">Enter File Name :-</span></td>
                <td width="245"><label>
                  <input required name="t1" type="text" value="<%=fname%>" size="40" />
                </label></td>
              </tr>
              <tr>
                <td height="34"><span class="style1">Trapdoor :-</span></td>
                <td><input name="t12" type="text" size="40" /></td>
              </tr>
              <tr>
                <td><span class="style1">Secret Key :-</span></td>
                <td><input name="t13" type="text" size="40" /></td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td><div align="right">
                  <input type="submit" name="Submit" value="Req Trapdoor" />
                </div></td>
                <td><label>
                  <input type="submit" name="Submit2" value="Download" />
                </label></td>
              </tr>
            </table>
          </form>
		  <%
	  		}else
			{
			%>	
			 <p><h2>You Don't Have Permission To Download !!!</h2></p><br />
						<p><a href="UserMain.jsp">Back</a></p>
						
						
		<%	}	
			
		  %>
          
        </div>
      </div>
      <div class="sidebar">
        <div class="gadget">
          <h2 class="star"><span>User Menu</span></h2>
          <div class="clr"></div>
          <ul class="sb_menu">
            <li><a href="Request.jsp">REQUEST PERMISSION </a></li>
            <li><a href="Download.jsp">DOWNLOAD FILE </a></li>
            <li><a href="Search.jsp">SEARCH DATA </a></li>
            <li><a href="Topk.jsp">TOP K DOCUMENT</a></li>
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
        <p class="style4">The efficient search algorithm proposed by EnDAS relies
          on a binary search tree structure to accelerate indexing.<br />
          This paper introduce the conventional<br />
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
