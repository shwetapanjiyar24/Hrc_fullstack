package com.highradius.internship;

import com.highradius.internship.pojo;
import com.highradius.internship.dtoOrder;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Date;
//import java.lang.*;
//import java.text.ParseException;
//import java.text.SimpleDateFormat;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
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
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class dummyServlet
 */
@WebServlet(name="json",urlPatterns="/json")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 String url = "jdbc:mysql://localhost:3306/winter_internship";
		   String username = "root";
		   String password = "shweta";
		   Connection conn=null;
		   PrintWriter out = response.getWriter();
			 response.setContentType("text/html");
			 response.setCharacterEncoding("UTF-8");
			 Gson gson=new Gson();
			 int flag=Integer.parseInt(request.getParameter("flag"));
			 System.out.println("flag="+request.getParameter("flag"));
			 ArrayList<pojo> arr=new ArrayList<pojo>();
			 
	  try{
	   //String driver = "com.mysql.jdbc.Driver";
		  
	   Class.forName("com.mysql.jdbc.Driver");
	   conn = DriverManager.getConnection(url,username,password);
	   Statement stmt=conn.createStatement();
	   if(flag==1) {
	   ResultSet rs = stmt.executeQuery("Select * from user_details");
	   System.out.println("Connected");
	     
	   
	 // HttpSession session = request.getSession();
	   while(rs.next()) {
		   pojo p=new pojo();
		   p.setusername(rs.getString("username"));
		   p.setpassword(rs.getString("password"));
		   p.setLevel(rs.getString("user_level"));
		   arr.add(p);
		   
		  // session.setAttribute("user_level",rs.getString("user_level"));
		   
		   
		     }
	   
	   out.print(gson.toJson(arr).toString());
		
	  }
	  }
	   catch(Exception e) {
		  System.out.println(e);
	  }
		
		
		// String data = gson.toJson(resp);
		 out.flush();
	}

}
