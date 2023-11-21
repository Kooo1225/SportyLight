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
<form action="/mypage/update" method="post">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
<div class="panel panel-default">
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
		     <input class="membername" name="name" value="${member.name}" readonly>
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
			 <input class="membernickname" name="nickname" value="${member.nickname}" readonly>
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
			 <input class="memberemail" name="email" value="${member.email}" readonly>
		</div>	
		<div class="pwtext mx-auto">*비밀번호 변경시 작성</div>	
		<!-- ------------------------------현비밀번호------------------------------- -->
		<form action="/mypage/update" method="post">
		<div class="form-group mx-auto check">
			      <!-- 민트박스  -->
			       <svg xmlns="http://www.w3.org/2000/svg" width="117" height="55"viewBox="0 0 117 52" fill="none"style="position: absolute; top: 0px; left: 0px;">
                      <rect x="116.248" y="52" width="116" height="52" rx="10"transform="rotate(179.72 116.248 50.9995)" fill="#CFF8EB" /> 
                      <rect x="116.248" y="52" width="12.4923" height="52"transform="rotate(179.72 116.248 50.9995)" fill="#CFF8EB" />
                      <text x="50%" y="50%" dominant-baseline="middle"text-anchor="middle" fill="#B3B3B3" font-size="18"
					        font-family="Arial">현재비밀번호</text>     
                   </svg>
			 <input type="password" id="password5" name="password" required>
		</div>		
		<!-- ------------------------------변경 비밀번호------------------------------- -->
		<div class="form-group mx-auto check">
			      <!-- 민트박스  -->
			       <svg xmlns="http://www.w3.org/2000/svg" width="117" height="55"viewBox="0 0 117 52" fill="none"style="position: absolute; top: 0px; left: 0px;">
                      <rect x="116.248" y="52" width="116" height="52" rx="10"transform="rotate(179.72 116.248 50.9995)" fill="#CFF8EB" /> 
                      <rect x="116.248" y="52" width="12.4923" height="52"transform="rotate(179.72 116.248 50.9995)" fill="#CFF8EB" />
                      <text x="50%" y="50%" dominant-baseline="middle"text-anchor="middle" fill="#B3B3B3" font-size="18"
					        font-family="Arial">변경비밀번호</text>     
                   </svg>
			 <input type="password" id="newPassword" name="newPassword" required>
		</div>		
		<!-- ------------------------------변경 비밀번호2------------------------------- -->
		<div class="form-group mx-auto check">
			      <!-- 민트박스  -->
			       <svg xmlns="http://www.w3.org/2000/svg" width="117" height="55"viewBox="0 0 117 52" fill="none" style="position: absolute; top: 0px; left: 0px;">
                      <rect x="116.248" y="52" width="116" height="52" rx="10"transform="rotate(179.72 116.248 50.9995)" fill="#CFF8EB" /> 
                      <rect x="116.248" y="52" width="12.4923" height="52"transform="rotate(179.72 116.248 50.9995)" fill="#CFF8EB" />
                      <text x="50%" y="50%" dominant-baseline="middle"text-anchor="middle" fill="#B3B3B3" font-size="18"
					        font-family="Arial">변경비밀번호</text>     
                   </svg>
			 <input type="password" id="newPassword2" name="newPassword2" required>
		</div>
		<!-- ------------------------------확인취소버튼------------------------------- -->		
		<div class="row mx-auto" >
    <div class="col-6 text-right">
        <div class="form-group mx-auto submitButton">
            <button type="submit" class="btn btn-info" >확인</button>
        </div>
    </div>
    <div class="col-6 text-left">
        <div class="form-group mx-auto submitButton" style="margin-left: -10px;">
            <button type="button" class="btn btn-info" 
            onclick="location.href='/mypage?membersId=${member.membersId }'">취소</button>
        </div>
    </div>
</div> 

	</div>

</div>
</form>
</body>