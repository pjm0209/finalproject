<<<<<<< HEAD
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
=======
	$(function(){
		var contextPath = "/mbti";
		
		$('#education-delete-button').click(function(){
			if($('input[type=checkbox]:checked').length<1){
				alert('삭제할 교육을 선택하세요.');
				return;
			}
			
			if(confirm('선택한 교육을 삭제하시겠습니까?')){
				$('form[name=frmDelete]').prop('action', contextPath+'/admin/education/eduDelete');
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
		
		
>>>>>>> branch 'dami' of https://github.com/pjm0209/finalproject.git
	});