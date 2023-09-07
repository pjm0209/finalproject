var contextPath = "/mbti"	
	
	$(function(){
		//전체 선택
		$('#check-All').click(function(){
			$('.board-checkbox').prop('checked', this.checked);
		});	

		$('#check-All-my').click(function(){
			$('.board-checkbox-my').prop('checked', this.checked);
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
		
		
		//교육장 수정
		$('#location-edit-button').click(function(){
			if($('input[type=checkbox]:checked').length>1){
				$('#alertModalBody').html("수정할 교육장을 하나만 선택하세요.");
				$('#alertModalBtn').trigger('click');
				return false;
			}
			
			if($('input[type=checkbox]:checked').length<1){
				$('#alertModalBody').html("수정할 교육장을 선택하세요.");
				$('#alertModalBtn').trigger('click');
				return false;
			}
			
			var no = $('input[type=checkbox]:checked').val();
						
			location.href= contextPath + "/admin/education/locationEdit?epNo=" + no;
			
		});	
		
		
		//교육 수정
		$('#education-edit-button').click(function(){
			if($('input[type=checkbox]:checked').length>1){
				$('#alertModalBody').html("수정할 질문을 하나만 선택하세요.");
				$('#alertModalBtn').trigger('click');
				return false;
			}
			
			if($('input[type=checkbox]:checked').length<1){
				$('#alertModalBody').html("수정할 질문을 선택하세요.");
				$('#alertModalBtn').trigger('click');
				return false;
			}
			
			var no = $('input[type=checkbox]:checked').val();
						
			location.href= contextPath + "/admin/education/educationEdit?eduNo=" + no;
			
		});
		
		
		//강사 수정
		$('#teacher-edit-button').click(function(){
			if($('input[type=checkbox]:checked').length>1){
				$('#alertModalBody').html("수정할 강사를 한명만 선택하세요.");
				$('#alertModalBtn').trigger('click');
				return false;
			}
			
			if($('input[type=checkbox]:checked').length<1){
				$('#alertModalBody').html("수정할 강사를 선택하세요.");
				$('#alertModalBtn').trigger('click');
				return false;
			}
			
			var no = $('input[type=checkbox]:checked').val();
						
			location.href= contextPath + "/admin/education/teacherEdit?eduTeaNo=" + no;
			
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
	
	
	//우편번호
	function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipcodePostalCode').value = data.zonecode;
                document.getElementById("locationAddress").value = roadAddr;
                               
            }
        }).open();
        
      }  

	
	//교육 신청 인원 보여주기 모달창
	function eduModal(eduNo){
		$.ajax({
			url:contextPath + "/admin/education/listAjax",
			data:{"eduNo" : eduNo},
			type:"POST",
			dataType:"json",
			success:function(res){
				if(res.length == 0){
					var str = "현재 신청 인원이 없습니다.";
				}else{
					var str = "<table class='table'>";
					str += "<tr>";
					str += "<td>이름</td>";
					str += "<td>아이디</td>";
					str += "<td>핸드폰 번호</td>";
					str += "</tr>";
						
					for(var i=0 ; i<res.length ; i++) {
						var vo = res[i];
						var name = vo.name;
						var userid = vo.userid;
						var hp = vo.hp;
						str += "<tr>";
						str += "<td>"+name+"</td>";
						str += "<td>"+userid+"</td>";
						str += "<td>"+hp+"</td>";
						str += "</tr>";
					}
						str += "</table>";
				}
				$('#modalTable').html(str);
				$('#educationModalBtn').trigger('click');
				
			},
			error:function(xhr, status, error){
				alert(status+" : "+error);
			}
		})
	}