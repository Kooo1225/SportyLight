<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ include file="../layouts/joinHeader.jsp" %>

<script type="text/javascript">
$("#file").on('change',function(){
	  var fileName = $("#file").val();
	  $(".upload-name").val(fileName);
	});

$(document).ready(function() {
	var now_utc = Date.now() 
	var timeOff = new Date().getTimezoneOffset()*60000; 
	var today = new Date(now_utc-timeOff).toISOString().split("T")[0];
	document.getElementById("date").setAttribute("max", today);
});
	
</script>

 <style>
	div#aa {
        position: absolute;
        width: 50px;
        height: 50px;
        border-radius: 50%; /* 50%로 변경하여 원 모양이 됨 */
        background: url('/resources/images/home/basketball-ball.png') center/cover; /* 이미지 경로를 설정 */
        animation: bounce 3s infinite, spin 3s linear infinite;
        z-index: 2;
    }

    @keyframes bounce {
        0%, 100% {
            bottom: 0px;
            animation-timing-function: ease-out;
        }

        50% {
            bottom: 200px;
            animation-timing-function: ease-in;
        }
    }

    @keyframes spin {
        0% {
            transform: rotate(0deg);
        }

        100% {
            transform: rotate(360deg);
        }
    }
     #basketballHoop {
        position: absolute;
        width: 25vw;
        height: auto; /* 높이 자동 조정 */
        bottom: 0; /* 농구골대를 아래에 배치 */
        left: 10px; /* 오른쪽으로 이동할 거리 조정 */
        z-index: 2;
    }

</style>
<h1 class="page-header"> JOIN</h1><br>

<div class="mx-auto">
	<form:form modelAttribute="member"
		action="/security/join?_csrf=${_csrf.token }" method="post" enctype="multipart/form-data">
		<div class="input-style">
		
			<div class="form-group check">
				<form:input path="email" placeholder=" 아이디(e-mail)를 작성해주세요."></form:input>
				<form:errors path="email" cssClass="error mx-auto" />
			</div>
			<div class="form-group mx-auto">
				<form:password path="password" placeholder=" 비밀번호를 작성해주세요."></form:password>
				<form:errors path="password" cssClass="error mx-auto" />
			</div>
			<div class="form-group mx-auto">
				<form:password path="password2" placeholder=" 비밀번호를 확인해주세요."></form:password>
				<form:errors path="password2" cssClass="error mx-auto" />
			</div>
			<div class="form-group mx-auto">
				<form:input path="name" placeholder="이름을 입력해주세요."></form:input>
				<form:errors path="name" cssClass="error mx-auto" />
			</div>
			<div class="form-group mx-auto select" >
				<i class="fa-sharp fa-regular fa-calendar-days fa-2x" 
				   style="color: #518E7B;"></i>
				<input type="date" id="date" name="birth"> 
				
				<i class="fa-solid fa-venus-double fa-2x" style="color: #518E7B;"></i>
				
				<form:radiobutton path="gender" id="select" value="male"></form:radiobutton><label for="select">남</label> 
				<form:radiobutton path="gender" id="select2" value="female"></form:radiobutton><label for="select2">여</label>
				<form:errors path="birth" cssClass="error mx-auto"></form:errors>
				<form:errors path="gender" cssClass="error2 mx-auto"></form:errors>
			</div>
			<div class="form-group mx-auto check">
				<form:input path="nickname" placeholder=" 닉네임"></form:input>
				<form:errors path="nickname" cssClass="error mx-auto"></form:errors>
			</div>
			
			<input type="file" name="avatar" id="file">
		</div>
		
		 <div id="aa"></div>
		 <div><img id="basketballHoop" src="/resources/images/home/hoop.png" alt="Basketball Hoop"></div>
		 <div class="runner"></div>
		
		<div class="form-group mx-auto submitButton">
			<button type="submit" class="btn btn-info">JOIN</button>
		</div>
	</form:form>
</div>

</body>

<%@ include file="../layouts/footer.jsp"%>