<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ include file="../layouts/homeHeader.jsp" %>

<link rel="stylesheet" href="/resources/css/home/home.css">


<nav id="container2" class="navbar navbar-expand-sm navbar-light bg-white">
	<div class="collapse navbar-collapse" id="secondmenu">

		<!-- 검색창 -->
		<div>
			<form id="searchForm" method="get" class="d-flex">
				<div class="selectBox">
					<select name="option" class="selectForm">
						<option value="">--검색 선택--</option>
						<option value="T">제목</option>
						<option value="C">내용</option>
						<option value="TC">제목+내용</option>
					</select>
				</div>
				<div>
					<input type="text" name="keyword" style="width:230px"/>
					<button style="left:320px;">
						<svg xmlns="http://www.w3.org/2000/svg" width="30" height="29" viewBox="0 0 30 29" fill="none">
		            	<circle cx="12" cy="12" r="11" fill="white" stroke="#7FDCBE" stroke-width="2" />
		            	<line x1="20.7071" y1="20.2929" x2="28.7071" y2="28.2929" stroke="#7FDCBE" stroke-width="2" />
		            	</svg>
					</button>
				</div>
			</form>
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
		
		let searchForm = $('#searchForm');
		$('#searchForm button').on('click', async function(e) {
			e.preventDefault();
			
			var option = searchForm.find('option:selected');
			if (!option.val()) {
				alert('검색 종류를 선택하세요.');
				option.focus();
				return false; 
			}

			var keyword = searchForm.find('input[name="keyword"]');
			if (!keyword.val()) {
				alert('키워드를 입력하세요.');
				keyword.focus();
				return false;
			}
			
			if(option.val() && keyword.val()) {
				$('.sidebar-board').empty();
				$('.scroll-container').empty();
				
				const gatherList = await rest_get(BASE_URL+'/search?option=' + option.val()+ '&keyword=' + keyword.val());
				console.log(gatherList);
				gatherCount = Object.keys(gatherList).length;
				
				let countEl = $(createListCountTemplate(gatherCount));
				
				$('.sidebar-board').append(countEl);
				
	 			let listEl;
				
	 			$.each(gatherList, function(index, item) {
					listEl = $(createTypeListTemplate(item));
					$('.scroll-container').append(listEl);
	 			})	
			}

		});
	})
</script>

<!-- 사이드바 -->
<div class="row-fluid">
	<nav id="container3-fluid" style="padding: 0px;" class="navbar navbar-expand-sm navbar-light bg-white">
		<div class="sidebar">
			<div class="sidebar-board">
				<span class="board-txt">모임</span> 
				<span class="board-total">${count} 건</span>
			</div>
			<!--------------프로필사진------------------>
			<div class="col-sm-12" style="height: 100%;">
				<div class="scroll-container" style="height: 100%;">
					<c:forEach var="gather" items="${GatherList}">
						<div class="row" id="set1">
							<div class="col-4">
								<div class="sidebar-board-get">
									<img src="/security/avatar/m/${gather.membersId}" class="board-avatar" />
								</div>
							</div>
							
							<!---------------------------------------->
							<div class="col-8" id="detail">
							
								<div class="board-info-wrapper" style="width: 100%;position: relative; bottom: 12px;left: -4px;">
								    <span class="board-category">[${gather.type}]</span> 
								    <br>
									<span class="board-title"><a href="#" onclick="setCenter('${gather.address}')">${gather.title}</a></span> 									
									<br>
									<span class="board-info">
										인원 ${gather.headCount} 명 | <fmt:parseDate value="${gather.dateTime}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both" />
										<fmt:formatDate pattern="yyyy년 MM월 dd일 HH시 mm분" value="${parsedDateTime}" />
									</span>
									<br>
									<c:if test="${gather.headCount == gather.participate}">
										<span class="board-info"><b>모임마감</b></span>
									</c:if>
									<c:if test="${gather.headCount != gather.participate}">
									<span class="board-info"><a href="/board/detail?gatheringId=${gather.gatheringId}">상세보기 ></a></span>
									</c:if>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
		<!-------------------Kakao Maps--------------------->
		<div class="col-sm-12" id="map" style="left: 380px; width: calc(100vw - 325px); height: 100%; position: absolute;"></div>
		<div class="register-button">
			<a href="/board/register"><i class="fa-solid fa-circle-plus fa-beat fa-3x"></i></a>
		</div>
	</nav>
</div>

</body>

