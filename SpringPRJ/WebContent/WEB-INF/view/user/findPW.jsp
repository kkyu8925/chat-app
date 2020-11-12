<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
  <head>
    <link rel="stylesheet" href="/css/screens/login.css">
    <link rel="stylesheet" href="/css/components/no-mobile.css">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Sign in</title>
  </head>
  <body>

    <div class="form">
     	 <form action="/user/findPasswordProc.do" method="post" id="login-form">
	          <div class="text-input">
	            <label for="username">Username</label>
	            <input type="text" name="user_name" />
	            <span class="separator"> </span>
	          </div>
	          
	          <div class="text-input">
	            <label for="username">Email</label>
	            <input type="email" name="user_email" id="user_email"/>
	            <span class="separator"> </span>
	          </div>  
	        
	          <div class="form-bottom">
	            <input type="submit" value="다음"  />
	            <input type="button" value="이전" onClick="location.href='/index.do'" />
	          </div>
    	</form>  
	</div>

    <div id="no-mobile">
      <span>Your screen is too big</span>
    </div>

  </body>
</html>