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
		<!-- -------------------------프로필--------------------------------------->
		<div class="profile-fluid mx-auto"> 
	       <img src="${member.avatarPath}" id="profile-image" name="avatarPath" alt="프로필 사진">
           <img src="/resources/images/home/cat.jpeg" name="avatarPath" id="profile2-image" alt="기본 이미지">
              <script>
				 var memberProfile = "${member.avatarPath}";
                 if (memberProfile === null || memberProfile === "") {
					document.getElementById('profile-image').style.display = 'none';
				    document.getElementById('profile2-image').style.display = 'block'; 
				    console.log("프로필 존재 안함")
				 } else  { // 이미지가 존재할때
					document.getElementById('profile-image').src = memberProfile;
				    document.getElementById('profile2-image').style.display = 'none';
				    console.log("프로필 존재")
				 }  
			  </script>
		</div>
             <input type="file" id="profile-fluid" name="avatarPath" accept="image/*">
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
			 <input type="nickname" class="membernickname" name="nickname" >
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
		<!-- ------------------------------확인취소버튼------------------------------- -->		
		<div class="row mx-auto" >
    <div class="col-4 mx-auto">
        <div class="form-group submitButton">
            <button type="submit" class="btn btn-info" style="position: relative;left: 22px;">확인</button>
        </div>
    </div>
    <div class="col-4 mx-auto">
        <div class="form-group submitButton">
            <button type="button" class="btn btn-info" style="right: 85px;position: relative;"
            onclick="location.href='/mypage?membersId=${member.membersId }'">취소</button>
        </div>
    </div>
    <div class="col-4 mx-auto">
        <div class="form-group submitButton">
            <button type="button" class="btn btn-info" style="position: relative;right: 199px;"
            onclick="location.href='/mypage/pwupdate?membersId=${membersId}'">비밀번호 변경</button>
        </div>
    </div>
</div> 

	</div>

</div>
</form>
</body>