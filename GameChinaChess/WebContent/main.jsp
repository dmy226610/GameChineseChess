<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page language="java" import="java.util.ArrayList"%>
<%@ page language="java" import="model.Bean.Account"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Sign Up Here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Estonia&display=swap" rel="stylesheet">
<style type="text/css">
.background {
	position: fixed;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	background-image:
		url("https://scontent.fdad3-3.fna.fbcdn.net/v/t1.15752-9/248722751_2933656020233295_6051376296257673518_n.png?_nc_cat=100&ccb=1-5&_nc_sid=ae9488&_nc_ohc=OHewDjeb4m0AX8sQKtM&tn=ycmvCxTGjLLS2sCC&_nc_ht=scontent.fdad3-3.fna&oh=e43c7c37e6434cc8d29bf8f64d8688cf&oe=61A476AD");
	background-size: cover;
}

.im1 {
	position: fixed;
	top: 0;
	right: 0;
	bottom: 0;
	left: 14%;
	background-image:
		url("https://scontent.fdad3-3.fna.fbcdn.net/v/t1.15752-9/257849596_219992213588240_2952717234318699934_n.png?_nc_cat=111&ccb=1-5&_nc_sid=ae9488&_nc_ohc=znxa5kseSYEAX8v81Ui&_nc_ht=scontent.fdad3-3.fna&oh=771b7b42a318e5835b2ff9c4d2579cf9&oe=61BE767E");
	background-size: cover;
}

body {
	font: normal 14px/1.4 "Helvetica Neue", "HelveticaNeue", Helvetica,
		Arial, sans-serif;
}

div {
	display: block;
}

a {
	text-decoration: none;
	opacity: 1;
	color: #fff;
}

input, button {
	outline: none;
}

::-moz-focus-inner {
	border: 0px;
}

.login_header {
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
}

.container {
	position: relative;
	top: 4%;
	margin: 0 auto;
}

.container1 {
	position: relative;
	margin-top: 50%;
	margin: 0 auto;
}

.container2 {
	margin-top: 40%;
	margin-right: 30%; position : relative;
	top: 40%;
	margin: 0 auto;
	position: relative;
}

#logo {
	margin-top: 70px;
	margin-left: 0px;
	margin-bottom: 20px;
	position: relative;
	display: block;
	text-align: center;
	font-weight: bold;
	font-size: 120px;
	color:#FF0000;
	height: 100%;
	font-family: 'Estonia', cursive;
}

#subheading {
	position: relative;
	width: 517px;
	left: 50%;
	margin: 10px 0 -25px -258px;
	font-size: 25px;
	font-weight: normal;
	color:#FF0000;
	text-align: center;
}

.signup_forms {
	width: 260px;
	height: 145px;
}

.signup_forms_container {
	width: 260px;
	overflow: hidden;
	background: #fff;
	border-radius: 3px;
}

.form_user, .form_password {
	width: 260px;
	height: 45px;
	margin: 0px;
	padding: 0px;
	border: 0px;
}

.form_password {
	border-top: 1px solid #e3e3e3;
}

.signup_forms input {
	padding: 11px 10px 11px 13px;
	width: 100%;
	margin: 0px;
	background: 0;
	font: 16px/1.4 "Liberation Sans", "Liberation Sans";
	border: 0px;
}

#signup_forms_submit {
	margin-top: 6%;
	margin-left: 26%;
	margin-bottom: 20px;
	width: 150px;
	height: 150px;
	font-size: 30px;
	font:Roboto;
	background-image:url("https://scontent.fdad3-3.fna.fbcdn.net/v/t1.15752-9/258851303_1051453565617719_4379487719396426626_n.png?_nc_cat=109&ccb=1-5&_nc_sid=ae9488&_nc_ohc=JY9SYBGoEYgAX-UJx5M&_nc_ht=scontent.fdad3-3.fna&oh=c7d36a29a82b72c1d9d308c1833b3ded&oe=61BED8A8");
	background-size: cover;
	border-radius: 100%;
	color:#FF0000;
	background-color: Transparent;
    background-repeat:no-repeat;
    border: none;
    cursor:pointer;
    overflow: hidden;
    outline:none;
    font-family: 'Lobster', cursive;
}
#signup_forms_submit:active{
    transform:translate(0,4px);
    box-shadow:0 4px gray;  
}

