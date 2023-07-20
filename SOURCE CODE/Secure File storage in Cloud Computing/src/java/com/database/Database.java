/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author KishanVenky
 */
public class Database {
    
    static Connection con=null;
    static ResultSet rs=null;
    static int i=0;
    public static Connection getCon(){
        try{
          Class.forName("com.mysql.jdbc.Driver");
     con=DriverManager.getConnection("jdbc:mysql://localhost:3306/securefile","root","root");
        }catch(Exception e){
        System.out.println(e);
        }
       return con;
    }
    
   public static ResultSet getExecuteQuery(String query){
       try{
           
          Statement st=getCon().createStatement();
          rs=st.executeQuery(query);
           
       }catch(Exception e){
         System.out.println(e);  
       }
      
       return rs;
   } 
    
   public static int getExecuteUpdate(String query){
     try{
           
          Statement st=getCon().createStatement();
          i=st.executeUpdate(query);
           
       }catch(Exception e){
         System.out.println(e);  
       }
       
       return i;
   }
}
