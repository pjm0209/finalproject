<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ include file="../inc/top.jsp" %>    

<style>
.PageContent > img{
	margin-top: 100px;
	width: 100%;
	height: 200px;

}

.sub_visual_wrap{
	position: relative;
	width: 100% !important;
	height: 180px !important;
}

.path_wrap{
	position : absolute;
	right: 50ox;
	top: 150px;
	z-index: 10
}

ul, li, dl, menu, ol{
	list-style: none;
}

ul, li, dd{
	margin:0;
	padding:0;
}

ul{
	display:block;
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
	padding-inline-start: 40px;
}

.tabType1{
	height: 50px;
	border-bottom: 1px solid #eb5d1e;

}

.con_1000{	
	width: 1200px;
	margin: 0 auto;

}

div{
	padding: 0;
}

div{
	display: block;
}

.tabType1 li.on{
	height: 50px;
}

.tabType1 li:first-child{
	background: none;
}

.tabType1 li{
	float: left;
	width: 25%;
	text-align: center;
	font-size: 14px;
	
}

li{
	display: list-item;
} 

.tabType1 li.on a{
	color: #eb5d1e;
	font-weight: bold;
	font-size: 20px;
	background: url(https://img.assesta.com/assesta/common/tab_arrow.png)no-repeat center 35px;
}

.tabType1 li a{
	display: block;
	height: 50px;
	line-height: 50px;
}

a{
	text-decoration: none;
	border-left: 1px solid #eb5d1e;
	border-right: 1px solid #eb5d1e;
}

.sub_title{
	padding-top: 30px;
	text-align: center;
}

.sub_tit > strong{
	color: #eb5d1e;;
	font-size: 50px;
	font-weight: bold;
	line-height: 1.3;
}

.sub_tit{
	text-align: center;
	margin-top: 50px;
	margin-bottom: 60px;
}

.whoweare > dl > dt img{
	vertical-align: top;
	margin-top: 15px;
}

img{
	max-width:100%;
	font-size: 0;
	width: 100px;
	height: 100px;
}

img{
	overflow-clip-margin: content-box;
	overflow: clip;
}

.whoweare > dl > dt{
	font-size: 18px;
	font-weight: bold;
	width: 20%;
	float: left;
}

dl{
	display:block;
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
}

.whoweare > dl{
	float: none;
	clear: both;
}

dd{
	display: block;
	margin-inline-start: 40px;
}

.whoweare > dl > dd{
	float: right;
	width: 75%;
	font-size: 20px;
	line-height: 1.6;	
	border-left: 1px solid #eb5d1e;
	padding-left: 20px;
	margin-bottom: 50px;
}

dt{
	display:block;
}

.whoweare{
	width: auto;
	position: relative;
}

.real_con{
	margin-left: 50px;
}

.whoweare > dl > dt .tit{
	display: inline-block;
	padding: 10px 0 0 20px;
	width: 120px;
	line-height: 1.2;
}



</style>


<script type="text/javascript">

</script>


<!--  컨텐츠 영역 -->
<div class="PageContent">

	<!--  서브 비주얼 영역 -->
	<div class="sub_visual_wrap" id="sub_visual">
	
	<ul class="path_wrap">
		<li><i class="fa fa-home" aria-hidden="true"></i></li>
		<li> > <span>회사소개</span> > <span>어세스타</span></li>
	</ul>
	
	<ul class="sub_visual">
		<li style="background:url('https://img.assesta.com/assesta/common/sub_visual01.jpg')no-repeat center center;">
			<div class="txt">
				<div>
					<em>회사소개</em>
				</div>
			</div>
		</li>
	</ul>
	</div>
	
	
	<!-- 탭 메뉴 -->
	<div class="tabType1 con_1200">
		<ul>
			<li class="on"><a href="<c:url value='/main/Introduction/Info'/>">소개</a></li>
			<li><a href="<c:url value='/main/Introduction/Vision'/>">비젼</a></li>
			<li><a href="<c:url value='/main/Introduction/Project'/>">프로젝트</a></li>
			<li><a href="<c:url value='/main/Introduction/Company'/>">위치</a></li>				
		</ul>
	</div>
	<!-- //탭 메뉴 -->
	
	<!-- 내용시작 -->
	<div class="sub_section">
		<div class="sub_section_inner">
		
		<!-- 서브 타이틀 -->
		<div class="sub_tit">
			<strong>소개</strong>
		</div>
		
			<!-- 어세스타 -->
			<div class="real_con">
				<div class="whoweare">
					<dl>
						<dt><img src="../../images/돋보기.png" alt=""><span class="tit">어세스타</span></dt>
						<dd><strong>올바른 심리평가, 교육, 활용을 통해 개인, 조직, 사회의 성장을 돕는 어세스타입니다.<br></strong>
						어세스타는 인간의 생각과 마음을 연구하는 심리평가 및 서비스 기관입니다. 심리평가를 통해 사람의 좋고 나쁨을 가리기보다, 개인이 타인과 얼마나 어떻게 다른가를 연구합니다.
					</dl>
					<dl>
						<dt><img src="../../images/돋보기.png" alt=""><span class="tit">다양한 심리서비스</span><br>
						<dd>올바른 심리평가, 교육, 활용을 통해 개인, 조직, 사회의 성장을 돕는 어세스타입니다.
							어세스타는 인간의 생각과 마음을 연구하는 심리평가 및 서비스 기관입니다. 심리평가를 통해 사람의 좋고 나쁨을 가리기보다, 개인이 타인과 얼마나 어떻게 다른가를 연구합니다.</dd>
					</dl>	
					<dl>
						<dt><img src="../../images/mingi.jpg" alt=""><span class="tit">글로벌 파트너</span></dt>
						<dd>더욱 타당하고 신뢰로운 심리평가 도구를 개발.보급하고, 자격을 갖춘 전문가만이 사용하도록 시스템을 강화하여 심리평가 도구가 다양한 분야에서 유익하게 활용
							에서 유익학세 활용될 수 있도록 노력하겠습니다.</dd>		
					</dl>															
				</div>
			</div>
			</div><!-- //inner 끝 -->
		</div><!-- //내용끝 -->
	</div>	
	
	<!-- 푸터 -->
	<div class="footer">
	
	<p class="top"><a href="#"><img src="https://img.assesta.com/assesta/common/icon_top.png" alt="위로"/></a></p>
	<div class="foot_inner">
	<!-- SNS버튼 -->
	<div class="snsBox">
		<ul>
			<li><a href="https:www.youtube.com/assestashare" target="_blank"><img src="https:///img.assesta.com/assesta/common/btn_youtube.png" alt="유투브"></a></li>
			<li><a href="https:www.istagram.com/assesta_official" target="_blank"><img src="https:///img.assesta.com/assesta/common/btn_ins.png" alt="인스타그램"></a></li>
			<li><a href="https:www.istagram.com/assesta_official" target="_blank"><img src="https:///img.assesta.com/assesta/common/btn_facebook.png" alt="페이스북"></a></li>
			<li><a href="https:www.youtube.com/assestashare" target="_blank"><img src="https:///img.assesta.com/assesta/common/btn_youtube.png" alt="카카오톡"></a></li>			
		</ul>
	</div>
	<!-- //SNS버튼 -->
	<div class="siste_info">
	<div class="footer_logo"><img src="https://img.assesta.com/assesta/common/footer_logo.png" alt="어세스타"/></div>
		<address>서울시 영등포구 국회대로 68길 11, 삼보호청빌딩 5,6층</address>
		<p>TEL 02)787-1400(평일 9am-6pm) FAX 02)787-1408<br />
		
	
	</div>
	
	
	</div>
	</div>