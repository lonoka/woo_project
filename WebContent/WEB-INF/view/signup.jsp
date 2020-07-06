<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Sign Up Form by Colorlib</title>

    <!-- Font Icon -->
    <link rel="stylesheet" href="fonts_signup/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="css_signup/style.css">
    <style>
        .piano{
            max-width: 100%;
            height: 90%;
        }
        .signup-content{
            margin-left: 180px;
        }
    </style>
    
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
<nav class="fh5co-nav" role="navigation">
		<div class="container">
			<div class="row">
				<div class="col-md-3 col-xs-2">
					<div id="fh5co-logo">
						<a href="/index.do">MusicalMoa</a>
					</div>
				</div>
				<div class="col-md-6 col-xs-6 text-center menu-1">
					<ul>
						<li class="has-dropdown"><a href="/Musical_select.do">뮤지컬정보</a>
							<ul class="dropdown">
								<li><a href="/musical_list1.do">일간 인기순</a></li>
								<li><a href="/Musical_select.do">월간 인기순</a></li>
								<li><a href="/musical_list1.do">가나다순</a></li>
							</ul>

						<li><a href="/signup.do">회원가입</a></li>
						<li><a href="/login.do">로그인</a></li>
					</ul>
				</div>
				<div class="col-md-3 col-xs-4 text-right hidden-xs menu-2">
					<ul>
						<li class="search">
							<div class="input-group">
								<input type="text" placeholder="Search.."> <span
									class="input-group-btn">
									<button class="btn btn-primary" type="button">
										<i class="icon-search"></i>
									</button>
								</span>
							</div>
						</li>
						<li class="shopping-cart"><a href="#" class="cart"><span><small>0</small><i
									class="icon-shopping-cart"></i></span></a></li>
					</ul>
				</div>
			</div>

		</div>
	</nav>

    <div class="main">

        <!-- Sign up form -->
        <section class="signup">
            <div class="container">
                <div class="signup-content">
					<div class="signup-form">
						<h2 class="form-title">Sign up</h2>
						<form method="POST" action="/signup_process.do"
							class="register-form" id="register-form">
							<div class="form-group">
								<label for="name"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name="id" id="id" placeholder="아이디를 입력해 주세요" />
								<div class="check_font" id="id_check"></div>
							</div>
							<div class="form-group">
								<label for="email"><i class="zmdi zmdi-email"></i></label> <input
									type="email" name="email" id="email" placeholder="이메일을 입력해 주세요" />
								<div class="check_font" id="email_check"></div>
							</div>
							<div class="form-group">
								<label for="pass"><i class="zmdi zmdi-lock"></i></label> <input
									type="password" name="pass" id="pass"
									placeholder="비밀번호를 입력해 주세요" />
								<div class="check_font" id="password_check"></div>
							</div>
							<div class="form-group">
								<label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
								<input type="password" name="re_pass" id="re_pass"
									placeholder="비밀번호를 재입력해 주세요" />
								<div class="check_font" id="re_pass_check"></div>
							</div>

							<div class="form-group form-button">
								<input type="submit" name="signup" id="signup"
									class="form-submit" value="회원가입" /> <a href="/login.do"><input
									type="button" class="form-submit" value="로그인" /></a>
							</div>
						</form>
					</div>
				</div>
                    <div class="signup-image">
                       
                       
                    </div>
                </div>
            </div>
        </section>

    </div>

    <!-- JS -->
    <script src="vendor_signup/jquery/jquery.min.js"></script>
    <script src="js_signup/main.js"></script>
    <script>
    //id 유효성 검사
    $("#id").blur(function() {
    	
    	var id = $('#id').val();
    	var idJ = /^[a-z0-9]{4,12}$/;
    	$.ajax({
    		url : '/user/idCheck.do?userId=' + id,
    				type : 'get',
    				success : function(data) {
  
					if (data == 1) {
															$("#id_check")
																	.text(
																			"사용중인 아이디입니다");
															$("#id_check").css(
																	"color",
																	"red");
															$("#signup").attr(
																	"disabled",
																	true);
														} else {

															if (idJ.test(id)) {
																$("#id_check")
																		.text(
																				"");
																$("#signup")
																		.attr(
																				"disabled",
																				false);
															} else if (id == "") {
																$('#id_check')
																		.text(
																				'아이디를 입력해주세요');
																$('#id_check')
																		.css(
																				'color',
																				'red');
																$("#signup")
																		.attr(
																				"disabled",
																				true);
															} else {
																$('#id_check')
																		.text(
																				"아이디는 소문자와 숫자 4~12자리만 가능합니다");
																$('#id_check')
																		.css(
																				'color',
																				'red');
																$("#signup")
																		.attr(
																				"disabled",
																				true);
															}

														}
													},
													error : function() {
														console.log("실패");
													}
												});
									});

					//비밀번호 체크
					/*    $("#re_pass").blur(function(){
					 if($('#pass').val() != $('#re_pass').val(){
					 $('#rePass_check').text("비밀번호가 일치하지 않습니다.");
					 $('#rePass_check').css('color', 'red');
					 $("#signup").attr("disabled", true);
					 }else{
					 $('#rePass_check').text("비밀번호가 일치합니다.");
					 $("#signup").attr("disabled", false);
					 }
					 ); //?? 그럼 아래거로 쓰면 된느거 아님?
					
					 }); */
					// 아니 ㅋㅋㅋㅋ 왜 일치하면 일치하지 않는다 뜨고 일치하지 않으면 일치한다 뜨냐?저거 내가 기억하기로 위에 먼저쓰면 ㄱㅊ은데 아래 비밀번호 확인부터 쓰면 망가졌던거 같음
				</script>
<!--     <script>
    $(function(){
        $('#pass').keydown(function(){
          $('#re_pass_check').html('');
        });

        $('#re_pass').keydown(function(){

            if($('#pass').val() != $('#re_pass').val()){
              $('#re_pass_check').html('비밀번호 일치하지 않음<br><br>');
              $('#re_pass_check').attr('color', '#f82a2aa3');
              $("#signup").attr("disabled", true);
            } else{
              $('#re_pass_check').html('비밀번호 일치함<br><br>');
              $('#re_pass_check').attr('color', '#199894b3');
              $("#signup").attr("disabled", false); 
            }

        });
    });
    </script> -->
    <script>
    	$('#pass').on('input',function(){
    		validatePw();
    	});
    	$('#re_pass').on('input', function(){
    		validatePw();
    	})
    	
    	function validatePw(){
    		var pass = $("#pass").val();
    		var re_pass = $("#re_pass").val();
    		if(pass != re_pass){
    			$('#re_pass_check').html('비밀번호 일치하지 않음<br><br>');
    			$("#signup").attr("disabled", true);
    			$('#re_pass_check').attr('color', '#f82a2aa3');
    		}else if(pass = ""){
    			$('#re_pass_check').html('비밀번호 입력좀<br><br>');
    			$("#signup").attr("disabled", true);
    			$('#re_pass_check').attr('color', '#f82a2aa3');
    		}else{
    			$('#re_pass_check').html('비밀번호 일치함<br><br>');
    			$("#signup").attr("disabled", false);
    			$('#re_pass_check').attr('color', '#199894b3');
    			

    		}
    	}
    </script>
    
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
   
</body><!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>