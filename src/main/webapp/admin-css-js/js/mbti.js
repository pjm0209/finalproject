	var contextPath = "/mbti";
	$(function(){
		$('div[name=mbti]').click(function(){
			location.href=contextPath+"/admin/mbti/mbti";
		});
		
		$('div[name=mbtiStatistics]').click(function(){
			location.href=contextPath+"/admin/mbti/mbtiStatistics";
		});
		
		$('#check-All').click(function () {
    		const isChecked = $(this).prop('checked');
    		$('.check').prop('checked', isChecked);
  	    });
  	    $('#mbti-precise-button').click(function(){
			
		});
  	    

  	    $('#mbti-write-button').click(function(){
			open(contextPath+"/admin/mbti/mbtiWrite",'mbtiWrite','width=800,height=800,top=50,left=500');
		});
  	    
  	    $('#mbti-edit-button').click(function(){
			if($('input[type=checkbox]:checked').length>1){
				$('#alertModalBody').html("여러 개를 수정할 수 없습니다.");
				$('#alertModalBtn').trigger('click');
				return;
			}
			
			if($('input[type=checkbox]:checked').length<1){
				$('#alertModalBody').html("수정할 질문을 선택하세요");
				$('#alertModalBtn').trigger('click');
				return;
			}
			var result=$('input[type=checkbox]:checked').val();
			open(contextPath+"/admin/mbti/mbtiWrite?mbtiSurveyNo="+result,'mbtiWrite','width=800,height=800,top=50,left=500');
		});
		
		$('#mbti-delete-button').click(function(){
			if($('input[type=checkbox]:checked').length<1){
				$('#alertModalBody').html("삭제할 질문을 선택하세요");
				$('#alertModalBtn').trigger('click');
				return;
			}
			
			$('#confirmModalBody').html('선택한 질문들을 삭제하시겠습니까?');
			$('#confirmOk').attr('onclick','mbtiWriteSubmit()');
			$('#confirmModalBtn').trigger('click');
			
		});
		
		$('#mbti-button').click(function(){
			var question=CKEDITOR.instances.question.getData();
			
			if($('#questionTypeNo').val()==0){
				event.preventDefault();
				$('#alertModalBody').html("문제 유형을 선택하세요");
				$('#alertModal').modal('show');
				return false;
			}
			if($('#questionCategoryNo').val()==0){
				event.preventDefault();
				$('#alertModalBody').html("질문 유형을 선택하세요");
				$('#alertModal').modal('show');
				return false;
			}
			if(question.length<1){
				event.preventDefault();
				$('#alertModalBody').html("질문을 입력해주세요");
				$('#alertModal').modal('show');
				return false;
			}
			
			
		});
		
		$('#mbti-free-button').click(function(){
			location.href=contextPath+"/main/mbti/question?questionTypeNo=1";
		});
		
		$('#mbti-precise-button').click(function(){
			location.href=contextPath+"/main/mbti/question?questionTypeNo=2";
		});
		
	    $('button.test_btn_style').hover(function(){
			$(this).toggleClass("active").animate("fast");
		},function(){
			$(this).toggleClass("active").animate("fast");
		});
		
	});
	
	function mbtiWriteSubmit(){
			$('form[name=frmDelete]').prop('action',contextPath+'/admin/mbti/mbtiDelete');
			$('form[name=frmDelete]').submit();
	}