<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- Remember to include jQuery :) -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>

<!-- jQuery Modal -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<style>
	.modal{
		position: fixed;
	    top: 70px;
	    left: 700;
	    z-index: 1050;
	    display: none;
	    width: 100%;
	    height: 84%;
	    overflow: hidden;
	    outline: 0;
    }
</style>
<%@ include file="../inc/top.jsp"%>

<section id="bookMain" class="book">
	<div style="width: 1000px;height: 800px;">
		<!-- Modal HTML embedded directly into document -->
		<div id="ex1" class="modal">
		  <p>Thanks for clicking. That felt good.</p>
		  <a href="#" rel="modal:close">Close</a>
		</div>
		
		<!-- Link to open the modal -->
		<p><a href="#ex1" rel="modal:open">Open Modal</a></p>
	</div>
</section>
<%@ include file="../inc/bottom.jsp"%>