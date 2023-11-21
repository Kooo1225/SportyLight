<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<link rel="stylesheet" href="/resources/css/mypage/mypage.css" />

<%@ include file="/WEB-INF/views/layouts/mpheader.jsp"%>

<style>
#myct2 {
color: #00000;
text-shadow: 0px 5px 5px rgba(0, 0, 0, 0.25);
}

</style>
<body>
<form action="${contextPath}/mypage/update" method="post">

<div class="panel panel-default">
	<!-- -------------------------프로필사진--------------------------------------- -->	
	<div class="profile2-fluid mx-auto">

		<img id="profile2-image" src="/resources/css/images/cat.jpeg" 
		
			alt="프로필 사진"> 
			<a href="/" style="text-decoration: none;" >사진 변경 </a>
	</div>


	<div class="input-style2" style="padding: 50px 0 50px 0;">		
		<!-- -------------------------이름--------------------------------------- -->		
		<div class="form-group mx-auto check">
			      <!-- 민트박스  -->
			        <svg xmlns="http://www.w3.org/2000/svg" width="117" height="55"viewBox="0 0 117 52" fill="none"style="position: absolute; top: 0px; left: 0px;">
                      <rect x="116.248" y="52" width="116" height="52" rx="10"transform="rotate(179.72 116.248 50.9995)" fill="#CFF8EB" /> 
                      <rect x="116.248" y="52" width="12.4923" height="52"transform="rotate(179.72 116.248 50.9995)" fill="#CFF8EB" />
                      <text x="50%" y="50%" dominant-baseline="middle"text-anchor="middle" fill="#B3B3B3" font-size="18"
					        font-family="Arial">이름</text>     
                   </svg>
		     <input class="membername" value="${member.name}" readonly>
	    </div>
		<!-- -------------------------생년월일,성별---------------------------------- -->
		<div class="form-group mx-auto select">

			<i class="fa-sharp fa-regular fa-calendar-days fa-2x"></i> 
			<input class="date" value="<fmt:formatDate value='${member.birth}' pattern='yyyy-MM-dd' />" readonly>

			<i class="fa-solid fa-venus-double fa-2x" style="color: #518E7B;"></i>

			<input type="radio" id="select" name="gender" value="0"> 
			    <label for="select" value="">남자</label> 
			<input type="radio" id="select2"name="gender" value="1"> 
			    <label for="select2">여자</label>
		</div>
		<!-- -------------------------닉네임---------------------------------------- -->		
		<div class="form-group mx-auto check">
			       <!-- 민트박스  -->
			       <svg xmlns="http://www.w3.org/2000/svg" width="117" height="55"viewBox="0 0 117 52" fill="none"style="position: absolute; top: 0px; left: 0px;">
                      <rect x="116.248" y="52" width="116" height="52" rx="10"transform="rotate(179.72 116.248 50.9995)" fill="#CFF8EB" /> 
                      <rect x="116.248" y="52" width="12.4923" height="52"transform="rotate(179.72 116.248 50.9995)" fill="#CFF8EB" />
                      <text x="50%" y="50%" dominant-baseline="middle"text-anchor="middle" fill="#B3B3B3" font-size="18"
					        font-family="Arial">닉네임</text>     
                   </svg>
			 <input class="membernickname" value="${member.nickname}" >
		</div>
		<!-- ------------------------------이메일------------------------------- -->
		<div class="form-group2 mx-auto check" id="emailbox">
			      <!-- 민트박스  -->
			       <svg xmlns="http://www.w3.org/2000/svg" width="117" height="55"viewBox="0 0 117 52" fill="none"style="position: absolute; top: 0px; left: 0px;">
                      <rect x="116.248" y="52" width="116" height="52" rx="10"transform="rotate(179.72 116.248 50.9995)" fill="#CFF8EB" /> 
                      <rect x="116.248" y="52" width="12.4923" height="52"transform="rotate(179.72 116.248 50.9995)" fill="#CFF8EB" />
                      <text x="50%" y="50%" dominant-baseline="middle"text-anchor="middle" fill="#B3B3B3" font-size="18"
					        font-family="Arial">이메일</text>     
                   </svg>
			 <input class="memberemail" value="${member.email}" readonly>
		</div>	
		<div class="pwtext mx-auto">*비밀번호 변경시 작성</div>	
		<!-- ------------------------------비밀번호------------------------------- -->
		<div class="form-group mx-auto check">
			      <!-- 민트박스  -->
			       <svg xmlns="http://www.w3.org/2000/svg" width="117" height="55"viewBox="0 0 117 52" fill="none"style="position: absolute; top: 0px; left: 0px;">
                      <rect x="116.248" y="52" width="116" height="52" rx="10"transform="rotate(179.72 116.248 50.9995)" fill="#CFF8EB" /> 
                      <rect x="116.248" y="52" width="12.4923" height="52"transform="rotate(179.72 116.248 50.9995)" fill="#CFF8EB" />
                      <text x="50%" y="50%" dominant-baseline="middle"text-anchor="middle" fill="#B3B3B3" font-size="18"
					        font-family="Arial">비밀번호</text>     
                   </svg>
			 <input class="password" type="password" placeholder="비밀번호를 입력해주세요.">
		</div>		
		<!-- ------------------------------비밀번호2------------------------------- -->
		<div class="form-group mx-auto check">
			      <!-- 민트박스  -->
			       <svg xmlns="http://www.w3.org/2000/svg" width="117" height="55"viewBox="0 0 117 52" fill="none" style="position: absolute; top: 0px; left: 0px;">
                      <rect x="116.248" y="52" width="116" height="52" rx="10"transform="rotate(179.72 116.248 50.9995)" fill="#CFF8EB" /> 
                      <rect x="116.248" y="52" width="12.4923" height="52"transform="rotate(179.72 116.248 50.9995)" fill="#CFF8EB" />
                      <text x="50%" y="50%" dominant-baseline="middle"text-anchor="middle" fill="#B3B3B3" font-size="18"
					        font-family="Arial">비밀번호</text>     
                   </svg>
			 <input class="password2" type="password" placeholder="비밀번호를 확인해주세요.">
		</div>
		<!-- ------------------------------확인취소버튼------------------------------- -->		
		<div class="row mx-auto" >
    <div class="col-6 text-right">
        <div class="form-group mx-auto submitButton">
            <button type="submit" class="btn btn-info" 
            onclick="location.href='${contextPath}/mypage?membersid=${member.membersId }'">확인</button>
        </div>
    </div>
    <div class="col-6 text-left">
        <div class="form-group mx-auto submitButton" style="margin-left: -10px;">
            <button type="button" class="btn btn-info" 
            onclick="location.href='${contextPath}/mypage?membersId=${member.membersId }'">취소</button>
        </div>
    </div>
</div> 

	</div>

</div>
</form>
</body>

