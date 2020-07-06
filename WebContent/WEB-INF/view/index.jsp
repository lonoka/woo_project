<%@page import="poly.util.CmmUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String userId = CmmUtil.nvl((String) session.getAttribute("userId"));
	String userAuthor = CmmUtil.nvl((String) session.getAttribute("userAuthor"));
	String sValue = CmmUtil.nvl((String) request.getAttribute("sValue"));
%>
<!DOCTYPE HTML>
<html>
<head>
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
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&display=swap"
	rel="stylesheet">

<style>
header {
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	display: flex;
	z-index: 3;
}

.desc {
	font-family: 'Nanum Gothic Coding', monospace;
}
</style>
<style type="text/css">
.block-27 ul {
	padding: 0;
	margin: 0;
}
.btn_alert {
	background-color: #F7CAC9;
	border-color: #F7CAC9;
}
.btn_alert:hover {
	background-color: #f7b6b5 !important;
	border-color: #f7b6b5 !important;
}
.block-27 ul li {
	display: inline-block;
	font-weight: 400;
}
.block-27 ul li a, .block-27 ul li span {
	color: dodgerblue;
	text-align: center;
	display: inline-block;
	width: 40px;
	height: 40px;
	line-height: 40px;
	border-radius: 50%;
	border: 1px solid #e6e6e6;
}
.block-27 ul li.active a, .block-27 ul li.active span {
	background: #E3F1FF;
	color: dodgerblue;
	border: 1px solid #e6e6e6;
}
h2 a:hover {
	color: aliceblue !important;
}
.div_content_container {
	display: table;
	table-layout: fixed;
	width: 100%;
	border: 1px solid #dee2e6;
}
.linkbody_content_container {
	display: table;
	table-layout: fixed;
	width: 100%;
	border-bottom: 1px solid #666666;
}
.linkheader_content_container {
	display: table;
	table-layout: fixed;
	width: 100%;
	border-top: 1px solid #666666;
	border-bottom: 1px solid #666666;
}
.linkdiv_content_box {
	display: table-cell;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
	text-align: center;
}
.link_1st {
	width: 70%;
}
.div_content_box {
	display: table-cell;
	border: 1px solid #dee2e6;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
	padding-top: 5px;
	padding-bottom: 5px;
	text-align: center;
}
.search_box {
	display : inline-block;
	margin-right: 5px;
}
.table_1st {
	width: 8%;
}
.table_3rd {
	width: 15%;
}
.table_5th {
	width: 10%;
}
#ticker{
	float:left;
	width:100%;
}
.navi{
	float:right;
}
.recommend_text {
	height:30px; 
	overflow:hidden;
	width: 200px;
}
.recommend_text ul,.recommend_text li {
	margin:0; 
	padding:0; 
	list-style:none;
}
.recommend_text li a {
	height:30px; 
	line-height:30px;
	color : black;
	display:block;
	text-decoration:none;
	text-overflow: ellipsis;
}
</style>

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
	<script src="/js/respond.min.js"></script>
	<![endif]-->
</head>
<body>
	<%@include file="/WEB-INF/view/frame/ModalLoginAdmin.jsp"%>
	

	<div class="fh5co-loader"></div>
	<header>
	<%if(userId.equals("")){ %>
	<%@include file="/WEB-INF/view/frame/TopbarLogout.jsp"%>
	<%} else {%>
	<%@include file="/WEB-INF/view/frame/TopbarLoginAdmin.jsp"%>
	<%} %>
	</header>
	<div id="page">


		<aside id="fh5co-hero" class="js-fullheight">
			<div class="flexslider js-fullheight">
				<ul class="slides">
					<li style="background-image: url(images/smile_man02_1.jpg);">
						<div class="overlay-gradient"></div>
						<div class="container">
							<div
								class="col-md-6 col-md-offset-3 col-md-pull-3 js-fullheight slider-text">
								<div class="slider-text-inner">
									<div class="desc">
										<span class="price"></span>
										<h2>웃는남자</h2>
										<p>
											“이 이상 위대한 작품을 쓰지 못했다.” <br> 탐욕의 시대를 뒤흔든 빅토르 위고의 위대한 통찰!
											<br> <br> 빈부격차가 극심했던 17세기 영국을 배경으로 그윈플렌의 여정을 통해<br>
											정의와 인간성이 무너진 세태를 비판하고, 인간의 존엄성과 평등의 가치에 대해 깊이 있게 조명하는 작품<br>
											<br> 무대예술상을 휩쓴 오필영 무대디자이너의 독창적인 무대디자인과<br> 최첨단 무대
											기술과 영상미로 무장한 예술성이 극대화된 무대

										</p>
									</div>
								</div>
							</div>
						</div>
					</li>
					<li style="background-image: url(images/mozart_04.jpg);">
						<div class="overlay-gradient"></div>
						<div class="container">
							<div
								class="col-md-6 col-md-offset-3 col-md-pull-3 js-fullheight slider-text">
								<div class="slider-text-inner">
									<div class="desc">
										<span class="price"></span>
										<h2>모차르트</h2>
										<p>
											새로운 신화, 끝나지 않은 감동!<br> 유럽뮤지컬 신화의 시작<br>
											<모차르트!> 한국 초연 10주년!<br>
											<br>
											2010년 세종문화회관 대극장 연일 매진 사례<br>
											각종 뮤지컬 시상식 11개 부문 상 석권<br>
											전세계 9개국 2200회 이상 공연, 240만 관객 동원<br>
											한국 초연 10주년을 맞아 역대급 공연으로 돌아온다!<br>
										</p>
									</div>
								</div>
							</div>
						</div>
					</li>
					<li style="background-image: url(images/dracula_03.jpg);">
						<div class="overlay-gradient"></div>
						<div class="container">
							<div
								class="col-md-6 col-md-offset-3 col-md-pull-3 js-fullheight slider-text">
								<div class="slider-text-inner">
									<div class="desc">
										<span class="price"></span>
										<h2>드라큘라</h2>
										<p>
											브로드웨이 역사상 가장 매혹적인 입맞춤 <br> 2020년 오디컴퍼니가 선사하는 또 하나의 대작<br>
											한 여인을 사랑하기 위해 영원의 삶을 선택한 ‘드라큘라’와<br> 그를 사랑할 수밖에 없는 운명의
											여인 ‘미나’ 죽음을 초월한 세기의 러브스토리를 입체적인 무대 예술과 웅장하고 아름다운 음악으로 표현하며 깊은
											인상을 남긴 뮤지컬
											<드라큘라> <br>
											2020년 2월, 뮤지컬 <드라큘라>의 새로운 역사가 시작된다. 
										</p>
									</div>
								</div>
							</div>
						</div>
					</li>
				</ul>
			</div>
		</aside>








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

