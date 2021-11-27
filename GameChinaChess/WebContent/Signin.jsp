<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html >
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Sign Up Here</title>
  
    <style type="text/css">
    .background {
    position: fixed;
			top: 0;
			right: 0;
			bottom: 0;
			left: 0;
			 background-image: url("https://scontent.fdad3-3.fna.fbcdn.net/v/t1.15752-9/248722751_2933656020233295_6051376296257673518_n.png?_nc_cat=100&ccb=1-5&_nc_sid=ae9488&_nc_ohc=OHewDjeb4m0AX8sQKtM&tn=ycmvCxTGjLLS2sCC&_nc_ht=scontent.fdad3-3.fna&oh=e43c7c37e6434cc8d29bf8f64d8688cf&oe=61A476AD");
			background-size: cover;
        }
    
		body
		{
			font: normal 14px/1.4 "Helvetica Neue","HelveticaNeue",Helvetica,Arial,sans-serif;
		}
		div
		{
			display:block;
		}
		a
		{
			text-decoration:none;
			opacity: 1;
			color: #fff;
		 }
		 input,button{ outline:none; }
		::-moz-focus-inner{border:0px;}   /*ȥ����ť���ʱ���ֵ����߱߿�*/
        
		.login_header {
			position:absolute;
			top:0;
			left:0;
			right:0;
			}
		.container {
			position:relative;
			top:20%;
			margin: 0 auto;
			width: 260px;
			}
		#logo
		{
			position:relative;
			display: block;
			text-align: center;
			font-weight: bold;
			font-size: 40px;
			color: white;
			height: 100%;
		}
		#subheading 
		{
		  position: relative;
		  width: 517px;
		  left: 50%;
		  margin: 10px 0 16px -258px;
		  font-size: 15px;
		  font-weight: normal;
		  color: #fff;
		  text-align: center;
		}
		.signup_forms
		{
			width:260px;
			height:145px;	
		}
		.signup_forms_container
		{
			width:260px;
			
			overflow: hidden;
			background: #fff;
			border-radius:3px;	
		}
		.form_user,.form_password
		{
			width:260px;
			height:45px;
			margin:0px;
        	padding:0px;
			border:0px;	
		}
		.form_password{border-top: 1px solid #e3e3e3;}
		.signup_forms input
		{
			padding: 11px 10px 11px 13px;
			width: 100%;
			margin:0px;
        	background: 0;
			font: 16px/1.4 "Helvetica Neue","HelveticaNeue",Helvetica,Arial,sans-serif;
			border:0px;	
		}
		#signup_forms_submit{
		  margin-top:8px;		
		  width:260px;
		  height:45px;
		  background:#529ECC;
		  border:0px;
		  border-radius:3px;
		  cursor:pointer;       
		 }
		 #signup_forms_submit span
		 {
			 color: #fff;
			 font: "Helvetica Neue",Arial,Helvetica,sans-serif;
			 font-size:16px;
		}
		.footer
		 {
			position: fixed;
			top: auto;
			right: 0;
			bottom: 0;
			left: 0;
		 }
		 .footer_signup_link
		 {
			 position: absolute;
			 width:141px;
			 height:78px;
			 bottom: 0;
			 padding: 0 20px;
			 margin: 0 0 13px 0;
			 line-height: 25px;
			 text-align: center;
			 opacity: 1;
			 color: #fff;
		 }
		 .signup_link
		 {
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
              background: rgba(255,255,255,0.33);
		}
		.link
		{
			font-size: 14px;
			padding-right: 5px;
			margin-right: 12px;
			color: #fff;
		}
		.design_show
		{
			position: fixed;
			bottom: 0;
			right: 0;
			padding: 0 12px;
			margin: 0 0 13px 0;
			line-height: 25px;
		}
		.designer_info
		{
			position: relative;
			color: #FFFFFF;
		}
		#face
		{
			margin: 0 0 0 10px;
			vertical-align: middle;
			border-radius:20px;
			padding: 0;
			height: 24px;
			width: 24px;
		}
    </style>

</head>
<script src="js/websocket.js"></script>
<body>
<%String mess = (String)request.getAttribute("mess"); 
    if(mess!=null){%>
    	<script>
     alert('<%=mess%>');
        </script>
   <%} %> 
    <div class="background">
    <div class="login_header">
    	<span></span>
    </div>
    
    <div class="container">
    	<div class="form_header">
        	<h1 id="logo">ChineseChess</h1>
        	<h2 id="subheading">Login here to join the game!</h2>
        </div>
        <form action="CheckSignin" method="post">
        <div class="signup_forms" class="signup_forms">
            	<div id="signup_forms_container" class="signup_forms_container">

                        	<div class="signup_account" id="signup_account">
                                <div class="form_username">
           							<input type="text" name="Susername" placeholder="Username" id="username">
        						</div>
                                <div class="form_password">
           							<input type="password" name="Spassword" placeholder="Password" id="password">
        						</div>
        						<div class="form_confirm_password">
           							<input type="password"  name="Spasswordc"placeholder="Confirm the password" id="confirm">
        						</div>
                            </div>
                            <div class="form_user">	
        							<input type="text" name="gmail" placeholder="gmail" id="Gmail">
                            </div>
                        	</div>
               					 <button type="submit" value = "Sign in" id="signup_forms_submit"><strong>Sign in</strong></button>
            				</div>
                    </form>
                  		   
    			</div>
    	</div>
    <div class="footer">
        <div class="design_show">
        	<div class="designer_info">
            	<a href="#"><strong>PBL4</strong></a>
            </div>
        </div>
    </div>   
</body>
</html>