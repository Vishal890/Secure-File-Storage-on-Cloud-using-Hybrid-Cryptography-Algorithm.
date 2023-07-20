<title>Authentication Page</title>
<%@ include file="connect.jsp" %>
<%@ page import="java.util.Date" %>
<%
   	String name=request.getParameter("userid");      
   	String pass=request.getParameter("pass");
	
    try{
			application.setAttribute("uname",name);
			String sql="SELECT * FROM ownerreg where name='"+name+"' and pass='"+pass+"'";
			Statement stmt = connection.createStatement();
			ResultSet rs =stmt.executeQuery(sql);
			String utype="";
			if(rs.next()){
				response.sendRedirect("DataOwnerMain.html");
			}
			else
			{
				response.sendRedirect("wronglogin.html");
			}
		
	}
	catch(Exception e)
	{
		out.print(e);
	}
%>