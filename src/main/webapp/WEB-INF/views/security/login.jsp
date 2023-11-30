<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="../layouts/joinHeader.jsp" %>
<link rel="stylesheet" href="/resources/css/security/login.css"/>

<h1 class="page-header"> WELCOME</h1><br>

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
					<div class="form-group mx-auto cover">
						<div>
							<input type="checkbox" name="remember-me"> 자동 로그인
						</div>
						<div>
							<a href="/security/findId">아이디 찾기 |</a>
							<a href="#">비밀번호 찾기 |</a>
							<a href="/security/join">회원가입</a>
						</div>
					</div>
					<div class="form-group mx-auto submitButton">
							<button type="submit">LOG-IN</button><br>
							 <a href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=ad5f045a6d90afc878186d9093e76908&redirect_uri=http://localhost:8080/security/kakao/callback"><img src="/resources/images/layouts/kakao_login_button.png"/></a>
					</div>
				</div>
			</form>
		</div>
	</div>
	
	<div id="carouselExampleControls" class="carousel slide mx-auto" data-ride="carousel"
	style="width:400px; height:200px;">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img class="d-block w-100" src="/resources/images/layouts/login1.png" alt="First slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="/resources/images/layouts/login2.png" alt="Second slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="/resources/images/layouts/login3.png" alt="Third slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="/resources/images/layouts/login4.png" alt="Third slide">
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselControls" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselControls" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
<script>
  $(document).ready(function() {
    $('#carouselControls').carousel({
      interval: 2000 // 2초마다 슬라이드 넘김
    });
  });
</script>
</body>

<%@ include file="../layouts/footer.jsp"%>