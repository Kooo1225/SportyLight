<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../layouts/chatHeader.jsp"%>


<div class="container">
	<div class="row">
		<div class="col-md-4 mx-auto" id="list-container1">
			<div class="col-md-12" id="list-container" style="overflow-y: auto; max-height: 100%;">
			<div class="liststart">목록(${chattingList.size()})</div>
				<!--------------프로필사진------------------>
				<div class="scroll-container">

					<c:forEach var="list" items="${chattingList}">
						<div class="row" id="set1">
							<div class="col-2">
								<div class="sidebar-board-get">
									<img src="/security/avatar/sm/${list.membersId}" id="profile1-image" alt="기본 이미지">
								</div>
							</div>
	
							<!---------------------------------------->
							<div class="col-10" id="detail">
									<span class="list-title" data-value="${list.gatheringId}"><b>${list.title}</b></span> 
<!-- 								<span class="list-time" >&nbsp;1일전</span>
									<br>
									<span> 감사합니다.</span> -->									
							</div>
						</div>
					</c:forEach>
					
				</div>
			</div>
		</div>
		
		<div class="col-md-8 mx-auto" id="chat-container1">
			<div class="col-2 col-md-12" id="chat-container" style="overflow-y: auto; max-height: 500px;">
			
				

			</div>


			<div class="col-12 col-md-12" id="inputbox">
				<div class="row mx-auto">
					<textarea class="col-12 col-md-10" id="messageInput" placeholder="Type your message"></textarea>
					<button type="submit" class="col-12 col-md-2" id="sendButton">Send</button>
				</div>
			</div>

		</div>

	</div>
</div>
</body>

<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.0/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment-with-locales.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/locale/ko.min.js"></script>

<script>
var stompClient = null;
var previousDate = null;
var principalName = '${customUser.getNickName()}';


function connect() {
	const socket = new SockJS("/endpoint");
	stompClient = Stomp.over(socket);
	
	stompClient.connect({}, function(frame) {	
		
		displayPreviousMessage();
		
		stompClient.subscribe('/subscribe/message/' + ${gatheringId}, function(response) {
			
			var message = JSON.parse(response.body);
			var currentTime = getCurrentTime(message.sendDate);
			var decodeMessage = decodeURIComponent(escape(atob(message.message)));
			
 			if (message.nickName == principalName) {
				displayMyMessage(currentTime, decodeMessage);
			}
			else {
				displayOtherMessage(message.nickName, currentTime, decodeMessage, message.avatarPath);
			}
		})
		
	});
	
}

function sendMessage() {
	var messageInput = $('#messageInput');
	var messageContent = convertNewlineToBr(messageInput.val());
	
	if(messageContent != '') {
		var encodeMessage = btoa(unescape(encodeURIComponent(messageContent)));
		
		stompClient.send('/app/gatherChat/' + ${gatheringId}, {}, JSON.stringify( 
						{ 
							gatheringId: ${gatheringId},
							membersId: ${customUser.getMembersId()},
							message: encodeMessage,
							nickName: principalName,
							avatarPath: '/security/avatar/sm/' + ${customUser.getMembersId()}
						}));
		
		document.getElementById("messageInput").value='';
	}
}
	
function displayOtherMessage(nickName, currentTime, message, avatarPath) {
	var chatContainer = $('#chat-container');
	
	var messageDiv = $('<div>');
	messageDiv.attr('id', 'bubble2');
	
	var rowDiv = $('<div>').addClass('row');
	var colDiv = $('<div>').addClass('col-md-1');
	colDiv.css({ padding: '0', top: '15px' });
	
	var imgDiv = $('<img>');
	imgDiv.attr('src', avatarPath);
	imgDiv.attr('id', 'profile2-image');
	
	var colDiv2 = $('<div>').addClass('col-md-11');
	colDiv2.css({ 'padding': '0 15' });
	
	var chatIdDiv = $('<div>').text(nickName);
	chatIdDiv.attr('id', 'chatid');
	
	var bubbleDiv = $('<div>').html(message);
	bubbleDiv.attr('id', 'get-bubble');
	
	var spanDiv = $('<span>').html('&nbsp;' + currentTime);
	spanDiv.attr('id', 'chattime');
	
	colDiv.append(imgDiv);
	colDiv2.append(chatIdDiv).append(bubbleDiv).append(spanDiv);
	
	rowDiv.append(colDiv).append(colDiv2);
	messageDiv.append(rowDiv);
	
	chatContainer.append(messageDiv);
	chatContainer.scrollTop(chatContainer.prop('scrollHeight'));
}
	
