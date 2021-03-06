<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html>
  <head>
    <title>node-websocket-server test</title>
		<style type="text/css">
#rockbar {
	position: fixed;
	top: 0;
	left: 20px;
	background: #fff;
	padding: 0.5em;
	display: block;
}

#warning {
	padding: 1em;
	border: 2px solid red;
}
		</style>
  </head>
  <body>
		<p id="warning">
			<strong>WARNING:</strong> run the Spam Test at your own risk, see below for more information.<br /><br />
Spam Test: The spam test rapidly spends 1 million messages to the websocket-server at a near instant interval, as such, any browsers connected to the server at the time of a spam test may crash or freeze up. The websocket server should not crash, but this is not 100% guaranteed.<br/><br />
The author does not take responsibility for any damage or data loss caused.</p>
	  <div id="rockbar">
			<a href="#" id="send">Send Something</a> | <a href="#" id="spam">Run Spam Test</a> | <a href="#" id="close">Close Connection.</a> | <a href="#" id="open">Open Connection.</a>
		</div>
		<div id="log"></div>
    <script type="text/javascript">
var months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];

function pad(n) {
  return n < 10 ? '0' + n.toString(10) : n.toString(10);
}

function timestamp() {
  var d = new Date();
  return [
    d.getDate(),
    months[d.getMonth()],
    [ pad(d.getHours())
    , pad(d.getMinutes())
    , pad(d.getSeconds())
    , (d.getTime() + "").substr( - 4, 4)
    ].join(':')
  ].join(' ');
};


function scrollToBottom() {
    window.scrollBy(0, document.body.scrollHeight - document.body.scrollTop);
};

function log(data){
  output_log.innerHTML += timestamp()+": "+data+"<br />";
  scrollToBottom();
}


var conn, recvd, connections = 0;
var output_log = document.getElementById("log");
var connect = function() {
  if (window["WebSocket"]) {
    recvd = 0;
    //host = (document.location.host != "" ? document.location.host : "localhost:8000");
    host = "localhost:8000";
    conn = new WebSocket("ws://"+host+"/test");
    conn.onmessage = function(evt) {
      log(evt.data);

      // conn.close();
      // log(connections++);
      // connect();

      // if(recvd == 0){
      //   conn.id = parseInt(evt.data.match(/\: ([0-9]+)/)[1], 10);
      // }
      // recvd++;
    };
    
    conn.onerror = function() {
      log("error", arguments);
    };
    
    conn.onclose = function() {
      log("closed");
			conn = false;
    };

    conn.onopen = function() {
      log("opened");
    };
  }
};

document.getElementById("send").addEventListener("click", function(e) {
  if (conn) {
    setTimeout(function() {
      conn.send("test message");
      log("<"+conn.id+"> "+"test message");
    }, 0);
  }
  e.preventDefault();
  return false;
}, false);

document.getElementById("spam").addEventListener("click", function() {
  if (conn) {
    for (var i = 0; i < 100000; ++i) {
      (function(n) {
        setTimeout(function() {
          conn.send("t" + n);
          //log("<"+conn.id+"> "+"t "+n);
        }, 0);
      })(i);
    }
  }
  return false;
}, true);

document.getElementById("close").addEventListener("click", function(e) {
  if (conn) {
    conn.close();
    conn = false;
  }
  e.preventDefault();
  return false;
}, false);

document.getElementById("open").addEventListener("click", function(e) {
  if (!conn) {
    connect();
  }
  e.preventDefault();
  return false;
}, false);

window.onload = connect;

    </script>
  </body>
</html>