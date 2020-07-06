<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>MusicalMoa</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="icon" type="image/png" href="/images/icons/favicon.ico" />

<link rel="stylesheet" type="text/css"
	href="/user_vendor/bootstrap/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css"
	href="/user_fonts/font-awesome-4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" type="text/css"
	href="/user_fonts/Linearicons-Free-v1.0.0/icon-font.min.css">

<link rel="stylesheet" type="text/css"
	href="/user_vendor/animate/animate.css">

<link rel="stylesheet" type="text/css"
	href="/user_vendor/css-hamburgers/hamburgers.min.css">

<link rel="stylesheet" type="text/css"
	href="/user_vendor/animsition/css/animsition.min.css">

<link rel="stylesheet" type="text/css"
	href="/user_vendor/select2/select2.min.css">

<link rel="stylesheet" type="text/css"
	href="/user_vendor/daterangepicker/daterangepicker.css">

<link rel="stylesheet" type="text/css" href="/user_css/user_util.css">
<link rel="stylesheet" type="text/css" href="/user_css/user_main.css">

</head>
<body>
	<div class="modal fade" id="alert_modal" tabindex="-1" role="dialog"
		aria-labelledby="alertLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="alertLabel">MusicalMoa</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>

				</div>
				<div id="alert_modal_body" class="modal-body"></div>
			</div>
		</div>
	</div>

	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-t-50 p-b-90">
				<span class="login100-form-title p-b-51">아이디/비밀번호 찾기</span>
				<form class="login100-form validate-form flex-sb flex-w"
					name="findID" method="post">

					<div class="wrap-input100 validate-input m-b-16">
						<input class="input100" type="text" id="find_id_name"
							name="user_name" placeholder="이름"> <span
							class="focus-input100"></span>
					</div>
					
					<div class="wrap-input100 validate-input m-b-16">
						<input class="input100" type="email" id="find_id_mail"
							name="user_mail" placeholder="Email"> <span
							class="focus-input100"></span>
					</div>

					<div class="container-login100-form-btn m-t-17">
						<button class="login100-form-btn" type="button"
							onclick="IDFind()">아이디 찾기</button>
					</div>
				</form>
				<br>
				<form class="login100-form validate-form flex-sb flex-w"
					name="findPW" method="post">

					<div class="wrap-input100 validate-input m-b-16">
						<input class="input100" type="text" id="find_pw_name"
							name="user_name" placeholder="이름"> <span
							class="focus-input100"></span>
					</div>
					
					<div class="wrap-input100 validate-input m-b-16">
						<input class="input100" type="text" id="find_pw_id"
							name="user_id" placeholder="아이디"> <span
							class="focus-input100"></span>
					</div>
					
					<div class="wrap-input100 validate-input m-b-16">
						<input class="input100" type="email" id="find_pw_mail"
							name="user_mail" placeholder="Email"> <span
							class="focus-input100"></span>
					</div>

					
					<div class="container-login100-form-btn m-t-17">
						<button id="PwFindBtn" class="login100-form-btn" type="button"
							onclick="PwFind()">비밀번호 찾기</button>
					</div>

				</form>
				<div class="" style="margin: auto;">
					<div class="text-center">
						<a class="small" href="/login.do">로그인</a>
					</div>
					<div class="text-center">
						<a class="small" href="/reg.do">회원가입</a>
					</div>
				</div>
			</div>
		</div>
	</div>


	<div id="dropDownSelect1"></div>


	<script src="/user_vendor/jquery/jquery-3.2.1.min.js"></script>

	<script src="/user_vendor/animsition/js/animsition.min.js"></script>

	<script src="/user_vendor/bootstrap/js/popper.js"></script>
	<script src="/user_vendor/bootstrap/js/bootstrap.min.js"></script>

	<script src="/user_vendor/select2/select2.min.js"></script>

	<script src="/user_vendor/daterangepicker/moment.min.js"></script>
	<script src="/user_vendor/daterangepicker/daterangepicker.js"></script>

	<script src="/user_vendor/countdowntime/countdowntime.js"></script>

	<script src="/user_js/main.js"></script>
	<script>
		function IDFind() {
			if ($('#find_id_name').val() == '') {
				$('#alert_modal_body').html('이름을 입력해주세요.');
				$('#alert_modal').modal('show')
			} else if ($('#find_id_mail').val() == '') {
				$('#alert_modal_body').html('이메일을 입력해주세요.');
				$('#alert_modal').modal('show')
			} else {
				$.ajax({
					url : "/findID.do",
					type : "post",
					data : {
						'user_name' : $('#find_id_name').val(),
						'user_mail' : $('#find_id_mail').val()
					},
					success : function(a) {
						if (a.user_id == null) {
							$('#alert_modal_body').html('가입된 아이디가 없습니다.');
							$('#alert_modal').modal('show');
							$('#find_id_name').val('');
							$('#find_id_mail').val('');
						} else {
							$('#alert_modal_body').html(
									'가입된 아이디는 ' + a.user_id + ' 입니다.');
							$('#alert_modal').modal('show');
							$('#find_id_name').val('');
							$('#find_id_mail').val('');
						}
					}
				})
			}
		}
		function PwFind() {
			if ($('#find_pw_name').val() == '') {
				$('#alert_modal_body').html('이름을 입력해주세요.');
				$('#alert_modal').modal('show')
			} else if ($('#find_pw_id').val() == '') {
				$('#alert_modal_body').html('아이디를 입력해주세요.');
				$('#alert_modal').modal('show')
			} else if ($('#find_pw_mail').val() == '') {
				$('#alert_modal_body').html('이메일을 입력해주세요.');
				$('#alert_modal').modal('show')
			} else {
				$('#PwFindBtn').attr('disabled', true);
				$.ajax({
					url : "/findPW.do",
					type : "post",
					data : {
						'user_name' : $('#find_pw_name').val(),
						'user_id' : $('#find_pw_id').val(),
						'user_mail' : $('#find_pw_mail').val()
					},
					success : function(a) {
						$('#PwFindBtn').attr('disabled', false);
						if (a == "0") {
							$('#alert_modal_body').html('가입된 아이디가 없습니다.');
							$('#alert_modal').modal('show');
							$('#find_pw_name').val('');
							$('#find_pw_id').val('');
							$('#find_pw_mail').val('');
						} else if (a == "1") {
							$('#alert_modal_body').html(
									'일시적 오류가 발생하였습니다. 나중에 다시 시도해주세요.');
							$('#alert_modal').modal('show');
							$('#find_pw_name').val('');
							$('#find_pw_id').val('');
							$('#find_pw_mail').val('');
						} else if (a == "2") {
							$('#alert_modal_body').html(
									'새로운 비밀번호가 이메일로 발송되었습니다.');
							$('#alert_modal').modal('show');
							$('#find_pw_name').val('');
							$('#find_pw_id').val('');
							$('#find_pw_mail').val('');
						}
					}
				})
			}
		}
	</script>


</body>
</html>