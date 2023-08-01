	$(function(){
		var contextPath = "/mbti";
		
		$('div[name=mbtiList]').click(function(){
			location.href=contextPath+"/admin/mbti/mbtiList";
		});
		$('div[name=mbtiManage]').click(function(){
			location.href=contextPath+"/admin/mbti/mbti";
		});
	});