<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<!-- Begin Page Content -->
<c:import url="/admin/board/boardHeadSide"></c:import>
<div class="board-body">
	<div id="board-title">
		<h5>공지사항</h5>
		<button class="bg-gradient-secondary" id="board-write-button" onclick="location.href='boardWrite'">글쓰기</button>
	</div>
	<div class="board">
		<div class="board-head">
			<div class="board-search-result">
				<span class="search-count"></span>
				<div class="input-group mb-3" id="board-search-div">
					<select class="form-select form-select-lg" aria-label=".form-select-lg example" name="searchcondition" id="board-search-select">					  	
					  	<option value="1">제목</option>
					  	<option value="2">내용</option>
					  	<option value="3">작성자</option>
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
					<th scope="col" class="board-title">제목</th>
					<th scope="col" class="board-regdate">작성자</th>
					<th scope="col" class="board-writer">작성일</th>
					<th scope="col" class="board-readcount">조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty boardList }">
					<tr>
						<td colspan="4" style="text-align: center;">등록된 게시글이 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${!empty boardList }">
					<c:forEach var="map" items="${boardList }">
						<tr>
							<th scope="row"><input type="checkbox" class="board-checkbox"></th>
							<td>${map['BOARDTITLE']}</td>
							<td>${map['NAME'] }</td>
							<td>${map['BOARDREGDATE'] }</td>
							<td>${map['BOARDREADCOUNT'] }</td>
						</tr>
					</c:forEach>
				</c:if>		
			</tbody>
		</table>
	</div>
</div>
</div>
<!-- End of Main Content -->

<%@ include file="../inc/bottom.jsp"%>