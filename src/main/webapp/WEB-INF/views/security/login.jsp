<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

 <%@ include file="../layouts/loginHeader.jsp" %>
<link rel="stylesheet" href="/resources/css/security/login.css"/>








<div class="container3">
<a href="/" style="text-decoration:none;"><h1 class="page-header" style="font-size: 45px;"> SportyLight</h1><br></a>
<h2 class="page-header" style="font-size: 25px;"> WELCOME</h2><br>

	<div class="panel panel-default">
		<div class="panel-body">
				
			<form action="/security/login" method="post">
			<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
				<div class="input-style">
				
					<div class="form-group mx-auto" style="margin:0px;">
					
					<c:if test="${param.error == 'true' }">
					    <input class="error" id="error" placeholder="사용자 ID 또는 비밀번호가 일치하지 않습니다."readonly>
				    </c:if>
		
				    <c:if test="${param.error == 'login_required' }">
					     <input class="error" id="error" placeholder="로그인이 필요한 서비스 입니다."readonly>
				    </c:if>
				    </div>
				    
				    <div class="form-group mx-auto" >
						<input type="email" name="email" placeholder=" 아이디(e-mail)를 입력해주세요." >
					</div>
					
					<div class="form-group mx-auto">
						<input type="password" name="password" placeholder=" 비밀번호를 입력해주세요." >
					</div>
					<div class="form-group mx-auto">
						<div class="autologin">
							<input type="checkbox" name="remember-me"> 자동 로그인
						</div>
						<div class="category10 mx-auto">
							<a href="/security/findId">아이디 찾기 |</a>
							<a href="#">비밀번호 찾기 |</a>
							<a href="/security/join">회원가입</a>
						</div>
					</div>
					<div class="form-group mx-auto submitButton" style="margin-top: 24px;">
							<button type="submit">LOG-IN</button>
							<button type="submit">JOIN</button>
							
							
<!-- 							 <a href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=ad5f045a6d90afc878186d9093e76908&redirect_uri=http://localhost:8080/security/kakao/callback"><img src="/resources/images/layouts/kakao_login_button.png"/></a>
 -->					</div>
				</div>
			</form>
		</div>
	</div>
	</div>
	<img src="/resources/images/layouts/wellguides_running.gif" alt="Animated GIF"
	     style="position: relative; bottom: 390px; right: 340px; width: 646px;">
	
	


 
