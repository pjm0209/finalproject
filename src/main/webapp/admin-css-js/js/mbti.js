	$(function(){
		var contextPath = "/mbti";
		
		$('div[name=mbti]').click(function(){
			location.href=contextPath+"/admin/mbti/mbti";
		});
		
		$('#check-All').click(function () {
    		const isChecked = $(this).prop('checked');
    		$('.check').prop('checked', isChecked);
  	    });
		
	});