<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>


<%
String OrderID=request.getParameter("Order_ID");
String name=request.getParameter("name");


try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/winter_internship", "root", "shweta");
PreparedStatement ps=null;
String Approval_Status=request.getParameter("Approval_Status");
String k=request.getParameter("myparam");
String sql="";
if(k.equals("2"))
{
sql+="Update order_details set Approved_By=?,Approval_Status='Rejected' where Order_ID="+OrderID;
 //sql+="UPDATE order_details SET Approved_By=?,Approval_Status =  'Rejected' WHERE Order_Amount>10000 AND Order_Amount<=50000 AND Order_ID=" +OrderID  ;

}
else
{
	sql+="Update order_details set Approved_By=?,Approval_Status='Rejected' where Order_ID="+OrderID;
	//sql+="UPDATE order_details SET Approved_By=?,Approval_Status =  'Rejected'  WHERE  Order_Amount>50000 AND Order_ID="+OrderID ;
}
ps = conn.prepareStatement(sql);
ps.setString(1,name);


int i = ps.executeUpdate();
if(i > 0)
{
	response.sendRedirect("dashboard2.jsp?page=1&myparam="+k+"&name="+name);
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