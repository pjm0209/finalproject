/**
 * 
 */
var contextPath="/mbti";
 $(function(){
	/* 관리자 쪽지 보내기 */
	$('.message-button').click(function(){
		$('#memberNoModal').html("");
		$('#memberNameModal').html("");
		$('#input').html("");
		if($(this).text()=='쪽지 보내기'){
			$('#alertModalLabel').html('쪽지 보내기');
			
			if($('input[type=checkbox]:checked').length<1){
				$('#alertModalBody').html("쪽지 보낼 회원을 선택하세요");
				$('#alertModal').modal('show');
				return false;
			}
			
			$('input[type=checkbox]:checked:not(input[id=check-All])').each(function(idx,item){
				if(idx!=$('input[type=checkbox]:checked:not(input[id=check-All])').length-1){
					var no=$(this).val();
					var name= $('#name'+no).text()+", ";
					result="<input type='text' name='sendItems["+idx+"].receiveNo' value='"+no+"'>";
				}else{
					var no=$(this).val();
					var name= $('#name'+no).text();
					result="<input type='text' name='sendItems["+idx+"].receiveNo' value='"+no+"'>";
				}
				
				$('#input').append(result);
				$('#memberNameModal').append(name);
			});
			
			$('#messageModal').modal('show');
			
		}
		if($(this).text()=='전체 쪽지 보내기'){
			$('#alertModalLabel').html('전체 쪽지 보내기');
			$('#memberNameModal').html("전체");
			$('#messageModal').modal('show');
			
		}
		
		$("#messageModal").on("shown.bs.modal", function () {
			$('textarea').focus();
		});
	});
	 
	$('#messageOkBtn').click(function(){
		$('form[name=adminMessageFrm]').prop('action',contextPath+'/admin/message/messageWrite');
		$('form[name=adminMessageFrm]').submit();
	});
	
	
	$("#messageDetailBtn").click(function(){
		$('#confirmModalBody').html('선택한 쪽지를 삭제하시겠습니까?');
		$('#confirmOk').attr('onclick','messageDeleteloc()');
		$('#confirmModalBtn').trigger('click');
	});
	 
	$("#myMessageDelBtn").click(function(){
		var len=$('input[type=checkbox]:checked').not('.myMessageCheck-All').length;
		if(len<1){
			$('#alertModalBody').html("삭제할 쪽지를 선택해주세요");
			$('#alertModalBtn').trigger('click');
			
			return false;
		}
		$('input[type=checkbox]:checked').each(function(idx,item){
			var sendDmNo=$(this).val();
		});
		
		$('#confirmModalBody2').html('선택한 쪽지들를 삭제하시겠습니까?');
		$('#confirmOk2').attr('onclick',"myMessageFormSubmit()");
		$('#confirmModalBtn2').trigger('click');
	});
	
	/* 내 쪽지함 - 쪽지 보내기 */
	$(".myMessage-button").click(function(){
		var result = "";
		var sendId = $(this).parent().find('input[name=sendId]').val();
		
		$('#receiveUser').text(sendId);
		
		var no = $(this).parent().find('input[name=no]').val();
		var adminNo = $(this).parent().find('input[name=adminNo]').val();
		
		if(no==null || no==''){
			result+="<input type='hidden' name='receiveNo' value='"+adminNo+"'>";
			result+="<input type='hidden' name='receiveManagerFlag' value='Y'>";
		}else{
			result+="<input type='hidden' name='receiveNo' value='"+no+"'>";
			result+="<input type='hidden' name='receiveManagerFlag' value='N'>";
		}
		
		$('#receiveModal').html(result);
		$('#messageModal').modal('show');
		
		$("#messageModal").on("shown.bs.modal", function () {
			$('textarea').focus();
		});
		
	});
	
	//마이페이지 쪽지 보내기
	$('#myMessageOkBtn').click(function(){
		$('form[name=myMessageFrm]').submit();
	});
	
	$('td[name=messageDetail]').click(function(){
		var sendDmNo=$(this).parent().parent().find('input[type=hidden]').eq(0).val();
		var readDate=$(this).parent().parent().find('input[type=hidden]').eq(1).val();
		var id=$(this).parent().find('td').eq(1).text();
		var body=$(this).parent().find('td').eq(2).text();
		
		$('#alertModalLabel').html('쪽지 상세보기');
		$('#memberNameModal').text(id);
		$('textarea').html(body);
		$('#messageDetailModal').modal('show');
		
		if(readDate==null || readDate==''){
			$.ajax({
				url:contextPath+'/admin/message/readDateUpdate',
				data: {sendDmNo:sendDmNo},
				type: "GET",
				success:function(res){
				},
				error:function(xhr,status,error){
					alert(status + ": " + error);
				}
			});
		}
	});
	
	$('#reSendMessage').click(function(){
		$('#messageDetailModal').modal('hide');
		
		$('#messageDetailModal').on('hidden.bs.modal', function (e) {
			$('#alertModalLabel').html('쪽지 답장');
			$('#user_id').html("받는 회원 : ");
			$('#reSendMessage').hide();
			$('#sendMessage').show();
			$('textarea').html("").attr('readonly',false);
			
			$('#messageDetailModal').modal('show');
			
		});
		
		
	});
	
	$('#modalClose').click(function(){
		$('#messageDetailModal').off();
		$('#messageDetailModal').modal('hide');
	});
	
	$('#sendMessage').click(function(){
		var len=$('#sendBody').val().length;
		
		if(len<1){
			$('#alertModalBody').html("쪽지 내용을 입력해주세요");
			$('#alertModalBtn').trigger('click');
			
			$('#messageDetailModal').off();
			return false;
		}
		var result="<input type='hidden' name='adminMessageFlag' value='Y'>";
		$('#input').html(result);
		
		$('form[name=adminMessageFrm]').submit();
	});
	
	$('#messateCDelete').click(function(){
		var idx=$('input[type=checkbox]:checked').not('#check-All').length;
		
		if(idx<1){
			$('#alertModalBody').html("삭제할 쪽지를 선택해주세요");
			$('#alertModalBtn').trigger('click');
			
			return false;
		}
		
		$('form[name=adminMessageFrm2]').prop('action',contextPath+'/admin/message/messageDelete');
		$('form[name=adminMessageFrm2]').submit();
	});
	
 });
 
 
 /* 마이페이지 - 내 쪽지함 삭제 버튼 */
 function myMessageFormSubmit(){
	 $('form[name=messageFrm]').prop('action',contextPath+'/main/mypage/myMessage/messageDelete');
	 $('form[name=messageFrm]').submit();
 }
 
 /* 마이페이지 - 쪽지함 상세페이지 삭제 버튼 */
 function messageDeleteloc(){
	 location.href=contextPath+'/main/mypage/myMessage/messageDelete?sendDmNo='+$("#sendDmNo").val();
 }