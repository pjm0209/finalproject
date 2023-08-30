<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="check_box flex">
	<div class="inner flex">
		<div class="check_all flex">
			<input type="checkbox" id="check">
			<label for="check"> 전체선택 </label>
		</div>
		<div class="check_remove">
			<a href="javascript:void(0);">전체삭제</a>
		</div>
	</div>
</div>

<section id="basket" class="flex">
	<ul class="list">
	
		<li class="flex">
			<div class="flex box1">
				<input type="checkbox">
				<div class="flex">
					<img src="<c:url value='/images/bookProduct/1.jpg'/>" alt="상품이미지" width="140px;"
					style="vertical-align: middle;">
					<P>제 목<span>10,000원</span></P>
				</div>
			</div>
			<div class="box2">
				<a href="javascript:void(0);"><span class="material-symbols-outlined"> close </span></a>
				<p>10,000원</p>
				<div class="flex">
					<button class="remove">
						<span class="material-symbols-outlined"> remove </span>
					</button>
					<p class="tt">10</p>
					<button class="plus">
						<span class="material-symbols-outlined"> add </span>
					</button>
				</div>
			</div>
		</li> 
		<li class="flex">
			<div class="flex box1">
				<input type="checkbox">
				<div class="flex">
					<img src="<c:url value='/images/bookProduct/1.jpg'/>" alt="상품이미지" width="140px;"
					style="vertical-align: middle;">
					<P>제 목<span>10,000원</span></P>
				</div>
			</div>
			<div class="box2">
				<a href="javascript:void(0);"><span class="material-symbols-outlined"> close </span></a>
				<p>10,000원</p>
				<div class="flex">
					<button class="remove">
						<span class="material-symbols-outlined"> remove </span>
					</button>
					<p class="tt">10</p>
					<button class="plus">
						<span class="material-symbols-outlined"> add </span>
					</button>
				</div>
			</div>
		</li> 
		<li class="flex">
			<div class="flex box1">
				<input type="checkbox">
				<div class="flex">
					<img src="<c:url value='/images/bookProduct/1.jpg'/>" alt="상품이미지" width="140px;"
					style="vertical-align: middle;">
					<P>제 목<span>10,000원</span></P>
				</div>
			</div>
			<div class="box2">
				<a href="javascript:void(0);"><span class="material-symbols-outlined"> close </span></a>
				<p>10,000원</p>
				<div class="flex">
					<button class="remove">
						<span class="material-symbols-outlined"> remove </span>
					</button>
					<p class="tt">10</p>
					<button class="plus">
						<span class="material-symbols-outlined"> add </span>
					</button>
				</div>
			</div>
		</li> 

	</ul>
	
</section>


