<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>마이페이지</title>
    
    	<!-- favicon -->
	<link rel="shortcut icon" type="image/png" href="/resources/images/favicon/favicon.ico">
	<link rel="apple-touch-icon" sizes="57x57" href="/apple-icon-57x57.png">
	<link rel="apple-touch-icon" sizes="60x60" href="/apple-icon-60x60.png">
	<link rel="apple-touch-icon" sizes="72x72" href="/apple-icon-72x72.png">
	<link rel="apple-touch-icon" sizes="76x76" href="/apple-icon-76x76.png">
	<link rel="apple-touch-icon" sizes="114x114" href="/apple-icon-114x114.png">
	<link rel="apple-touch-icon" sizes="120x120" href="/apple-icon-120x120.png">
	<link rel="apple-touch-icon" sizes="144x144" href="/apple-icon-144x144.png">
	<link rel="apple-touch-icon" sizes="152x152" href="/apple-icon-152x152.png">
	<link rel="apple-touch-icon" sizes="180x180" href="/apple-icon-180x180.png">
	<link rel="icon" type="image/png" sizes="192x192"  href="/android-icon-192x192.png">
	<link rel="icon" type="image/png" sizes="32x32" href="/favicon-32x32.png">
	<link rel="icon" type="image/png" sizes="96x96" href="/favicon-96x96.png">
	<link rel="icon" type="image/png" sizes="16x16" href="/favicon-16x16.png">
	<link rel="manifest" href="/manifest.json">
	<meta name="msapplication-TileColor" content="#ffffff">
	<meta name="msapplication-TileImage" content="/ms-icon-144x144.png">
	<meta name="theme-color" content="#ffffff">
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" />
        
    <link rel="stylesheet" href="/resources/css/mypage/mypage.css"/>
    
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <div class="container">
        <header class="jumbotron mb-0 rounded-0">
            <a href="/map" style="text-decoration:none;"><h1>SportyLight</h1></a>
        </header>
 
<nav id="mypagemenu"
	class="navbar navbar-expand-sm navbar-light " style="background-color: #fff;">
	<ul class="navbar-nav mx-auto mb-2 mb-lg-0 ">
			<li class="nav-item d-md-none d-lg-block "><a id="myct1"
				class="nav-link" href="/mypage?membersId=${membersId}">나의 회원 정보</a></li>
			
			<sec:authentication property="principal.member.oauth" var="oauth" />	
				<c:if test="${empty oauth}">
					<li class="nav-item d-md-none d-lg-block "><a id="myct2"
						class="nav-link" href="/mypage/update?membersId=${membersId}">회원 정보 변경</a></li>
					<li class="nav-item d-md-none d-lg-block "><a id="myct3"
						class="nav-link" href="/mypage/withdrawal?membersId=${membersId}">회원 탈퇴 하기</a></li>
				</c:if>
			<sec:authentication property="principal.member.oauth" var="oauth" />
				<c:if test="${!empty oauth}">
					<li class="nav-item d-md-none d-lg-block "><a id="myct3"
						class="nav-link" href="/mypage/withdrawal?membersId=${membersId}">회원 탈퇴 하기</a></li>
				</c:if>
			
		</ul>
		</nav>
		
		