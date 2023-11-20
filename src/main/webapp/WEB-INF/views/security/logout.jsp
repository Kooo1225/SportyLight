<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/security/logout" method="post">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		로그아웃
	</form>
	
</body>
</html>