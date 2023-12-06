<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<link rel="stylesheet prefetch"
	href="https://gist.githubusercontent.com/mfd/614e2e80a22b878bde63cb471cbe677e/raw/eef2aabfd0d588d43285431186a0cf70305ceb80/sanfrancisco-font.css">


<%@ include file="../layouts/detailHeader.jsp"%>
<link rel="stylesheet" href="/resources/css/board/detail.css?after" />

<script>

$(document).ready(function(e) {
	document.getElementById('manageButton').addEventListener('click', function() {
	    var hiddenButtons = document.getElementById('hiddenButtons');
	    if (hiddenButtons.style.display === 'none') {
	        hiddenButtons.style.display = 'block';
	    } else {
	        hiddenButtons.style.display = 'none';
	    }
	});	
});

</script>


<div class="container-fluid" style="padding: 0;">

	<div class="row" id="row1">
		
		<!---------------- 첫번째 상자---------------->
		<div class="sample1 col-md-3" style="padding: 78px 143px 50px 0; text-align: center;">
		 <div class="container15">
			<blockquote>
				<div id="container2">
					<img class="col-md-12" src="/resources/images/detail/2323.png" id="secondimg" style="position: relative;right: 10px;">
				</div>
			</blockquote>
			</div>
		</div>
		<!---------------- 두번째 상자---------------->
		<div class="sample col-md-6" >
			<div class="container14">
				<div class="icon">
					<span><i class="fa-solid fa-circle-xmark"></i></span>
					<span><i class="fa-solid fa-circle-minus"></i></span>
					<span><i class="fa-solid fa-circle-plus"></i></span>
					<span style="display:inline-block;"> 
						<div class="url">
			      			<i class="fa-solid fa-lock"></i>${gather.title}</div>
			      	</span>
		
					<span style="display:inline-block;">
		 				<sec:authentication property="principal.member.membersId" var="membersId" /> 
		 					<c:if test="${membersId == gather.membersId }"> 
                        		<button type="button" class="btn5" id="manageButton">관리</button>
                     		</c:if>
            				<c:if test="${membersId != gather.membersId }">
                       
                      <c:if test="${state == null}">
                            <button type="submit" class="btn5" 
                            onclick="location.href='/board/insertApply?gatheringId=${gather.gatheringId}&membersId=${membersId }&state=0';">신청</button>
                      </c:if>
                     
                      <c:if test="${state == 0}">
                         <button type="button" class="btn5">승인 중</button>
                      </c:if>
                      <c:if test="${state == 1}">
                         <button type="button" class="btn5">승인완료</button>
                      </c:if>
                      <c:if test="${state == -1}">
                         <button type="button" class="btn5">다음 기회에..</button>
                      </c:if>
                       
								    </c:if>
								     <div id="hiddenButtons" style="display: none;">
						            <div><a href="/board/modify?gatheringId=${gather.gatheringId} "><button type="button" class="btn5">모임수정</button></a></div>
						            <div><a href="/board/manage/${gather.gatheringId}"><button type="button" class="btn5">신청관리</button></a></div>
                 </div>
                 </span>
		
		</div>
			<blockquote>
				
				<cite>
					<div id="container3">
						<div style="padding: 26px 36px 0 36px;">
							<div style="border: 5px solid #bbbbbb;height:204px;border-radius: 15px;box-shadow: 0px 4px 7px rgba(0, 0, 0, 0.25);">
								<div class="title-detail">information</div>
							   		<span style="display: flex;">
							    		<div style="border-right: 5px solid #bbbbbb;height: 159px;width: 185px;">
							    			<img src="/security/avatar/sm/${gather.membersId }" id="profile-image"alt="기본 이미지"></div>
								     	<div style="margin-left: 10px;">
									     	<div class="gathermember0">
										     	<i class="fa-solid fa-check" style="color: #7FB3FA;"></i>&nbsp;&nbsp;모집인원 : ${gather.headCount}명
									     	</div>
								         	<div class="meetingtime0">
									        	<i class="fa-solid fa-check" style="color: #7FB3FA;"></i>&nbsp;&nbsp;
										        	<fmt:parseDate value="${gather.dateTime}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both" />
										        	<fmt:formatDate pattern="yyyy년 MM월 dd일(EE) HH시 mm분" value="${parsedDateTime}" />
								         	</div>
							      				<div class="place0"><i class="fa-solid fa-check" style="color: #7FB3FA;"></i>&nbsp;&nbsp;${gather.address}</div>
					     				</div>
					     				 <div class="container" style="padding: 30px 0;width: 150px;">
                                     <a href="/"><button type="button" class="btn0">홈</button> </a>
                  
							 	 <button type="button" class="btn0" onclick="getState(${membersId}, ${gather.gatheringId})">채팅</button>
            
                
						</div>
							     	</span>
								     	</div>
								     </div>
											<span style="display: flex;padding: 25px 36px;"> 
												<div class="description0">
													<div class="des-detail">detail</div>
								     					<div class="scrollbar">${gather.description }</div>
							     				</div>
							
											<div class="map2">
                       							<div id="map" style="top:8px;height: 259px; left: 10px; width: 244px; background: gray; border-radius: 8px;"></div></div>
													<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2a214bd6b5af9abe29536c813436a779&libraries=services"></script>
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
						    				</span>
						    
						    
						
					</div>
				</cite>
			</blockquote>
			</div>
		</div>
		<!---------------- 세번째 상자---------------->
		<div class="sample2 col-md-3" style="padding: 78px 0 50px 143px;">
			<div class="container16">
			<div class="icon2">
					<span><i class="fa-solid fa-circle-xmark"></i></span>
					<span><i class="fa-solid fa-circle-minus"></i></span>
					<span><i class="fa-solid fa-circle-plus"></i></span>
					<span style="display:inline-block;"> 
			</div>
			<blockquote>
				<div id="container4">
					<img class="col-md-12" src="/resources/images/detail/5656.png" id="fourimg">
				</div>
			</blockquote>
			</div>
			
		</div>
	</div>
</div>
</body>

<script src="/resources/js/home/rest.js"></script>
<script>
	function getManage(gatheringId) {
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
		f.setAttribute('action', 'manage');
		document.body.appendChild(f);
		f.submit(); 
	}

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

<%-- <%@ include file="../layouts/footer.jsp"%> --%>
