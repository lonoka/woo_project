<%@page import="poly.util.CmmUtil"%>
<%@page import="java.util.ArrayList"%>
<%@page import="poly.dto.MusicalInfoDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String userId = CmmUtil.nvl((String) session.getAttribute("userId"));
String userAuthor = CmmUtil.nvl((String) session.getAttribute("userAuthor"));
String sValue = CmmUtil.nvl((String) request.getAttribute("sValue"));

ArrayList<MusicalInfoDTO> rList = (ArrayList<MusicalInfoDTO>) request.getAttribute("rList");
String str = CmmUtil.nvl((String) request.getAttribute("str"));
if (str.equals("")) {
	str = "Month";
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.5.0.js"
	integrity="sha256-r/AaFHrszJtwpe+tHyNi/XCfMxYpbsRg2Uqn0x3s2zc="
	crossorigin="anonymous"></script>

<!-- <script>
$(window).on("load", function() {
	getRank();
});

function getRank() {
	$.ajax({
		url : "/Musical_select.do",
		type : "post",
		dataType : "JSON",
		contentType : "application/json; charset=UTF-8",
		success : function(json) {
			for (var i = 0; i < json.length; i ++) {
				$("#inner-contents").append(
					"<p class='musical_title'>"+ json[i].title +"</p>"		
				);
			}
		}
	})
}
</script> -->

<!-- Animate.css -->
<link rel="stylesheet" href="/css/animate.css">
<!-- Icomoon Icon Fonts-->
<link rel="stylesheet" href="/css/icomoon.css">
<!-- Bootstrap  -->
<link rel="stylesheet" href="/css/bootstrap.css">

<!-- Flexslider  -->
<link rel="stylesheet" href="/css/flexslider.css">

<!-- Owl Carousel  -->
<link rel="stylesheet" href="/css/owl.carousel.min.css">
<link rel="stylesheet" href="/css/owl.theme.default.min.css">

<!-- Theme style  -->
<link rel="stylesheet" href="/css/style.css">

<!-- Modernizr JS -->
<script src="/js/modernizr-2.6.2.min.js"></script>
<!-- FOR IE9 below -->
<!--[if lt IE 9]>
	<script src="/js/respond.min.js"></script>
	<![endif]-->
<link
	href="https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap"
	rel="stylesheet">

<style>
.musical_title {
	font-family: 'Sunflower', sans-serif;
	font-size: 30px;
	color: #57FE6E;
}
</style>

</head>
<body>
<%@include file="/WEB-INF/view/frame/ModalLoginAdmin.jsp"%>
	<%if(userId.equals("")){ %>
	<%@include file="/WEB-INF/view/frame/TopbarLogout.jsp"%>
	<%} else {%>
	<%@include file="/WEB-INF/view/frame/TopbarLoginAdmin.jsp"%>
	<%} %>

	<div id="fh5co-product">
		<div class="container">
			<div class="row animate-box">
				<div class="col-md-8 col-md-offset-2 text-center fh5co-heading">
					<%
						if (str.equals("Month")) {
					%>
					<h2>월간 인기순</h2>
					<%
						} else if (str.equals("Week")) {
					%>
					<h2>주간 인기순</h2>
					<%
						} else if (str.equals("Alpha")) {
					%>
					<h2>가나다 순</h2>
					<%
						}
					%>
				</div>
			</div>
			<div class="row">
				<%
					for (int i = 0; i < rList.size(); i++) {
				%>
				<div class="col-md-4 text-center animate-box">
					<div class="product">
						<div class="product-grid"
							style="background-image: url(<%=rList.get(i).getMusical_poster()%>);">
							<div class="inner">
								<p class="musical_title">
									<a class="musical_title" onclick=""
										href="musical/detail/<%=rList.get(i).getId()%>.do?sort=<%=str%>"><%=rList.get(i).getTitle()%></a>
								</p>
							</div>
						</div>
						<div class="desc"></div>
					</div>

				</div>
				<%
					}
				%>
			</div>
		</div>
	</div>


	<!-- jQuery -->
	<script src="/js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="/js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="/js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="/js/jquery.waypoints.min.js"></script>
	<!-- Carousel -->
	<script src="/js/owl.carousel.min.js"></script>
	<!-- countTo -->
	<script src="/js/jquery.countTo.js"></script>
	<!-- Flexslider -->
	<script src="/js/jquery.flexslider-min.js"></script>
	<!-- Main -->
	<script src="/js/main.js"></script>

</body>
</html>