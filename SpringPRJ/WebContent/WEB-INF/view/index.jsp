<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
  <head>
  	<script src="https://kit.fontawesome.com/54d6336788.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="../css/styles.css" />
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Log in</title>
    <style>
    	body{
        	height: 100%;
      	}
      	.footer-box {
      		display:flex;
     		justify-content:center;
      		margin-top: 25px;
      	}
    </style>
  </head>
  <body>

    <header class="welcome-header">
      <h1 class="welcome-header__title">Welcome</h1>
    </header>

    <form action="/user/userLoginProc.do" method="post" id="login-form">
      <input name="user_email" type="text" placeholder="Email or phone number" />
      <input name="user_pw" type="password" placeholder="Password" />
      <input type="submit" value="Log In"/>
      <input type="button" value="Sign In" onClick="location.href='/user/userSignin.do'" style="cursor:pointer; background-color: #FFFFFF; border: 1.5px solid #4285F4; border-radius: 5px;">
      <a href="#">Find Account or Password</a>
    </form>

    <div id="no-mobile">
      <span>Your screen is too big</span>
    </div>
	
  </body>
</html>