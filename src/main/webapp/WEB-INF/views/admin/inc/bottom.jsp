<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- <!DOCTYPE html> -->

<!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Your Website 2021</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">로그아웃 하시겠습니까??</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">로그아웃할 준비가 되었으면 아래에 있는 "로그아웃"을 선택하세요</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
                    <a class="btn btn bg-orange-primary" href="<c:url value='/admin/logout'/>">로그아웃</a>
                </div>
            </div>
        </div>
    </div>
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
	        <button type="button" class="btn bg-orange-primary" data-bs-dismiss="modal">확인</button>
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
    
	<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
	<script type="text/javascript" src="<c:url value='/admin-css-js/js/mbti.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/admin-css-js/js/message.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/admin-css-js/js/education.js'/>"></script>	
	
    <!-- Bootstrap core JavaScript-->     
    <script src="<c:url value='/admin-css-js/vendor/bootstrap/js/bootstrap.bundle.min.js'/>"></script>

    <!-- Core plugin JavaScript-->
    <script src="<c:url value='/admin-css-js/vendor/jquery-easing/jquery.easing.min.js'/>"></script>
	
    <!-- Custom scripts for all pages-->
    <script src="<c:url value='/admin-css-js/js/sb-admin-2.min.js'/>"></script>

</body>
</html>