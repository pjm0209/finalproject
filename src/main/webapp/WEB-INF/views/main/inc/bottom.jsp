<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <!-- ======= Footer ======= -->
  <footer id="footer">
    <div class="footer-top">
      <div class="container">
        <div class="row">

          <div class="col-lg-3 col-md-6 footer-contact">
            <h3>Essential MBTI</h3>
            <p>
              서울특별시 서초구 서초대로77길 55 (에이프로스퀘어3층)<br>
              06611 <br><br>
              <strong>Phone:</strong> 02-532-6509<br>
              <strong>Email:</strong> info@example.com<br>
            </p>
          </div>

          <div class="col-lg-3 col-md-6 footer-links">
            <h4>Useful Links</h4>
            <ul>
              <li><i class="bx bx-chevron-right"></i> <a href="/mbti/main/index">Home</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="/mbti/main/Introduction/info">소개</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="/mbti/main/education/info">MBTI 교육</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="/mbti/main/mbti/mbti">MBTI 검사</a></li>
            </ul>
          </div>

          <div class="col-lg-3 col-md-6 footer-links">
            <h4>Our Services</h4>
            <ul>
              <li><i class="bx bx-chevron-right"></i> <a href="/mbti/main/book/bookMain">도서/자료</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="/mbti/main/board/boardMain">커뮤니티</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="/mbti/main/mypage/mypage">마이페이지</a></li>
            </ul>
          </div>

          <div class="col-lg-3 col-md-6 footer-links">
            <h4>Our Social Networks</h4>
            <p>Cras fermentum odio eu feugiat lide par naso tierra videa magna derita valies</p>
            <div class="social-links mt-3">
              <a href="#" class="twitter"><i class="bx bxl-twitter"></i></a>
              <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a>
              <a href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
              <a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
              <a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
            </div>
          </div>

        </div>
      </div>
    </div>


    <div class="container py-4">
      <div class="copyright">
        &copy; Copyright <strong><span>Ninestars</span></strong>. All Rights Reserved
      </div>
      <div class="credits">
        <!-- All the links in the footer should remain intact. -->
        <!-- You can delete the links only if you purchased the pro version. -->
        <!-- Licensing information: https://bootstrapmade.com/license/ -->
        <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/ninestars-free-bootstrap-3-theme-for-creative/ -->
        Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
      </div>
    </div>
  </footer><!-- End Footer -->
  <button type="button" style="display: none" id="alertModalBtn" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#alertModal"></button>
    
    <div class="modal fade" id="alertModal" tabindex="-1" aria-labelledby="alertModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="alertModalLabel">알림</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <p id="alertModalBody"></p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" id="btnClose" class="btn bg-orange-primary" data-bs-dismiss="modal">확인</button>
	      </div>
	    </div>
	  </div>
	</div>
	
    <button type="button" style="display: none" id="confirmModalBtn" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#confirmModal"></button>
    
    <div class="modal fade" id="confirmModal" tabindex="-1" aria-labelledby="confirmModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="confirmModalLabel">알림</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <p id="confirmModalBody"></p>
	      </div>
	      <div class="modal-footer">
	      	<button class="btn btn-secondary" type="button" data-bs-dismiss="modal">취소</button>
	        <button type="button" class="btn bg-orange-primary" id="confirmOk" data-bs-dismiss="modal">확인</button>
	      </div>
	    </div>
	  </div>
	</div>

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <script type="text/javascript" src="<c:url value='/admin-css-js/js/mbti.js'/>"></script>
  <script type="text/javascript" src="<c:url value='/admin-css-js/js/education.js'/>"></script>
  <script type="text/javascript" src="<c:url value='/admin-css-js/js/message.js'/>"></script>
	

	<script type="text/javascript" src="<c:url value='/admin-css-js/js/mbti.js'/>"></script>

  <!-- Vendor JS Files -->
  <script src="${path }/assets/vendor/aos/aos.js"></script>
  <script src="${path }/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="${path }/assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="${path }/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="${path }/assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="${path }/assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="${path }/assets/js/main.js"></script>
  
      
	<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
	

    <!-- Core plugin JavaScript-->
    <script src="<c:url value='/admin-css-js/vendor/jquery-easing/jquery.easing.min.js'/>"></script>
	
    <!-- Custom scripts for all pages-->
    <script src="<c:url value='/admin-css-js/js/sb-admin-2.min.js'/>"></script>

</body>
</html>