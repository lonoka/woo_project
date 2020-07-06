<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<nav class="fh5co-nav" role="navigation">
	<div class="container">
		<div class="row">
			<div class="col-md-3 col-xs-2">
				<div id="fh5co-logo">
					<a href="/index.do">MusicalMoa</a>
				</div>
			</div>
			<div class="col-md-9 col-xs-6 text-right menu-1">
				<ul>
					<li class="has-dropdown"><a href="/Musical_select.do">뮤지컬정보</a>
						<ul class="dropdown">
							<li><a href="/Musical_select.do?sort=Week">주간 인기순</a></li>
							<li><a href="/Musical_select.do?sort=Month">월간 인기순</a></li>
							<li><a href="/Musical_select.do?sort=Alpha">가나다순</a></li>
						</ul></li>
					<li><a href="/reg.do">회원가입</a></li>
					<li><a href="/login.do">로그인</a></li>
				</ul>
			</div>
		</div>

	</div>
</nav>