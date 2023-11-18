
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<%@ include file="/WEB-INF/views/layouts/mpheader.jsp"%>

<style>
#myct3 {
	color: #00000;
	text-shadow: 0px 5px 5px rgba(0, 0, 0, 0.25);
}
</style>

<body>

	<form id="withdrawalForm" action="/mypage/withdrawl" method="post"> 

		<div class="panel2 panel-default">
			<div class="form-group3 mx-auto check">

				<div class="wdtext">*가입된 회원 정보가 모두 삭제됩니다.*</div>
				<!-- 이메일 -->
				<div class="form-group4 mx-auto check" id="emailbox">
					<input class="memberemail" value="${member.email}" readonly>
				</div>
				<!-- 비밀번호  -->
				<div class="form-group5 mx-auto check">
					<input class="password" type="password" placeholder="비밀번호를 입력해주세요.">
				</div>
				<!-- 비밀번호 확인  -->
				<div class="form-group6 mx-auto check">
					<input class="password2" type="password" placeholder="비밀번호를 확인해주세요.">
				</div>
				<!-- 버튼  -->
				<div class="row mx-auto">
					<div class="col-6 text-right">
						<div class="form-group mx-auto submitButton">
							<button type="submit" class="btn btn-info" >확인</button>
						</div>
					</div>
					<div class="col-6 text-left">
						<div class="form-group mx-auto submitButton"
							style="margin-left: -10px;">
                            <a href="/mypage?membersId=${member.membersId}" class="btn btn-info">취소</a>
						</div>
					</div>
				</div>

			</div>
		</div>
	</form>
</body>
