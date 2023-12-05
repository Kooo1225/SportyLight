<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%@ include file="../layouts/homeHeader.jsp"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
<link rel="stylesheet" href="/resources/css/board/mylist.css" />





	<div class="pannel mx-auto">
		<div class="mylist-box mx-auto">
			<ul class="nav justify-content-center">
				<li class="nav-mylist-item"><a class="nav-mylist-link" id="btn3">신청한모임</a></li>
				<li class="nav-mylist-item"><a class="nav-mylist-link" id="btn4">내가 올린 모임</a></li>
			</ul>
		</div>
	    
	    <script>
	    $(document).ready(function () {
	        // 공통의 클릭 이벤트 핸들러
	        $(".nav-mylist-link").on("click", function () {
	          // 모든 링크의 색상을 초기화
	          $(".nav-mylist-link").css({
	            'background-color': 'white', // 초기 배경색으로 되돌리기
	            'color': '#7FB3FA' // 초기 글자색으로 되돌리기
	          });

	          // 클릭된 링크의 색상을 변경
	          $(this).css({
	            'background-color': '#7FB3FA',
	            'color': 'white'
	          });
	        });
	    });  
	    </script>
	
		<script src="/resources/js/home/rest.js"></script>
		<script src="/resources/js/board/boardAjax.js"></script>
	
		<script>
		const MYLIST_URL = "/api/board"
		const MYSTATE_URL = "/api/board"
		
	
		async function remove(gatheringId) {
			if(!confirm('정말 삭제할까요?')) return;
			const result = await rest_get2(MYLIST_URL + "/remove?gatheringId=" + gatheringId);


			$(this).closest('.card').remove();
		    $("#btn4").trigger("click");
		}
		
 		async function deleteMyState(gatheringId, membersId) {
			if(!confirm('정말 삭제할까요?')) return;
			
			const result = await rest_get2(MYLIST_URL + "/delete?gatheringId=" + gatheringId + "&membersId=" + membersId);

			$(this).closest('.card').remove();
		    $("#btn3").trigger("click");
		}
		
		$(document).ready(function(e) {
	
			$("#btn3").on("click", async function(e) { //내가 신청한 게시글(btn1) 버튼 클릭
				$('.container0').empty();
				const myState = await rest_get(MYSTATE_URL + "/mystate?membersId=" + ${membersId});
				console.log(myState);
				
				let listEl;
	
				$.each(myState, function(index, item) {
					listEl = $(MyStateTemplate(item));
					$('.container0').append(listEl);
	 			})
			})
			
			$("#btn4").on("click", async function(e) { //내가 올린 게시글(btn2) 버튼 클릭
				$('.container0').empty();
				
				const myList = await rest_get(MYLIST_URL + "/mylist?membersId=" + ${membersId});
				console.log(myList);
				
				let listEl;
				
				$.each(myList, function(index, item) {
					listEl = $(MyListTemplate(item));
					$('.container0').append(listEl);
	 			})	
			})
			
			
			$("#btn3").trigger("click"); // btn1(내가 신청한 모임글) 클릭 효과
			
		})
		</script>
	</div>
	<div class="scrollBar mx-auto" style="height: 100%;">
		<div class="container0"></div>
	</div>
</body>


<%-- 	<div class="mylist-border mx-auto">
		<div class="mylist-container mx-auto">
			
			<c:forEach var="mystate" items="${myState}">
				<div class="mylist-wrapper mx-auto">
					<div class="mylist-title">
						<span class="mylist-title-main">${mystate.title }</span> <span
							class="mylist-title-type">${mystate.type }</span>
					</div>
					<div class="mylist-dateTime">
						${mystate.headCount}명 |
						<fmt:parseDate value="${mystate.dateTime}"
							pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both" />
						<fmt:formatDate pattern="yyyy년 MM월 dd일(EE) HH시 mm분"
							value="${parsedDateTime}" />
					</div>
					<div class="mylist-description"> ${mystate.description}</div>
				</div>
			</c:forEach>
			
		</div>
	</div> --%>
	
<%-- 	<%@ include file="../layouts/chatFooter.jsp"%> --%>
