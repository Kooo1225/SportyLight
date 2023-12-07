<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ include file="../layouts/joinHeader.jsp"%>


<h1 class="page-header">FIND PASSWORD</h1>
<br>

<div class="mx-auto">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	
	<div class="form-group1 mx-auto">
		<input type="text" name="name" id="name2" placeholder="이름">
	</div>
	
	<div class="form-group1 mx-auto">
		<input type="text" name="email" id="email2" placeholder="email">
	</div>
	
	<div class="form-group3 mx-auto submitbutton">
		<button type="submit" id="pw-find" >비밀번호 찾기</button>
	</div>
</div>

<script src="/resources/js/home/rest.js" ></script>
<script>
$(document).ready(function(e) {
	const BASE_URL = '/api/security/pw';
	var userName = document.getElementById('name2');
	var userId = document.getElementById('email2');
	
	$('#pw-find').on('click', async function(e) {
		if(userName.value == '') {
			alert('이름을 입력해주세요');
		}
		else if(userId.value == '') {
			alert('이메일을 입력해주세요');
		}
		else {
			var name = userName.value;
			var id = userId.value;
			
			$.ajax({
				type: 'post',
				contentType: 'application/json',
				url: BASE_URL,
				data: JSON.stringify({ name: name, email: id }),
				success: function(data) {
					if(data == false) {
						alert('잘못된 이름 혹은 이메일 입니다.');
					}
					else if(data == true) {
						alert('비밀번호 변경이 완료되었습니다. 재접속 시 비밀번호를 변경해주시기 바랍니다.');
						window.location.href = '/';
					}
				}
			})
		}
	})
})

</script>

</body>