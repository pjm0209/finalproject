<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <form name="join_form" action="" method="get" id="jaoin_form" onsubmit="return form_check()">
    <fieldset>
      <legend>회원가입</legend>
      <p>
        <label for="u_name">이름</label>
        <input type="text" name="u_name" id="u_name">
        <br>
        <span class="err_name"></span>
      </p>
      <p>
        <label for="u_id">아이디</label>
        <input type="text" name="u_id" id="u_id">
        <button type="button">아이디 중복확인</button> 
        <br>
        <span class="err_id">* 4~12글자까지만 입력 가능합니다.</span>
      </p>
      <p>
        <label for="pwd">비밀번호</label>
        <input type="text" name="pwd" id="pwd"> 
        <br>
        <span class="err_pwd">* 4~12글자까지만 입력 가능합니다.</span>
      </p>
      <p>
        <label for="repwd">비밀번호 확인</label>
        <input type="text" name="repwd" id="repwd">
        <br>
        <span class="err_repwd"></span>
      </p>
      <p>
        <label for="birth">생년월일</label>
        <input type="text" name="birth" id="birth">
        <br>
        <span class="err_birth">* ex)19700101 - 8자리로 입력</span>
      </p>
      <p>
        <label for="postalCode">주소검색</label>
        <input type="text" name="postalCode" id="postalCode" placeholder="우편번호">
        <button type="button">주소검색</button> <br>
        <label for="addr1">주소</label>
        <input type="text" name="addr1" id="addr1" placeholder="기본주소">
        <label for="addr2"></label>
        <input type="text" name="addr2" id="addr2" placeholder="상세주소">
      </p>
      <p>
        <label for="email_id">이메일</label>
        <input type="text" name="email_id" id="email_id"> @
        <input type="text" name="email_dns" id="email_dns">
        <select name="email_sel" id="email_sel">
          <option value="">직접 입력</option>
          <option value="naver.com">NAVER</option>
          <option value="hanmail.net">DAUM</option>
          <option value="gmail.com">GOOGLE</option>
        </select>
      </p>
      <p>
        <label for="mobile">전화번호</label>
        <input type="text" name="mobile" id="mobile">
        <br>
        <span class="err_mobile">* '-'없이 숫자만 입력</span>
      </p>
      <p>
        <input type="checkbox" name="agree" id="agree">
        <label for="agree">약관 동의</label>
        <br>
        <span class="err_agree">* 필수</span>
      </p>
      <p class="final_btn">
        <button type="button" class="btn">이전으로</button>
        <button type="submit" class="btn">회원가입</button>
      </p>
    </fieldset>
  </form>
  <script src="join.js" type="text/javascript"></script>
</body>
</html>