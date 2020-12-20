<%@ page import="java.util.*, com.highradius.internship.*"  %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/Dashboard.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/skeleton/2.0.4/skeleton.css" />
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>  

    
   
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nextpage</title>
</head>
<body>
    <div class="product-image">
        <img src="images/abc-logo.png" alt="highradius-logo" class="hrc-logo">
    </div> 
    <div class="hrc-main-logo">
        <img src="images/hrc-logo.svg" alt="highradius-logo" class="hrc-main-logo">
    </div> 

<div class= "containerfull">
<form id="form" action="" method="post"  style = "float:left">
<button class="btn1" id="confirmButton" disabled>Approve</button></form>
<form id="form2" action="" method="post" style = "float:right:45px">
<button class="btn2" id="confirmButton2" disabled>Reject</button>
</form>




    <div class="search-container">
        <form id="myform"  method="post" >
          <input type="text" placeholder="Search....." name="search" id="Search" onkeyup="myFunction()">
        </form>
      </div> 
      <div style="padding-left:16px"></div>


<table class="table" id="myTable" >
    
        <tr>
        	<th>Select</th>
            <th>Order Date</th>
            <th>Approved By</th>
            <th>Order ID</th>
            <th>Customer Name</th>
            <th>Customer ID</th>
            <th>Order Amount</th>
            <th>Approval Status</th>
            <th>Notes</th>
             </tr>        

<%
      String spageid=request.getParameter("page");
      String oid=request.getParameter("search");
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
          out.print("<tr><td>"+"<input type = checkbox name=checkbox class=myCheckBox id="+e.getOrderID()+">"+"</td><td>"+e.getOrder_Date()+"</td><td>"+e.getApproved_By()+"</td><td>"+e.getOrderID()+"</td><td>"+e.getCustomer_Name()+"</td><td>"+e.getCustomer_ID()+"</td><td>"+e.getOrder_Amount()+"</td><td>"+e.getApproval_Status()+"</td><td>"+e.getNotes()+"</td></tr>");
          
        }
      }
      if(oid!=null){
    	  // String spageid1;
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
    </table>
              
    <footer>
    <% int p_id=1,count_Orders=5;String k=request.getParameter("page"); %>
    <div class="pagination"> 
        <a  href="dashboard2.jsp?page=1">&laquo;</a>   
        <a  href="dashboard2.jsp?page=<%  if(Integer.parseInt(k)>1) out.print(Integer.parseInt(k)-1); else out.print("1");%>"> < </a>
        <a>Page</a>
        <a><%  out.print(k);  %></a>
        <a >of</a>
         <a><%out.print(count_Orders); %></a>
        <a href="dashboard2.jsp?page=<%if(Integer.parseInt(k)<count_Orders) out.print(Integer.parseInt(k)+1); else out.print("5");%>"> > </a>
        <a href="dashboard2.jsp?page=<%out.print(count_Orders); %>"> &raquo;</a>
    </div>
        
  </footer>
  </div>
</body>
<footer>
  <script type="text/javascript" src="js/checkbox.js"></script>
  <script type="text/javascript" src="js/search.js"></script>
  
  </footer>
</html>