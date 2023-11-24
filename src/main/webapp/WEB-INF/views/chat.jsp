<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="layouts/homeHeader.jsp" %>

<div class=></div>

<input type="text" id="messageInput" placeholder="Type your message">
<button id="sendButton">Send</button>

<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.0/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<script>
$(document).ready(function() {
    const socket = new SockJS("/endpoint");
    const stompClient = Stomp.over(socket);

    stompClient.connect({}, function (frame) {
    	
        console.log('Connected ' + frame);

        // Subscribe to the destination, e.g., "/sub/message/room1"
        stompClient.subscribe('/subscribe/message/room1', function (response) {
            console.log('Received message: ' + response.body);
            
            var content = JSON.parse(response.body);
            
        });
    });

    $('#sendButton').click(function () {
        const messageInput = $('#messageInput');
        const message = messageInput.val();

        // Send message to the destination, e.g., "/app/hello/room1"
        stompClient.send('/app/hello/room1', {}, JSON.stringify({ content: message }));

        messageInput.val(''); // Clear input field after sending message
    });
});
</script>

</body>


</html>