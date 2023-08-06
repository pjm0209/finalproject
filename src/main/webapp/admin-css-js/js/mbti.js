	$(function(){
		var contextPath = "/mbti";
		
		$('div[name=mbti]').click(function(){
			location.href=contextPath+"/admin/mbti/mbti";
		});
		
		$('#check-All').click(function () {
    		const isChecked = $(this).prop('checked');
    		$('.check').prop('checked', isChecked);
  	    });
  	    
  	    $('#mbti-write-button').click(function(){
			open(contextPath+"/admin/mbti/mbtiWrite",'mbtiWrite','width=800,height=800,top=50,left=500');
		});
  	    
  	    $('#mbti-edit-button').click(function(){
			if($('input[type=checkbox]:checked').length>1){
				alert('여러 개를 수정할 수 없습니다.');
				return;
			}
			
			if($('input[type=checkbox]:checked').length<1){
				alert('수정할 질문을 체크하세요');
				return;
			}
			var result=$('input[type=checkbox]:checked').val();
			open(contextPath+"/admin/mbti/mbtiWrite?mbtiServeyNo="+result,'mbtiWrite','width=800,height=800,top=50,left=500');
		});
		
		$('#mbti-delete-button').click(function(){
			if($('input[type=checkbox]:checked').length<1){
				alert('삭제할 질문을 체크하세요');
				return;
			}
			
			if(confirm('선택한 질문들을 삭제하시겠습니까?')){
				$('form[name=frmDelete]').prop('action',contextPath+'/admin/mbti/mbtiDelete');
				$('form[name=frmDelete]').submit();
			}
		});
		
	});