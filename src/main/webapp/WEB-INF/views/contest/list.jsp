<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../layouts/homeHeader.jsp"%>
<link rel="stylesheet" href="/resources/css/contest/contest.css">

<div class="container8 mx-auto">
	<div class="contest-title">
		<h3>각종 대회 신청</h3>
	</div>
</div>


<div class="container11 mx-auto" style="margin-bottom: 80px;">

	<div class="contest-list mx-auto">

		<div>
			<span><a href="#" class="btncategory">카테고리 :</a></span> 
			<span><a href="#" class="common-button button0">전체</a></span> 
			<span><a href="#" class="common-button button1">마라톤</a></span> 
			<span><a href="#" class="common-button button2">축구</a></span> 
			<span><a href="#" class="common-button button3">농구</a></span> 
			<span><a href="#" class="common-button button4">야구</a></span> 
			<span><a href="#" class="common-button button5">테니스</a></span> 
			<span><a href="#" class="common-button button6">배드민턴</a></span>

		</div>
	</div>
	
<script src="/resources/js/home/rest.js" ></script>
<script src="/resources/js/contest/contestAjax.js"></script>
<script>
$(document).ready(function () {
	
	$('.common-button').on('click', async function(e) {
		if($(this).text() == '전체') {
			location.reload(true);
		}
		
		$('.contest-detail').empty();
		
		const contestList = await rest_get('/api/contest/type/' + $(this).text());

		let listEl;
		
		$.each(contestList, function(index, item) {
			listEl = $(createCardTemplate(item));
			$('.contest-detail').append(listEl);
		})
	})
	
	$(".button0, .button1, .button2, .button3, .button4, .button5, .button6").on("click", function () {
	    // 모든 버튼의 색상을 초기화
		$(".button0, .button1, .button2, .button3, .button4, .button5, .button6").css({
			'background-color': '', 
			'color': '#535353'
		});

		// 클릭된 버튼의 색상을 변경
		$(this).css({
			'background-color': 'gray'
		});
 		});

	$(".button1").on("click", function () {
		$(this).css({
			'background-color': '#7fccdd'
		});
	});

	$(".button2").on("click", function () {
		$(this).css({
			'background-color': '#8bcba0'
		});
	});

	$(".button3").on("click", function () {
		$(this).css({
			'background-color': '#ffb79a'
		});
	});

	$(".button4").on("click", function () {
		$(this).css({
			'background-color': '#fdabad'
		});
	});

	$(".button5").on("click", function () {
		$(this).css({
			'background-color': '#c7aadf'
		});
	});

	$(".button6").on("click", function () {
		$(this).css({
			'background-color': '#fbfac3'
		});
	});
});
</script>
 <div class="scroll4-container">
	<div class="contest-detail mx-auto">
		<c:forEach var="list" items="${contest}">
			<div class="card">
				
				<c:choose>
					<c:when test="${list.title eq '마라톤'}">
						<div class="card-header" style="background: #7fccdd; border-radius: 12px 11px 0px 0px;">
							<div class="contest-title2">${list.association}</div>
						</div>
					</c:when>
				
					<c:when test="${list.title eq '축구'}">
						<div class="card-header" style="background: #8bcba0; border-radius: 12px 11px 0px 0px;">
							<div class="contest-title2">${list.association}</div>
						</div>
					</c:when>
					
					<c:when test="${list.title eq '농구'}">
						<div class="card-header" style="background: #ffb79a; border-radius: 12px 11px 0px 0px;">
							<div class="contest-title2">${list.association}</div>
						</div>
					</c:when>
					
					<c:when test="${list.title eq '야구'}">
						<div class="card-header" style="background: #fdabad; border-radius: 12px 11px 0px 0px;">
							<div class="contest-title2">${list.association}</div>
						</div>
					</c:when>
					
					<c:when test="${list.title eq '테니스'}">
						<div class="card-header" style="background: #c7aadf; border-radius: 12px 11px 0px 0px;">
							<div class="contest-title2">${list.association}</div>
						</div>
					</c:when>
					
					<c:when test="${list.title eq '배드민턴'}">
						<div class="card-header" style="background: #fbfac3; border-radius: 12px 11px 0px 0px;">
							<div class="contest-title2">${list.association}</div>
						</div>
					</c:when>
				
					<c:otherwise>
						<div class="card-header" style="background: gray; border-radius: 12px 11px 0px 0px;">
							<div class="contest-title2">${list.association}</div>
						</div>
					</c:otherwise>
				</c:choose>

				<div class="card-body">
				   
					<div class="contest-category">${list.title}</div>
					<div class="contest-site">사이트 링크
						<a href="${list.link}" class="contest-link">바로가기</a>
					</div>
					</div>
				</div>
		</c:forEach>
		</div>
	</div>
</div>
</body>

<%@ include file="../layouts/footer.jsp"%>
