<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%@ include file="../layouts/homeHeader.jsp"%>

<div>

	<h3>모임 목록</h3>
	<c:forEach var="list" items="${myList }">
		<button class="gather-list" onclick="#">${list.title }</button>
		<br>
	</c:forEach>

	<br>
	
	
	
	<h3>회원 목록</h3>
	<div class="non-apply">
		<form:form modelAttribute="gatherMemebers" role="form" action="/board/manage" method="post">
		
			<c:forEach var="user" items="${myMemberList}">
			
				<div class="user-list">
					<label>${user.nickname}</label>
					<form:hidden path="membersId" name="membersId" value="${user.membersId}"/>
					<form:hidden path="gatheringId" name="gatheringId" value="${gatheringId}"/>
					
					<form:checkbox path="state" value="1"/>승인
					<form:checkbox path="state" value="-1"/>거부
					<form:button type="submit">확인</form:button>
				</div>

			</c:forEach>

		</form:form>
	</div>
	<br><br>

	<h3>승인 목록</h3>
	<div class="apply">
	
	</div>
	
</div>

<script src="/resources/js/home/rest.js"></script>
<script>
$(document).ready(function(e) {

})

</script>