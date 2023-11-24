<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="layouts/homeHeader.jsp" %>

<style>
    #chat-container {
        max-width: 600px;
        margin: 0 auto;
        padding: 20px;
    }

    .message {
        display: flex;
        margin-bottom: 10px;
    }

    .message .sender {
        font-weight: bold;
        margin-right: 10px;
    }

    .message .content {
        background-color: #e6e6e6;
        padding: 10px;
        border-radius: 10px;
    }
</style>

<div id="chat-container"></div>

<textarea id="messageInput" placeholder="Type your message"></textarea>
<button id="sendButton">Send</button>

<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.0/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<script>
var stompClient = null;

function connect() {
	const socket = new SockJS("/endpoint");
	stompClient = Stomp.over(socket);
	
	stompClient.connect({}, function(frame) {
		console.log('Connected: ' + frame);
		stompClient.subscribe('/subscribe/message/room1', function(response) {
			console.log(response.body);
			var message = JSON.parse(response.body);
			displayMessage(message.sender, message.content);
		})
	})
	
}

	function sendMessage() {
		var messageInput = $('#messageInput');
		var messageContent = messageInput.val();
		
		console.log('messageContent: ' + messageContent);
		
		if(messageContent != '') {
			stompClient.send('/app/hello/room1', {}, JSON.stringify({ content: messageContent }));
			messageInput.empty();
		}
	}
	
	function displayMessage(sender, content) {
		var chatContainer = $('#chat-container');
		var messageDiv = $('<div>').addClass('message');
		var senderDiv = $('<div>').addClass('sender').text(sender + ':');
		var contentDiv = $('<div>').addClass('content').text(content);
		
		messageDiv.append(senderDiv).append(contentDiv);
		chatContainer.append(messageDiv);
		chatContainer.scrollTop(chatContainer.prop('scrollHeight'));
	}


$(document).ready(function() {
	connect();
	
	var testNickName = '${list.userName}';
	var testMsg = '${list.message}';
	
	displayMessage(testNickName, testMsg);
	
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