<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2a214bd6b5af9abe29536c813436a779&libraries=services,clusterer"></script>
<script>
	var container = document.getElementById('map');
	var options = {
		center : new kakao.maps.LatLng(33.450701, 126.570667),
		level : 3
	};
	
	var map = new kakao.maps.Map(container, options);
	
	/* title 클릭 시 해당 마커 중심좌표로 이동 */
	function setCenter(address) {
	    var geocoder = new kakao.maps.services.Geocoder();

	    geocoder.addressSearch(address, function(result, status) {
	        if (status === kakao.maps.services.Status.OK) {
	            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	            map.setLevel(3);
	            map.setCenter(coords);
	        }
	    });
	}
	
	/* -------------사용자 현재위치로 이동---------------- */	
	if (navigator.geolocation) {
	    navigator.geolocation.getCurrentPosition(function(position) {
	        var latitude = position.coords.latitude,
	            longitude = position.coords.longitude; 
	        var position = new kakao.maps.LatLng(latitude, longitude); 
	        
	        displayPosition(position);
	      });
	    
	} else { 
	    var position = new kakao.maps.LatLng(35.1781, 129.0736);    
	    displayPosition(position);
	}

	function displayPosition(position) {
	    map.setCenter(position);      
	} 
	
/* --------------------GatherList별 마커 생성-------------------------- */	

	// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열
	 var positions = [
        <c:forEach var="gather" items="${GatherList}">
            {
            	id: '${gather.gatheringId}',
                title: '${gather.title}',
                address: '${gather.address}',
                type: '${gather.type}',
                headCount: '${gather.headCount}',
                participate: '${gather.participate}'
            },
        </c:forEach>
    ];
	var imageSrc = "/resources/images/home/placeholder.png", // 마커이미지 주소
	    imageSize = new kakao.maps.Size(44, 46), // 마커이미지 크기
	    imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지 옵션
	    
	var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
	
/* -----------------주소를 좌표로 변환하여 마커를 생성하는 함수---------------- */
	var clusterer = new kakao.maps.MarkerClusterer({
		map: map,
		averageCenter: true,
		minLevel: 6
	});
	
    function createMarker(position) {
        var geocoder = new kakao.maps.services.Geocoder();
        
        geocoder.addressSearch(position.address, function(result, status) {
            if (status == kakao.maps.services.Status.OK) {
            	
            	var marker = new kakao.maps.Marker({
                    position: new kakao.maps.LatLng(result[0].y, result[0].x),
					image: markerImage
            	});
            	
            	clusterer.addMarker(marker);
            	
            	var contentsImage;
            	
            	if (position.type == '헬스') {
            		contentsImage = "/resources/images/home/health.png"	
            	} else if (position.type == '스포츠') {
            		contentsImage = "/resources/images/home/sports.png"
            	} else if(position.type == '등산') {
            		contentsImage = "/resources/images/home/hiking.png"
            	} else 
            		contentsImage = "/resources/images/home/run.png"
            		
            	var contents = document.createElement('div');
            	contents.innerHTML = 
            	'<div class="wrap">' +
	            	'	<div class="info">' +
	            	'		<div class="title">' + position.title +
	            	'			<div class="close" title="닫기"></div>' +
	            	'		</div>' +
	            	'		<div class="body">' +
	            	'			<div class="img">' +
            	  	'                <img src="' + contentsImage + '" width="70" height="70">' +
	                '           </div>' + 
	                '            <div class="content">' + 
	                '                <div class="addr"><b>' + position.address + '</b></div>' + 
	                '                <div class="type addr"><b>' + position.type + '</b></div>' + 
	                (position.headCount === position.participate ? '<span><b>모임마감</b></span>' : '<span><a href="/board/detail?gatheringId='+ position.id + '" class="link">모임 신청</a></span>') +
	               	'				 <span><i class="fa-solid fa-user-group"></i> ' + position.participate + ' / ' + position.headCount +'명</span>' + 
	                '            </div>' + 
	                '        </div>' +
	                '    </div>' +    
	                '</div>';	
            				
            	var customOverlay = new kakao.maps.CustomOverlay({
				    map: map,
				    position: new kakao.maps.LatLng(result[0].y, result[0].x),
				    content: contents,
				    yAnchor: 2
				});	
				customOverlay.setMap(null);
                
                kakao.maps.event.addListener(marker, 'click', function() {
                	customOverlay.setMap(map);
                	customOverlay.setRange(300);
                }); 
                
                $(contents).find('.close').on('click', function() {
                	customOverlay.setMap(null);
                });
                
                kakao.maps.event.addListener(map, 'zoom_changed', function() {
                	var level = map.getLevel();
                	
                	if(level >= 5) {
                		customOverlay.setMap(null);
                	}
                });
            }
        });
    }

    for (var i=0; i<positions.length; i++) {
        createMarker(positions[i]);
    }
    
</script>
