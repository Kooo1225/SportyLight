<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ include file="/WEB-INF/views/layouts/homeHeader.jsp"%>


<div class="pannel mx-auto">
	<div class="mylist-box mx-auto">
		<ul class="nav justify-content-center">
			<li class="nav-mylist-item"><a class="nav-mylist-link" id ="btn1">신청한
					모임</a></li>
			<li class="nav-mylist-item"><a class="nav-mylist-link" id ="btn2">내가
					올린 모임</a></li>
			<li class="nav-mylist-item"><a class="nav-mylist-link" id ="btn3">찜한
					모임</a></li>
		</ul>
	</div>
	
	<script src="/resources/js/home/rest.js"></script>
	<script src="/resources/js/home/boardAjax.js" ></script>
	
	<script>
	const MYLIST_URL = "/api/board"
	const MYSTATE_URL = "/api/board"
	$(document).ready(function(e) {
		
		$("#btn1").on("click", async function(e) {
			$('.mylist-gather-container').empty();
			const myState = await rest_get(MYSTATE_URL + "/mystate?membersId=" + ${membersId});
			console.log(myState);
			
			let listEl;
			
			$.each(myState, function(index, item) {
				listEl = $(MyStateTemplate(item));
				$('.mylist-gather-container').append(listEl);
 			})	
		})
		
		$("#btn2").on("click", async function(e) {
			$('.mylist-gather-container').empty();
			
			const myList = await rest_get(MYLIST_URL + "/mylist?membersId=" + ${membersId});
			console.log(myList);
			
			let listEl;
			
			$.each(myList, function(index, item) {
				listEl = $(MyListTemplate(item));
				$('.mylist-gather-container').append(listEl);
 			})	
		})
		$("#btn1").trigger("click");
	})
	</script>
	
	<div class="mylist-border mx-auto">
		<div class="mylist-gather-container mx-auto">
			
			<c:forEach var="mystate" items="${mystate}">
				<div class="mylist-gather-wrapper mx-auto">
					<div class="mylist-gather-title">
						<span class="mylist-gather-title-main">${mystate.title }</span> <span
							class="mylist-gather-title-type">${mystate.type }</span>
					</div>
					<div class="mylist-gather-dateTime">
						${mystate.headCount}명 |
						<fmt:parseDate value="${mystate.dateTime}"
							pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both" />
						<fmt:formatDate pattern="yyyy년 MM월 dd일(EE) HH시 mm분"
							value="${parsedDateTime}" />
					</div>
					<div class="mylist-gather-description"> ${mystate.description}</div>
				</div>
			</c:forEach>
			
		</div>
	</div>
</div>


</body>