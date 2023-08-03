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
			var num=0;
			$('input[type=checkbox]:checked').each(function(){
				num++;
				if(num>1){
					alert('여러 개를 수정할 수 없습니다.');
					event.defaultPrevented();
					return false;
				}
			});
			var result=$('input[type=checkbox]:checked').val();
			
			if(result==null){
				alert('수정할 질문을 체크하세요');
				return false;
			}
			open(contextPath+"/admin/mbti/mbtiWrite?mbtiServeyNo="+result,'mbtiWrite','width=800,height=800,top=50,left=500');
		});
		
	});