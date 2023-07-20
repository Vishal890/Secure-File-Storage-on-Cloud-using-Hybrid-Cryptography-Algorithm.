<%@ page import="java.sql.*,java.util.Random" %>
<%@ include file="connect.jsp" %>
<html><style type="text/css">
<!--
body {
	background-color: #FFFFFF;
}
-->
</style>
<body>
<center>&nbsp;</center>
<br><br><br>
  <%
  		   int mid = Integer.parseInt(request.getParameter("uid"));
		  
          
  
  
   try {
	   
     	String str="Yes";
       Statement st1 = connection.createStatement();
       String query1 ="update request set ownerper='"+str+"' where id='"+mid+"' ";
	   st1.executeUpdate (query1);
	  
	 
	   
           
	   connection.close();




	       
          
          }
         
          catch(Exception e)
          {
            out.println(e.getMessage());

          }
   
   
   response.sendRedirect("OwnerGrant.jsp");
		 
		  
		  
%>



</body></html>