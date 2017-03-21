<%@ page contentType="text/html; charset=utf-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WebScoketAPI</title>
</head>
<body>
<input type="text"  id='msg'/>
<button onclick='tosend()'>发送</button>
<button>退出</button>
<br>
<textarea id='mymess'></textarea>
</body>
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
    var ws = new WebSocket("ws://localhost:8080/springmvc_websocket/websocket"); 
    ws.onmessage = function(evt){
         console.log(evt.data);
         $("#mymess").append(evt.data+"<br>");
     }; 

     ws.onerror = function(evt){
         console.log("WebSocketError");
     };
    /*
     ws.onopen = function(){
         ws.send(msg); 
     }; 

     ws.onclose = function(evt){
         console.log("WebSocketClosed");
     }; 
     */
     function tosend(){
         var msg=$("#msg").val();
         $("#mymess").append(msg+"<br>");
         ws.send(msg);
     }
</script>
</html>