
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title> User Search</title>
<%@page import ="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>
<%@page import ="java.sql.*"%>
<%@page import ="java.io.*"%>
<%@page import ="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
<%@ page import="java.sql.*,java.util.Random"%>
<%@ page import ="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
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
.style6 {font-size: 30px}
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
          <h2><span class="style6">Search Result  </span>:: </h2>
          <div class="clr"></div>
          <p> </p>
          <table width="625" border="1" align="center">
            <tr>
              <td width="86" height="29"><div align="center"><span class="style4">File ID </span></div></td>
              <td width="204"><div align="center"><span class="style4">File Name </span></div></td>
              <td width="97"><div align="center"><span class="style4">Rank </span></div></td>
              <td width="210"><div align="center"><span class="style4">Download</span></div></td>
			  
		<%	  
			  
			  
	String s1="",s2="",s3="",s4="",s5="",s6="",s7="",s8,s9="",s10,s11,s12,s13;
	int i=0,j=0,k=0;

      	try 
	{
        
          String keyword = request.getParameter("t14");
      		String keys = "ef50a0ef2c3e3a5f";
      		String h1="";
      		String filename="filename.txt";
      		
			SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
			SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");

			Date now = new Date();
		
			String strDate = sdfDate.format(now);
			String strTime = sdfTime.format(now);
			String dt = strDate + "   " + strTime;
			
      		byte[] keyValue = keys.getBytes();
      		Key key = new SecretKeySpec(keyValue, "AES");
      		Cipher c = Cipher.getInstance("AES");
      		c.init(Cipher.ENCRYPT_MODE, key);
      		String search = new String(Base64.encode(keyword.getBytes()));
			String per ="";	
      		String uname=(String)application.getAttribute("uname");
      		out.println(uname);
			String yes="Yes";
			
			String query1="select * from request  where user='"+uname+"' and search='"+yes+"'"; 
			Statement st1=connection.createStatement();
			ResultSet rs1=st1.executeQuery(query1);
		
						
		   	
	if ( rs1.next() )
	   {
			per="Yes";
			String strQuery22 ="insert into search(user,keyword,permission,dt) values('"+uname+"','"+keyword+"','"+per+"','"+dt+"')";
			connection.createStatement().executeUpdate(strQuery22);
			
      		String query="select * from cloudserver"; 
           Statement st=connection.createStatement();
           ResultSet rs=st.executeQuery(query);
	while ( rs.next() )
	   {
		i=rs.getInt(1);
		s2=rs.getString(2);
		s3=rs.getString(6);
		s4=rs.getString(3);
		
		c.init(Cipher.DECRYPT_MODE,key);
		String decryptedValue = new String(Base64.decode(s4.getBytes()));
			
      	
	   
		if(decryptedValue.indexOf(keyword)>0)
		{
			String strQuery1 = "select * from cloudserver where fname='"+s2+"'";
			ResultSet rs11 = connection.createStatement().executeQuery(strQuery1);
			{
			if(rs11.next()==true)
			{
				String rank=rs11.getString(6);
				int updaterank = Integer.parseInt(rank)+1;
				String strQuery2 = "update cloudserver set rank='"+updaterank+"' where fname='"+s2+"'";
				connection.createStatement().executeUpdate(strQuery2);
			}
			}
			
			
					
		%>
            <tr>
              <td height="28"><div align="center"><%=i%></div></td>
              <td><div align="center"><%=s2%></div></td>
              <td><div align="center"><%=s3%></div></td>
              <td><div align="center"><a href="DownloadSearch.jsp?uid=<%=s2%>"> <image src="view.jsp?id=<%=i%>" width="100" height="100"/></a></div></td>
            </tr>
            <%
			
			}else
	   {
	   		
	   }
	   }
	  }
	  
	  else
	   {
	   per="No";
	   
	   String strQuery11= "insert into search(user,keyword,permission,dt) values('"+uname+"','"+keyword+"','"+per+"','"+dt+"')";
	   connection.createStatement().executeUpdate(strQuery11);
	  %>
	  
	   <p><h2>You Don't Have Permission To Access !!!</h2></p><br />
						<p><a href="Download.jsp">Back</a></p>
	   		
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
          
          <p> BACK <a href="UserMain.html">USER MENU</a></p>
          <p>&nbsp;</p>
          <p align="center">&nbsp;</p>
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
			<li><a href="KSearch.jsp">K NEAREST SEARCH </a></li>
			<li><a href="Topk.jsp">TOP K DOCUMENT</a></li>
			<li><a href="index.html">LOG OUT</a></li>
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