function displayMyMessage(currentTime, message) {
	var chatContainer = $('#chat-container');
	
	var messageDiv = $('<div>');
	messageDiv.attr('id', 'bubble1');
	
	var spanDiv = $('<span>').html(currentTime + '&nbsp;');
	spanDiv.attr('id', 'chattime');
	
	var bubbleDiv = $('<div>').html(message);
	bubbleDiv.attr('id', 'send-bubble');
	
	messageDiv.append(spanDiv).append(bubbleDiv);
	
	chatContainer.append(messageDiv);
	chatContainer.scrollTop(chatContainer.prop('scrollHeight'));
}

function displayPreviousMessage() {
	/* 이 부분도 MessageVO에 맞게 수정해야함 */
	var chatList = [ 
			<c:forEach var="chat" items="${chatList}"> 
			{ 
				chattingId: ${chat.chattingId},
				gatheringId: ${chat.gatheringId},
				membersId: ${chat.membersId},
				message: '${chat.message}',
				nickName: '${chat.nickName}',
				sendDate: formatTime('${chat.sendDate}'),
				avatarPath: '/security/avatar/sm/' + ${chat.membersId}
			}, 
			</c:forEach> 
		];
	
	displayDate();
	
	/* 이 부분 수정해야함! */
	$.each(chatList, function(index, item) {

		var decodeMessage = decodeURIComponent(escape(atob(item.message)));
		
		if (item.nickName == principalName) {
			displayMyMessage(item.sendDate, decodeMessage);
		}
		else {
			displayOtherMessage(item.nickName, item.sendDate, decodeMessage, item.avatarPath);
		}	
	});
}

function displayDate() {
	let currentDate = new Date();
	let dateString = currentDate.toLocaleDateString('ko-KR', { year: 'numeric', month: 'long', day: 'numeric'});
	
	if (dateString !== previousDate) { 
		previousDate = dateString; 
		
		var container = $('#chat-container');
		var Div = $('<div>').addClass('monthdate mx-auto').text(previousDate);
		
		container.append(Div);

	}
}

function getCurrentTime(sendTime) {	
    let options = { hour: 'numeric', minute: 'numeric', hour12: true };

    // LocalDateTime 객체를 JavaScript Date 객체로 변환
    let date = new Date(sendTime.year, sendTime.monthValue - 1, sendTime.dayOfMonth, sendTime.hour, sendTime.minute, sendTime.second);

    // 변환된 JavaScript Date 객체를 문자열로 포맷팅
    let formattedDate = date.toLocaleString('ko-KR', options);

    return formattedDate;
}

function formatTime(sendDate) {
	moment.locale('ko');
	let momentObj = moment(sendDate);
	
	let fmtTime = momentObj.format("A h:mm");
	
    return fmtTime;
}

function convertNewlineToBr(text) {
	return text.replace(/\n/g, '<br>');
}

$(document).ready(function(e) {
	connect();
	
	$('#sendButton').click(function() {
		sendMessage();
	})
	
	$('#inputbox').keypress(function(e) {
		if(e.which === 13) { 
			if(!e.shiftKey) {
				e.preventDefault();
				sendMessage(); 
			}
		}
	})
	
	$('.list-title').on('click', function(e) {
		var test = $(this).attr('data-value');
		
		let f = document.createElement('form');

		let gatherIdObj;
		gatherIdObj = document.createElement('input');
		gatherIdObj.setAttribute('type', 'hidden');
		gatherIdObj.setAttribute('name', 'gatheringId');
		gatherIdObj.setAttribute('value', test);
		
		let CSRFToken;
		CSRFToken = document.createElement('input');
		CSRFToken.setAttribute('type', 'hidden');
		CSRFToken.setAttribute('name', '${_csrf.parameterName}');
		CSRFToken.setAttribute('value', '${_csrf.token}');
		
		console.log(${gather.gatheringId});
		
		f.appendChild(gatherIdObj);
		f.appendChild(CSRFToken);
		f.setAttribute('method', 'post');
		f.setAttribute('action', '../chat');
		document.body.appendChild(f);
		f.submit();
	
	})
})
</script>

<%@ include file="../layouts/footer.jsp"%>