#history {
	margin-left: 700px;
	width: 85px;
	height: 40px;
	font-size: 20px;
	 text-align:center;
	background:#954121;
	border: 3px solid #3f1606;
	border-radius: 6px;
	cursor: pointer;
	font-family: 'Praise', cursive;
}
#history:active{
    transform:translate(0,4px);
    box-shadow:0 4px gray;  
}


#logout {
	margin-left: 630px;
	width: 100px;
	height: 40px;
	font-size: 20px;
	background:#954121;
	border: 3px solid #3f1606;
	border-radius: 45%;
	cursor: pointer;
	font-family: 'Praise', cursive;
}
#logout:active{
    transform:translate(0,4px);
    box-shadow:0 4px gray;  
}

.name {
	margin-top: 20px;
	margin-left: 130px;
	left: 30px;
	width: 260px;
	height: 45px;
	font-size: 30px;
	color: black;
	background:;
	border: 0px;
	border-radius: 3px;
	cursor: pointer;
	font-family: 'Estonia', cursive;
	line-height: 28px;
}


#signup_forms_submit span {
	color: #fff;
	font: "Helvetica Neue", Arial, Helvetica, sans-serif;
	font-size: 16px;
}

.footer_signup_link {
	position: absolute;
	width: 141px;
	height: 78px;
	bottom: 0;
	padding: 0 20px;
	margin: 0 0 13px 0;
	line-height: 25px;
	text-align: center;
	opacity: 1;
	color: #fff;
}

.signup_link {
	display: block;
	height: 45px;
	padding: 0 10px;
	margin: 0 0 8px 0;
	font-size: 16px;
	font-weight: bold;
	line-height: 45px;
	border: 0;
	border-radius: 2px;
	color: #fff;
	background: rgba(255, 255, 255, 0.33);
}

.link {
	font-size: 14px;
	padding-right: 5px;
	margin-right: 12px;
	color: #fff;
}

.design_show {
	position: fixed;
	bottom: 0;
	right: 0;
	padding: 0 12px;
	margin: 0 0 13px 0;
	line-height: 25px;
}

.designer_info {
	position: relative;
	color: #FFFFFF;
}

#face {
	margin: 0 0 0 10px;
	vertical-align: middle;
	border-radius: 20px;
	padding: 0;
	height: 24px;
	width: 24px;
}
</style>

</head>
<script src="js/websocket.js"></script>
<body>


	<div class="background">
		<div class="container">
			<div class="im1">
				<div class="name">
				<form><button type="submit" value="history" id="history">
						<strong>History</strong>
					</button></form>
                <% Account account=(Account)request.getSession().getAttribute("account");
					try{if(account==null){
						response.sendRedirect("Login.jsp"); 
					}}catch(Exception e){}
					try{if(account!=null){
					%>
				
					<label for="user" ><B><%=account.getUsername()%></B></label><br>
					<label for="user"><B>Rank:<%=account.getRank()%></B></label>
					<%}}catch(Exception e){} %>
				</div>
			</div>
			<div class="container1">
				<div class="form_header">
					<h1 id="logo">ChineseChess</h1>
					<h2 id="subheading">Welcome to play game!</h2>
				</div>
           <form action="Check_maingame" method="post">
				<div class="container2">
					<div>
					
					<button type="submit" value="Sign in" id="signup_forms_submit">
							<strong>WATCH</strong>
						</button>
                        
						<button type="submit" value="Sign in" id="signup_forms_submit">
							<strong>PLAY</strong>
						</button>
						
					</div>

				</div>
				</form>
				<div class="container2">
					<form action="CheckLogout" method="post">
						<button type="submit" value="logout" id="logout">
							<strong>Log out</strong>
						</button>
					</form>


				</div>

			</div>
		</div>
	</div>
</body>
</html>