<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ include file="../layouts/joinHeader.jsp" %>

<script type="text/javascript">
$("#file").on('change',function(){
	  var fileName = $("#file").val();
	  $(".upload-name").val(fileName);
	});
</script>
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

		<div class="form-group mx-auto submitButton">
			<button type="submit" class="btn btn-info">JOIN</button>
		</div>
	</form:form>
</div>

</body>