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
					
						<form:form modelAttribute="gatherMemebers" role="form" action="/board/manage" method="post">
							<c:forEach var="user" items="${myNonMemberList}">
								<table>
									<tr>
										<th>${user.nickname}</th>
										
										<form:hidden path="membersId" name="membersId" value="${user.membersId}"/>
										<form:hidden path="gatheringId" name="gatheringId" value="${gatheringId}"/>
										
										<td style="border-right: 1px solid gray;">
											<form:checkbox path="state" value="1"/>
											<label for="state1">
												<span>&nbsp;승인&nbsp;&nbsp;</span>
											</label>
											
											<form:checkbox path="state" value="-1"/>
											<label for="state2">
												<span>&nbsp;거부</span>
											</label>
										</td>
										
										<td style="width: 95px;">
											<form:button type="submit" id="submit">확인</form:button>
										</td>
									</tr>
								</table>
							</c:forEach>
						</form:form>
					</div>
				</div>

				<div class="apply">
					<div class="list3">승인 목록</div>
						<div class="scroll4-container">
					
							<form:form modelAttribute="gatherMemebers" role="form" action="/board/manage" method="post">
								<c:forEach var="user" items="${myMemberList}">
									<table>
										<tr>
											<th>${user.nickname}</th>
											
											<form:hidden path="membersId" name="membersId" value="${user.membersId}"/>
											<form:hidden path="gatheringId" name="gatheringId" value="${gatheringId}"/>
											
											<td style="border-right: 1px solid gray;">
												<form:checkbox path="state" value="0"/>
												<label for="state1">
													<span>&nbsp;취소</span>
												</label>
											</td>
											
											<td style="width: 95px;">
												<form:button type="submit" id="submit">확인</form:button>
											</td>
										</tr>
									</table>
								</c:forEach>
							</form:form>
						</div>
					
				</div>
				
			</div>
		</div>
	</div>





</div>


<%@ include file="../layouts/chatFooter.jsp"%>

<script src="/resources/js/home/rest.js"></script>
<script>
$(document).ready(function(e) {
	
})

</script>