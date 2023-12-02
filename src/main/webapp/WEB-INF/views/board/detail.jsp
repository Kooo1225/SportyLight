<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<link rel="stylesheet prefetch"
	href="https://gist.githubusercontent.com/mfd/614e2e80a22b878bde63cb471cbe677e/raw/eef2aabfd0d588d43285431186a0cf70305ceb80/sanfrancisco-font.css">


<%@ include file="../layouts/detailHeader.jsp"%>
<link rel="stylesheet" href="/resources/css/board/detail.css?after" />




<div class="container-fluid" style="padding: 0;">
	<div class="row" id="row1">
		<!---------------- 첫번째 상자---------------->
		<div class="sample2 col-md-1" style="padding: 78px 50px 50px 0px;">
			<blockquote>
				<div id="container1">
					<!-- <img class="col-md-12" src="/resources/images/detail/24example.png"
					id="secondimg"> -->
				</div>
			</blockquote>
		</div>
		<!---------------- 두번째 상자---------------->
		<div class="sample1 col-md-3"
			style="padding: 78px 58px 50px 28px; text-align: center;">
			<blockquote>
				<div id="container2">
					<img class="col-md-12" src="/resources/images/detail/123.png" id="secondimg">
				</div>
			</blockquote>
		</div>
		<!---------------- 세번째 상자---------------->
		<div class="sample col-md-4">
			<blockquote>
				<p class="title">${gather.title}</p>
				<cite>
					<div id="container3">
						<div class="row mx-auto"style="width: 550px; padding: 22px 30px 0 30px;">
							<div class="col-md-6"style="padding: 0; width: 200px; margin-top: 12px;">
							    <div><img src="/security/avatar/sm/${gather.membersId }" id="profile-image"alt="기본 이미지"></div>
								     <div style="border: 2px solid rgba(0, 0, 0, .075); border-radius: 15px;">
									     <div class="gathermember0">
										     <i class="fa-solid fa-check" style="color: #7FDCBE;"></i>&nbsp;&nbsp;모집인원 : ${gather.headCount}명
									     </div>
									         <div class="meetingtime0">
										        <i class="fa-solid fa-check" style="color: #7FDCBE;"></i>&nbsp;&nbsp;
										        <fmt:parseDate value="${gather.dateTime}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both" />
										        <fmt:formatDate pattern="yyyy년 MM월 dd일(EE) HH시 mm분" value="${parsedDateTime}" />
									         </div>
									      <div class="place0"><i class="fa-solid fa-check" style="color: #7FDCBE;"></i>&nbsp;&nbsp;${gather.address}
									      </div>
								     </div>
							 </div>
                        <div class="col-md-6" style="padding: 0;">
							 <div id="map" style="height: 233px; left: 27px; width: 215px; background: gray; border-radius: 30px;"></div>
						</div>
							<script
								src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2a214bd6b5af9abe29536c813436a779&libraries=services"></script>
							<script>
								// GeoCode
								let geocoder = new kakao.maps.services.Geocoder();
								let address = '${gather.address}';

								geocoder
										.addressSearch(
												address,
												function(result, status) {
													if (status == kakao.maps.services.Status.OK) {
														var coords = new kakao.maps.LatLng(
																result[0].y,
																result[0].x); // 지도의 중심좌표와 마커의 위치
														var marker = new kakao.maps.Marker(
																{
																	map : map,
																	position : coords
																});
														map.setCenter(coords);
													}
												});
								let mapContainer = document
										.getElementById('map');
								//  지도 제어 코딩
								let mapOption = {
									center : new kakao.maps.LatLng(36.0132159,
											127.7586034),
									level : 3
								};
								let map = new kakao.maps.Map(mapContainer,
										mapOption); // 두번째 인자는 지도의 위치를 어디에 둘 것인지 설정
								map.setDraggable(false);
								function setDraggable(draggable) {
									// 마우스 드래그로 지도 이동 가능여부를 설정합니다
									map.setDraggable(draggable);
								}
								var marker = new kakao.maps.Marker({
									map : map,
									position : new kakao.maps.LatLng(
											36.0132159, 127.7586034)
								});
								marker.setMap(map);
							</script>
							
														
  
						</div>
						    <div class="col-md-12" style="padding: 0; margin-top: 48px;">
							     <div class="description0 mx-auto">
								     <div class="scrollbar">${gather.description }</div>
							     </div>
						    </div>
						<div class="container" style="margin-top: 0px;">
                             <a href="/"><button type="button" class="btn0">홈</button> </a>
                                 <sec:authentication property="principal.member.membersId" var="membersId" />
							     <c:if test="${membersId == gather.membersId }"> <button type="button" class="btn0">관리</button></c:if>
							     <c:if test="${membersId != gather.membersId }">
							     	<c:if test="${state != 0}">
					          	 		<button type="submit" class="btn0" 
							     				onclick='location.href="/board/insertApply?gatheringId=${gather.gatheringId}&membersId=${membersId }&state=0";'>신청</button>
				     				</c:if>
				     				<c:if test="${state == 0}">
				     					 <button type="button" class="btn0">신청완료</button>
				     				</c:if>
								 </c:if>
							 	 <button type="button" class="btn0" onclick="getState(${membersId}, ${gather.gatheringId})">채팅</button>
						</div>
					</div>
				</cite>
			</blockquote>
		</div>
		<!---------------- 네번째 상자---------------->
		<div class="sample1 col-md-3" style="padding: 78px 28px 50px 58px;">
			<blockquote>
				<div id="container4">
					<img class="col-md-12" src="/resources/images/detail/123.png" id="secondimg">
				</div>
			</blockquote>
		</div>
		<!---------------- 다섯번째 상자---------------->
		<div class="sample2 col-md-1 text-right"
			style="padding: 78px 0px 50px 50px;">
			<blockquote>
				<div id="container5">
					<!-- <img class="col-md-12" src="/resources/images/detail/24example.png"
					id="secondimg"> -->
				</div>
			</blockquote>
		</div>
	</div>
</div>
</body>

<script src="/resources/js/home/rest.js"></script>
<script>
	function createChattingElement() {		
 		let f = document.createElement('form');

		let gatherIdObj;
		gatherIdObj = document.createElement('input');
		gatherIdObj.setAttribute('type', 'hidden');
		gatherIdObj.setAttribute('name', 'gatheringId');
		gatherIdObj.setAttribute('value', ${gather.gatheringId});
		
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
		
		let state = await rest_post(URL, ${gather.gatheringId}, membersId);

		if (state === 2 || state === 1) {
			createChattingElement();
		}
		else {
			alert("권한이 부여되지 않았습니다.");
			return;
		}
	}
	
	async function getState2(membersId, gatheringId) {
		const URL = "/api/board/getstate"
		
		let state = await rest_post(URL, ${gather.gatheringId}, membersId);

		return state;
	}

</script>
