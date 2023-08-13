
$(function(){
	
	var contextPath = "/mbti";
	
	CKEDITOR.replace("p_content", {
		uploadUrl: contextPath + "/bookImages",					
		filebrowserUploadUrl:  contextPath + "/bookImages", //파일은 이 경로로 업로드
		height : 500
	});	
	
	
	/*var addIconImage = "<span class='board-side-icon'><i class='fas fa-fw fa-check'></i></span>";*/
	var flag = $('#requestValue').val();
	console.log("1");
	console.log(addIconImage);
	console.log(flag);
	$('.addIcon').each(function(){
		console.log("2");
		
		var sideBodyName = $(this).find('a').text();
		if( flag == null) {
			$(this).addClass('fas fa-fw fa-check');
			console.log("3");
		}
		console.log("4");
	});
	
	
});
	