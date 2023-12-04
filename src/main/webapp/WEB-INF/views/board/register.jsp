<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<%@ include file="../layouts/joinHeader.jsp" %>
<link rel="stylesheet" href="/resources/css/security/register.css"/>


<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2a214bd6b5af9abe29536c813436a779&libraries=services"></script>

<style>

</style>
<script>
$(document).ready(function() {
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div
		mapOption = {
		    center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
		    level: 3 // 지도의 확대 레벨
	};
	
	//지도를 미리 생성
	var map = new daum.maps.Map(mapContainer, mapOption);
	//주소-좌표 변환 객체를 생성
	var geocoder = new daum.maps.services.Geocoder();
	//마커를 미리 생성
	var marker = new daum.maps.Marker({
		position: new daum.maps.LatLng(37.537187, 127.005476),
		map: map
	});
	
	// 버튼에 클릭 이벤트를 추가
	$('.openPostcode').click(function() {
		new daum.Postcode({
            oncomplete: function(data) {
                var addr = data.address; // 최종 주소 변수

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("sample5_address").value = addr;
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {

                        var result = results[0]; //첫번째 결과의 값을 활용

                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)
                    }
                });
            }
        }).open();
    });
	
	var now_utc = Date.now()
	var timeOff = new Date().getTimezoneOffset()*60000; 
	var today = new Date(now_utc-timeOff).toISOString().substring(0, 16);
	 
	document.getElementById("DateLocal").setAttribute("min", today);
});
</script>

<h1 class="page-header"> REGISTER</h1><br>

	<div class="panel panel-default">
		<div class="panel-body">
			<form action="/board/register" method="post">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<div class="form-group mx-auto main-select" style="margin-bottom:0;">
					<input type="radio" id="select-health" name="type" value="헬스"><label for="select-health">헬스</label>
					<input type="radio" id="select-sport" name="type" value="스포츠"><label for="select-sport">스포츠</label>
					<input type="radio" id="select-climb" name="type" value="등산"><label for="select-climb">등산</label>
					<input type="radio" id="select-run" name="type" value="러닝"><label for="select-run">러닝</label>
				</div>
				
				<div class="form-group mx-auto input-style" style="height: 71px;">
					<input type="text" name="title" id="register-title" placeholder=" 제목을 작성해주세요.">
				</div>
				<div class="form-group mx-auto" >
					<i class="fa-solid fa-user-group fa-2x" style="color:#5A95F5;"></i>
					<input type="number" min="1" max="20" value="1" name="headCount" class="num">

					<i class="fa-solid fa-calendar-days fa-2x" style="color:#5A95F5;"></i>
					<input type="datetime-local" name="dateTime" class="date">
				</div>
				<div class="form-group mx-auto input-style" style="margin: 0;">
					<input type="text" id="sample5_address" name="address" placeholder=" 모임 장소를 선택해주세요." readonly><br>
					<input type="button" class="openPostcode" value="주소 검색" style="background: #5A95F5; color: white"><br>
					<div id="map" class="register-address"></div>
				</div>
				
				<div class="form-group mx-auto">
					<textarea class="register-text" name="description" placeholder=" 게시글에 대한 자세한 정보를 작성해주세요..."></textarea>
				</div>
				
				<sec:authentication property="principal.member.membersId" var="membersId" />
					<input type="hidden" name="membersId" value="${membersId }" />

				<div class="form-group mx-auto submitButton" >
					<button type="submit" style="width: 222px; margin-top: 4px;">REGISTER</button>
					<a href="/" class="homebtn" > Go Back? </a>
				</div>
			</form>
		</div>
	</div>
</body>