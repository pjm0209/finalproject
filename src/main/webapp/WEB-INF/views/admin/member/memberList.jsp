<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<!-- Begin Page Content -->
<script>
  function showRegisteredMembers() {
    var memberList = [
      { id: "karina", name: "카리나", regdate: "2023.08.03" },
      { id: "winter", name: "윈터", regdate: "2023.08.03" },
      { id: "hongeunchae", name: "홍은채", regdate: "2023.08.03" },
      { id: "ohhyewon", name: "오혜원", regdate: "2023.08.03" },
      { id: "kimchaewon", name: "김채원", regdate: "2023.08.03" },
    ];

    var tableBody = document.getElementById("board-table-body");
    tableBody.innerHTML = ""; 

    for (var i = 0; i < memberList.length; i++) {
      var row = document.createElement("tr");
      row.innerHTML = `
        <th scope="row"><input type="checkbox" class="board-checkbox"></th>
        <td>${i + 1}</td>
        <td>${memberList[i].id}</td>
        <td>${memberList[i].name}</td>
        <td>${memberList[i].regdate}</td>
      `;
      tableBody.appendChild(row);
    }
  }
</script>
<!-- Page Heading -->
<div class="head-div">
	<h2 class="text-gray-800">회원 관리</h2>
</div>
<div class="side-body">
	<div class="side-div-title">
		<h6>회원 리스트</h6>
		<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30"
			fill="currentColor" class="bi bi-chevron-down" viewBox="0 0 16 16">
  			<path fill-rule="evenodd"
				d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z" />
		</svg>
	</div>
	<div class="group">
		<div id="group-list" class="nav">	
			<div class="board-side-boardItem">
				<div class="board-name" name="notice" value="notice" onclick="showRegisteredMembers()">
					<span>가입 회원 조회</span>
				</div>
				<span class="board-side-icon"><i class="fas fa-fw fa-cog"></i></span>
			</div>
			<div class="board-side-boardItem">
				<div class="board-name" name="QnA" value="QnA">
					<span>탈퇴 회원 조회</span>
				</div>
				<span class="board-side-icon"><i class="fas fa-fw fa-cog"></i></span>
			</div>
		</div>
	</div>
</div>
<div class="board-body">
	<div id="board-title">
		<h5>회원 리스트</h5>
		<button class="bg-gradient-secondary" id="board-write-button">수정</button>
		<button class="bg-gradient-secondary" id="board-write-button">삭제</button>
	</div>
	<div class="board">
		<div class="board-head">
			<div class="board-search-result">
				<span class="search-count"></span>
				<div class="input-group mb-3" id="board-search-div">
					<select class="form-select form-select-lg" aria-label=".form-select-lg example" name="searchcondition" id="board-search-select">					  	
					  	<option value="1">이름</option>
					  	<option value="2">아이디</option>
					</select>
				 	<input type="text" class="form-control" placeholder="검색어를 입력하세요" aria-label="Recipient's username" aria-describedby="button-addon2" id="board-search-area">
				 	<button class="btn btn-outline-secondary" type="button" id="button-addon2">검색</button>
				</div>
			</div>
		</div>
		<table class="table">
			<thead>
				<tr class="board-table-colum">
					<th scope="col"><input type="checkbox" id="check-All" class="board-checkbox"></th>
					<th scope="col" class="board-no">번호</th>
					<th scope="col" class="board-userid">아이디</th>
					<th scope="col" class="board-name">이름</th>
					<th scope="col" class="board-regdate">가입일</th>
				</tr>
			</thead>
			<tbody id="board-table-body">
				<tr>
					<th scope="row"><input type="checkbox" class="board-checkbox"></th>
					<td>1</td>
					<td>karina</td>
					<td>카리나</td>
					<td>2023.08.03</td>
				</tr>
				<tr>
					<th scope="row"><input type="checkbox" class="board-checkbox"></th>
					<td>2</td>
					<td>winter</td>
					<td>윈터</td>
					<td>2023.08.03</td>
				</tr>
				<tr>
				<th scope="row"><input type="checkbox" class="board-checkbox"></th>
					<td>3</td>
					<td>hongeunchae</td>
					<td>홍은채</td>
					<td>2023.08.03</td>
				</tr>
				<th scope="row"><input type="checkbox" class="board-checkbox"></th>
					<td>4</td>
					<td>ohhyewon</td>
					<td>오혜원</td>
					<td>2023.08.03</td>
				</tr>
				</tr>
				<th scope="row"><input type="checkbox" class="board-checkbox"></th>
					<td>5</td>
					<td>kimchaewon</td>
					<td>김채원</td>
					<td>2023.08.03</td>
				</tr>								
			</tbody>
		</table>
	</div>
</div>
</div>
<!-- End of Main Content -->

<%@ include file="../inc/bottom.jsp"%>