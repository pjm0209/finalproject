/**
 * calendar.js
 */

$(function(){
	$('#bt1').click(function(){
		$('.fc-daygrid-day-bg').text("버튼1누름");	
	});
	
	$('#bt2').click(function(){
		$('.fc-daygrid-day-bg').html("버튼2누름");
	});
});	

