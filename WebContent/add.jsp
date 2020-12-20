<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%
int Order_ID=Integer. parseInt(request. getParameter("Order_ID"));
String Order_Date=request.getParameter("Order_Date");
String Customer_Name=request.getParameter("Customer_Name");
int Customer_ID=Integer. parseInt(request. getParameter("Customer_ID"));
//String Order_Amount=request.getParameter("Order_Amount");
int Order_Amount=Integer. parseInt(request. getParameter("Order_Amount"));
String Notes=request.getParameter("Notes");
String name=request.getParameter("name");
String a = "Approved";

try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/winter_internship", "root", "shweta");
Statement st=conn.createStatement();
if(Order_Amount<=10000)
{
	int i=st.executeUpdate("insert into order_details(Order_ID,Order_Date,Customer_Name,Customer_ID,Order_Amount,Notes,Approved_By,Approval_Status)values('"+Order_ID+"','"+Order_Date+"','"+Customer_Name+"','"+Customer_ID+"','"+Order_Amount+"','"+Notes+"','"+name+"','"+a+"')");
}
else
{
    int i=st.executeUpdate("insert into order_details(Order_ID,Order_Date,Customer_Name,Customer_ID,Order_Amount,Notes)values('"+Order_ID+"','"+Order_Date+"','"+Customer_Name+"','"+Customer_ID+"','"+Order_Amount+"','"+Notes+"')");
}
System.out.println("success");
response.sendRedirect("Dashboard.jsp?page=1&myparam=1&name="+name);
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>