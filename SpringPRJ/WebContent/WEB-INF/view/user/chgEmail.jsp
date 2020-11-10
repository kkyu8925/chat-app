<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
  <head>
  	<script src="https://kit.fontawesome.com/54d6336788.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="../css/styles.css" />
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Sign in</title>
  </head>
  <body>

    <header class="welcome-header">
      <h1 class="welcome-header__title">Please enter a new email</h1>
    </header>

    <form action="/user/chgEmailProc.do" method="post" id="login-form">
      <input name="user_email" type="email" placeholder="Email" />
      <div class="find-password-container">
      	<div>
      		<input type="submit" value="전송" class="line-input"/>
      	</div>
      	<div>
      		<input type="button" value="이전" class="line-input" onClick="location.href='/personalinfo.do'"/>
     	 </div>
      </div>
    </form>

    <div id="no-mobile">
      <span>Your screen is too big</span>
    </div>
    
    <script>
    	
    </script>
	
  </body>
</html>