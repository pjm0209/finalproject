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
	
	<div id="map" style="width:500px;height:400px;"></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2666b9d92b136acbf73b4b00a4f508ff"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services,clusterer,drawing"></script>
	<script type="text/javascript">
		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
	    mapOption = { 
	        center: new kakao.maps.LatLng(37.499596, 127.061935), // 지도의 중심좌표
	        level: 9 // 지도의 확대 레벨
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
	</script>
	</div>
	
</section>

<%@ include file="../inc/bottom.jsp"%>