/**
 * calendar.js
 */

function openModal(info) {
	 
	$('#calendar a').attr("href", "#ex1");
	$('#calendar a').attr("rel", "modal:open");
	/*$('#calendar a').parent().parent().click(function(event){
		$(this).modal();
	});*/
	$('#calendar a').parent().parent().on('click', function() {
      $('#ex1').modal();
    });
	$('#ex1 #modalLabel').text(info.dateStr);
	
	
}







