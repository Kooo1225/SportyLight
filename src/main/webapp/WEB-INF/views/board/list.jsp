<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ include file="/WEB-INF/views/layouts/homeHeader.jsp"%>

<div class="card">
	<div class="card-body">
		<div class="form-group mx-auto main-select">
			<div>
				<input type="radio" id="applied" name="listType" value="applied">
				<label for="applied">신청한 모임</label>
			</div>
			<div>
				<input type="radio" id="written" name="listType" value="written">
				<label for="written">내가 올린 모임</label>
			</div>
			<div>
				<input type="radio" id="favorited" name="listType" value="favorited">
				<label for="favorited">찜한 모임</label>
			</div>
		</div>
		<div class="mylist-border mx-auto"
			style="width: 1047px; height: 908px; background: white; border-radius: 30px; border: 2px #7FDCBE solid">
		</div>
	</div>
</div>



</body>