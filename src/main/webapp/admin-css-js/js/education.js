	$(function(){
		var contextPath = "/mbti";
		
		$('#education-delete-button').click(function(){
			if($('input[type=checkbox]:checked').length<1){
				alert('삭제할 교육을 체크하세요.');
				return;
			}
			
			if(confirm('선택한 교육을 삭제하시겠습니까?')){
				$('form[name=frmDelete]').prop('action',contextPath+'/admin/education/eduDelete');
				$('form[name=frmDelete]').submit();
			}
		});
	});