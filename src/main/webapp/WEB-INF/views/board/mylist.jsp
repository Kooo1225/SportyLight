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
	
		<script src="/resources/js/home/rest.js"></script>
		<script src="/resources/js/board/boardAjax.js"></script>
	
		<script>
		const MYLIST_URL = "/api/board"
		const MYSTATE_URL = "/api/board"
		
		function getChatting(gatheringId) {
	 		let f = document.createElement('form');

			let gatherIdObj;
			gatherIdObj = document.createElement('input');
			gatherIdObj.setAttribute('type', 'hidden');
			gatherIdObj.setAttribute('name', 'gatheringId');
			gatherIdObj.setAttribute('value', gatheringId);
			
			let CSRFToken;
			CSRFToken = document.createElement('input');
			CSRFToken.setAttribute('type', 'hidden');
			CSRFToken.setAttribute('name', '${_csrf.parameterName}');
			CSRFToken.setAttribute('value', '${_csrf.token}');
				
			f.appendChild(gatherIdObj);
			f.appendChild(CSRFToken);
			f.setAttribute('method', 'post');
			f.setAttribute('action', '../chat');
			document.body.appendChild(f);
			f.submit(); 
		}
		
		async function getState(membersId, gatheringId) {
			const URL = "/api/board/getstate"
			
			let state = await rest_post(URL, gatheringId, membersId);

			if (state === 2 || state === 1) {
				getChatting(gatheringId);
			}
			else {
				alert("권한이 부여되지 않았습니다.");
				return;
			}
		}
	
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
			
/* 			$('.mylist-title').on('click', { gatheringId : gatheringId }, function(e) {
			 	let f = document.createElement('form');

				let gatherIdObj;
				gatherIdObj = document.createElement('input');
				gatherIdObj.setAttribute('type', 'hidden');
				gatherIdObj.setAttribute('name', 'gatheringId');
				gatherIdObj.setAttribute('value', gatheringId);
				
				let CSRFToken;
				CSRFToken = document.createElement('input');
				CSRFToken.setAttribute('type', 'hidden');
				CSRFToken.setAttribute('name', '${_csrf.parameterName}');
				CSRFToken.setAttribute('value', '${_csrf.token}');
					
				f.appendChild(gatherIdObj);
				f.appendChild(CSRFToken);
				f.setAttribute('method', 'post');
				f.setAttribute('action', '../chat');
				document.body.appendChild(f);
				f.submit(); 
			}) */
			
		})
		</script>
		
	</div>
	<div class="scrollBar mx-auto" style="height: 100%;">
		<div class="container0"></div>
	</div>
</body>

	
<%-- 	<%@ include file="../layouts/chatFooter.jsp"%> --%>
