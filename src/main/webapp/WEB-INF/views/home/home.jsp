<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ include file="../layouts/homeHeader.jsp" %>

<link rel="stylesheet" href="/resources/css/layouts/main.css" />
<link rel="stylesheet" href="/resources/css/home/sidebar.css">

<nav id="container2" class="navbar navbar-expand-sm navbar-light bg-light">
	<div class="collapse navbar-collapse" id="secondmenu">

		<!-- 검색창 -->
		<div>
			<input type="text">
			<button>
				<svg xmlns="http://www.w3.org/2000/svg" width="30" height="29" viewBox="0 0 30 29" fill="none">
            		<circle cx="12" cy="12" r="11" fill="white" stroke="#7FDCBE" stroke-width="2" />
            		<line x1="20.7071" y1="20.2929" x2="28.7071" y2="28.2929" stroke="#7FDCBE" stroke-width="2" />
            	</svg>
			</button>
		</div>
		
		<!-- 카테고리  -->
		<ul class="navbar-nav me-auto mb-2 mb-lg-0 ">
			<li class="nav-item d-md-none d-lg-block"><a id="ct1" class="nav-link" value="헬스">헬스</a></li>
			<li class="nav-item d-md-none d-lg-block"><a id="ct2" class="nav-link" value="스포츠">스포츠</a></li>
			<li class="nav-item d-md-none d-lg-block"><a id="ct3" class="nav-link" value="등산">등산</a></li>
			<li class="nav-item d-md-none d-lg-block"><a id="ct4" class="nav-link" value="러닝">러닝</a></li>
		</ul>
		
	</div>
</nav>

<script src="/resources/js/home/rest.js" ></script>
<script src="/resources/js/home/homeAjax.js" ></script>
<script>
	const BASE_URL = "/api/home"

	$(document).ready(function(e) {
		
		$(".nav-link").on("click", async function(e) {
			$('.sidebar-board').empty();
			$('.scroll-container').empty();
			
			const gatherList = await rest_get(BASE_URL + '/typelist?types=' + $(this).text());
			gatherCount = Object.keys(gatherList).length;
			
			let countEl = $(createListCountTemplate(gatherCount));
			
			$('.sidebar-board').append(countEl);
			
 			let listEl;
			
 			$.each(gatherList, function(index, item) {
				listEl = $(createTypeListTemplate(item));
				$('.scroll-container').append(listEl);
 			})	
		})
	})
</script>

<!-- 사이드바 -->
<div class="row-fluid">
	<nav id="container3-fluid" style="padding: 0px;"
		class="navbar navbar-expand-sm navbar-light bg-white">
		
		<div class="sidebar">
			

			<div class="sidebar-board">
				<span class="board-txt">모임</span> <span class="board-total">${count} 건</span>
			</div>
			<!--------------프로필사진------------------>
			<div class="col-sm-12">
				<div class="scroll-container">
				
					<c:forEach var="gather" items="${GatherList}">
						<div class="row" id="set1">
							<div class="col-4">
								<div class="sidebar-board-get">
									<img src="/resources/images/home/cat.jpeg" class="board-avatar" />
								</div>
							</div>
							
							<!---------------------------------------->
							<div class="col-8" id="detail">
							
								<div class="board-info-wrapper" style="width: 100%;">
								
									<span class="board-title"><a href="/board/detail?gatheringId=${gather.gatheringId}">${gather.title}</a></span> 
									<span class="board-category">${gather.type}</span> 
									
									<br>
									
									<span class="board-info">
										인원 ${gather.headCount} 명 | <fmt:parseDate value="${gather.dateTime}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both" />
										<fmt:formatDate pattern="yyyy년 MM월 dd일 HH시 mm분" value="${parsedDateTime}" />
									</span>
									
								</div>
								
							</div>
							
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
		
		<!-------------------Kakao Maps--------------------->
		<div class="col-sm-12" id="map" style="left: 425px; width: calc(100vw - 425px); height: 100%; position: absolute;"></div>
	</nav>
</div>

</body>




<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2a214bd6b5af9abe29536c813436a779"></script>
<script>
	var container = document.getElementById('map');
	var options = {
		center : new kakao.maps.LatLng(33.450701, 126.570667),
		level : 3
	};
	var map = new kakao.maps.Map(container, options);
</script>









