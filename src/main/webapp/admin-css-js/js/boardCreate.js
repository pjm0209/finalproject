$(function() {
	$('.checkbox_group > .use_off').on("click", function(){
		$(this).nextAll('input[type=hidden]').val('N');
		$(this).next().attr('class', 'use_on');
		$(this).attr('class', 'use_off on');
	});
	
	$('.checkbox_group > .use_on').on("click", function(){
		$(this).nextAll('input[type=hidden]').val('Y');
		$(this).prev().attr('class', 'use_off');
		$(this).attr('class', 'use_on on');
	});
});

const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]');
const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl));