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
		
		
		$('#location-delete-button').click(function(){
			if($('input[type=checkbox]:checked').length<1){
				alert('삭제할 교육장을 선택하세요.');
				return;
			}
			
			if(confirm('선택한 교육장을 삭제하시겠습니까?')){
				$('form[name=frmDelete]').prop('action', contextPath+'/admin/education/locDelete');
				$('form[name=frmDelete]').submit();
			}
		});
		
		
		$('#teacher-delete-button').click(function(){
			if($('input[type=checkbox]:checked').length<1){
				alert('삭제할 강사를 선택하세요.');
				return;
			}
			
			if(confirm('선택한 강사를 삭제하시겠습니까?')){
				$('form[name=frmDelete]').prop('action', contextPath+'/admin/education/teaDelete');
				$('form[name=frmDelete]').submit();
			}
		});
		
		$('#applicant-delete-button').click(function(){
			if($('input[type=checkbox]:checked').length<1){
				alert('거절할 신청자를 선택하세요.');
				return;
			}
			
			if(confirm('선택한 신청자를 거절하시겠습니까?')){
				$('form[name=frmDelete]').prop('action', contextPath+'/admin/education/appliDelete');
				$('form[name=frmDelete]').submit();
			}
		});
		
	});