<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	    
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    var element_wrap = document.getElementById('addressSearch');

    // 페이지 로드 시 자동으로 실행
    window.onload = function () {
        sample3_execDaumPostcode();
    }

    function sample3_execDaumPostcode() {
        var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                if (data.userSelectedType === 'R') {
                    // ... (기존 코드)
                } else {
                    document.getElementById("sample3_extraAddress").value = '';
                }

                document.getElementById('sample3_postcode').value = data.zonecode;
                document.getElementById("sample3_address").value = addr;
                document.getElementById("sample3_detailAddress").focus();
                
                var resultDiv = document.getElementById('address');
                resultDiv.innerHTML = "선택한 주소: " + addr;

                element_wrap.style.display = 'none';
                document.body.scrollTop = currentScroll;
            },
            onresize : function(size) {
                element_wrap.style.height = size.height + 'px';
            },
            width : '100%',
            height : '100%'
        }).embed(element_wrap);

        element_wrap.style.display = 'block';
    }
</script>