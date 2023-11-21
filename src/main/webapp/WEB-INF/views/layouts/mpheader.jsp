<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>MyPage</title>
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" />
        
    <link rel="stylesheet" href="/resources/css/mypage/mypage.css"/>
    
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>

    <div class="container">
        <header class="jumbotron mb-0 rounded-0">
            <h1>SportyLight</h1>
        </header>
 
<nav id="mypagemenu"
	class="navbar navbar-expand-sm navbar-light " style="background-color: #fff;">
	<ul class="navbar-nav mx-auto mb-2 mb-lg-0 ">
			<li class="nav-item d-md-none d-lg-block "><a id="myct1"
				class="nav-link" href="/mypage?membersId=${membersId}">나의 회원 정보</a></li>
			<li class="nav-item d-md-none d-lg-block "><a id="myct2"
				class="nav-link" href="/mypage/update?membersId=${membersId}">회원 정보 변경</a></li>
			<li class="nav-item d-md-none d-lg-block "><a id="myct3"
				class="nav-link" href="/mypage/withdrawl?membersId=${membersId}">회원 탈퇴 하기</a></li>
		</ul>
		</nav>
		