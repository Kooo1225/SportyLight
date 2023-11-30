<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<link rel="stylesheet" href="/resources/css/mypage/mypage.css" />

<%@ include file="/WEB-INF/views/layouts/mpheader.jsp"%>

<style>
#myct1 {
	color: #00000;
	text-shadow: 0px 5px 5px rgba(0, 0, 0, 0.25);
}
</style>

	<div class="panel panel-default">
		<!-- -------------------------프로필사진--------------------------------------- -->
		<div class="profile-fluid mx-auto"> 
		  <img src="/security/avatar/sm/${member.membersId }" class="home-avatar"/>
		</div>		
		<div class="input-style" style="padding: 50px 0 50px 0;">
			<!-- -------------------------이름--------------------------------------- -->
			<div class="form-group mx-auto check">
				<!-- 민트박스  -->
				<svg xmlns="http://www.w3.org/2000/svg" width="117" height="55"
					viewBox="0 0 117 52" fill="none"
					style="position: absolute; top: 0px; left: 0px;">
                      <rect x="116.248" y="52" width="116" height="52"
						rx="10" transform="rotate(179.72 116.248 50.9995)" fill="#CFF8EB" /> 
                      <rect x="116.248" y="52" width="12.4923"
						height="52" transform="rotate(179.72 116.248 50.9995)"
						fill="#CFF8EB" />
                      <text x="50%" y="50%" dominant-baseline="middle"
						text-anchor="middle" fill="#B3B3B3" font-size="18"
						font-family="Arial">이름</text>     
                   </svg>
				<input class="membername" value="${member.name}" readonly>
			</div>
			<!-- -------------------------생년월일,성별---------------------------------- -->
			<div class="form-group mx-auto "  style="display: flex; align-items: center;">

				 <i class="fa-sharp fa-regular fa-calendar-days fa-2x"></i> 
				  <input class="date" 
				         value="<fmt:formatDate value='${member.birth}' pattern='yyyy-MM-dd' />" readonly> 
				<i class="fa-solid fa-venus-double fa-2x" style="color: #518E7B;"></i> 
				<!-- 여성 라디오 버튼 -->
				   <input id="select" name="gender" value="남" readonly>
				<!-- 남성 라디오 버튼 -->
				   <input id="select2" name="gender" value="여" readonly>
			</div>
			  <script>
				  // 회원 정보에서 성별을 가져와 초기 색상 설정
				  var memberGender = "${member.gender}";

				  // 초기 회원 성별에 따라 색상 설정
				  if (memberGender === 'male') {
				      document.getElementById('select').style.backgroundColor = '#7FDCBE'; // 남자 색상
				  } else if (memberGender === 'female') {
					document.getElementById('select2').style.backgroundColor = '#7FDCBE'; // 여자 색상
				  }
			  </script>
			<!-- -------------------------닉네임---------------------------------------- -->
			<div class="form-group mx-auto check">
				<!-- 민트박스  -->
				<svg xmlns="http://www.w3.org/2000/svg" width="117" height="55"
					viewBox="0 0 117 52" fill="none"
					style="position: absolute; top: 0px; left: 0px;">
                      <rect x="116.248" y="52" width="116" height="52"
						rx="10" transform="rotate(179.72 116.248 50.9995)" fill="#CFF8EB" /> 
                      <rect x="116.248" y="52" width="12.4923"
						height="52" transform="rotate(179.72 116.248 50.9995)"
						fill="#CFF8EB" />
                      <text x="50%" y="50%" dominant-baseline="middle"
						text-anchor="middle" fill="#B3B3B3" font-size="18"
						font-family="Arial">닉네임</text>     
                   </svg>
				<input class="membernickname" value="${member.nickname}" readonly>
			</div>
			<!-- ------------------------------이메일------------------------------- -->
			<div class="form-group mx-auto check">
				<!-- 민트박스  -->
				<svg xmlns="http://www.w3.org/2000/svg" width="117" height="55"
					viewBox="0 0 117 52" fill="none"
					style="position: absolute; top: 0px; left: 0px;">
                      <rect x="116.248" y="52" width="116" height="52"
						rx="10" transform="rotate(179.72 116.248 50.9995)" fill="#CFF8EB" /> 
                      <rect x="116.248" y="52" width="12.4923"
						height="52" transform="rotate(179.72 116.248 50.9995)"
						fill="#CFF8EB" />
                      <text x="50%" y="50%" dominant-baseline="middle"
						text-anchor="middle" fill="#B3B3B3" font-size="18"
						font-family="Arial">이메일</text>     
                   </svg>
				<input class="memberemail" value="${member.email}" readonly>
			</div>
		</div>
	</div>
</body>
