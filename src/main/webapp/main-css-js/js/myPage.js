var contextPath = "/mbti";

$(function(){
	/*내 게시글 전체체크*/
	$('.chkAll').click(function(){
		$('.ck input[type=checkbox]').prop('checked', this.checked);
	});
	
	//다중게시글 삭제버튼 숨기기
    $('#boardMultiDel').hide();
    
    //게시글 체크박스 체크유무 검사
    $('table input[type=checkbox]').click(function() {
		var count = $('tbody input[type=checkbox]:checked').length;
		
		if(count > 0) {
			$('#boardMultiDel').show();
			$('span.boardDelCount').html(count + "건이 선택되었습니다.");
		} else {
			$('#boardMultiDel').hide();
			$('span.boardDelCount').html("");
		}
	});
    
    //게시글 다중삭제 이벤트
    $('#boardMultiDel').click(function() {
		$('#confirmModalBody').html('해당 게시글을 삭제하겠습니까?');
		$('#confirmOk').attr('onclick', '$("form[name=boardDelMultiFrm]").submit();');
		$('#confirmModalBtn').trigger('click');		
	});
});