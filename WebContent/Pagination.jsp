<%@ page import="java.util.*, com.highradius.internship.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

 <link rel="stylesheet" href="css/Dashboard.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/skeleton/2.0.4/skeleton.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>  
<title>Insert title here</title>
</head>
<body>

<%! String oid;%>
<% String spageid=request.getParameter("page");
oid=request.getParameter("search");
// String k=request.getParameter("myparam");
//k1+=k;
System.out.println("its done  "+spageid);
System.out.println("test  "+oid);
//System.out.println("login "+k);

if(oid==null)//ok
{
  //int pageid=Integer.parseInt(spageid);
   String k=request.getParameter("myparam");
int pageid=Integer.parseInt(spageid);
int total=6;
  if(pageid==1){}
  else{
    pageid=pageid-1;
    pageid=pageid*total+1;
    
  }
  List<dtoOrder> list=dashboard.getRecords(pageid,total,k);
  for(dtoOrder e:list){
    out.print("<tr><td>"+"<input type = checkbox  class=myCheckBox id="+e.getOrderID()+">"+"</td><td>"+e.getOrder_Date()+"</td><td>"+e.getApproved_By()+"</td><td>"+e.getOrderID()+"</td><td>"+e.getCustomer_Name()+"</td><td>"+e.getCustomer_ID()+"</td><td>"+e.getOrder_Amount()+"</td><td>"+e.getApproval_Status()+"</td><td>"+e.getNotes()+"</td></tr>");
    
  }
}
if(oid!=null){
	   String spageid1;
	  int total=6;
	  String k1=request.getParameter("myparam");
	  String k=request.getParameter("page");
	  int pageid=Integer.parseInt(k);
	  System.out.println("pageid=="+pageid);
    if(pageid==1){}
   else{
     pageid=pageid-1;
      pageid=pageid*total+1;
    }
	  List<dtoOrder> list1=dashboard.getRecords(oid,pageid,total,k1);
	  for(dtoOrder e:list1){
	        out.print("<tr><td>"+"<input type = checkbox class=myCheckBox>"+"</td><td>"+e.getOrder_Date()+"</td><td>"+e.getApproved_By()+"</td><td>"+e.getOrderID()+"</td><td>"+e.getCustomer_Name()+"</td><td>"+e.getCustomer_ID()+"</td><td>"+e.getOrder_Amount()+"</td><td>"+e.getApproval_Status()+"</td><td>"+e.getNotes()+"</td></tr>");
	      }

}

%>



  




</body>
</html>