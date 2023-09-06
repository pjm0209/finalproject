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
					result="<input type='hidden' name='sendItems["+idx+"].receiveNo' value='"+no+"'>";
				}else{
					var no=$(this).val();
					var name= $('#name'+no).text();
					result="<input type='hidden' name='sendItems["+idx+"].receiveNo' value='"+no+"'>";
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
		$('form[name=messageFrm]').submit();
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
		$('#confirmModalBody').html('선택한 쪽지들를 삭제하시겠습니까?');
		$('#confirmOk').attr('onclick','myMessageFormSubmit()');
		$('#confirmModalBtn').trigger('click');
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
		
		$('#memberNameModal').html(result);
		$('#messageModal').modal('show');
		
		$("#messageModal").on("shown.bs.modal", function () {
			$('textarea').focus();
		});
		
	});
	
	$('#myMessageOkBtn').click(function(){
		$('form[name=myMessageFrm]').submit();
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