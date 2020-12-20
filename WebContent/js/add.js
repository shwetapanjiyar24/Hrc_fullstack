const openModalButtons = document.querySelectorAll('[data-modal-target]')  
const closeModalButtons = document.querySelectorAll('[data-close-button]')
const overlay = document.getElementById('overlay') 
const submitElement = document.querySelector(".btn3");


submitElement.addEventListener( 'click',function(){
	  console.log("Hello Element");
	});

	openModalButtons.forEach(function(button) {
	  button.addEventListener('click', function(){
	    const modal = document.querySelector(button.dataset.modalTarget)
	    openModal(modal) 
	  })
	})

	overlay.addEventListener('click', function() {
	  const modals = document.querySelectorAll('.modal.active')
	  modals.forEach(function(modal) {
	    closeModal(modal)
	  })
	})
	closeModalButtons.forEach(function(button) {
	  button.addEventListener('click', function(){
	    const modal = button.closest('.modal')
	    closeModal(modal)
	  })
	})

	function openModal(modal) {
	  if (modal == null) return
	  modal.classList.add('active')
	  overlay.classList.add('active')
	}

	function closeModal(modal) {
	  if (modal == null) return
	  modal.classList.remove('active')
	  overlay.classList.remove('active')
	}
	
    var boxes = $('.myCheckBox');
	boxes.on('change', function () {
		
		$('input[type="checkbox"]').not(this).prop('checked', false);
		var somethingChecked = $("input[name='checkbox']:checked");
		$(this).closest('tr').toggleClass('yellow', $(this).is(':checked'));
		var checkedIds = somethingChecked.map(function() {
		    return this.id;
		});
		
		
	    $('#confirmButton').prop('disabled', !boxes.filter(':checked').length);
	    console.log(somethingChecked);
	    console.log(checkedIds[0]);
	   // console.log( document.getElementById("oid").value);
	   
	    document.getElementById("oid").value =checkedIds[0];
	}).trigger('change');
	
	
	 