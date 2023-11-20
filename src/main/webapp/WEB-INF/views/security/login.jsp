<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="../layouts/joinHeader.jsp" %>

<style>
.cover {
	display: flex;
	justify-content: space-between;
}
</style>

<h1 class="page-header"> WELCOME</h1><br>

	<div class="panel panel-default">
		<div class="panel-body">
				<c:if test="${param.error == 'true' }">
					<div class="error">사용자 ID 또는 비밀번호가 일치하지 않습니다.</div>
				</c:if>
		
				<c:if test="${param.error == 'login_required' }">
					<div class="error">로그인이 필요한 서비스 입니다.</div>
				</c:if>
			<form action="/security/login" method="post">
			<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
				<div class="input-style">
					<div class="form-group mx-auto">
						<input type="email" name="email" placeholder=" 아이디(e-mail)를 입력해주세요." >
					</div>
					<div class="form-group mx-auto">
						<input type="password" name="password" placeholder=" 비밀번호를 입력해주세요." >
					</div>
					<div class="cover">
						<div>
							<input type="checkbox" name="remember-me"> 자동 로그인
						</div>
						<div>
							<a href="#">아이디 찾기</a>
							<a href="#">비밀번호 찾기</a>
						</div>
					</div>
					<div class="form-group mx-auto submitButton">
							<button type="submit">LOG-IN</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>