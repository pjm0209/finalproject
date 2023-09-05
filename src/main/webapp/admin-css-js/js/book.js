$(function() {

	$('#bookDeleteBtn').click(function() {
		var cnt = $("table input[type='checkbox']:checked").length;
		if(cnt < 1){
			$('#alertModalBody').html("삭제할 제품을 체크하세요");
			$('#alertModalBtn').trigger('click');
			return false;
		}
		//유효성 검사
		var result = '';
		$("table input[type='checkbox']:checked:not(#check-All)").each(function(idx, item) {
			result += "<input type='text' name='stockBookItems[" + idx + "].bookNo' value='" + $(this).val() + "'>";
			result += "<input type='text' name='stockBookItems[" + idx + "].bookImgName' value='" + $(this).parent().parent().find('#bookImgName2').val() + "'>";
			alert($(this).parent().parent().find('#bookImgName2').val());
			$('#frmDeleteMulti').html(result);
		});

		if (cnt < 1) {
			alert("삭제할 상품을 선택해주세요.2");
			return false;
		} else {
			if ($('#check-All').is(':checked')) {
				cnt = cnt - 1;
			}
			if (confirm(cnt + "개 상품을 삭제할까요?")) {
				$('#frmDeleteMulti').submit();
			}
		}
	});


	

});



