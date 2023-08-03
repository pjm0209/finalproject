	var contextPath = "/herb";

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

		$('#btnZipcode').click(function(){            
			window.open(contextPath+'/zipcode/zipcode','zipcode',
				'width=750,height=800,location=yes,resizable=yes,left=0,top=0');
	    });
		
	});

	function validate_hp(ph) {
		var pattern = new RegExp(/^[0-9]*$/g);
		return pattern.test(ph); 

	}

	function validate_userid(uid) {
		var pattern = new RegExp(/^[a-zA-Z0-9_]+$/g);
		return pattern.test(uid);

	}