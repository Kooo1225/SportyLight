<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>home header</title>

<link rel="stylesheet" href="/resources/css/layouts/main.css" />
<link rel="stylesheet" href="/resources/css/home/sidebar.css">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>

<!-- Popper JS -->
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>

</head>

<body style="overflow-y: hidden">

	<!-- 로고 -->
	<nav id="container"
		class="navbar navbar-expand-sm navbar-light bg-light">
		<a id="logo" class="navbar-brand" href="/"> <img
			src="/resources/images/layouts/logo.png">
		</a>


		<!-- 메뉴 -->
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav">



				<li class="nav-item active"><a id="menu1" class="nav-link"
					href="/">모임</a></li>

				<sec:authorize access="isAuthenticated()">
					<sec:authentication property="principal.member.membersId"
						var="membersId" />
					<li class="nav-item"><a id="menu2" class="nav-link"
						href="/board/mylist?membersId=${membersId}">목록</a></li>
				</sec:authorize>

				<li class="nav-item"><a id="menu3" class="nav-link" href="/">대회</a></li>
			</ul>
		</div>



		<!-- 로그인 및 회원가입 버튼 -->
		<sec:authorize access="isAnonymous()">
      <div class="ml-auto">
        <a id="login" href="/security/login" class="btn btn-link">로그인</a> 
        <a id="join" href="/security/join" class="btn btn-link">회원가입</a>
      </div>
		</sec:authorize>

		<sec:authorize access="isAuthenticated()">
      <div class="ml-auto">
        <sec:authentication property="principal.member.nickname" var="nickname" />
          <a id="login-nickname" href="/mypage?membersId=${member.membersId }">
            <img src="/resources/images/home/cat.jpeg" class="home-avatar" style="margin-right:4px;" />${nickname}님</a>
          <a id="logout" href="/security/logout" class="btn btn-link">로그아웃</a>
      </div>
		</sec:authorize>
	</nav>
	
	<!-- 로그아웃 처리 -->
	<form id="logoutForm" action="/security/logout" method="post">
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
	</form>

	<script>
	$(document).ready(function() {
		$('#logout').click(function(e) {
			e.preventDefault();
			$('#logoutForm').submit();
		});
	});
	</script>
