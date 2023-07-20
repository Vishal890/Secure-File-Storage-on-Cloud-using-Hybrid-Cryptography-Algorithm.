/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.register;

import com.database.Database;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author KishanVenky
 */
@MultipartConfig(maxFileSize=16*1024*1024)
public class insertdata extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       PrintWriter out=response.getWriter();
        try{
            String userid=request.getParameter("userid");
             String pass=request.getParameter("pass");
              String email=request.getParameter("email");
               String mobile=request.getParameter("mobile");
                String address=request.getParameter("address");
                 String dob=request.getParameter("dob");
                  String gender=request.getParameter("gender");
                      String pincode=request.getParameter("pincode");
                 String location=request.getParameter("location");
                  Part image=request.getPart("pic");
                InputStream in=image.getInputStream();
                
                String query1="select count(*) from user  where name='"+userid+"'";
                int c=0;
            ResultSet r=Database.getExecuteQuery(query1);
            while(r.next()){
               c=r.getInt(1); 
            }
            if(c==0){
                Connection connection=Database.getCon();
                PreparedStatement ps=connection.prepareStatement("insert into user(name,pass,email,mobile,addr,dob,gender,pin,location,imagess) values(?,?,?,?,?,?,?,?,?,?)");
						ps.setString(1,userid);
						ps.setString(2,pass);
						ps.setString(3,email);	
						ps.setString(4,mobile);
						ps.setString(5,address);
						ps.setString(6,dob);
						ps.setString(7,gender);
						ps.setString(8,pincode);
						ps.setString(9,location);
                                                if(in!=null){
                                                 ps.setBlob(10,in);   
                                                }
                                                int i=ps.executeUpdate();
                                                if(i>0){
                                               response.sendRedirect("Register.html?msg=Registration successful...!!!");     
                                                }else{
                                                  response.sendRedirect("Register.html?msg=Registration failed...!!!");     
                                                
                                                }
            }else{
              response.sendRedirect("Register.html?msg=UserName Already Exist...!!!");     
                                                
            }
            
        }catch(Exception e){
          out.println(e);  
        }
            
      
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
