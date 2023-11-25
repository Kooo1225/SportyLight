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

<div id="chat-container">
</div>

<textarea id="messageInput" placeholder="Type your message"></textarea>
<button id="sendButton">Send</button>

<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.0/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<script>
var stompClient = null;
var principalName = '${principalName}';
console.log(principalName);

function connect() {
	const socket = new SockJS("/endpoint");
	stompClient = Stomp.over(socket);
	

	var chatList = [ 
			<c:forEach var="chat" items="${chatList}"> 
			{ 
				sender: '${chat.nickName}', 
				msg: '${chat.message}'
			}, 
			</c:forEach> 
		];
	
	$.each(chatList, function(index, item) {
		if (item.sender == principalName) {
			displayMyMessage(item.sender, item.msg);
		}
		else {
			displayOtherMessage(item.sender, item.msg);
		}	
	});
	
	stompClient.connect({}, function(frame) {		
		stompClient.subscribe('/subscribe/message/room1', function(response) {
			console.log(response.body);
			var message = JSON.parse(response.body);
			
			console.log(message);
			
			if (message.sender == principalName) {
				displayMyMessage(message.sender, message.content);
			}
			else {
				displayOtherMessage(message.sender, message.content);
			}
			
		})
	})
	
}

function sendMessage() {
	var messageInput = $('#messageInput');
	var messageContent = messageInput.val();
	
	console.log('messageContent: ' + messageContent);
	console.log('messageSender: ' + principalName);
	
	if(messageContent != '') {
		stompClient.send('/app/hello/room1', {}, JSON.stringify( { sender: principalName, content: messageContent }));
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


$(document).ready(function() {
	connect();
	
	$('#sendButton').click(function() {
		sendMessage();
	});
	
	$('#messageInput').keypress(function(e) {
		if(e.which === 13) {
			sendMessage();
		}
	});
});

</script>

</body>


</html>