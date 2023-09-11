var contextPath = "/mbti"	
	
	$(function(){
		//전체 선택
		$('.edu-check-All').click(function(){
			$(this).parents('thead').next('tbody').find('input[type=checkbox]').prop('checked', this.checked);			
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
			var name = $('#education_name').val();
			var teaNo = $('#getTeaName').val();
			var com = $('#getEduCom').val();
			var people = $('#education_people').val();
			var price = $('#education_price').val();
			var place = $('#selectPlace').val();
			
			if(name == 0){
				$('#alertModalBody').html('교육 이름을 입력하세요.');
				$('#alertModalBtn').trigger('click');
				$('#education_name').focus();
				return false;
			}
			if(teaNo == 0){
				$('#alertModalBody').html('강사명을 선택하세요.');
				$('#alertModalBtn').trigger('click');
				$('#getTeaName').focus();
				return false;
			}
			if(com == 0){
				$('#alertModalBody').html('교육 날짜를 선택하세요.');
				$('#alertModalBtn').trigger('click');
				$('#getEduCom').focus();
				return false;
			}
			if(people == 0){
				$('#alertModalBody').html('최대 인원을 입력하세요.');
				$('#alertModalBtn').trigger('click');
				$('#education_people').focus();
				return false;
			}
			if(price == 0){
				$('#alertModalBody').html('교육비를 입력하세요.');
				$('#alertModalBtn').trigger('click');
				$('#education_price').focus();
				return false;
			}
			if(place == 0){
				$('#alertModalBody').html('교육장을 입력하세요.');
				$('#alertModalBtn').trigger('click');
				$('#selectPlace').focus();
				return false;
			}
			
			$('form[name=educationWrite-frm]').submit();
		});	
		
		
		//강사 등록 유효성검사
		$('#save-teacherWrite').click(function(){
			var name = $('#teacher_name').val();
			var id = $('#teacher_id').val();
			var pwd = $('#teacher_pwd').val();
			var email = $('#teacher_email').val();
			var tel = $('#teacher_tel').val();
			var img = $('#teacher_img').val();
			
			if(name == 0){
				$('#alertModalBody').html('이름을 입력하세요.');
				$('#alertModalBtn').trigger('click');
				$('#teacher_name').focus();
				return false;
			}
			if(id == 0){
				$('#alertModalBody').html('아이디를 입력하세요.');
				$('#alertModalBtn').trigger('click');
				$('#teacher_id').focus();
				return false;
			}
			if(pwd == 0){
				$('#alertModalBody').html('비밀번호를 입력하세요.');
				$('#alertModalBtn').trigger('click');
				$('#teacher_pwd').focus();
				return false;
			}
			if(email == 0){
				$('#alertModalBody').html('이메일을 입력하세요.');
				$('#alertModalBtn').trigger('click');
				$('#teacher_email').focus();
				return false;
			}
			if(tel == 0){
				$('#alertModalBody').html('전화번호를 입력하세요.');
				$('#alertModalBtn').trigger('click');
				$('#teacher_tel').focus();
				return false;
			}
			if(img == 0){
				$('#alertModalBody').html('사진을 업로드하세요.');
				$('#alertModalBtn').trigger('click');
				$('#teacher_img').focus();
				return false;
			}
			
			$('form[name=teacherWrite-frm]').submit();
		});	
		
		
		//교육장 등록 유효성검사
		$('#save-locationWrite').click(function(){
			var name = $('#location_name').val();
			var zipcode = $('#zipcodePostalCode').val();
			var latitude = $('#locationLatitude').val();
			var longitude = $('#locationLongitude').val();
			var tel = $('#location_tel').val();
			
			if(name == 0){
				$('#alertModalBody').html('교육장 이름을 입력하세요.');
				$('#alertModalBtn').trigger('click');
				$('#location_name').focus();
				return false;
			}
			if(zipcode == 0){
				$('#alertModalBody').html('우편번호를 입력하세요.');
				$('#alertModalBtn').trigger('click');
				$('#zipcodePostalCode').focus();
				return false;
			}
			if(latitude == 0){
				$('#alertModalBody').html('경도를 입력하세요.');
				$('#alertModalBtn').trigger('click');
				$('#locationLatitude').focus();
				return false;
			}
			if(longitude == 0){
				$('#alertModalBody').html('위도를 입력하세요.');
				$('#alertModalBtn').trigger('click');
				$('#locationLongitude').focus();
				return false;
			}
			if(tel == 0){
				$('#alertModalBody').html('전화번호를 입력하세요.');
				$('#alertModalBtn').trigger('click');
				$('#location_tel').focus();
				return false;
			}
			
			$('form[name=locationWrite-frm]').submit();
		});	
		
		
		//교육 신청 승인 처리
		$('#applicant-edit-button').click(function(){
			var count = $('input[type=checkbox]:checked').length;
			
			if(count < 1) {
				$('#alertModalBody').html('신청자를 선택하세요.');
				$('#alertModalBtn').trigger('click');
				return false;
			}
			
			$('#confirmModalBody').html('선택한 신청자를 승인하시겠습니까?');		 		 
         	$('#confirmOk').attr('onclick', 'educationAppOk()');		          
         	$('#confirmModalBtn').trigger('click');
			
			
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
		
		/*//교육 찜하기 클릭 이벤트
		$('div.edu_like').click(function() {
			var a = $(this).find('.u_icon');
			
			if($(a).is('.like') === true) {
				eduLikeDel($(a));
			} else {
				eduLikeIns($(a));
			}
		});*/
		
	});
	
	//교육 삭제
	function educationDel() {
		$('#eduDelFrm').attr('action', contextPath + '/admin/education/eduDelete');
		$('form[name=frmDelete]').submit();
	}
	
	//교육 신청 거절
	function educationAppDel() {
		$('#eduAppDelFrm').attr('action', contextPath + '/admin/education/appliDelete');
		$('form[name=frmDelete]').submit();
	}
	
	//강사 삭제
	function educationTeaDel() {
		$('#eduTeaDelFrm').attr('action', contextPath + '/admin/education/teaDelete');
		$('form[name=frmDelete]').submit();
	}

	//교육장 삭제
	function educationLocDel() {
		$('#eduTeaDelFrm').attr('action', contextPath + '/admin/education/locDelete');
		$('form[name=frmDelete]').submit();
	}
	
	//교육 신청자 승인
	function educationAppOk() {
		$('#eduAppDelFrm').attr('action', contextPath + '/admin/education/appliUpdate');
		$('form[name=frmDelete]').submit();
	}
	
	//교육 찜하기 처리
	function eduLikeIns(eduNo, no){				
		$.ajax({
			url:contextPath + '/educationLike/eduLikeIns',
			type:'POST',
			data:{eduNo:eduNo,
				  no:no},
			success:function(result) {			
				console.log(result);
			},
			error:function(xhr, status, error) {
				alert(status + ": " + error);
			}
		});
	}
	
	//교육 찜하기 취소
	function eduLikeDel(eduNo) {		
		$.ajax({
			url:contextPath + '/educationLike/eduLikeDel',
			type:'POST',
			data:{eduNo:eduNo},
			success:function(result) {			
				console.log(result);
			},
			error:function(xhr, status, error) {
				alert(status + ": " + error);
			}
		});
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