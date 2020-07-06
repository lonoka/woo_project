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
					id="login_form">
					<span class="login100-form-title p-b-51"> Login </span>

					<div class="wrap-input100 validate-input m-b-16">
						<input class="input100" type="text" id="user_login_id"
							name="user_id" placeholder="Username"> <span
							class="focus-input100"></span>
					</div>


					<div class="wrap-input100 validate-input m-b-16"
						data-validate="Password is required">
						<input class="input100" type="password" id="user_login_password"
							name="password" placeholder="Password"
							style="ime-mode: disabled;" required="required"> <span
							class="focus-input100"></span>
					</div>

					<div class="flex-sb-m w-full p-t-3 p-b-24">
						<div class="contact100-form-checkbox">
							<input class="input-checkbox100" type="checkbox" id="customCheck"
								name="userCheck"> <label class="label-checkbox100"
								for="customCheck"> ID 기억하기 </label>
						</div>
					</div>

					<div class="container-login100-form-btn m-t-17">
						<button class="login100-form-btn" type="button" onclick="loginUser()">Login</button>
					</div>

				</form>
				<div class="" style="margin: auto;">
					<div class="text-center">
						<a class="small" href="/reg.do">회원가입</a>
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
		function loginUser() {
			if (doModifyUserCheck(document.getElementById('login_form'))) {
				$.ajax({
					url : "/Loginbtn.do",
					type : "post",
					data : {
						'user_id' : $('#user_login_id').val(),
						'password' : $('#user_login_password').val()
					},
					success : function(a) {
						console.log(a);
						if (a == 1) {
							$('#alert_modal_body').html('관리자 로그인에 성공하였습니다.');
							$('#alert_modal').modal('show')
							$('#alert_modal').on('hide.bs.modal', function(e) {
								location.href = "/index.do";
							});
						} else if (a == 0) {
							$('#alert_modal_body').html(
									'없는 아이디 또는 잘못된 비밀번호입니다.');
							$('#alert_modal').modal('show')
						} else if (a == 2) {
							$('#alert_modal_body').html('로그인되었습니다.');
							$('#alert_modal').modal('show')
							$('#alert_modal').on('hide.bs.modal', function(e) {
								location.href = "/index.do";
							});
						}
					}
				})
			}
		}
		function doModifyUserCheck(f) {
			if (f.user_id.value == "") {
				$('#alert_modal_body').html('아이디를 입력하세요.');
				$('#alert_modal').modal('show')
				return false;
			}
			if (f.password.value == "") {
				$('#alert_modal_body').html('비밀번호를 입력하세요.');
				$('#alert_modal').modal('show')
				return false;
			}
			return true;
		}
	</script>
	<!-- 쿠키 저장 및 로드 -->
<script>
	window.onload = function() {
		var userInputId = getCookie("userInputId");//저장된 쿠기값 가져오기
		$('input[name=user_id]').val(userInputId);
		if ($('input[name=user_id]').val() != "") { // 그 전에 ID를 저장해서 처음 페이지 로딩
			// 아이디 저장하기 체크되어있을 시,
			$('input[name=userCheck]').attr("checked", true); // ID 저장하기를 체크 상태로 두기.
		}
		$('input[name=userCheck]').change(function() { // 체크박스에 변화가 발생시
			if ($('input[name=userCheck]').is(":checked")) { // ID 저장하기 체크했을 때,
				var userInputId = $('input[name=user_id]').val();
				setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
			} else { // ID 저장하기 체크 해제 시,
				deleteCookie("userInputId");
			}
		});
		// ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
		$('input[name=user_id]').keyup(function() { // ID 입력 칸에 ID를 입력할 때,
			if ($('input[name=userCheck]').is(":checked")) { // ID 저장하기를 체크한 상태라면,
				var userInputId = $('input[name=user_id]').val();
				setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
			}
		});
	};
	function setCookie(cookieName, value, exdays) {
		var exdate = new Date();
		exdate.setDate(exdate.getDate() + exdays);
		var cookieValue = escape(value)
				+ ((exdays == null) ? "" : "; expires=" + exdate.toGMTString());
		document.cookie = cookieName + "=" + cookieValue;
	}
	function deleteCookie(cookieName) {
		var expireDate = new Date();
		expireDate.setDate(expireDate.getDate() - 1);
		document.cookie = cookieName + "= " + "; expires="
				+ expireDate.toGMTString();
	}
	function getCookie(cookieName) {
		cookieName = cookieName + '=';
		var cookieData = document.cookie;
		var start = cookieData.indexOf(cookieName);
		var cookieValue = '';
		if (start != -1) {
			start += cookieName.length;
			var end = cookieData.indexOf(';', start);
			if (end == -1)
				end = cookieData.length;
			cookieValue = cookieData.substring(start, end);
		}
		return unescape(cookieValue);
	}
</script>

</body>
</html>