	var contextPath = "/mbti";

 	$(function() {	
		$("#email2").change(function() {
			if ($("#email2").val() == "etc") {
				$("#email3").val("");
				$("#email3").css("visibility", "visible");
				$("#email3").focus();
			} else {
				$("#email3").css("visibility", "hidden");
			}
		});

		$('#btnChkId').click(function(){
	    	var id=$('#userid').val();
	        open(contextPath+'/member/checkId?userid='+id,'dup',
	        	'width=590,height=300,location=yes,resizable=yes,left=0,top=0');
	    });
		
		$('#btAdminChkId').click(function(){
	    	var id=$('#userid').val();
	        open(contextPath+'/admin/manager/adminCheckId?userid='+id,'dup',
	        	'width=590,height=300,location=yes,resizable=yes,left=0,top=0');
	    });

		/*$('#btnZipcode').click(function(){            
			window.open(contextPath+'/zipcode/zipcode','zipcode',
				'width=750,height=800,location=yes,resizable=yes,left=0,top=0');
	    });*/
		
	});

	function validate_hp(ph) {
		var pattern = new RegExp(/^[0-9]*$/g);
		return pattern.test(ph); 

	}

	function validate_userid(uid) {
		var pattern = new RegExp(/^[a-zA-Z0-9_]+$/g);
		return pattern.test(uid);

	}
	//회원가입 - 우편번호 찾기
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {

                var roadAddr = data.roadAddress; 
                var extraRoadAddr = '';

                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }

                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                document.getElementById('memberPostalCode').value = data.zonecode;
                document.getElementById("memberAddress").value = roadAddr;
                               
            }
        }).open();
    } 
    
    //개인정보수정 - 우편번호 찾기
        function sample4_execDaumPostcode2() {
        new daum.Postcode({
            oncomplete: function(data) {

                var roadAddr = data.roadAddress; 
                var extraRoadAddr = '';

                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }

                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                document.getElementById('memberPostalCode').value = data.zonecode;
                document.getElementById("memberAddress").value = roadAddr;
                               
            }
        }).open();
    } 