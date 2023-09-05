<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div id="sidebar" class="" style="">
	<div class="sidebar__inner shadow-sm bg-body rounded" style="position: relative;">
		<div>
			<ul>
				<li id="sbl1"><a href="<c:url value='/main/book/bookList1?bookCategory=검사자료'/>">검 사 자 료</a></li>
			  	<li id="sbl2"><a href="<c:url value='/main/book/bookList1?bookCategory=도서'/>">도 서</a></li>
			  	<li id="sbl3"><a href="<c:url value='/main/book/bookList1?bookCategory=기타'/>">기 타 교 구</a></li>
			</ul>
		</div>
		<div class="resize-sensor"
			style="position: absolute; inset: 0px; overflow: hidden; z-index: -1; visibility: hidden;">
			<div class="resize-sensor-expand"
				style="position: absolute; left: 0; top: 0; right: 0; bottom: 0; overflow: hidden; z-index: -1; visibility: hidden;">
				<div
					style="position: absolute; left: 0px; top: 0px; transition: all 0s ease 0s; width: 100000px; height: 100000px;">
				</div>
			</div>
			<div class="resize-sensor-shrink"
				style="position: absolute; left: 0; top: 0; right: 0; bottom: 0; overflow: hidden; z-index: -1; visibility: hidden;">
				<div style="position: absolute; left: 0; top: 0; transition: 0s; width: 200%; height: 200%">
				</div>
			</div>
		</div>
	</div>
</div>