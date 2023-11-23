<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../layouts/joinHeader.jsp"%>
<link rel="stylesheet" href="/resources/css/board/board.css" />


<div class="panel panel-default mx-auto">
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
		&nbsp;모집인원 :${gather.headCount}명
	</div>
	<div class="meetingtime">
		<i class="fa-solid fa-clock icon" style="color: #7FDCBE; margin-right:5px;"></i>
		<fmt:parseDate value="${gather.dateTime}" pattern="yyyy-MM-dd'T'HH:mm"
			var="parsedDateTime" type="both" />
		<fmt:formatDate pattern="yyyy년 MM월 dd일(EE) HH시 mm분"
			value="${parsedDateTime}" />
	</div>

	<div class="form-group mx-auto" id="map"
		style="width: 400px; height: 300px; background: gray; border-radius: 30px"></div>
	
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2a214bd6b5af9abe29536c813436a779&libraries=services"></script>
	<script>
		// GeoCode

		let geocoder = new kakao.maps.services.Geocoder();
		let address = '${gather.address}';

		geocoder.addressSearch(address, function(result, status) {
			if (status == kakao.maps.services.Status.OK) {
				var coords = new kakao.maps.LatLng(result[0].y, result[0].x); // 지도의 중심좌표와 마커의 위치
				var marker = new kakao.maps.Marker({
					map : map,
					position : coords
				});
				map.setCenter(coords);
			}
		});

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

		var marker = new kakao.maps.Marker({
			map : map,
			position : new kakao.maps.LatLng(36.0132159, 127.7586034)
		});
		marker.setMap(map);
	</script>

	<div class="description mx-auto">${gather.description }</div>
</div>

<div class="container">

  <a href="/"><button type="button" class="btn">홈</button> </a>
  <button type="button" class="btn">신청</button>
  <button type="button" class="btn">채팅</button>
  </div>



 