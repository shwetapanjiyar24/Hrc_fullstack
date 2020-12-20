let searchParams = new URLSearchParams(window.location.search);
            		  let param = searchParams.get('myparam');
            		  let name = searchParams.get('name');
            		  console.log("dfsdf",param);
            		  var input,filter;
            		  var z
            		  var x=document.getElementById('Search').value;
            		  console.log("sdfd",x);
            		  function myFunction() {
            			  var   table, tr, td, i, txtValue;
            			  input = document.getElementById("Search");
            			  filter = input.value.toUpperCase();
            			  console.log(filter);
           
            				  table = document.getElementById("myTable");
            				  tr = table.getElementsByTagName("tr");
            				  for (i = 0; i < tr.length; i++) {
            				    td = tr[i].getElementsByTagName("td")[3];
            				    if (td) {
            				      txtValue = td.textContent || td.innerText;
            				      if (txtValue.toUpperCase().indexOf(filter) > -1) {
            				        tr[i].style.display = "";
            				      } else {
            				        tr[i].style.display = "none";
            				      }
            				    }       
            				  }
            			  }
            			
            		  $(document).ready(function(){$('#myform').submit(function ()
            				  {
            				console.log("hahaha",filter);   
            			  var action = 'dashboard2.jsp?page=1&myparam='+param+'&name='+name+"&Search="+filter;
            				      // compute action here...
            				      
            				      $(this).attr('action', action);
            				  });});
            		 
            				 // $("#myform").attr('action','Dashboard.jsp?page=1&myparam='+param);
            		  $(document).ready(function(){
            		        $('a[href^="dashboard2.jsp?"]').each(function(){ 
            		            var oldUrl = $(this).attr("href"); // Get current url
            		            var newUrl =oldUrl+"&myparam="+param+'&name='+name; 
            		            $(this).attr("href", newUrl); // Set herf value
            		            console.log("new url ",newUrl);
            		        });
            		    });
            		  
            		  $(document).ready(function(){$('#myform1').submit(function ()
            				  {
            				console.log("hahaha",filter);   
            			  var action = 'Dashboard.jsp?page=1&myparam='+param+'&name='+name+"&Search="+filter;
            				      // compute action here...
            				      
            				      $(this).attr('action', action);
            				  });});
            		  
            		  $(document).ready(function(){
          		        $('a[href^="Dashboard.jsp?"]').each(function(){ 
          		            var oldUrl = $(this).attr("href"); // Get current url
          		            var newUrl =oldUrl+"&myparam="+param+'&name='+name; 
          		            $(this).attr("href", newUrl); // Set herf value
          		            console.log("new url ",newUrl);
          		        });
          		    });