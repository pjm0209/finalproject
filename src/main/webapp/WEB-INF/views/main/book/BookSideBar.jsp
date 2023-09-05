<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<style>
.sideBarBestBook3{
	position: absolute;
    right: 0;
     /*top: 760px;*/
    margin-right: 10px;
    text-align: center;
}

.sideBarBestBook3 #sidebar li img{
	width: 80px;
	vertical-align: middle;
}

.sideBarBestBook3 #sidebar ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	width: 150px;
	background-color: #efefef;
}

.sideBarBestBook3 #sidebar li  {
	display: block;
	color: #ee7843;
	padding: 8px 16px;
	font-weight: bold;
	text-decoration: none;
}
	
</style>
<nav class="sideBarBestBook3" style="top:835px;">
	<div id="sidebar" class="" style="">
		<div class="sidebar__inner shadow-sm bg-body rounded" style="position: relative;">
			<div>
				<ul>
					<li>이 분야 베스트3</li><br>
					<li>
						<i class="bi bi-1-square-fill"></i><br>
						<img src="<c:url value='/images/bookProduct/1.jpg'/>">
						<div>책 이름 넣기</div>
					</li>
					<li>
						<i class="bi bi-2-square-fill"></i></i><br>
						<img src="<c:url value='/images/bookProduct/1.jpg'/>" >
						<div>책 이름 넣기</div>
					</li>
					<li>
						<i class="bi bi-3-square-fill"></i></i><br>
						<img src="<c:url value='/images/bookProduct/1.jpg'/>">
						<div>책 이름 넣기</div>
					</li>
				</ul>
			</div>
		</div>
	</div>
</nav>