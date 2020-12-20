var x	
var boxes = $('.myCheckBox');
	boxes.on('change', function () {
		
		$('input[type="checkbox"]').not(this).prop('checked', false);
		var somethingChecked = $("input[name='checkbox']:checked");
		$(this).closest('tr').toggleClass('yellow', $(this).is(':checked'));
		var checkedIds = somethingChecked.map(function() {
		    return this.id;
		});
		console.log('I am here');
		
		 document.getElementById("confirmButton").disabled = false;
		 document.getElementById("confirmButton2").disabled = false;
	    console.log(somethingChecked);
	    console.log(checkedIds[0]);
	    x=checkedIds[0];
	}).trigger('change');
	
	 $(document).ready(function(){$('#form').submit(function ()
			  {
		  var action = 'approve.jsp?myparam='+param+"&Order_ID="+x+'&name='+name;
			      console.log("ffff",action)
			      $(this).attr('action', action);
			  });});
	 $(document).ready(function(){$('#form2').submit(function ()
			  {
		  var action = 'reject.jsp?myparam='+param+"&Order_ID="+x+'&name='+name;
			      console.log("ffff",action)
			      $(this).attr('action', action);
			  });});
	 document.getElementById("confirmButton").disabled = true;
	 document.getElementById("confirmButton2").disabled = true;