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


<div class="container11 mx-auto">

	<div class="contest-list mx-auto">

		<div>
			<span><a href="#" class="btncategory">카테고리 :</a></span> 
			<span><a href="#" class="common-button button0">전체</a></span> 
			<span><a href="#" class="common-button button1">러닝</a></span> 
				<span><a href="#" class="common-button button2">축구</a></span> 
				<span><a href="#" class="common-button button3">농구</a></span> 
				<span><a href="#" class="common-button button4">야구</a></span> 
				<span><a href="#" class="common-button button5">테니스</a></span> 
				<span><a href="#" class="common-button button6">배드민턴</a></span>

		</div>
	</div>
	<script>
	$(document).ready(function () {
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

	<div class="contest-detail mx-auto">

		<div class="card">

			<div class="card-header"
				style="background: #7fccdd; border-radius: 12px 11px 0px 0px;">
				<div class="contest-title2">이건 러닝 카드</div>
			</div>

			<div class="card-body">
				<div class="contest-category">카테고리 : 러닝</div>
				<div class="contest-cite">
					사이트 <br> www.cite.com.cite.com.cite.com
					<%-- <a href="${contest.link}" style="text-decoration: none">${contest.association}</a> --%>
				</div>
			</div>
		</div>

		<div class="card">

			<div class="card-header"
				style="background: #8bcba0; border-radius: 12px 11px 0px 0px;">
				<div class="contest-title2">이건 축구 카드</div>
			</div>

			<div class="card-body">
				<div class="contest-category">카테고리 : 축구</div>
				<div class="contest-cite">
					사이트 <br> www.cite.com.cite.com.cite.com
				</div>

			</div>
		</div>


		<div class="card">

			<div class="card-header"
				style="background: #ffb79a; border-radius: 12px 11px 0px 0px;">
				<div class="contest-title2">이건 농구 카드</div>
			</div>

			<div class="card-body">
				<div class="contest-category">카테고리 : 농구</div>
				<div class="contest-cite">
					사이트 <br> www.cite.com.cite.com.cite.com
				</div>

			</div>
		</div>

		<div class="card">

			<div class="card-header"
				style="background: #fdabad; border-radius: 12px 11px 0px 0px;">
				<div class="contest-title2">이건 야구 카드</div>
			</div>

			<div class="card-body">
				<div class="contest-category">카테고리 : 야구</div>
				<div class="contest-cite">
					사이트 <br> www.cite.com.cite.com.cite.com
				</div>
			</div>
		</div>

		<div class="card">

			<div class="card-header"
				style="background: #c7aadf; border-radius: 12px 11px 0px 0px;">
				<div class="contest-title2">이건 테니스 카드</div>
			</div>

			<div class="card-body">
				<div class="contest-category">카테고리 : 테니스</div>
				<div class="contest-cite">
					사이트 <br> www.cite.com.cite.com.cite.com
				</div>
			</div>
		</div>

		<div class="card">

			<div class="card-header"
				style="background: #fbfac3; border-radius: 12px 11px 0px 0px;">
				<div class="contest-title2">이건 배드민턴 카드</div>
			</div>

			<div class="card-body">
				<div class="contest-category">카테고리 : 배드민턴</div>
				<div class="contest-cite">
					사이트 <br> www.cite.com.cite.com.cite.com
				</div>
			</div>
		</div>


	</div>
</div>


