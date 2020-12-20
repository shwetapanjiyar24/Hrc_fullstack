<%@ page import="java.util.*, com.highradius.internship.*,javax.servlet.http.HttpSession" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
    
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
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
<button data-modal-target="#modal" class="btn1" >Add</button>
<button data-modal-target="#modal1" class="btn2" id ="confirmButton">Edit</button>



    <div class="search-container">
        <form id="myform1" method="post" >
          <input type="text" placeholder="Search....." name="search" id="Search" onkeyup="myFunction()">
        </form>
      </div> 
      <div style="padding-left:16px"></div>
      <div class = "jsaddition"> </div>
      


<%! String oid;

%>

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
      oid=request.getParameter("search");
      System.out.println("its done  "+spageid);
      System.out.println("test  "+oid);
      
      if(oid==null)
      {
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
    </table>
<div class="modal" id="modal">
        <div class="modal-header">
          <div class="title"><h3 class="name" style="font-size:2.5rem">ADD ORDER</h3></div>  
          
          <button data-close-button class="close-button" >&times;</button>
        </div>
        <div class = "container">
        <div class="modal-body">
          <form id="addForm" action ="" method="post">
            <br>
              Order ID:<br> <input type="number" name="Order_ID">
              <br>
              Order Date: <br> <input type="date" name="Order_Date">
              <br>
              
              Customer Name:<br> <input type="text" name="Customer_Name">
              <br>
              Customer ID:<br> <input type="number" name="Customer_ID">
              <br>
              Order Amount:<br> <input type="text" name="Order_Amount">
              <br>
              Notes:<br> <input type="text" name="Notes">
              <br>
              <button class="btn3">ADD</button>
           </form>
           </div>
        </div>
      </div>
      <div id="overlay"></div>
  
      <!-- Here comes with the edit button -->
      <div class="modal" id="modal1">
        <div class="modal-header">
          <div class="title" style="font-size:2.5rem">EDIT ORDER</div>  
          <button data-close-button class="close-button">&times;</button>
        </div>
        <div class="modal-body">
          <form id="editForm" action = ""  method="post">
            <br>
              Order ID: <br> <input type="number" name="Order_ID" id="oid">
              <br>
              Order Amount:<br> <input type="number" name="orderAmount" id="orderAmount" onkeyup="approvedBy()">
              <br>
              Notes:<br> <input type="text" name="Notes">
              <br>
              Approved By:<br> <input type="text" id="ApprovedBy" name="ApprovedBy" >
              <br>
              <button class="btn4" id="edit">EDIT</button>
              
              <script type="text/javascript">
              
              
              $(document).ready(function() {
            	    var $submit = $('.btn3');
            	    $submit.prop('disabled', true);
            	    $('input[type="text"]').on('input change', function() { //'input change keyup paste'
            	        $submit.prop('disabled', !$(this).val().length);
            	    });
            	});
            		      $(document).ready(function(){$('#addForm').submit(function ()
            				  { 
            			  var action = 'add.jsp?name='+name;
            			  console.log("add");
            				      $(this).attr('action', action);
            				      
            				  });});
            		      $(document).ready(function() {
                      	    var $submit = $('.btn4');
                      	    $submit.prop('disabled', true);
                      	    $('input[type="text"]').on('input change', function() { //'input change keyup paste'
                      	        $submit.prop('disabled', !$(this).val().length);
                      	    });
                      	});
            		      
            		  $(document).ready(function(){$('#editForm').submit(function ()
            				  { 
            			  var action = 'edit.jsp?name='+name;
            				      $(this).attr('action', action);
            				  });});
            		  
            		
              function approvedBy()
				{
				orderAmount = document.getElementById("orderAmount").value;
				if(orderAmount<=10000)
				{	
					let n = searchParams.get('name');
					document.getElementById("ApprovedBy").value=n;
				}
				else if(orderAmount>10000 && orderAmount<=50000)
				{
					document.getElementById("ApprovedBy").value="null";
				}
				else
				{
					document.getElementById("ApprovedBy").value="null";
				}
				}
				
				</script>
           </form>
        </div>
      </div>
      <div id="overlay"></div> <!-- edited portion -->

    <footer>
    <% int p_id=1,count_Orders=5;String k=request.getParameter("page"); %>
    <div class="pagination"> 
        <a  href="Dashboard.jsp?page=1">&laquo;</a>   
        <a  href="Dashboard.jsp?page=<%  if(Integer.parseInt(k)>1) out.print(Integer.parseInt(k)-1); else out.print("1");%>" > < </a>
        <a>Page</a>
        <a><%  out.print(k);  %></a>
        <a >of</a>
         <a><%out.print(count_Orders); %></a>
        <a href="Dashboard.jsp?page=<%if(Integer.parseInt(k)<count_Orders) out.print(Integer.parseInt(k)+1); else out.print("5");%>"> > </a>
       
        
        <a href="Dashboard.jsp?page=<%out.print(count_Orders); %>"> &raquo;</a>
    </div>
  </footer>
  </div>
</body>
<footer>
  <script type="text/javascript" src="js/add.js"></script>
  <script type="text/javascript" src="js/search.js"></script>
   
  </footer>
</html>