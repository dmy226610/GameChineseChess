<%@page import="model.Bean.Account"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/bootstrap.css">
<title>Document</title>
<style>
.background {
	background-image:
		url("https://scontent.fdad3-3.fna.fbcdn.net/v/t1.15752-9/248722751_2933656020233295_6051376296257673518_n.png?_nc_cat=100&ccb=1-5&_nc_sid=ae9488&_nc_ohc=OHewDjeb4m0AX8sQKtM&tn=ycmvCxTGjLLS2sCC&_nc_ht=scontent.fdad3-3.fna&oh=e43c7c37e6434cc8d29bf8f64d8688cf&oe=61A476AD");
	width: 100%;
	height: 620px;
	background-position: center center;
	background-size: cover;
	background-repeat: no-repeat;
	background-attachment: fixed;
}

#logo {
	position: relative;
	display: block;
	text-align: center;
	font-weight: bold;
	font-size: 40px;
	color: white;
	height: 100%;
}

#subheading {
	position: relative;
	width: 517px;
	left: 50%;
	margin: 10px 0 16px -258px;
	font-size: 15px;
	font-weight: normal;
	color: #fff;
	text-align: center;
}

.form-group {
	width: 300px;
	height: 70px;
}

a {
	text-decoration: none;
	opacity: 1;
	color: white;
}
.container{
 width:24.99%;
}

.btn-primary {
	background: #1abc9c;
	padding: 0.7em 1.0em;
	font-size: 20px;
	margin: 5px;
	border: none;
	border-radius: 10px;
	//box-shadow: 0 9px gray;
	cursor: pointer;
	outline: none;
}

.btn-primary:active {
	transform: translate(0, 4px);
	box-shadow: 0 4px gray;
}
</style>
</head>

<body>

	<div class="background">
		<%
		Account account = (Account) request.getSession().getAttribute("account");
		try {
			if (account != null) {
				response.sendRedirect("main.jsp");
			}
		} catch (Exception e) {
		}

		String mess = (String) request.getAttribute("mess");
		if (mess != null) {
		%>
		<script>
     alert('<%=mess%>');
		</script>
		<%
		}
		%>
		
		<div class="container col-1" style="padding-top: 150px;">
        <div class="form_header">
			<h1 id="logo">ChineseChess</h1>
			<h2 id="subheading">Login here to join the game!</h2>
		 </div>
			<form action="CheckLogin" method="post">
				<div class="form-group">
					<label for="user"><B>Username:</B></label> <input type="text"
						class="form-control" name="username" placeholder="Enter username"
						id="username">
				</div>
				<div class="form-group">
					<label for="pwd"><B>Password:</B></label> <input type="password"
						class="form-control" name="password" placeholder="Enter password"
						id="pwd">
				</div>
				<div class="form-group form-check">
					<label class="form-check-label"> <input
						class="form-check-input" type="checkbox"> <B>Remember
							me</B>
					</label>
				</div>
				<div class=" align-items-center" style ="display:flex;">
					<button type="submit" class="btn-primary" name="login">Login</button>
					<button type="button" class="btn-primary" name="register">
						<A HREF="Signin.jsp">Register</A>
					</button>
				</div>
			</form>

		</div>
	</div>

</body>

</html>