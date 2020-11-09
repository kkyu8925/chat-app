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
      <h1 class="welcome-header__title">Find your password</h1>
    </header>

    <form action="/user/findPasswordProc.do" method="post" id="login-form">
      <input name="user_email" type="email" placeholder="Email" />
      <input name="user_name" type="text" placeholder="Name" />
      <input type="submit" value="전송"/>
      <input type="button" value="이전" onClick="location.href='/index.do'"/>
    </form>

    <div id="no-mobile">
      <span>Your screen is too big</span>
    </div>
    
    <script>
    	
    </script>
	
  </body>
</html>