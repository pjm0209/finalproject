
$(function(){
	
	var contextPath = "/mbti";
	
	CKEDITOR.replace("p_content", {
		uploadUrl: contextPath + "/bookImages",					
		filebrowserUploadUrl:  contextPath + "/bookImages", //파일은 이 경로로 업로드
		height : 500
	});	
});
	