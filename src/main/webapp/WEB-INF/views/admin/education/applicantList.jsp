<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<!-- Begin Page Content -->
<!-- Page Heading -->
<div class="board-head-div">
	<h2 class="text-gray-800">교육 관리</h2>
</div>
<div class="board-side-body">
	<div class="board-side-div-title">
		<h6>교육 리스트</h6>
		<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30"
			fill="currentColor" class="bi bi-chevron-down" viewBox="0 0 16 16">
  			<path fill-rule="evenodd"
				d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z" />
		</svg>
	</div>
	<div class="board-group">
		<div id="board-group-list" class="nav">
			<div class="board-side-boardItem">
				<div class="board-name" name="notice" value="notice">
					<span>신청자 조회</span>
				</div>
				<span class="board-side-icon"><i class="fas fa-fw fa-cog"></i></span>
			</div>
			<div class="board-side-boardItem">
				<div class="board-name" name="QnA" value="QnA">
					<span>교육장 위치</span>
				</div>
				<span class="board-side-icon"><i class="fas fa-fw fa-cog"></i></span>
			</div>
		</div>
	</div>
</div>
<div class="board-body">
	<div id="board-title">
		<h5>신청자 조회</h5>
		<button class="bg-gradient-secondary" id="board-write-button">승인</button>
		<button class="bg-gradient-secondary" id="board-write-button">거절</button>
	</div>
	<div class="board">
		<div class="board-head">
			<div class="board-search-result">
				<span class="search-count"></span>
				<div class="input-group mb-3" id="board-search-div">
					<select class="form-select form-select-lg" aria-label=".form-select-lg example" name="searchcondition" id="board-search-select">					  	
					  	<option value="1">신청자</option>
					  	<option value="2">프로그램</option>
					  	<option value="3">강사명</option>
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
					<th scope="col" class="board-title">신청자</th>
					<th scope="col" class="board-title">프로그램</th>
					<th scope="col" class="board-regdate">강사명</th>
					<th scope="col" class="board-regdate">교육일</th>
					<th scope="col" class="board-writer">신청일</th>
					<th scope="col" class="board-writer">교육비</th>
					<th scope="col" class="board-readcount">교육장</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th scope="row"><input type="checkbox" class="board-checkbox"></th>
					<td>황재구</td>
					<td>MBTI와 진로</td>
					<td>박정민</td>
					<td>2023.10.05</td>
					<td>2023.08.30~</td>
					<td>5만원</td>
					<td>강남점</td>
				</tr>
				
			</tbody>
		</table>
	</div>
</div>
</div>
<!-- End of Main Content -->

<%@ include file="../inc/bottom.jsp"%>