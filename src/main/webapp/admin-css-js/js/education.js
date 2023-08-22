var contextPath = "/mbti"	
	
	$(function(){
		$('#check-All').click(function(){
			$('.board-checkbox').prop('checked', this.checked);
		});	
		
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
		
		
		
		//강의 등록 유효성검사
		$('#save-educationWrite').click(function(){
			var teaNo = $('#getTeaName').val();
			
			if(teaNo == 0){
				$('#alertModalBody').html('강사명을 선택하세요.');
				$('#alertModalBtn').trigger('click');
				$('#getTeaName').focus();
				return false;
			}
			
			$('form[name=educationWrite-frm]').submit();
		});
		
		//교육 신청 승인 처리
		$('#applicant-edit-button').click(function(){
			var count = $('input[type=checkbox]:checked').length;
			
			if(count < 1) {
				$('#alertModalBody').html('신청자를 선택하세요.');
				$('#alertModalBtn').trigger('click');
				return false;
			}
			
			$('form[name=frmDelete]').submit();
			
		});
		
		//교육 신청 거절 처리
		$('#applicant-delete-button').click(function(){
			var count = $('input[type=checkbox]:checked').length;
			
			if(count < 1) {
				$('#alertModalBody').html('신청자를 선택하세요.');
				$('#alertModalBtn').trigger('click');
				return false;
			}
	
		 $('#confirmModalBody').html('선택한 신청자를 거절하시겠습니까?');		 		 
         $('#confirmOk').attr('onclick', 'educationAppDel()');		          
         $('#confirmModalBtn').trigger('click');

		});
		
		//교육 등록 달력
		$('#startDay').datepicker({
			dateFormat:'yy-mm-dd',
			changeYear:true,
			dayNamesMin:['일','월','화','수','목','금','토'],
			monthNames:['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
		});
		
		
	});
	
	function educationAppDel() {
		$('#eduAppDelFrm').attr('action', contextPath + '/admin/education/appliDelete');
		$('form[name=frmDelete]').submit();
	}
	
	
	