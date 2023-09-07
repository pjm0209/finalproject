<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>    

<style>
*{
	margin: 0px;
	box-sizing: border-box;
	font-size:15px;
}

h1{
	margin-top: 30px;
	margin-bottom: 30px;
	text-align: center;
	font-size: 30px;
	font-weight: bold;
}

p{
	margin-bottom: 30px;
	text-align: center;
	font-size: 15px;
}

html {
    width: 100%;
    display: flex;
    justify-content: center;
    padding-top: 300px;
    padding-bottom: 20px;
}

body {
    width: 30%;
    border: 1px solid black;
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
	margin-left: 80px;
}

.btnSearch1 {
    text-align: center;	
    justify-content: space-between; 
}

.btnSearch2 {
    text-align: center;	
    justify-content: space-between; 
}

button[type="submit"]{
  	width: 180px;
 	height: 50px;
	font-weight: bold;	
	color: white;
}

button[type="button"]{
	width: 180px;
 	height: 50px;
	font-weight: bold;	
	color: white;
}

form {
    display: flex;
    flex-direction: column;
    align-items: center;
}

.tab {
    display: flex;
    justify-content: center;
    margin-top: 30px;
    margin-bottom: 20px;
}

.tab-button {
    cursor: pointer;
    padding: 15px 50px;
    background-color: #f0f0f0;
    border: 1px solid #ccc;
    border-radius: 5px 5px 0 0;
    font-size: 18px;
}

.tab-button.active {
    background-color: darkorange;
    border-bottom: none;
}

.tab-content {
    display: none;
    width: 100%;
    padding: 20px;
}

.tab-content.active {
    display: block;
}

</style>

<script type="text/javascript">
    $(function() { 
        $('.tab-button').click(function() {
            $('.tab-button').removeClass('active');
            $(this).addClass('active');

            var tabIndex = $(this).index();
            $('.tab-content').removeClass('active');
            $('.tab-content').eq(tabIndex).addClass('active');
        });
        
        $('#btnCancel1').click(function(){
            var confirmed = confirm("메인 화면으로 돌아가시겠습니까?");
            if (confirmed) {
                window.location.href = '<c:url value="/main/index"/>';
            }
        }); 
        
        $('#btnCancel2').click(function(){
            var confirmed = confirm("메인 화면으로 돌아가시겠습니까?");
            if (confirmed) {
                window.location.href = '<c:url value="/main/index"/>';
            }
        }); 
            	
        $('#btnSearch1').click(function(e) {
            e.preventDefault(); 

            var name = $('#name1').val();
            var tel = $('#tel').val();

            if (name.trim() === '') {
                alert("이름을 입력하세요");
                $('#name1').focus();
                return false;
            }

            if (tel.trim() === '') {
                alert("전화번호를 입력하세요");
                $('#tel').focus();
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

</head>
<body>
<h1>아이디 찾기</h1>	
	<div class="tab">
        <div class="tab-button active">휴대폰번호로 찾기</div>
        <div class="tab-button">이메일로 찾기</div>
    </div>
    
	<form name = "form-find-id-tel" method="post" action="<c:url value='/main/member/forgot-id'/>">	
		<div class="tab-content active">
			<p>회원가입 시 입력한 휴대폰 번호를 입력하시면 아이디를 찾을 수 있습니다.</p>			
				<div class="findTel-name1">
					<label>*&nbsp;이름 : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
						<input type="text" name="name" id="name1" placeholder="이름을 입력하세요">
				</div><br>													
				
				<div class="findTel-tel">
					<label>*&nbsp;휴대폰 : &nbsp;</label>
						<input type="text" name="hp" id="tel" placeholder="휴대폰번호를 입력하세요">		
				</div><br>	
				
				<div class="btnSearch1"><br>
					<button class="btn btn-primary" type="submit" id="btnSearch1">찾기</button>	
					<button class="btn btn-info" type="button" id="btnCancel1">취소</button>				
				</div>
		</div>	
		</form>
		
		<form name = "form-find-id-" method="post" action="<c:url value='/main/member/findIdResult'/>">		
		<div class="tab-content">
			<p>회원가입 시 입력한 이메일을 입력하시면 아이디를 찾을 수 있습니다.</p>	
				<div class="findEmail-name2">
					<label>*&nbsp;이름 : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
						<input type="text" name="name" id="name2" placeholder="이름을 입력하세요">	
				</div><br>		
			
				<div class="findEmail-email">
					<label>*&nbsp;E-mail : &nbsp;</label>
						<input type="email" name="email" id="email" placeholder="이메일을 입력하세요">		
				</div><br>
													
				<div class="btnSearch2"><br>
					<button class="btn btn-primary" type="submit" id="btnSearch2">찾기</button>	
					<button class="btn btn-info" type="button" id="btnCancel2">취소</button>					
				</div>
		</div>				
	</form>    
</body>
