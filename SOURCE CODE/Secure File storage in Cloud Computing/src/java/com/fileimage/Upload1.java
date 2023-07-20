/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fileimage;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.security.Key;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.util.Date;
import java.text.SimpleDateFormat;
import javax.crypto.Cipher;
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
public class Upload1 extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out=response.getWriter();
          	try 
	{
      		String file=request.getParameter("t42");
      		String cont=request.getParameter("text2");
      		String mac =request.getParameter("t4");
      		
                Part p=request.getPart("image");
             
           
                
                InputStream in=p.getInputStream();
                
                
                
			SimpleDateFormat sdfDate = new SimpleDateFormat(
					"dd/MM/yyyy");
			SimpleDateFormat sdfTime = new SimpleDateFormat(
					"HH:mm:ss");

			Date now = new Date();

			String strDate = sdfDate.format(now);
			String strTime = sdfTime.format(now);
			String dt = strDate + "   " + strTime;
			
      		KeyPairGenerator kg = KeyPairGenerator.getInstance("RSA");
				Cipher encoder = Cipher.getInstance("RSA");
				KeyPair kp = kg.generateKeyPair();

				Key pubKey = kp.getPublic();

				byte[] pub = pubKey.getEncoded();
//				System.out.println("PUBLIC KEY" + pub);
		
				String pk = String.valueOf(pub);
				String rank="0";
                                
                                Class.forName("com.mysql.jdbc.Driver");	
		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/securefile","root","root");

			 Statement st=connection.createStatement();
	 Statement st1=connection.createStatement();
				String user="Data Owner";
				String task="Upload";
				
				String strQuery2 = "insert into transaction(user,fname,sk,task,dt) values('"+user+"','"+file+"','"+pk+"','"+task+"','"+dt+"')";
				int i=connection.createStatement().executeUpdate(strQuery2);
			long startTime = System.nanoTime();
       PreparedStatement pst=connection.prepareStatement("insert into cloudserver values(null,'"+file+"','"+cont+"','"+mac+"','"+pk+"','"+rank+"','"+dt+"',?)");
//st.executeUpdate("insert into  cloudserver(fname,ct,trapdoor,sk,rank,dt) values ('"+file+"','"+cont+"','"+mac+"','"+pk+"','"+rank+"','"+dt+"')"); 
pst.setBlob(1,in);
int ii=pst.executeUpdate();
long endTime   = System.nanoTime();
long totalTime = endTime - startTime;
	int k=st1.executeUpdate("insert into  uploadtime values (null,'"+file+"','"+totalTime+"')"); 
        if(i>0&&ii>0&&k>0){
          response.sendRedirect("Upload1.jsp");  
        }else{
         response.sendRedirect("Uploa.jsp?msg=Uploading Failed");     
        }
         connection.close();
          }
         
          catch(Exception e)
          {
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
