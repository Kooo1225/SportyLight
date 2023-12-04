<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ include file="../layouts/joinHeader2.jsp" %>

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

function previewFile() {
    var preview = document.getElementById('preview');
    var fileInput = document.getElementById('file');
    
    // 파일이 선택되었는지 확인
    if (fileInput.files && fileInput.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            // 이미지를 미리보기로 출력
            preview.innerHTML = '<img src="' + e.target.result + '" alt="프로필 이미지" style="width:50px; height:50px">';
        }

        // 파일을 읽어오기
        reader.readAsDataURL(fileInput.files[0]);
    }
}
	
</script>

 <style>
 /* 농구공 및 농구골대 css */
	div#basketball-action {
	    left: 348px;
        top: 327px;
        position: absolute;
        width: 50px;
        height: 50px;
        border-radius: 50%; /* 50%로 변경하여 원 모양이 됨 */
        background: url('/resources/images/home/basketball-ball.png') center/cover; /* 이미지 경로를 설정 */
        animation: bounce 4s infinite, spin 3s linear infinite;
        z-index: 2;
    }

    @keyframes bounce {
        0%, 100% {
            left: 800px;
            top: 600px;
            animation-timing-function: ease-out;
        }

        50% {
            top: 200px;
            left: 800px;
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
        position: relative;
        width: 23vw;
        height: auto;
        bottom: 682px;
        right: 364px;
        z-index: 2;
    }
    
    #basketballCourt {
        position: relative;
        width: 40vw;
        height: auto;
        bottom: 790px;
        right: 364px;
        z-index: 1;
    }
    
    #preview {
            max-width: 50px;
            max-height: 50px;
            margin-top: 10px;
        }
    
</style>

<div class="container7">
	<a href="/" style="text-decoration:none;"><h1 class="page-header" style="font-size: 45px;"> SportyLight</h1><br></a>
	<h2 class="page-header" style="font-size: 25px;">join</h2><br>
	
	<div class="mx-auto">
		<form:form modelAttribute="member"
			action="/security/join?_csrf=${_csrf.token }" method="post" enctype="multipart/form-data">
			<div class="input-style">
			
				<div class="form-group check">
				<form:input path="email" class="email" placeholder=" 아이디(e-mail)를 작성해주세요."></form:input>
				<form:errors path="email" cssClass="error mx-auto" />
				<button type="button" class="email2" data-toggle="modal" data-target="#exampleModalCenter">
                    인증
                </button>
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
					   style="color: #5A95F5;top: 5px;position: relative;"></i>
					<input type="date" id="date" name="birth" style="color:gray">
					 
					<i class="fa-solid fa-venus-double fa-2x" style="color: #5A95F5;top: 4px;position: relative;"></i>
					<form:radiobutton path="gender" id="select" value="male"></form:radiobutton><label for="select">남</label> 
					<form:radiobutton path="gender" id="select2" value="female"></form:radiobutton><label for="select2">여</label>
					<form:errors path="birth" cssClass="error mx-auto"></form:errors>
					<form:errors path="gender" cssClass="error2 mx-auto"></form:errors>
				</div>
				<div class="form-group mx-auto check">
					<form:input path="nickname" placeholder=" 닉네임"></form:input>
					<form:errors path="nickname" cssClass="error mx-auto"></form:errors>
				</div>
				
				<label class="file-button" for="file">
					&nbsp;프로필 선택
				</label>
				<input type="file" name="avatar" id="file" style="display:none" accept="image/*" onchange="previewFile()">
				<span id="preview"></span>
			</div>
			
			<div class="form-group mx-auto submitButton">
				<button type="submit" class="btn btn-info">JOIN</button>
			</div>
		</form:form>
	</div>
</div>
		<div id="basketball-action"></div>
		<div><img id="basketballHoop" src="/resources/images/home/hoop.png" alt="Basketball Hoop"></div>
		<div><img id="basketballCourt" src="/resources/images/home/basketball-court.png" alt="Basketball Court"></div>

</body>
