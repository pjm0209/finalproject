<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>    

<style>
*{
	margin: 0px;
	box-sizing: border-box;
	font-size:15px;
}

.title{
	margin-top: 120px;
	margin-bottom: 50px;
	text-align: center;
	font-size: 30px;
	font-weight: bold;
}

.p{
	margin-bottom: 50px;
	text-align: center;
	font-size: 15px;
}

input{
	font-size: 15px;
    border: 1px solid black;
    border-radius: 3px;
    line-height: 30px;
    padding-left: 10px;
    padding-right: 10px;
    width: 280px;
}

div {
    padding-top: 3px;
    padding-bottom: 8px;
}

label{
	font-weight: bold;
	margin-left: 750px;
}

.btnSearch {
    text-align: center;	
    justify-content: space-between; 
    margin-bottom: 30px;
}

#btnSearch{
  	width: 180px;
 	height: 50px;
	font-weight: bold;	
	color: white;
}

#btnCancel{
	width: 180px;
 	height: 50px;
	font-weight: bold;	
	color: white;
}
</style>

<script type="text/javascript">
    $(function() { 
        
        $('#btnCancel').click(function(){
            var confirmed = confirm("메인 화면으로 돌아가시겠습니까?");
            if (confirmed) {
                window.location.href = '<c:url value="/main/index"/>';
            }
        }); 
        
        $('#btnCancel').click(function(){
            var confirmed = confirm("메인 화면으로 돌아가시겠습니까?");
            if (confirmed) {
                window.location.href = '<c:url value="/main/index"/>';
            }
        }); 
            	
        $('#btnSearch').click(function(e) {
            e.preventDefault(); 

            var name = $('#name2').val();
            var email = $('#email').val();

            if (name.trim() === '') {
                //alert("이름을 입력하세요");
                $('#alertModalBody').html("이름을 입력하세요");
    			$('#alertModal').modal('show');                
                $('#name2').focus();
                return false;
            }

            if (email.trim() === '') {
                //alert("전화번호를 입력하세요");
                $('#alertModalBody').html("이메일을 입력하세요");
    			$('#alertModal').modal('show');     
                $('#email').focus();
                return false;
            }
            
            window.location.href = '<c:url value="/main/member/findIdResult"/>';
        });
        
        // 서버로 데이터 전송
        $.ajax({
            type: "POST",
            url: "<c:url value='main/member/forgot-id'/>",
            data: {
                name: name,
                tel: tel
            },
            success: function(response) {
                // 서버로부터의 응답 처리
                console.log("데이터 전송 성공:", response);
                // 원하는 처리를 여기에 추가
            },
            error: function(xhr, status, error) {
                console.log("데이터 전송 실패:", error);
            }
        });
    });   
</script>

<div class="content">
<h1 class="title">아이디 찾기</h1>	
		<form name = "form-find-id-" method="post" action="<c:url value='/main/member/findIdResult'/>">		
			<p class="p">회원가입 시 입력한 이메일을 입력하시면 아이디를 찾을 수 있습니다.</p>	
				<div class="findEmail-name2">
					<label>*&nbsp;이름 : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
						<input type="text" name="name" id="name2" placeholder="이름을 입력하세요">	
				</div><br>		
			
				<div class="findEmail-email">
					<label>*&nbsp;E-mail : &nbsp;</label>
						<input type="email" name="email" id="email" placeholder="이메일을 입력하세요">		
				</div><br>
													
				<div class="btnSearch"><br>
					<button class="btn btn-primary" type="submit" id="btnSearch">찾기</button>	
					<button class="btn btn-info" type="button" id="btnCancel">취소</button>					
				</div>			
	</form>    
</div>

    <button type="button" style="display: none" id="alertModalBtn" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#alertModal"></button>
    
    <div class="modal fade" id="alertModal" tabindex="-1" aria-labelledby="alertModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="alertModalLabel">알림</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <p id="alertModalBody"></p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn bg-orange-primary" data-bs-dismiss="modal">확인</button>
	      </div>
	    </div>
	  </div>
	</div>
	
    <button type="button" style="display: none" id="alertModalBtn" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#alertModal"></button>
    
    <div class="modal fade" id="alertModal" tabindex="-1" aria-labelledby="alertModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="alertModalLabel">알림</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <p id="alertModalBody"></p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn bg-orange-primary" data-bs-dismiss="modal">확인</button>
	      </div>
	    </div>
	  </div>
	</div>
	
    <button type="button" style="display: none" id="confirmModalBtn" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#confirmModal"></button>
    
    <div class="modal fade" id="confirmModal" tabindex="-1" aria-labelledby="confirmModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="confirmModalLabel">알림</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <p id="confirmModalBody"></p>
	      </div>
	      <div class="modal-footer">
	      	<button class="btn btn-secondary" type="button" data-bs-dismiss="modal">취소</button>
	        <button type="button" class="btn bg-orange-primary" id="confirmOk" data-bs-dismiss="modal">확인</button>
	      </div>
	    </div>
	  </div>
	</div>	
<%@ include file="../inc/bottom.jsp" %>  