<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<%@ include file="../layouts/detailHeader.jsp"%>
<link rel="stylesheet" href="/resources/css/board/detail.css" />




<div class="container-fluid" style="padding: 0;">
	<div class="row">
		<!---------------- 첫번째 상자---------------->
		<div class="col-md-1" style="padding:0;">
			<div id="container1">
               <img src="/resources/images/detail/1example.png" id="firstimg">
            </div>
		</div>
		<!---------------- 두번째 상자---------------->
		<div class="col-md-3 text-center" style="padding:35px 50px 50px 50px;">
			<div id="container2">
               <img src="/resources/images/detail/24example.png" id="secondimg">
            </div>
            
             <a href="/board/detail?gatheringId=${gather.gatheringId-1}"><i class="fa-solid fa-angles-left" 
             style="position:absolute; right: -70px; top:300px;color:#7FDCBE;font-size: 35px; z-index: 2;"></i></a>
		</div>
		<!---------------- 세번째 상자---------------->
		<div class="col-md-4 text-center" style="padding:0 100px; z-index: 1;">
			<div id="container3">
			
			<div>
					<h5 class="title">
						<b><i class="fa-solid fa-quote-left"></i> ${gather.title} <i
							class="fa-solid fa-quote-right"></i></b>
					</h5>
				</div>
				<div class="place">
					<i class="fa-solid fa-map-location-dot icon" style="color: #7FDCBE"></i>
					&nbsp;${gather.address}
				</div>
				<div class="gathermember">
					<i class="fa-solid fa-user-group icon" style="color: #7FDCBE"></i>
					&nbsp;모집인원 : ${gather.headCount}명 (${gather.participate}명 / ${gather.headCount}명)
				</div>
				<div class="meetingtime">
					<i class="fa-solid fa-clock icon"
						style="color: #7FDCBE; margin-right: 5px;"></i>
					<fmt:parseDate value="${gather.dateTime}"
						pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both" />
					<fmt:formatDate pattern="yyyy년 MM월 dd일(EE) HH시 mm분"
						value="${parsedDateTime}" />
				</div>
				<div class="form-group mx-auto" id="map"
					style="width: 400px; height: 300px; background: gray; border-radius: 30px;"></div>

				<script
					src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2a214bd6b5af9abe29536c813436a779&libraries=services"></script>
				<script>
					
					let mapContainer = document.getElementById('map');
					//  지도 제어 코딩
					let mapOption = {
						center : new kakao.maps.LatLng(36.0132159, 127.7586034),
						level : 3
					};
					let map = new kakao.maps.Map(mapContainer, mapOption); // 두번째 인자는 지도의 위치를 어디에 둘 것인지 설정
					map.setDraggable(false);
					function setDraggable(draggable) {
						// 마우스 드래그로 지도 이동 가능여부를 설정합니다
						map.setDraggable(draggable);
					}
					// GeoCode
					let geocoder = new kakao.maps.services.Geocoder();
					let address = '${gather.address}';
					var imageSrc = "/resources/images/home/placeholder.png", // 마커이미지 주소
					    imageSize = new kakao.maps.Size(44, 46), // 마커이미지 크기
					    imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지 옵션
				    
				var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);

					geocoder.addressSearch(address, function(result, status) {
						if (status == kakao.maps.services.Status.OK) {
							var coords = new kakao.maps.LatLng(result[0].y,
									result[0].x); // 지도의 중심좌표와 마커의 위치
							var marker = new kakao.maps.Marker({
								map : map,
								position : coords,
								image: markerImage
							});
							map.setCenter(coords);
						}
					});
					
				</script>
				<div class="description mx-auto">${gather.description }</div>
			
			</div>
             <a href="/board/detail?gatheringId=${gather.gatheringId+1}"><i class="fa-solid fa-angles-right" 
             style="position:absolute; right: 40px; top:300px;color:#7FDCBE;font-size: 35px;"></i></a>
		</div>
		
		<!---------------- 네번째 상자---------------->
		<div class="col-md-3 text-center" style="padding:35px 50px 50px 50px;">
			<div id="container4">
               <img src="/resources/images/detail/24example.png" id="fourimg">
            </div>
		</div>
		<!---------------- 다섯번째 상자---------------->
		
		<div class="col-md-1 text-right" style="padding:0;">
			<div id="container5" >
               <img src="/resources/images/detail/5example.png" id="fiveimg">
            </div>
		</div>

	</div>
</div>

<div class="container" style="margin-top: 20px;">

	<a href="/">
		<button type="button" class="btn">홈</button> 
	</a>
	
	<sec:authentication property="principal.member.membersId" var="membersId" />
		<c:if test="${membersId == gather.membersId }">
			<button type="button" class="btn">관리</button>
		</c:if>
		<c:if test="${membersId != gather.membersId }">
			<button type="button" class="btn">신청</button>
		</c:if>
		
	<button type="submit" class="btn" onclick="createChattingElement()">채팅</button>
</div>

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
		
		console.log(${gather.gatheringId});
		
		f.appendChild(gatherIdObj);
		f.appendChild(CSRFToken);
		f.setAttribute('method', 'post');
		f.setAttribute('action', '../chat');
		document.body.appendChild(f);
		f.submit();
	}

</script>





 

			 



