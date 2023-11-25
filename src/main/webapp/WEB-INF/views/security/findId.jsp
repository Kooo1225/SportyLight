<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ include file="../layouts/joinHeader.jsp"%>

     <link rel="stylesheet" href="/resources/css/security/findId.css"/>

<h1 class="page2-header">FIND ID</h1>
<br>

<div class="mx-auto">
	<form id="findForm" action="/security/findId" method="post">
     <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

		<div class="form-group1 mx-auto">
			<input type="text" name="name" id="name2" placeholder="이름">
		</div>
		<div class="form-group2 mx-auto">
			<i class="fa-sharp fa-regular fa-calendar-days fa-2x" style="color: #518E7B;"></i> 
			<input type="date" id="date2" name="birth">
		</div>
		<div class="form-group3 mx-auto submitbutton">
		<button type="submit" id="id-find" >아이디 찾기</button>
	</div>
	</form>

</div>
<script>
        <c:if test="${result == 'true'}">
            alert('회원 아이디가 일치합니다.\n회원 아이디: ${email}');
        </c:if>
        <c:if test="${result == 'false'}">
            alert('회원 정보를 다시 확인해주세요.\n${notFoundMessage}');
        </c:if>
        
    </script>


</body>