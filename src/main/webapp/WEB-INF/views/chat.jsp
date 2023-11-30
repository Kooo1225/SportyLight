<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ include file="layouts/homeHeader.jsp" %>

<style>
    .chat-container {
        display: flex;
        flex-direction: column;
    }

    .sender {
        font-weight: bold;
        margin-right: 10px;
    }

    .content {
        background-color: #e6e6e6;
        padding: 10px;
        border-radius: 10px;
    }
    
	.my-message {
	    align-self: flex-end;
	    background-color: #DCF8C6; /* 내 채팅 배경색 */
	}
	
	.other-message {
	    align-self: flex-start;
	    background-color: #E5E5EA; /* 상대방 채팅 배경색 */
	}
</style>

<div id="chat-container"></div>

<textarea id="messageInput" placeholder="Type your message"></textarea>
<button id="sendButton">Send</button>

<c:forEach var="chatList" items="${chattingList}">
	<a class="chatList" href="#" data-value="${chatList.gatheringId}">${chatList.title}</a>
</c:forEach>

<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.0/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<script>
var stompClient = null;
var principalName = '${customUser.getNickName()}';
let previousDate = null;

function connect() {
	const socket = new SockJS("/endpoint");
	stompClient = Stomp.over(socket);
	
	stompClient.connect({}, function(frame) {	
		
		displayPreviousMessage();
		
		stompClient.subscribe('/subscribe/message/' + ${gatheringId}, function(response) {
			
			var message = JSON.parse(response.body);
			console.log(message.sendDate);
			var currentTime = getCurrentTime(message.sendDate);
			
			var msg = message.message + currentTime + message.avatarPath;
			
 			if (message.nickName == principalName) {
				displayMyMessage(message.nickName, msg);
			}
			else {
				displayOtherMessage(message.nickName, msg);
			}
			
		})
	})
	
}

function sendMessage() {
	var messageInput = $('#messageInput');
	var messageContent = messageInput.val();
		
	if(messageContent != '') {
		stompClient.send('/app/gatherChat/' + ${gatheringId}, {}, JSON.stringify( 
						{ 
							gatheringId: ${gatheringId},
							membersId: ${customUser.getMembersId()},
							message: messageContent,
							nickName: principalName,
							avatarPath: '${customUser.getAvatarPath()}'
						}));
		messageInput.empty();
	}
}
	
function displayOtherMessage(sender, content) {
	var chatContainer = $('#chat-container');
	var messageDiv = $('<div>').addClass('other-message');
	var senderDiv = $('<div>').addClass('sender').text(sender + ':');
	var contentDiv = $('<div>').addClass('content').text(content);
	
	messageDiv.append(senderDiv).append(contentDiv);
	chatContainer.append(messageDiv);
	chatContainer.scrollTop(chatContainer.prop('scrollHeight'));
}
	
function displayMyMessage(sender, content) {
	var chatContainer = $('#chat-container');
	var messageDiv = $('<div>').addClass('my-message');
	var senderDiv = $('<div>').addClass('sender').text(sender + ':');
	var contentDiv = $('<div>').addClass('content').text(content);
	
	messageDiv.append(senderDiv).append(contentDiv);
	chatContainer.append(messageDiv);
	chatContainer.scrollTop(chatContainer.prop('scrollHeight'));
}

function displayPreviousMessage() {
	/* 이 부분도 MessageVO에 맞게 수정해야함 */
	var chatList = [ 
			<c:forEach var="chat" items="${chatList}"> 
			{ 
				gatheringId: ${chat.gatheringId},
				membersId: ${chat.membersId},
				message: '${chat.message}',
				nickName: '${chat.nickName}',
				sendDate: formatTime('${chat.sendDate}'),
				avatarPath: '${chat.avatarPath}'
			}, 
			</c:forEach> 
		];
	
	displayDate();
	
	/* 이 부분 수정해야함! */
	$.each(chatList, function(index, item) {
		var msg = item.message + item.sendDate + item.avatarPath;
		
		if (item.nickName == principalName) {
			displayMyMessage(item.nickName, msg);
		}
		else {
			displayOtherMessage(item.nickName, msg);
		}	
	});
}

function displayDate() {
	let currentDate = new Date();
	let dateString = currentDate.toLocaleDateString('ko-KR', { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric'});
	
	if (dateString !== previousDate) { 
		previousDate = dateString; 
		
		displayMyMessage('테스트', previousDate);
	}
}

function getCurrentTime(sendTime) {	
    let options = { hour: 'numeric', minute: 'numeric', hour12: false };

    // LocalDateTime 객체를 JavaScript Date 객체로 변환
    let date = new Date(sendTime.year, sendTime.monthValue - 1, sendTime.dayOfMonth, sendTime.hour, sendTime.minute, sendTime.second);

    // 변환된 JavaScript Date 객체를 문자열로 포맷팅
    let formattedDate = date.toLocaleString('ko-KR', options);

    return formattedDate;
}

function formatTime(sendDate) {
	let date = new Date(sendDate);
	
    // 시간과 분을 가져옴
    let hours = date.getHours();
    let minutes = date.getMinutes();

    // 한 자리 숫자일 경우 앞에 0을 붙임
    let formattedHours = (hours < 10 ? '0' : '') + hours;
    let formattedMinutes = (minutes < 10 ? '0' : '') + minutes;

    let fmtTime = formattedHours + ':' + formattedMinutes;

    // 시간과 분을 조합하여 반환
    return fmtTime;
}

$(document).ready(function() {
	connect();
	setInterval(displayDate, 5000);
	
	$('#sendButton').click(function() {
		sendMessage();
	});
	
	$('#messageInput').keypress(function(e) {
		if(e.which === 13) {
			sendMessage();
		}
	});
	
	$('.chatList').on('click', function(e) {
		var test = $(this).attr('data-value');
		
		let f = document.createElement('form');

		let gatherIdObj;
		gatherIdObj = document.createElement('input');
		gatherIdObj.setAttribute('type', 'hidden');
		gatherIdObj.setAttribute('name', 'gatheringId');
		gatherIdObj.setAttribute('value', ${gather.gatheringId});
		
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
});

</script>

</body>


</html>