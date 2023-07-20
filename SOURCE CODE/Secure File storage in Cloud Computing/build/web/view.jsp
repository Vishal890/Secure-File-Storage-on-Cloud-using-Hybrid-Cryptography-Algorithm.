<%-- 
    Document   : view
    Created on : Dec 13, 2016, 10:25:35 AM
    Author     : java4
--%>
<%@ include file="connect.jsp" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>

<%
    Blob image = null;
    Connection con = null;
    byte[] imgData = null;
    Statement stmt = null;
    ResultSet rs = null;
    String id = request.getParameter("id");
   
    try {
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/securefile", "root", "root");
        stmt = con.createStatement();
            rs = stmt.executeQuery("select image from cloudserver where id = '" + id + "' ");
        if (rs.next()) {
            image = rs.getBlob(1);
            imgData = image.getBytes(1, (int) image.length());
        } else {
            out.println("Display Blob Example");
            out.println("image not found for given image>");
            return;
        }
// display the image
        response.setContentType("image/gif");
        OutputStream o = response.getOutputStream();
        o.write(imgData);
        o.flush();
        o.close();
    } catch (Exception e) {
        out.println("Unable To Display image");
        out.println("Image Display Error=" + e.getMessage());
        return;
    } finally {
        try {
            rs.close();
            stmt.close();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

%> 