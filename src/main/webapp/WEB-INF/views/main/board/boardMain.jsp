<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<style>
section.boardSection {
    margin-top: 30px;
    padding-top: 200px;
    display: flex;
    justify-content: center;
}

.boardContent {
    width: 60%;
    border: 1px solid black;
    border-radius: 15px;
}

.boardContent-head {
    border-bottom: 1px solid black;
}

.head-content {
    display: flex;
    justify-content: space-between;
}

nav.board-nav {
    height: 100%;
}

ul.board-ul {
    padding: 10px;
    margin: 0;
    display: flex;
}

li.board-li-category {
    list-style: none;
    margin-right: 45px;
}
</style>

<section class="boardSection">
	<div class="boardContent">
		<div class="boardContent-head">
			<div class="head-content">
				<div class="head-content-box1">
					<nav class="board-nav">
						<ul class="board-ul">
							<li class="board-li-category">게시판 카테고리</li>
							<li class="board-li-category">전체 게시글</li>							
						</ul>
					</nav>
				</div>
				<div class="head-content-box2">
				</div>			
			</div>
		</div>
	</div>
</section>
<%@ include file="../inc/bottom.jsp"%>