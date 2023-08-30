<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<section id="edu-main-location" class="edu-main-location">
<div id="education-main">
	<pre>MBTI에 대해 더 자세히 알고 싶다면
지금 바로 다양한 교육을 신청해 보세요!</pre>
</div>
	
<div class="inner1200">
	<h2>ESSENTIAL 교육장 위치</h2>
	
	<div class="map-box" style="display:flex;">
		<ul class="map-list">
		<c:forEach var="educationVo" items="${list}">
			<c:set var="educationNo" value="${educationVo.epNo}"/>
				<li class="name"><a onclick="setCenter(${educationVo.epLatitude}, ${educationVo.epLongitude})"><button type="button" id="ep-name" onclick="showepinfo('${educationVo.epNo}')">${educationVo.epName }</button></a></li>
		</c:forEach> 
		</ul>
		
		<div class="map-info">
			<div class="map-wrap">
			<div id="map" style="width:900px;height:500px;margin-top:50px;"></div>
			<div class="custom_zoomcontrol radius_border"> 
		        <span onclick="zoomIn()"><img src="<c:url value='/images/education/ico_plus.png'/>" alt="확대"></span>  
		        <span onclick="zoomOut()"><img src="<c:url value='/images/education/ico_minus.png'/>" alt="축소"></span>
		    </div>
			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2666b9d92b136acbf73b4b00a4f508ff&libraries=services,clusterer,drawing"></script>
			<script type="text/javascript">
				
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
			    mapOption = { 
			        center: new kakao.maps.LatLng(37.502238, 127.024476), // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨
			    };
		
				var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
				 
				// 마커를 표시할 위치와 title 객체 배열입니다 
				var positions = [
				    {
				        title: '강남1호점', 
				        latlng: new kakao.maps.LatLng(37.502238, 127.024476)
				    },
				    {
				        title: '강남2호점', 
				        latlng: new kakao.maps.LatLng(37.502813, 127.024737)
				    },
				    {
				        title: '종로점', 
				        latlng: new kakao.maps.LatLng(37.570154, 126.986036)
				    },
				    {
				        title: '신촌점',
				        latlng: new kakao.maps.LatLng(37.556913, 126.941614)
				    },
				    {
				        title: '노원점', 
				        latlng: new kakao.maps.LatLng(37.665463, 127.073503)
				    },
				    {
				        title: '상봉점', 
				        latlng: new kakao.maps.LatLng(37.597463, 127.087727)
				    },
				    {
				        title: '송파점', 
				        latlng: new kakao.maps.LatLng(37.494019, 127.120483)
				    },
				    {
				        title: '강서점',
				        latlng: new kakao.maps.LatLng(37.541072, 126.836445)
				    },
				    {
				        title: '화곡점', 
				        latlng: new kakao.maps.LatLng(37.541508, 126.838153)
				    },
				    {
				        title: '신림점', 
				        latlng: new kakao.maps.LatLng(37.484973, 126.930076)
				    },
				    {
				        title: '신도림점', 
				        latlng: new kakao.maps.LatLng(37.503818, 126.887512)
				    },
				    {
				        title: '인천점',
				        latlng: new kakao.maps.LatLng(37.450557, 126.702859)
				    },
				    {
				        title: '안양점',
				        latlng: new kakao.maps.LatLng(37.402029, 126.919368)
				    },
				    {
				        title: '의정부점', 
				        latlng: new kakao.maps.LatLng(37.739452, 127.044866)
				    },
				    {
				        title: '구리점', 
				        latlng: new kakao.maps.LatLng(37.605116, 127.140274)
				    },
				    {
				        title: '일산점', 
				        latlng: new kakao.maps.LatLng(37.653129, 126.776632)
				    },
				    {
				        title: '안산점',
				        latlng: new kakao.maps.LatLng(37.308541, 126.850984)
				    },
				    {
				        title: '성남분당점', 
				        latlng: new kakao.maps.LatLng(37.350461, 127.110078)
				    },
				    {
				        title: '성남모란점', 
				        latlng: new kakao.maps.LatLng(37.432802, 127.129662)
				    },
				    {
				        title: '김포점', 
				        latlng: new kakao.maps.LatLng(37.644887, 126.667038)
				    },
				    {
				        title: '수원역점',
				        latlng: new kakao.maps.LatLng(37.268285, 127.000338)
				    },
				    {
				        title: '하남미사점', 
				        latlng: new kakao.maps.LatLng(37.562561, 127.191942)
				    },
				    {
				        title: '천안점', 
				        latlng: new kakao.maps.LatLng(37.819864, 127.158418)
				    },
				    {
				        title: '전주점',
				        latlng: new kakao.maps.LatLng(35.840283, 127.132485)
				    }
				];
			
				// 마커 이미지의 이미지 주소입니다
				var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
				    
				for (var i = 0; i < positions.length; i ++) {
				    
				    // 마커 이미지의 이미지 크기 입니다
				    var imageSize = new kakao.maps.Size(24, 35); 
				    
				    // 마커 이미지를 생성합니다    
				    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
				    
				    // 마커를 생성합니다
				    var marker = new kakao.maps.Marker({
				        map: map, // 마커를 표시할 지도
				        position: positions[i].latlng, // 마커를 표시할 위치
				        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
				        image : markerImage // 마커 이미지 
				    });
				}
				
				// 지도 확대, 축소 컨트롤에서 확대 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
				function zoomIn() {
				    map.setLevel(map.getLevel() - 1);
				}

				// 지도 확대, 축소 컨트롤에서 축소 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
				function zoomOut() {
				    map.setLevel(map.getLevel() + 1);
				}
				
				
				// 클릭한 지점 위치로 맵 이동
				function setCenter(epLatitude,epLongitude) {            
				    // 이동할 위도 경도 위치를 생성합니다 
				    var moveLatLon = new kakao.maps.LatLng(epLatitude, epLongitude);
				    
				    // 지도 중심을 이동 시킵니다
				    map.setCenter(moveLatLon);
				}
				
				
				// 클릭한 지점 해당 정보 보여주기
				function showepinfo(epNo){
					$.ajax({
						url:"<c:url value='/main/education/locationAjax'/>",
						data:{"epNo" : epNo},
						type:"POST",
						dataType:"json",
						success:function(res){
							var zipcode = res.epZipcode
							var address = res.epAddress
							var tel = res.epTel
							$('.ep-zipcode').html(zipcode);
							$('.ep-address').html(address);
							$('.ep-tel').html(tel);
						},
						error:function(xhr, status, error){
							alert(status+" : "+error);
						}
					});
				}
			</script>
			</div>
			<div class="location-info">
				<dl class="zipcode">
					<dt>우편번호</dt>
					<dd class="ep-zipcode">${educationVo.epZipcode }</dd>
				</dl>		
				<dl class="address">
					<dt>주소</dt>
					<dd class="ep-address">${educationVo.epAddress }</dd>
				</dl>		
				<dl class="tel">
					<dt>전화번호</dt>
					<dd class="ep-tel">${educationVo.epTel }</dd>
				</dl>		
			</div>
		</div>
	</div>
</div>
</section>

<%@ include file="../inc/bottom.jsp"%>