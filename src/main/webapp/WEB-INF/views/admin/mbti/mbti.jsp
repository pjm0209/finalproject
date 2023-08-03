<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<style>
button.mbti-button{
	background-color: #c87fdf;
    background-size: cover;
	float: right;
    border:1px solid black;
	border-radius: 5px;
	padding: 6px 41px;
	margin-top: -6px;
	margin-right: 9px;
	color: white;
}
</style>
<!-- Begin Page Content -->
<!-- Page Heading -->
<div class="head-div">
	<h2 class="text-gray-800">MBTI</h2>
</div>
<div class="side-body">
	<div class="side-div-title">
		<h6>MBTI </h6>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30"
			fill="currentColor" class="bi bi-chevron-down" viewBox="0 0 16 16">
  			<path fill-rule="evenodd"
				d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z" />
		</svg>
	</div>
	<div class="group">
		<div id="board-group-list" class="nav">
			<div class="side-boardItem">
				<div class="board-name" name="mbti" value="mbti">
					<span>MBTI 관리</span>
				</div>
			</div>
		</div>
	</div>
</div>
<div style="width: 1405px;float: right;display: inline;">
	<div id="board-title">
		<h5>MBTI 관리</h5>
		<button class="mbti-button" id="mbti-write-button">질문지 등록</button>
		<button class="mbti-button" id="mbti-delete-button">질문지 삭제</button>
	</div>
	<div class="board">
		<div class="board-head">
			<div class="board-search-result">
				<span class="search-count"></span>
				<div class="input-group mb-3" id="board-search-div">
					<select class="form-select form-select-lg" aria-label=".form-select-lg example" name="searchcondition" id="board-search-select">					  	
					  	<option value="1">문제 유형</option>
					  	<option value="2">질문지</option>
					  	<option value="3">등록자</option>
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
					<th scope="col" class="board-writer">번호</th>
					<th scope="col" class="board-writer">문제 유형</th>
					<th scope="col" class="board-title">제목</th>
					<th scope="col" class="board-regdate">작성일</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th scope="row"><input type="checkbox" class="board-checkbox check"></th>
					<td>1</td>
					<td>F</td>
					<td>Otto</td>
					<td>@mdo</td>
				</tr>
				<tr>
					<th scope="row"><input type="checkbox" class="board-checkbox check"></th>
					<td>1</td>
					<td>F</td>
					<td>Thornton</td>
					<td>@fat</td>
				</tr>
				<tr>
					<th scope="row"><input type="checkbox" class="board-checkbox check"></th>
					<td>1</td>
					<td>F</td>
					<td>Otto</td>
					<td>@mdo</td>
				</tr>
				<tr>
					<th scope="row"><input type="checkbox" class="board-checkbox check"></th>
					<td>1</td>
					<td>M</td>
					<td>Thornton</td>
					<td>@fat</td>
				</tr>
				<tr>
					<th scope="row"><input type="checkbox" class="board-checkbox check"></th>
					<td>1</td>
					<td>M</td>
					<td>Otto</td>
					<td>@mdo</td>
				</tr>
				<tr>
					<th scope="row"><input type="checkbox" class="board-checkbox check"></th>
					<td>1</td>
					<td>M</td>
					<td>Thornton</td>
					<td>@fat</td>
				</tr>
				<tr>
					<th scope="row"><input type="checkbox" class="board-checkbox check"></th>
					<td>1</td>
					<td>P</td>
					<td>Otto</td>
					<td>@mdo</td>
				</tr>
				<tr>
					<th scope="row"><input type="checkbox" class="board-checkbox check"></th>
					<td>1</td>
					<td>P</td>
					<td>Thornton</td>
					<td>@fat</td>
				</tr>
				<tr>
					<th scope="row"><input type="checkbox" class="board-checkbox check"></th>
					<td>1</td>
					<td>P</td>
					<td>Otto</td>
					<td>@mdo</td>
				</tr>
				<tr>
					<th scope="row"><input type="checkbox" class="board-checkbox check"></th>
					<td>1</td>
					<td>P</td>
					<td>Thornton</td>
					<td>@fat</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
</div>
<!-- End of Main Content -->

<%@ include file="../inc/bottom.jsp"%>