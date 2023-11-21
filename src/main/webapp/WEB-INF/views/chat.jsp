<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="layouts/homeHeader.jsp" %>

<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.0/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<script>
$(document).ready(function(e) {
	$(function() {

		var sock = new SockJS("/endpoint");
		var client = Stomp.over(sock);
           
    });

})
</script>

</body>


</html>