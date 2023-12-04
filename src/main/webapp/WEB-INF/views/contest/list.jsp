<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<%@ include file="../layouts/homeHeader.jsp" %>

<style>
.contest-list {
	width: 200px;
	padding: 12px 26px;
	border-radius: 24px;
	border: 2px solid #7FB3FA;
	color: #7FB3FA;
	text-align: center;
}

.contest-list:hover {
	background-color: #788FA1;
	border: 2px solid #788FA1;
}

body {
	overflow-y: scroll;
}

</style>
<div class="pannel mx-auto">
		<div class="mylist-box mx-auto">
			<ul class="nav justify-content-center">
				<li class="nav-contest-list-item"><a class="nav-contest-link">각종 대회신청</a></li>
			</ul>
		</div>
</div>

<div class="card">
	<div class="card-body">
		<span class="contest-list"><a href="${contest.link}" style="text-decoration: none">${contest.association}</a></span>
	</div>
</div>
</body>
</html>