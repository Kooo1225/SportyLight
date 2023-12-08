<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%@ include file="../layouts/manageHeader.jsp"%>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
<link rel="stylesheet" href="/resources/css/board/manage.css" />

<div class="container11-fluid mx-auto">
	<div class="row">
		<div class="col-md-6">
			<div class="manage-list">
				<div class="list">모임 목록</div>
				<div>

					<div class="scroll3-container">
					
						<c:forEach var="gather" items="${myGatherList}">
						<!-- 한 세트 -->
						<div class="row" id="set3">
							<div class="col-2">
								<div class="sidebar-board-get">
									<img src="/avatar/sm/${gather.membersId}" id="profile1-image"alt="기본 이미지">
								</div>
							</div>
							
							<div class="col-10" id="detail">
								<span class="manage-category">[${gather.type}]</span> 
								<br>
								<button class="gather-list" onclick="location.href='/board/manage/${gather.gatheringId}'">[${gather.title}]</button>
								<br> 
								
								<fmt:parseDate value="${gather.dateTime}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both" />
								<span class="meetingdate"> <fmt:formatDate pattern="yyyy년 MM월 dd일 HH시 mm분" value="${parsedDateTime}" />
				                         
								</span> 
								<br> 
								<span class="count">참여인원: ${gather.participate}/${gather.headCount}명</span>
							</div>
						</div>

						</c:forEach>
						
					</div>

				</div>
			</div>
		</div>
		<div class="col-md-6" style="padding: 0;">
			<div style="margin: 50px 60px 45px 0px;">
				<div class="non-apply">
					<div class="list2">회원 목록</div>
                    
					<div class="scroll4-container">
						<c:forEach var="user" items="${myNonMemberList}">
							<div class="container" style="padding: 0px 0px">
							<input type="hidden" name="membersId" id="membersId" value="${user.membersId}"/>

							<table>
								<tr>
									<th>${user.nickname}</th>
									
									<td style="border-right: 1px solid gray;">
										<input type="radio" id="state" name="state" value="1"/>
										<label for="state1">
											<span>&nbsp;승인&nbsp;&nbsp;</span>
										</label>
										
										<input type="radio" id="state" name="state" value="-1"/>
										<label for="state2">
											<span>&nbsp;거부</span>
										</label>
									</td>
									
									<td style="width: 95px;">
										<button id="submit" onclick="checkCount(this)">확인</button>
									</td>
								</tr>
							</table>
							</div>
						</c:forEach>
						
					</div>
				</div>

				<div class="apply">
					<div class="list3">승인 목록</div>
						<div class="scroll4-container" >
							<c:forEach var="user" items="${myMemberList}">
								<div class="container" style="padding: 0px 0px">									
									<input type="hidden" name="membersId" id="membersId" value="${user.membersId}"/>
									<table>
										<tr>
											<th>${user.nickname}</th>
											
											<td style="border-right: 1px solid gray;">
												<input type="radio" id="state" name="state" value="0" data-id="${user.membersId}"/>
												<label for="state1">
													<span>&nbsp;취소</span>
												</label>
											</td>
											
											<td style="width: 95px;" data-id="${user.membersId }">
												<button id="submit" onclick="checkCount(this)">확인</button>
											</td>
										</tr>
									</table>
								</div>
							</c:forEach>
						</div>
					
				</div>
				
			</div>
		</div>
	</div>





</div>


<%@ include file="../layouts/chatFooter.jsp"%>

<script src="/resources/js/home/rest.js"></script>
<script>

function checkCount(btn) {
	const headCount = ${gatherVO.headCount};
	const participate = ${gatherVO.participate};
	const gatheringId = ${gatherVO.gatheringId};
	const container = btn.closest('.container');
	
	var radioElement = container.querySelector("input[name=state]:checked");
	const radioValue = radioElement ? radioElement.value : null;
	
	var idElement = container.querySelector("[name='membersId']");
	const idValue = idElement ? idElement.value : null;
	
	if(radioValue == 0){
		getManage(gatheringId, idValue, radioValue);
	}
	else if (radioValue != 0 && participate >= headCount) {
		alert("신청 인원이 초과되었습니다.");
		return;
	}
	else {
		getManage(gatheringId, idValue, radioValue);
	}
}

function getManage(gatheringId, membersId, state) {
	let f = document.createElement('form');

	let gatheringIdObj;
	gatheringIdObj = document.createElement('input');
	gatheringIdObj.setAttribute('type', 'hidden');
	gatheringIdObj.setAttribute('name', 'gatheringId');
	gatheringIdObj.setAttribute('value', gatheringId);
	
	let membersIdObj;
	membersIdObj = document.createElement('input');
	membersIdObj.setAttribute('type', 'hidden');
	membersIdObj.setAttribute('name', 'membersId');
	membersIdObj.setAttribute('value', membersId);
	
	let stateObj;
	stateObj = document.createElement('input');
	stateObj.setAttribute('type', 'hidden');
	stateObj.setAttribute('name', 'state');
	stateObj.setAttribute('value', state);
	
	let CSRFToken;
	CSRFToken = document.createElement('input');
	CSRFToken.setAttribute('type', 'hidden');
	CSRFToken.setAttribute('name', '${_csrf.parameterName}');
	CSRFToken.setAttribute('value', '${_csrf.token}'); 
			
	f.appendChild(gatheringIdObj);
	f.appendChild(membersIdObj);
	f.appendChild(stateObj);
	f.appendChild(CSRFToken);
	f.setAttribute('method', 'post');
	f.setAttribute('action', '/board/manage');
	document.body.appendChild(f);
	f.submit(); 
}

$(document).ready(function(e) { 
	
})


</script>