
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>ENDAS :: Data Owner </title>
<%@page import ="java.util.*"%>
<%@page import ="java.sql.*"%>
<%@page import ="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
<%@ page import="java.sql.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream" %>
<%@ page import ="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
<%@page import ="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>
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
.style11 {font-size: 16px; font-weight: bold; color: #666666; }
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
          <h2><span>Access Permission  </span> ::</h2>
          <form id="form1" name="form1" method="post" action="">
            <p>&nbsp;</p>
            <table width="625" border="1" align="center">
              <tr>
                <td width="60" height="30"><div align="center"><span class="style11">User ID </span></div></td>
                <td width="97"><div align="center"><span class="style11">User Name  </span></div></td>
                <td width="126"><div align="center"><span class="style11">Search Permission </span></div></td>
                <td width="160"><div align="center"><span class="style11">Download Permission </span></div></td>
                <td width="148"><div align="center"><span class="style11">Approve</span></div></td>
                <%	  
			  
			  
	String s1="",s2="",s3="",s4="",s5="",s6="",s7="",s8,s9="",s10,s11,s12,s13;
	int i=0,j=0,k=0;

      	try 
	{
        
          String keyword = request.getParameter("t14");
      		
      		String uname=(String)application.getAttribute("uname");
      		
			
      		String query="select * from request"; 
           Statement st=connection.createStatement();
           ResultSet rs=st.executeQuery(query);
	while ( rs.next() )
	   {
		i=rs.getInt(1);
		s2=rs.getString(2);
		s3=rs.getString(3);
		s4=rs.getString(4);
		s5=rs.getString(5);
		
		
		%>
              </tr>
              <tr>
                <td height="28"><div align="center"><%=i%></div></td>
                <td><div align="center"><%=s2%></div></td>
                <td><div align="center"><%=s3%></div></td>
                <td><div align="center"><%=s4%></div></td>
                
		<%	
			if(s5.equalsIgnoreCase("No"))
			{
			
		%>	
			  <td><div><div align="center"><a href="OwnerGrant1.jsp?uid=<%=i%>"><%=s5%></a></div>
                </div></td>
              </tr>
		<%
		
			}else
			{
		%>	  
				
                  <td><div><div align="center"><%=s5%></div>
                </div></td>
              </tr>
              <%
			  }
	  }
           connection.close();
          }
         
          catch(Exception e)
          {
            out.println(e.getMessage());
          }
%>
            </table>
            <p><a href="DataOwnerMain.html">BACK</a></p>
          </form>
          <p>&nbsp;</p>
	    </div>
      </div>
      <div class="sidebar">
        <div class="gadget">
          <h2 class="star"><span>Data Owner  Menu</span></h2>
          <div class="clr"></div>
          <ul class="sb_menu">
            <li><a href="Uploa.jsp">UPLOAD DATA </a></li>
            <li><a href="OwnerGrant.jsp">GRANT PERMISSION </a></li>
            <li><a href="ViewOwnerFiles.jsp">VIEW FILES </a></li>
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
