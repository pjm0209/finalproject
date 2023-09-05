/**
 * 
 */

 $(function(){
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
		$('form[name=messageFrm]').submit(); 
	});
	
	$("#messageDetailBtn").click(function(){
		$('#confirmModalBody').html('선택한 쪽지를 삭제하시겠습니까?');
		$('#confirmOk').attr('onclick','messageDeleteloc()');
		$('#confirmModalBtn').trigger('click');
	});
	 
 });
 
 function messageDeleteloc(){
	 location.href=contextPath+'/main/mypage/myMessage/messageDelete?sendDmNo='+$("#sendDmNo").val();
 }