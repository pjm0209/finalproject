$(function(){
	$('')
});

//게시글목록 페이징 함수
function pageFunc(curPage) {
	$('input[name="currentPage"]').val(curPage);
	$('form[name="paginForm"]').submit();
}