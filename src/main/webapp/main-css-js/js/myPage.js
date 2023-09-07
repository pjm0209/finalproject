var contextPath = "/mbti";

$(function(){
	/*내 게시글 전체체크*/
	$('.chkAll').click(function(){
		$('.ck input[type=checkbox]').prop('checked', this.checked);
	});
});