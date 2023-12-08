<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Responsive Bootstrap4 Shop Template, Created by Imran Hossain from https://imransdesign.com/">

	<!-- title -->
	<title>SportyLight</title>

	<!-- favicon -->
	<link rel="shortcut icon" type="image/png" href="/resources/images/favicon/favicon.ico">
	<link rel="apple-touch-icon" sizes="57x57" href="/apple-icon-57x57.png">
	<link rel="apple-touch-icon" sizes="60x60" href="/apple-icon-60x60.png">
	<link rel="apple-touch-icon" sizes="72x72" href="/apple-icon-72x72.png">
	<link rel="apple-touch-icon" sizes="76x76" href="/apple-icon-76x76.png">
	<link rel="apple-touch-icon" sizes="114x114" href="/apple-icon-114x114.png">
	<link rel="apple-touch-icon" sizes="120x120" href="/apple-icon-120x120.png">
	<link rel="apple-touch-icon" sizes="144x144" href="/apple-icon-144x144.png">
	<link rel="apple-touch-icon" sizes="152x152" href="/apple-icon-152x152.png">
	<link rel="apple-touch-icon" sizes="180x180" href="/apple-icon-180x180.png">
	<link rel="icon" type="image/png" sizes="192x192"  href="/android-icon-192x192.png">
	<link rel="icon" type="image/png" sizes="32x32" href="/favicon-32x32.png">
	<link rel="icon" type="image/png" sizes="96x96" href="/favicon-96x96.png">
	<link rel="icon" type="image/png" sizes="16x16" href="/favicon-16x16.png">
	<link rel="manifest" href="/manifest.json">
	<meta name="msapplication-TileColor" content="#ffffff">
	<meta name="msapplication-TileImage" content="/ms-icon-144x144.png">
	<meta name="theme-color" content="#ffffff">
	
	
	
	<!-- google font -->
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Poppins:400,700&display=swap" rel="stylesheet">
	<!-- fontawesome -->
	<link rel="stylesheet" href="/resources/css/gate/all.min.css">
	<!-- bootstrap -->
	<link rel="stylesheet" href="/resources/css/gate/bootstrap.min.css">
	<!-- owl carousel -->
	<link rel="stylesheet" href="/resources/css/gate/owl.carousel.css">
	<!-- magnific popup -->
	<link rel="stylesheet" href="/resources/css/gate/magnific-popup.css">
	<!-- animate css -->
	<link rel="stylesheet" href="/resources/css/gate/animate.css">
	<!-- mean menu css -->
	<link rel="stylesheet" href="/resources/css/gate//meanmenu.min.css">
	<!-- main style -->
	<link rel="stylesheet" href="/resources/css/gate/main.css">
	<!-- responsive -->
	<link rel="stylesheet" href="/resources/css/gate/responsive.css">
	
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />

