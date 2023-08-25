<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<title></title>
<style>
*, *:before, *:after {
	box-sizing: border-box;
}

body {
	font-family: Arial;
}

header {
	color: #888;
}

header h1 {
	font-size: 30px;
}

.container {
	max-width: 700px;
	margin: 0 auto;
}

#content {
	border: 2px dotted green;
	padding: 18px;
	margin-left: 215px;
	min-height: 2000px;
	color: darkgrey;
}

#sidebar {
	float: left;
	width: 200px;
	color: #ffbdbd;
	will-change: min-height;
}

#sidebar .sidebar__inner {
	border: 2px dotted red;
	padding: 10px;
	position: relative;
	transform: translate(0, 0);
	transform: translate3d(0, 0, 0);
	will-change: position, transform;
}

footer {
	height: 300px;
	height: 85vh;
	border: 2px dotted black;
	margin-top: 20px;
	text-align: center;
	color: #8e8d8d;
	background: rgba(0, 0, 0, 0.02);
	line-height: 300px;
	line-height: 95vh;
}

footer p {
	margin: 0;
}

.clearfix:after {
	display: block;
	content: "";
	clear: both;
}
</style>

</head>

<body>
	<header>
		<div class="container">
			<h1>Site Title</h1>
		</div>
	</header>

	<div class="container clearfix" style="position: relative;">
		<div id="sidebar" class="" style="">
			<div class="sidebar__inner" style="position: relative;">
				<p>This is sticky column</p>
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
		<div id="content">
			<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras tempus id leo et aliquam.
				Proin consectetur ligula vel neque cursus laoreet. Nullam dignissim, augue at consectetur
				pellentesque, metus ipsum interdum sapien, quis ornare quam enim vel ipsum.</p>

			<p>In congue nunc vitae magna tempor ultrices. Cras ultricies posuere elit. Nullam ultrices
				purus ante, at mattis leo placerat ac. Nunc faucibus ligula nec lorem sodales venenatis.
				Curabitur nec est condimentum, blandit tellus nec, semper arcu. Nullam in porta ipsum, non
				consectetur mi. Sed pharetra sapien nisl. Aliquam ac lectus sed elit vehicula scelerisque ut vel
				sem. Ut ut semper nisl.</p>

			<p>Curabitur rhoncus, arcu at placerat volutpat, felis elit sollicitudin ante, sed tempus
				justo nibh sed massa. Integer vestibulum non ante ornare eleifend. In vel mollis dolor.</p>
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
				<div style="position: absolute; left: 0; top: 0; transition: 0s; width: 200%; height: 200%"></div>
			</div>
		</div>
	</div>

	<footer>
		<p>Very Tall Footer</p>
	</footer>
	
	<script type="text/javascript" src="<c:url value='/js/rAF.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/ResizeSensor.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/jquery-3.7.0.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/js/sticky-sidebar.js'/>"></script>
	<script type="text/javascript">
		var a = new StickySidebar('#sidebar', {
			topSpacing : 20
		});
	</script>



