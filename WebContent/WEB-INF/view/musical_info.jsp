
<%@page import="poly.util.CmmUtil"%>
<%@page import="poly.dto.ActorInfoDTO"%>
<%@page import="java.util.List"%>
<%@page import="poly.dto.MusicalInfoDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	MusicalInfoDTO pDTO = (MusicalInfoDTO) request.getAttribute("musicalDto");
List<ActorInfoDTO> aList = (List<ActorInfoDTO>) request.getAttribute("aList");
String userId = CmmUtil.nvl((String) session.getAttribute("userId"));
String userAuthor = CmmUtil.nvl((String) session.getAttribute("userAuthor"));
String sValue = CmmUtil.nvl((String) request.getAttribute("sValue"));
%>
<!DOCTYPE HTML>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.5.0.js"
	integrity="sha256-r/AaFHrszJtwpe+tHyNi/XCfMxYpbsRg2Uqn0x3s2zc="
	crossorigin="anonymous"></script>
<style>
#musical_poster>img {
	width: 500;
}
</style>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Shop &mdash; Free Website Template, Free HTML5 Template
	by gettemplates.co</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description"
	content="Free HTML5 Website Template by gettemplates.co" />
<meta name="keywords"
	content="free website templates, free html5, free template, free bootstrap, free website template, html5, css3, mobile first, responsive" />
<meta name="author" content="gettemplates.co" />

<!-- 
	//////////////////////////////////////////////////////

	FREE HTML5 TEMPLATE 
	DESIGNED & DEVELOPED by FreeHTML5.co
		
	Website: 		http://freehtml5.co/
	Email: 			info@freehtml5.co
	Twitter: 		http://twitter.com/fh5co
	Facebook: 		https://www.facebook.com/fh5co

	//////////////////////////////////////////////////////
	 -->

<!-- Facebook and Twitter integration -->
<meta property="og:title" content="" />
<meta property="og:image" content="" />
<meta property="og:url" content="" />
<meta property="og:site_name" content="" />
<meta property="og:description" content="" />
<meta name="twitter:title" content="" />
<meta name="twitter:image" content="" />
<meta name="twitter:url" content="" />
<meta name="twitter:card" content="" />

<!-- <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet"> -->
<!-- <link href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i" rel="stylesheet"> -->

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
	<script src="js/respond.min.js"></script>
	<![endif]-->

</head>
<body>

	<div class="fh5co-loader"></div>

	<div id="page">
		<%@include file="/WEB-INF/view/frame/ModalLoginAdmin.jsp"%>
		<%
			if (userId.equals("")) {
		%>
		<%@include file="/WEB-INF/view/frame/TopbarLogout.jsp"%>
		<%
			} else {
		%>
		<%@include file="/WEB-INF/view/frame/TopbarLoginAdmin.jsp"%>
		<%
			}
		%>


		<div id="fh5co-product">
			<div class="container">
				<div class="row">
					<div class="col-md-10 col-md-offset-1 animate-box">
						<div class="">
							<div class="item">
								<div class="active text-center" id="musical_poster">
									<figure>
										<img src="<%=pDTO.getMusical_poster()%>" width="500"
											alt="user">
									</figure>
								</div>
								<center>
									<div>
										<a href="<%=pDTO.getLink()%>"><U>예매하러가기</U></a>
									</div>
								</center>
							</div>
							<div class="item">
								<div class="active text-center">
									<figure>

									</figure>
								</div>
							</div>
						</div>
						<div class="row animate-box">
							<div class="col-md-8 col-md-offset-2 text-center fh5co-heading">
								<h2><%=pDTO.getTitle()%></h2>

							</div>
						</div>
					</div>
				</div>
				<center>
					<div class="row">
						<div class="col-md-10 col-md-offset-1">
							<div class="fh5co-tabs animate-box">
								<ul class="fh5co-tab-nav">
									<li class="active"><a href="#" data-tab="1"><span
											class="icon visible-xs"><i class="icon-file"></i></span><span
											class="hidden-xs">상세정보</span></a></li>
									<li><a href="#" data-tab="2"><span
											class="icon visible-xs"><i class="icon-bar-graph"></i></span><span
											class="hidden-xs">좌석배치도</span></a></li>
									<li><a href="#" data-tab="3"><span
											class="icon visible-xs"><i class="icon-star"></i></span><span
											class="hidden-xs">출연 배우</span></a></li>
								</ul>

								<!-- Tabs -->
								<div class="fh5co-tab-content-wrap">

									<div class="fh5co-tab-content tab-content active"
										data-tab-content="1">
										<div class="col-md-10 col-md-offset-1">
											<div class="row">
												<div class="col-md-6">
													<h2 class="uppercase">제목</h2>
													<p><%=pDTO.getTitle()%></p>
												</div>
												<div class="col-md-6">
													<h2 class="uppercase">장소</h2>
													<p><%=pDTO.getLoc()%></p>
												</div>
												<div class="col-md-6">
													<h2 class="uppercase">기간</h2>
													<p><%=pDTO.getDate()%>s
													</p>
												</div>
												<div class="col-md-6">
													<%
														if (pDTO.getScore().equals("")) {
													%>
													<h2 class="uppercase"></h2>
													<p></p>
													<%
														} else {
													%>
													<h2 class="uppercase">평점</h2>
													<p><%=pDTO.getScore()%>점
													</p>
													<%
														}
													%>
												</div>
											</div>

										</div>
									</div>

									<div class="fh5co-tab-content tab-content" data-tab-content="2">
										<div class="col-md-10 col-md-offset-1">
											<h3><%=pDTO.getLoc()%></h3>
											<ul>
												<%
													if (pDTO.getSeat().equals("")) {
												%>
												<h2>좌석 정보가 없습니다</h2>
												<%
													} else {
												%>
												<img src="<%=pDTO.getSeat()%>" alt="user">
												<%
													}
												%>
											</ul>
										</div>
									</div>

									<div class="fh5co-tab-content tab-content" data-tab-content="3">
										<div class="col-md-10 col-md-offset-1">
											<h3>출연 배우</h3>
											<div class="feed">
												<%
													if (aList.size() == 0) {
												%>
												<h3>배우정보가 존재하지 않습니다.</h3>
												<%
													} else {
												%>
												<%
													for (int i = 0; i < aList.size(); i++) {
												%>
												<div>
													<blockquote>
														<div style="float: left;">
															<img src="<%=aList.get(i).getActor_img()%>"
																alt="My Image">
														</div>
														<div>
															&nbsp;&nbsp;&nbsp; 이름 :<%=aList.get(i).getActor_name()%></div>
														<%
															if (aList.get(i).getActor_birth().equals("")) {
														%>
														<%
															} else {
														%>
														<br>
														<div>
															&nbsp;&nbsp;&nbsp; 생년월일 :
															<%=aList.get(i).getActor_birth()%></div>
														<%
															}
														%>
														<br>
														<div>
															&nbsp;&nbsp;&nbsp; 직업 :<%=aList.get(i).getActor_job()%></div>
													</blockquote>

													<span class="rate"> </span>
												</div>
												<%
													}
												%>
												<%
													}
												%>
											</div>
										</div>
									</div>
								</div>

							</div>
						</div>
					</div>
				</center>
			</div>
		</div>



		<div class="gototop js-top">
			<a href="#" class="js-gotop"><i class="icon-arrow-up"></i></a>
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