</head>
<body>
	
	<!--PreLoader-->
    <div class="loader">
        <div class="loader-inner">
            <div class="circle"></div>
        </div>
    </div>
    <!--PreLoader Ends-->
	
	<!-- header -->
	<div class="top-header-area" id="sticker">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-sm-12 text-center">
					<div class="main-menu-wrap">
						<!-- logo -->
						<div class="site-logo">
							<a href="/map">
								<img src="/resources/images/layouts/bluelogo.png" alt="">
							</a>
						</div>
						<!-- logo -->
						
						<!-- menu start -->
						<nav class="main-menu">
							<ul>
								<li><a href="/map">모임</a></li>
								<li><a href="/contest/list">대회</a></li>
								<li>
									<div class="header-icons">
										<a class="shopping-cart" href="/map"><i class="fas fa-search"></i> 둘러보기</a>
										<a class="mobile-hide search-bar-icon" href="/security/login"><i class="fa-solid fa-right-to-bracket"></i> 로그인</a>
									</div>
								</li>
							</ul>
						</nav>
						<a class="mobile-show search-bar-icon" href="#"><i class="fas fa-search"></i></a>
						<div class="mobile-menu"></div>
						<!-- menu end -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end header -->
	

	<!-- home page slider -->
	<div class="homepage-slider">
		<!-- single home slider -->
		<div class="single-homepage-slider homepage-bg-1">
			<div class="container">
				<div class="row">
					<div class="col-md-12 col-lg-7 offset-lg-1 offset-xl-0">
						<div class="hero-text">
							<div class="hero-text-tablecell">
								<p class="subtitle">Your area & Sports Gathering</p>
								<h1>나의 동네에서 <br> 시작하는 스포츠 모임</h1>
								<div class="hero-btns">
									<a href="/map" class="boxed-btn">지금 시작하기</a>
									<a href="/security/login" class="bordered-btn">로그인</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- single home slider -->
		<div class="single-homepage-slider homepage-bg-2">
			<div class="container">
				<div class="row">
					<div class="col-lg-10 offset-lg-1 text-center">
						<div class="hero-text">
							<div class="hero-text-tablecell">
								<p class="subtitle">When you want, Where you want</p>
								<h1>원하는 시간, 원하는 장소에서<br> 이루어지는 스포츠활동</h1>
								<div class="hero-btns">
									<a href="/map" class="boxed-btn">지금 시작하기</a>
									<a href="/security/login" class="bordered-btn">로그인</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- single home slider -->
		<div class="single-homepage-slider homepage-bg-3">
			<div class="container">
				<div class="row">
					<div class="col-lg-10 offset-lg-1 text-right">
						<div class="hero-text">
							<div class="hero-text-tablecell">
								<p class="subtitle">You are not alone</p>
								<h1>혼자 운동하고 계신가요? <br>지금 시작해보세요!</h1>
								<div class="hero-btns">
									<a href="/map" class="boxed-btn">지금 시작하기</a>
									<a href="/security/login" class="bordered-btn">로그인</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end home page slider -->

	<!-- features list section -->
	<div class="list-section pt-80 pb-80">
		<div class="container">

			<div class="row">
				<div class="col-lg-4 col-md-6 mb-4 mb-lg-0" style="padding-left: 40px">
					<div class="list-box d-flex align-items-center">
						<div class="list-icon">
							<i class="fa-solid fa-people-group"></i>
						</div>
						<div class="content">
							<h3>스포츠 모임</h3>
							<p>원하는 모임을 만들수 있습니다.</p>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 mb-4 mb-lg-0" style="padding-left: 40px">
					<div class="list-box d-flex align-items-center">
						<div class="list-icon">
							<i class="fa-solid fa-volleyball"></i>
						</div>
						<div class="content">
							<h3>다양한 종목</h3>
							<p>인원 제약을 받지마세요.</p>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6" style="padding-left: 40px">
					<div class="list-box d-flex justify-content-start align-items-center">
						<div class="list-icon">
							<i class="fa-solid fa-person-shelter fa-xl" style="color:#5A95F5"></i>
						</div>
						<div class="content">
							<h3>지역 내</h3>
							<p>집 앞에서 자유롭게 즐길 수 있습니다.</p>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
	<!-- end features list section -->

	<!-- product section -->
	<div class="product-section mt-150 mb-150">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 offset-lg-2 text-center">
					<div class="section-title">	
						<h3><span class="orange-text">모임</span>현황</h3>
						<p>살펴보세요. 다른 사람들이 등록한 모임 건수입니다.</p>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-lg-4 col-md-6 text-center">
					<div class="single-product-item">
						<div class="product-image">
							<a href="single-product.html"><img src="assets/img/products/product-img-1.jpg" alt=""></a>
						</div>
						<h3>오늘 모임 건수</h3>
						<a class="cart-btn"><i class="fa-solid fa-check"></i> ${count} 건</a>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 text-center">
					<div class="single-product-item">
						<div class="product-image">
							<a href="single-product.html"><img src="assets/img/products/product-img-2.jpg" alt=""></a>
						</div>
						<h3>총 모집인원</h3>
						<a href="#" class="cart-btn"><i class="fa-solid fa-user-group"></i> ${totalHeadCount} 명</a>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 offset-md-3 offset-lg-0 text-center">
					<div class="single-product-item">
						<div class="product-image">
							<a href="single-product.html"><img src="assets/img/products/product-img-3.jpg" alt=""></a>
						</div>
						<h3>현재 신청인원</h3>
						<a href="#" class="cart-btn"><i class="fa-solid fa-user-check"></i> ${totalJoinCount} 명</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end product section -->

	<!-- cart banner section -->
	<section class="cart-banner pt-100 pb-100" style="padding: 40px 0px 80px 0px">
    	<div class="container">
        	<div class="row clearfix" style="align-items: center">
            	<!--Image Column-->
            	<div class="image-column col-lg-6">
            	
	            	<!-- Kakao Map -->
	            	<div class="col-md-6" style="padding: 0;">
						 <div id="map" style="height: 500px; left: 27px; width: 340px; background: gray; box-shadow:0 0 20px #b7b7b7"></div>
					</div>
						<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2a214bd6b5af9abe29536c813436a779&libraries=services,clusterer"></script>
						<script>
							var container = document.getElementById('map');
							var options = {
								center : new kakao.maps.LatLng(36.5129, 127.9626),
								level : 13
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
            	
                </div>
                <!--Content Column-->
                <div class="content-column col-lg-6">
					<h3>주요 도시별 모임현황</h3>
                    <div class="text">찾아보세요. 전국의 지역의 모임 현황을 볼 수 있습니다.<br>더 자세한 정보는 메인페이지를 방문해주세요.</div>
                    <!--Countdown Timer-->
					<div class="region-counter">
						<div class="region-countup clearfix">
							<div class="counter-column">
								<div class="inner">
									<span class="count">${seoul}</span>서울
								</div>
							</div>
							<div class="counter-column">
								<div class="inner">
									<span class="count">${gyunggi}</span>경기
								</div>
							</div>
							<div class="counter-column">
								<div class="inner">
									<span class="count">${busan}</span>부산
								</div>
							</div>
							<div class="counter-column">
								<div class="inner">
									<span class="count">${daegu}</span>대구
								</div>
							</div>
						</div>
					</div>
					<a href="/map" class="cart-btn mt-3"><i
						class="fa-brands fa-golang"></i> 모임신청</a>
				</div>
            </div>
        </div>
    </section>
    <!-- end cart banner section -->

	<!-- testimonail-section -->
	
	<!-- team section -->
	<div class="mt-150">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 offset-lg-2 text-center">
					<div class="section-title">
						<h3><span class="orange-text"> Sportylight</span> 팀</h3>
						<p>소개합니다. Sportylight 프로젝트를 진행하는 개발자들입니다.</p>
					</div>
				</div>
			</div>
			<div class="row" style="display: flex; flex-wrap:nowrap; justify-content: center">
				<div class="col-lg-4 col-md-6">
					<div class="single-team-item" style="width: 300px">
						<div class="team-bg team-bg-1" style="width: 300px"> <img src="/resources/images/gate/taehwa.jpg" alt="" style="height: 400px;"></div>
						<h4>태화 <span>아우 진짜 화내는 개발자</span></h4>
						<ul class="social-link-team">
							<li><a href="#" target="_blank"><i class="fab fa-facebook-f"></i></a></li>
							<li><a href="#" target="_blank"><i class="fab fa-instagram"></i></a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-4 col-md-6">
					<div class="single-team-item" style="width: 300px">
						<div class="team-bg team-bg-1" style="width: 300px"> <img src="/resources/images/gate/jeonghyeon.jpg" alt="" style="height: 400px;"></div>
						<h4>정현 <span>내 걸음마는 개 발자</span></h4>
						<ul class="social-link-team">
							<li><a href="#" target="_blank"><i class="fab fa-facebook-f"></i></a></li>
							<li><a href="#" target="_blank"><i class="fab fa-instagram"></i></a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-4 col-md-6">
					<div class="single-team-item" style="width: 300px">
						<div class="team-bg team-bg-2" style="width: 300px"><img src="/resources/images/gate/honggeun.jpg" alt="" style="height: 400px;"></div>
						<h4>홍근 <span>시치시치한 개발자</span></h4>
						<ul class="social-link-team">
							<li><a href="#" target="_blank"><i class="fab fa-facebook-f"></i></a></li>
							<li><a href="#" target="_blank"><i class="fab fa-instagram"></i></a></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 offset-md-3 offset-lg-0">
					<div class="single-team-item" style="width: 300px">
						<div class="team-bg team-bg-3" style="width: 300px"><img src="/resources/images/gate/haye.jpg" alt="" style="height: 400px;"></div>
						<h4>하예 <span>아침에 사라지는 개발자</span></h4>
						<ul class="social-link-team">
							<li><a href="#" target="_blank"><i class="fab fa-facebook-f"></i></a></li>
							<li><a href="#" target="_blank"><i class="fab fa-instagram"></i></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end team section -->
	
	<div class="testimonail-section mt-150 mb-150">
		<div class="container">
			<div class="row">
				<div class="col-lg-10 offset-lg-1 text-center">
					<div class="testimonial-sliders">
						<div class="single-testimonial-slider">
							<div class="client-meta">
								<h3>태화 <span>아우 진짜 화내는 개발자</span></h3>
								<p class="testimonial-body">
									"다들 쉬고 합시다. 근데 어디까지 했어요?"
								</p>
								<div class="last-icon">
									<i class="fas fa-quote-right"></i>
								</div>
							</div>
						</div>
						<div class="single-testimonial-slider">
							<div class="client-meta">
								<h3>정현 <span>내 걸음마는 개 발자</span></h3>
								<p class="testimonial-body">
									"어라? 새벽은 저녁 아닌가요?"
								</p>
								<div class="last-icon">
									<i class="fas fa-quote-right"></i>
								</div>
							</div>
						</div>
						<div class="single-testimonial-slider">
							<div class="client-meta">
								<h3>홍근 <span>시치시치한 개발자</span></h3>
								<p class="testimonial-body">
									"시치는 나를 더욱 강하게 만든다."
								</p>
								<div class="last-icon">
									<i class="fas fa-quote-right"></i>
								</div>
							</div>
						</div>
						<div class="single-testimonial-slider">
							<div class="client-meta">
								<h3>하예 <span>아침에 사라지는 개발자</span></h3>
								<p class="testimonial-body">
									"왜지? 코딩하는데 왜 코고는 소리가 나는걸까?"
								</p>
								<div class="last-icon">
									<i class="fas fa-quote-right"></i>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end testimonail-section -->
	
	<!-- copyright -->
	<div class="copyright">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-12">
					<p>Copyrights &copy; 2023 - Sportylight (Java Backend Project),  All Rights Reserved.</p>
				</div>
				<div class="col-lg-6 text-right col-md-12">
					<div class="social-icons">
						<ul>
							<li><a href="https://www.google.com/intl/ko/gmail/about/" target="_blank"><i class="fa-brands fa-google"></i></a></li>
							<li><a href="https://www.facebook.com/" target="_blank"><i class="fab fa-facebook-f"></i></a></li>
							<li><a href="https://www.instagram.com/" target="_blank"><i class="fab fa-instagram"></i></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- end copyright -->
	
	<!-- jquery -->
	<script src="resources/js/gate/jquery-1.11.3.min.js"></script>
	<!-- bootstrap -->
	<script src="resources/js/gate/bootstrap.min.js"></script>
	<!-- count down -->
	<script src="resources/js/gate/jquery.countdown.js"></script>
	<!-- isotope -->
	<script src="resources/js/gate/jquery.isotope-3.0.6.min.js"></script>
	<!-- waypoints -->
	<script src="resources/js/gate/waypoints.js"></script>
	<!-- owl carousel -->
	<script src="resources/js/gate/owl.carousel.min.js"></script>
	<!-- magnific popup -->
	<script src="resources/js/gate/jquery.magnific-popup.min.js"></script>
	<!-- mean menu -->
	<script src="resources/js/gate/jquery.meanmenu.min.js"></script>
	<!-- sticker js -->
	<script src="resources/js/gate/sticker.js"></script>
	<!-- main js -->
	<script src="resources/js/gate/main.js"></script>

</body>
</html>