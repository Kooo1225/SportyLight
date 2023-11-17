<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../layouts/detailHeader.jsp" %>

<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans:wght@900&display=swap');

.panel-body {
    display: flex;
    flex-direction: column;
    align-items: center;
    text-align: center;
}

.panel-body > .form-group {
    margin-bottom: 20px;
    text-align: left; 
}

/* gatheringTitle margin */
h5 { margin: 5px 0px 20px 0px;}

/* gatheringAddress, Headcount, Datetime style */
p { 
	margin: 0px 0px 10px 0px; 
	line-height: 120%; 
}

/* icon style */
p > i {
	color: #518e7b; 
	margin-bottom:0;
}

</style>

	<div class="panel panel-default">
		<div class="panel-body" style="text-align: center; margin:100px">
		<h1><i class="fa-solid fa-arrow-up-right-from-square" style="color: #7fdcbe;"></i> Gathering</h1>
			<div class="form-group mx-auto">
				<div style="width: 590px; height: 160px; border: 1px solid #f7f7f7; border-radius: 30px; background: #f7f7f7; padding: 10px;">
				    <h5><b>${gather.title}</b></h5>
				    
				    <p><i class="fa-solid fa-map-location-dot icon"></i> ${gather.address }</p>
				    <p><i class="fa-solid fa-user-group icon"></i> 모집인원 : ${gather.headCount}명</p>
				    <p><i class="fa-solid fa-clock icon"></i>  
				    		<fmt:parseDate value="${gather.dateTime}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both" />
							<fmt:formatDate pattern="yyyy년 MM월 dd일(EE) HH시 mm분" value="${parsedDateTime}" />
				</div>
			</div>
			
			<div class="form-group mx-auto" id="map" style="width:590px; height:400px; background:gray; border-radius: 30px"></div>
			
			<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2a214bd6b5af9abe29536c813436a779&libraries=services"></script>
			<script>
			// GeoCode
			
			let geocoder = new kakao.maps.services.Geocoder();
			let address = '${gather.address}';
			
			// 비동기 함수. 동기 함수의 실행이 끝나고 나서 callback 함수 호출
			geocoder.addressSearch(address, function(result, status) {
				if(status == kakao.maps.services.Status.OK) {
					// 배열의 첫번째 위치로 이동
					var coords = new kakao.maps.LatLng(result[0].y, result[0].x); // 지도의 중심좌표와 마커의 위치
					var marker = new kakao.maps.Marker({
						map: map,
						position: coords
					});
					
					// 지도의 중심을 결과값으로 받은 위치로 이동
					map.setCenter(coords);
				}
			});
			
			let mapContainer = document.getElementById('map'); // map은 id 태그
		  	//  지도 제어 코딩
		  	let mapOption= {
				  center: new kakao.maps.LatLng(36.0132159,127.7586034), // 위도 경도
				  level: 3 //지도 확대 레벨
		  	};
					  
		  	let map = new kakao.maps.Map(mapContainer, mapOption); // 두번째 인자는 지도의 위치를 어디에 둘 것인지 설정
			map.setDraggable(false);
		  	
		  	function setDraggable(draggable) {
		  	    // 마우스 드래그로 지도 이동 가능여부를 설정합니다
		  	    map.setDraggable(draggable);    
		  	}
		  	
			// 마커
			// 마커가 표시될 위치
			var markerPosition = new kakao.maps.LatLng(36.0132159,127.7586034);
		  	
		  	// 마커 생성
		  	var marker = new kakao.maps.Marker({
		  		position: markerPosition
		  	});
		  	
		  	// 마커가 지도 위에 표시되도록 설정
		  	marker.setMap(map);
			
			</script>
			
			<div class="form-group mx-auto">
				<div style="width: 590px; height: 160px; border: 1px solid #f7f7f7; border-radius: 30px; background: #f7f7f7; padding: 10px;">
				    <p><i class="fa-solid fa-quote-left icon"></i><br>
				    	${gather.description }</p>
				</div>
			</div>
		</div>
	</div>
</html>