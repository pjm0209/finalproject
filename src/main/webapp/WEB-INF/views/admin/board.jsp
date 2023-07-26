<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="inc/top.jsp"%>

<style>
button#add-newBoard-button {
	color: white;
	padding: 4px 25px;
	border-radius: 5px;
	border: none;
	float: right;
}

.board-head-div {
	width: 100%;
	height: max-content;
	border-bottom: 1px solid #d8dce5;
	padding-right: 30px;
	padding-left: 30px;
	padding-bottom: 7px;
}

.board-side-body {
	height: 85%;
	border-right: 1px solid #d8dce5;
	display: inline-block;
	width: 220px;
}

.board-head-div h2 {
	display: inline-block;
	font-weight: bold;
	margin: 0;
}

.board-side-div-title {
	padding: 20px 10px 15px 20px;
	border-bottom: 1px solid #d8dce5;
}

.board-side-div-title h6 {
	display: inline-block;
	margin-right: 48px;
	margin-bottom: 0;
}

h1.h3.mb-4.text-gray-800 {
	display: inline;
}

.board-group {
	overflow: auto;
}

.board-side-boardItem {
	width: 100%;
	cursor: pointer;
	margin: 5px;
	border-radius: 5px;
	padding: 0;
}

.board-name {
	display: inline-block;
	width: 83%;
	padding: 10px 15px 10px 30px;
}

.board-body {
	display: inline;
	float: right;
	width: 1462px;
}

div#board-title {
	height: 66px;
	padding: 20px;
	border-bottom: 1px solid #d8dce5;
}

div#board-title h5 {
	font-weight: bold;
	color: black;
	display: inline-block;
}

button#board-write-button {
	float: right;
	border: 0;
	border-radius: 5px;
	padding: 6px 41px;
	margin-top: -6px;
	margin-right: 9px;
	color: white;
}
</style>

<!-- Begin Page Content -->
<!-- Page Heading -->
<div class="board-head-div">
	<h2 class="text-gray-800">게시판</h2>
	<button type="button" class="bg-gradient-primary"
		id="add-newBoard-button">새 게시판 추가</button>
</div>
<div class="board-side-body">
	<div class="board-side-div-title">
		<h6>게시판 리스트</h6>
		<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30"
			fill="currentColor" class="bi bi-chevron-down" viewBox="0 0 16 16">
  			<path fill-rule="evenodd"
				d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z" />
		</svg>
	</div>
	<div class="board-group">
		<div id="board-group-list" class="nav">
			<div class="board-side-boardItem">
				<div class="board-name">
					<span>공지사항</span>
				</div>
				<span class="board-side-icon"><i class="fas fa-fw fa-cog"></i></span>
			</div>
			<div class="board-side-boardItem">
				<div class="board-name">
					<span>QnA</span>
				</div>
				<span class="board-side-icon"><i class="fas fa-fw fa-cog"></i></span>
			</div>
			<div class="board-side-boardItem">
				<div class="board-name">
					<span>FAQ</span>
				</div>
				<span class="board-side-icon"><i class="fas fa-fw fa-cog"></i></span>
			</div>
		</div>
	</div>
</div>
<div class="board-body">
	<div id="board-title">
		<h5>공지사항</h5>
		<button class="bg-gradient-secondary" id="board-write-button">글쓰기</button>
	</div>
	<div class="board">
		<div class="board-head">
			<div class="board-search-result">
				<span class="search-count"></span>
			</div>
		</div>
		<table class="table">
			<thead>
				<tr>
					<th scope="col">#</th>
					<th scope="col">제목</th>
					<th scope="col">작성일</th>
					<th scope="col">작성자</th>
					<th scope="col">조회수</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th scope="row">1</th>
					<td>Mark</td>
					<td>Otto</td>
					<td>@mdo</td>
					<td>@mdo</td>
				</tr>
				<tr>
					<th scope="row">2</th>
					<td>Jacob</td>
					<td>Thornton</td>
					<td>@fat</td>
					<td>@fat</td>
				</tr>
				<tr>
					<th scope="row">3</th>
					<td colspan="2">Larry the Bird</td>
					<td>@twitter</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>

</div>
<!-- End of Main Content -->

<%@ include file="inc/bottom.jsp"%>