<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page language="java" import="java.util.ArrayList"%>
<%@ page language="java" import="model.Bean.Account"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>HTML5</title>
<link href="css/zzsc.css" type="text/css" rel="stylesheet" />
<link href="css/bootstrap.min.css" type="text/css" rel="stylesheet" />
<style>
.im1 {
	position: fixed;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	background-image:
		url("https://scontent.fdad3-3.fna.fbcdn.net/v/t1.15752-9/257849596_219992213588240_2952717234318699934_n.png?_nc_cat=111&ccb=1-5&_nc_sid=ae9488&_nc_ohc=znxa5kseSYEAX8v81Ui&_nc_ht=scontent.fdad3-3.fna&oh=771b7b42a318e5835b2ff9c4d2579cf9&oe=61BE767E");
	background-size: cover;
}
.container {
	position: relative;
	top: 4%;
	margin: 0 auto;
}
.name {
	margin-top: 20px;
	margin-left: 140px;
	margin-bottom: -60px;
	font-size: 30px;
	color: white;
	background:;
	border: 0px;
	border-radius: 3px;
	cursor: pointer;
	font-family: 'Estonia', cursive;
	line-height: 28px;
}
.user{
  
  display: block;
  background-color: gray;
  color: black;
  border: none;
}

</style>
</head>

<body>
<div class="container">
			<div class="im1">
				<div class="name">
					<%
					Account account=(Account)request.getSession().getAttribute("account");
					try{if(account==null){
						response.sendRedirect("Login.jsp"); 
					}}catch(Exception e){}
					try{if(account!=null){
					%>
					<label for="user"><B><%=account.getUsername()%></B></label><br>
					<label for="user"><B>Rank:<%=account.getRank()%></B></label>
					<%}}catch(Exception e){} %>
				</div>
			
<div class="box" id="box">
	<div class="chess_left">
		<canvas id="chess">Game</canvas>
		<audio src="audio/click.wav" id="clickAudio" preload="auto"></audio>
		<audio src="audio/select.wav" id="selectAudio" preload="auto"></audio>
		<div>
			<div class="bn_box" id="bnBox">
				<input type="button" class='btn' name="offensivePlay" id="tyroPlay" value="Ready" />
				<input type="button" class='btn' name="Rank" onclick="Rank()" value="Rank" />
			</div>
		</div>
	</div>
</div>
<h2><font color='#ffffff'>ChatRoom</font></h2>
<%try{%>:
	<input type="text" value='<%=account.getUsername()%>' class="form-inline" id="user" readonly="readonly"/>
<% }catch(Exception e1){} %>

<textarea id="textAreaMessage" style="border:1px solid #cccccc; background-color:#ffffff; width:400px; height:400px; overflow:scroll; " readonly="readonly"></textarea>
<br>
<br>
<font color='#ffffff' size="3px">&nbsp;Input:&nbsp;</font>
<input type="text" value='' class="form-inline"id="textMessage"/>
<input type="button" class="btn" id="send" onClick="sendMessage()" value="send"/>
</div>
		<script type="text/javascript">
			var websocket = new WebSocket("ws://localhost:8081/websocketdemo/chatRoomServer");
				websocket.onopen = function(message) {processOpen(message);};
				websocket.onmessage = function(message) {processMessage(message);};
				websocket.onclose = function(message) {processClose(message);};
				websocket.onerror = function(message) {processError(message);};

			function processOpen(message) {
				textAreaMessage.value += "";
			}
			function processMessage(message) {
				console.log(message);
				textAreaMessage.value += message.data + " \n";
			}
			function processClose(message) {
				textAreaMessage.value += "Server Disconnect... \n";
			}
			function processError(message) {
				textAreaMessage.value += "Error... " + message +" \n";
			}
			var i=1;
			function sendMessage() {
				
				if (typeof websocket != 'undefined' && websocket.readyState == WebSocket.OPEN) {
					if(i==1){
					websocket.send(user.value  );
					i++}
					websocket.send( textMessage.value );
					textMessage.value = "";
					
				}
			}
		</script>
<script src="common.js"></script> 
<script src="play.js"></script> 
</body>
</html>