<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>


<%
String Order_ID=request.getParameter("Order_ID");
String Order_Amount=request.getParameter("orderAmount");
String Notes=request.getParameter("Notes");
String ApprovedBy=request.getParameter("ApprovedBy");
String name=request.getParameter("name");

try
{
	System.out.println(ApprovedBy+" testing"+Order_Amount);
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/winter_internship", "root", "shweta");
PreparedStatement ps=null;
int s=Integer.parseInt(Order_Amount);
String Approval_Status="";
if(s<=10000)
{
	Approval_Status="Approved";
}
else
	Approval_Status="Awaiting Approval"; 
	
String sql="Update order_details set Order_Amount=?,Notes=?,Approved_By=?,Approval_Status=? where Order_ID="+Order_ID;
ps = conn.prepareStatement(sql);


//ps.setString(1,Order_ID);
ps.setInt(1,s );
ps.setString(2, Notes);
ps.setString(3, ApprovedBy);
ps.setString(4,Approval_Status);

int i = ps.executeUpdate();
if(i > 0)
{
	response.sendRedirect("Dashboard.jsp?page=1&myparam=1&name="+name);
}
else
{
out.print("Unsuccessful.");
}
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}

%>