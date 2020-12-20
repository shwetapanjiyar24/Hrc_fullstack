package com.highradius.internship;
import com.highradius.internship.dtoOrder;
import java.sql.Connection;
import java.sql.*;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.*;

import java.util.Date;
//import java.lang.*;
//import java.text.ParseException;
//import java.text.SimpleDateFormat;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.*;

public class dashboard {
		 
		  static String dbDriver = "com.mysql.jdbc.Driver"; 
		  static String dbURL = "jdbc:mysql:// localhost:3306/"; 
		  static String dbName = "winter_internship"; 
		  static String dbUsername = "root"; 
		  static String dbPassword = "shweta"; 
		  
		 
		  
		  public static void loadDriver(String dbDriver)
		  {
		    try {
		      Class.forName(dbDriver);
		    } catch (ClassNotFoundException e) {
		      // TODO Auto-generated catch block
		      e.printStackTrace();
		    }
		  }
		  

		  public static Connection getConnection()
		  {
		    Connection con = null;
		    try {
		      con = DriverManager.getConnection(dbURL + dbName,dbUsername, dbPassword);
		    } catch (SQLException e) {
		      // TODO Auto-generated catch block
		      e.printStackTrace();
		    }
		    return con;
		  }
		  	  
		  public static List<dtoOrder> getRecords(int start,int total,String l){
			  String x;
			  if(l.equals("1"))
				  x=">0";
			  else if(l.equals("2"))
				  x=">10000 AND Order_Amount<=50000";
				  
			  else
				  x=">50000";
				  
		    
		    List<dtoOrder> list=new ArrayList<dtoOrder>();
		    
		    
		    try{
		      loadDriver(dbDriver);
		      Connection con = getConnection();
		     // String sql = "select * from order_details  limit "+(start-1)+","+total;
		      String sql = "select * from order_details where Order_Amount"+x+" limit "+(start-1)+","+total;
		      PreparedStatement ps=con.prepareStatement(sql);
		      System.out.println(sql);
		      ResultSet rs=ps.executeQuery();
		      while(rs.next()){
		        dtoOrder e=new dtoOrder();
		        e.setOrderID(rs.getInt(1));
		        e.setCustomer_Name(rs.getString(2));
		        e.setCustomer_ID(rs.getInt(3));
		        e.setOrder_Amount(rs.getInt(4));
		        e.setApproval_Status(rs.getString(5));
		        e.setApproved_By(rs.getString(6));
		        e.setNotes(rs.getString(7));
		        e.setOrder_Date(rs.getDate(8));
		        list.add(e);
		      } 
		      con.close();
		    }catch(Exception e){System.out.println(e);}
		    return list;
		  }

		  public static List<dtoOrder> getRecords(String oid,int x,int y,String l){
			  String x1;
			  if(l.equals("1"))
				  x1="<=10000";
			  else if(l.equals("2"))
				  x1=">10000 AND Order_Amount<=50000";
			  else
				  x1=">50000";
			 
			  String sql ="Select * from order_details where Order_Amount"+x1+" AND Order_ID LIKE ? limit ?,?";

			  //String sql ="Select * from order_details where  Order_ID LIKE ? limit ?,?";
		     // PreparedStatement ps = cn.prepareStatement();
		     
		      List<dtoOrder> list=new ArrayList<dtoOrder>();
		      try{
		        loadDriver(dbDriver);
		        Connection con = getConnection();
		        PreparedStatement ps=con.prepareStatement(sql);
		        ps.setString(1, oid + '%');
		        ps.setInt(2,(x-1));
		        ps.setInt(3,y);
		        ResultSet rs=ps.executeQuery();
		        while(rs.next()){
		          dtoOrder e=new dtoOrder();
		          e.setOrderID(rs.getInt(1));
		          e.setCustomer_Name(rs.getString(2));
		          e.setCustomer_ID(rs.getInt(3));
		          e.setOrder_Amount(rs.getInt(4));
		          e.setApproval_Status(rs.getString(5));
		          e.setApproved_By(rs.getString(6));
		          e.setNotes(rs.getString(7));
		          e.setOrder_Date(rs.getDate(8));
		          list.add(e);
		        }
		        con.close();
		      }catch(Exception e){System.out.println(e);}
		      return list;
		    }

}
		       
		