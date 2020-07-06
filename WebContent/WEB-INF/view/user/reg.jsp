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
				<form class="login100-form validate-form flex-sb flex-w"
					id="reg_form" name="f" method="post">
					<span class="login100-form-title p-b-51"> Sign up </span>

					<div class="wrap-input100 validate-input m-b-16">
						<input class="input100" type="text" id="user_reg_id"
							oninput="checkId()" name="user_id" placeholder="ID"
							required="required"> <span class="focus-input100"></span>
					</div>
					<div id="wrongId"
						style="display: none; color: red; font-size: 12px;">5~16자의
						영문 소문자,숫자만 사용 가능합니다.</div>
					<div id="failId"
						style="display: none; color: red; font-size: 12px;">사용하실 수
						없는 아이디입니다.</div>
					<div id="successId"
						style="display: none; color: dodgerblue; font-size: 12px;">사용하실
						수 있는 아이디입니다.</div>
					<div class="wrap-input100 validate-input m-b-16">
						<input class="input100" type="text" id="user_reg_name"
							name="user_name" placeholder="이름" required="required"> <span
							class="focus-input100"></span>
					</div>


					<div class="wrap-input100 validate-input m-b-16"
						data-validate="Password is required">
						<input class="input100" type="password" id="user_reg_password"
							name="password" placeholder="비밀번호" maxlength="16"
							oninput="checkPw()" style="ime-mode: disabled;"
							required="required"> <span class="focus-input100"></span>
					</div>
					<div class="wrap-input100 validate-input m-b-16"
						data-validate="Password is required">
						<input class="input100" type="password" id="user_reg_password"
							name="RepeatPassword" placeholder="비밀번호 확인" maxlength="16"
							oninput="checkPw2()" style="ime-mode: disabled;"
							required="required"> <span class="focus-input100"></span>
					</div>
					<div id="wrongPw"
						style="display: none; color: red; font-size: 12px; margin-left: 20px;">6~16자의
						비밀번호를 사용해주세요.</div>
					<div id="wrongPw2"
						style="display: none; color: red; font-size: 12px; margin-left: 20px;">비밀번호가
						일치하지 않습니다.</div>

					<div class="wrap-input100 validate-input m-b-16">
						<input class="input100" type="email" id="user_reg_mail"
							name="user_mail" placeholder="Email" oninput="checkMail()"
							required="required"> <span class="focus-input100"></span>
					</div>
					<div id="wrongMail"
						style="display: none; color: red; font-size: 12px;">잘못된 이메일
						형식입니다.</div>
					<div id="successMail"
						style="display: none; color: dodgerblue; font-size: 12px;">사용
						가능한 Email입니다.</div>
					<div id="failMail"
						style="display: none; color: red; font-size: 12px;">이미 등록된
						Email입니다.</div>

					<div class="container-login100-form-btn m-t-17">
						<button id="submitbtn" class="login100-form-btn" type="button"
							onclick="userReg()">회원 가입</button>
					</div>

				</form>
				<div class="" style="margin: auto;">
					<div class="text-center">
						<a class="small" href="/login.do">로그인</a>
					</div>
					<div class="text-center">
						<a class="small" href="/find.do">아이디/비밀번호 찾기</a>
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
		var idCheck = 0;
		var pwCheck = 0;
		var emailCheck = 0;
		function reset_reg_form() {
			$("#reg_form")[0].reset();
			$('#wrongId').hide();
			$('#failId').hide();
			$('#successId').hide();
			$('#wrongPw').hide();
			$('#wrongPw2').hide();
			$('#successMail').hide();
			$('#failMail').hide();
			$('#wrongMail').hide();
		}
		function checkId() {
			var inputed = f.user_id.value;
			var CheckForm = /^[a-z0-9]{5,16}$/;
			if (!CheckForm.test(inputed)) {
				$('#wrongId').show();
				$('#failId').hide();
				$('#successId').hide();
				idCheck = 0;
			} else {
				$.ajax({
					data : {
						user_id : inputed
					},
					url : "checkId.do",
					success : function(data) {
						if (inputed == "" && data == '0') {
							$('#wrongId').hide();
							$('#failId').show();
							$('#successId').hide();
							idCheck = 0;
						} else if (data == '0') {
							$('#wrongId').hide();
							$('#failId').hide();
							$('#successId').show();
							idCheck = 1;
						} else if (data == '1') {
							$('#wrongId').hide();
							$('#failId').show();
							$('#successId').hide();
							idCheck = 0;
						}
					}
				})
			}
		}
		function checkPw() {
			var inputed = f.password.value;
			if (inputed.length < 6) {
				$('#wrongPw').show();
				$('#wrongPw2').hide();
			} else {
				$('#wrongPw').hide();
				$('#wrongPw2').hide();
			}
		}
		function checkPw2() {
			var inputed = f.password.value;
			var inputed2 = f.RepeatPassword.value;
			if (inputed != inputed2) {
				$('#wrongPw2').show();
			} else {
				$('#wrongPw2').hide();
			}
		}
		function checkMail() {
			var inputed = f.user_mail.value;
			var CheckForm = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			if (!CheckForm.test(inputed)) {
				$('#successMail').hide();
				$('#failMail').hide();
				$('#wrongMail').show();
				emailCheck = 0;
			} else {
				$.ajax({
					data : {
						user_mail : inputed
					},
					url : "checkMail.do",
					success : function(data) {
						if (inputed == "" && data == '0') {
							$('#successMail').hide();
							$('#failMail').show();
							$('#wrongMail').hide();
							emailCheck = 0;
						} else if (data == '0') {
							$('#successMail').show();
							$('#failMail').hide();
							$('#wrongMail').hide();
							emailCheck = 1;
						} else if (data == '1') {
							$('#successMail').hide();
							$('#failMail').show();
							$('#wrongMail').hide();
							emailCheck = 0;
						}
					}
				})
			}
		}
		function userReg() {
			if (doRegUserCkeck(document.getElementById('reg_form'))) {
				$.ajax({
					url : "/insertUserInfo.do",
					type : "post",
					data : {
						'user_id' : $('#user_reg_id').val(),
						'user_name' : $('#user_reg_name').val(),
						'password' : $('#user_reg_password').val(),
						'user_mail' : $('#user_reg_mail').val()
					},
					success : function(a) {
						console.log(a);
						reset_reg_form();
						if (a == 0) {
							$('#alert_modal_body').html('회원가입되었습니다.');
							$('#alert_modal').modal('show')
							$('#alert_modal').on('hide.bs.modal', function(e) {
								location.href = "/login.do";
							});
						} else if (a == 1) {
							$('#alert_modal_body').html('이미 가입된 회원입니다.');
							$('#alert_modal').modal('show');
							reset_reg_form();
						} else if (a == 2) {
							$('#alert_modal_body').html(
									'일시적 오류가 발생하였습니다. 나중에 다시 시도해주세요.');
							$('#alert_modal').modal('show');
							reset_reg_form();
						}
					}
				})
			}
		}
		function doRegUserCkeck(f) {
			if (idCheck == 0) {
				$('#alert_modal_body').html('사용하실수 없는 아이디 입니다.');
				$('#alert_modal').modal('show')
				return false;
			}
			if (emailCheck == 0) {
				$('#alert_modal_body').html('사용하실수 없는 이메일 입니다.');
				$('#alert_modal').modal('show')
				return false;
			}
			if (f.password.value.length < 6) {
				$('#alert_modal_body').html('6~16자의 비밀번호를 사용해주세요.');
				$('#alert_modal').modal('show')
				return false;
			}
			if (f.password.value.length > 16) {
				$('#alert_modal_body').html('6~16자의 비밀번호를 사용해주세요.');
				$('#alert_modal').modal('show')
				return false;
			}
			if (f.user_id.value == "") {
				$('#alert_modal_body').html('아이디를 입력하세요.');
				$('#alert_modal').modal('show')
				return false;
			}
			if (f.user_name.value == "") {
				$('#alert_modal_body').html('이름을 입력하세요.');
				$('#alert_modal').modal('show')
				return false;
			}
			if (f.password.value == "") {
				$('#alert_modal_body').html('비밀번호를 입력하세요.');
				$('#alert_modal').modal('show')
				return false;
			}
			if (f.RepeatPassword.value == "") {
				$('#alert_modal_body').html('비밀번호 재입력을 입력하세요.');
				$('#alert_modal').modal('show')
				return false;
			}
			if (f.user_mail.value == "") {
				$('#alert_modal_body').html('Email을 입력하세요.');
				$('#alert_modal').modal('show')
				return false;
			}
			if (f.password.value != f.RepeatPassword.value) {
				$('#alert_modal_body').html('비밀번호가 같지 않습니다.');
				$('#alert_modal').modal('show')
				return false;
			}
			return true;
		}
	</script>



</body>
</html>