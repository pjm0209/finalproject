var contextPath = "/mbti"	
	
	$(function(){
		//전체 선택
		$('#check-All').click(function(){
			$('.board-checkbox').prop('checked', this.checked);
		});	
		
		
		//교육 삭제 유효성 검사
		$('#education-delete-button').click(function(){
			var count = $('input[type=checkbox]:checked').length;
			
			if(count < 1) {
				$('#alertModalBody').html('삭제할 교육을 선택하세요.');
				$('#alertModalBtn').trigger('click');
				return false;
			}
			
			$('#confirmModalBody').html('선택한 교육을 삭제하시겠습니까?');		
			 $('#confirmOk').attr('onclick', 'educationDel()');	 		 
	         $('#confirmModalBtn').trigger('click');
		});
		
		
		//교육장 삭제 유효성 검사
		$('#location-delete-button').click(function(){
			var count = $('input[type=checkbox]:checked').length;
			
			if(count < 1) {
				$('#alertModalBody').html('삭제할 교육장을 선택하세요.');
				$('#alertModalBtn').trigger('click');
				return false;
			}
	
			 $('#confirmModalBody').html('선택한 교육장을 삭제하시겠습니까?');		
			 $('#confirmOk').attr('onclick', 'educationLocDel()');	 		 
	         $('#confirmModalBtn').trigger('click');
		});
		
		
		//강사 삭제 유효성 검사
		$('#teacher-delete-button').click(function(){
			var count = $('input[type=checkbox]:checked').length;
			
			if(count < 1) {
				$('#alertModalBody').html('삭제할 강사를 선택하세요.');
				$('#alertModalBtn').trigger('click');
				return false;
			}
	
			 $('#confirmModalBody').html('선택한 강사를 삭제하시겠습니까?');		
			 $('#confirmOk').attr('onclick', 'educationTeaDel()');	 		 
	         $('#confirmModalBtn').trigger('click');
		});
		
		
		
		//교육 등록 유효성검사
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

		
	});

	function educationDel() {
		$('#eduDelFrm').attr('action', contextPath + '/admin/education/eduDelete');
		$('form[name=frmDelete]').submit();
	}
	
	function educationAppDel() {
		$('#eduAppDelFrm').attr('action', contextPath + '/admin/education/appliDelete');
		$('form[name=frmDelete]').submit();
	}
	
	
	function educationTeaDel() {
		$('#eduTeaDelFrm').attr('action', contextPath + '/admin/education/teaDelete');
		$('form[name=frmDelete]').submit();
	}


	function educationLocDel() {
		$('#eduTeaDelFrm').attr('action', contextPath + '/admin/education/locDelete');
		$('form[name=frmDelete]').submit();
	}
	