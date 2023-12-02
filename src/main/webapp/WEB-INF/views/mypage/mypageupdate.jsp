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


<form action="/mypage/update?_csrf=${_csrf.token }" method="post" enctype="multipart/form-data">

<div class="panel panel-default">
	    <div class="input-style2" style="padding: 50px 0 50px 0;">
		<!-- -------------------------프로필--------------------------------------->
		<div class="profile-fluid mx-auto"> 
	       <img src="/security/avatar/sm/${member.membersId}" class="home-avatar2"/>
		</div>
             <input type="file" name="avatar" id="profile-fluid">
		<!-- -------------------------이름--------------------------------------- -->		
		<div class="form-group mx-auto check">
			      <!-- 민트박스  -->
			        <svg xmlns="http://www.w3.org/2000/svg" width="117" height="55"viewBox="0 0 117 52" fill="none"style="position: absolute; top: 0px; left: 0px;">
                      <rect x="116.248" y="52" width="116" height="52" rx="10"transform="rotate(179.72 116.248 50.9995)" fill="#7FB3FA" /> 
                      <rect x="116.248" y="52" width="12.4923" height="52"transform="rotate(179.72 116.248 50.9995)" fill="#7FB3FA" />
                      <text x="50%" y="50%" dominant-baseline="middle"text-anchor="middle" fill="#fff" font-size="18"
					        font-family="Arial">이름</text>     
                   </svg>
		     <input class="membername" name="name" value="${member.name}" readonly>
	    </div>

		<!-- -------------------------닉네임---------------------------------------- -->		
		<div class="form-group mx-auto check">
			       <!-- 민트박스  -->
			       <svg xmlns="http://www.w3.org/2000/svg" width="117" height="55"viewBox="0 0 117 52" fill="none"style="position: absolute; top: 0px; left: 0px;">
                      <rect x="116.248" y="52" width="116" height="52" rx="10"transform="rotate(179.72 116.248 50.9995)" fill="#7FB3FA" /> 
                      <rect x="116.248" y="52" width="12.4923" height="52"transform="rotate(179.72 116.248 50.9995)" fill="#7FB3FA" />
                      <text x="50%" y="50%" dominant-baseline="middle"text-anchor="middle" fill="#fff" font-size="18"
					        font-family="Arial">닉네임</text>     
                   </svg>
			 <input type="nickname" class="membernickname" name="nickname" >
		</div>
		<!-- ------------------------------이메일------------------------------- -->
		<div class="form-group2 mx-auto check" id="emailbox">
			      <!-- 민트박스  -->
			       <svg xmlns="http://www.w3.org/2000/svg" width="117" height="55"viewBox="0 0 117 52" fill="none"style="position: absolute; top: 0px; left: 0px;">
                      <rect x="116.248" y="52" width="116" height="52" rx="10"transform="rotate(179.72 116.248 50.9995)" fill="#7FB3FA" /> 
                      <rect x="116.248" y="52" width="12.4923" height="52"transform="rotate(179.72 116.248 50.9995)" fill="#7FB3FA" />
                      <text x="50%" y="50%" dominant-baseline="middle"text-anchor="middle" fill="#fff" font-size="18"
					        font-family="Arial">이메일</text>     
                   </svg>
			 <input class="memberemail" name="email" value="${member.email}" readonly>
		</div>	
		<!-- ------------------------------확인취소버튼------------------------------- -->		
		<div class="row mx-auto" >
    <div class="col-4 mx-auto">
        <div class="form-group submitButton">
            <button type="submit" class="btn btn-info" 
            style="width:150px;height: 52px;position: relative;top: 7px;left: 94px;">확인</button>
        </div>
    </div>
    <div class="col-4 mx-auto">
        <div class="form-group submitButton">
            <button type="button" class="btn btn-info" style="right: 90px;width: 150px;height: 52px;position: relative;top: 7px;"
            onclick="location.href='/mypage?membersId=${member.membersId }'">취소</button>
        </div>
    </div>
    <div class="col-4 mx-auto">
        <div class="form-group submitButton">
            <button type="button" class="btn btn-info" style="right: 274px;width: 150px;height: 52px;position: relative;top: 7px;"
            onclick="location.href='/mypage/pwupdate?membersId=${membersId}'">비밀번호 변경</button>
        </div>
    </div>
</div> 

	</div>

</div>
</form>
</body>