<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
  <head>
    <link rel="stylesheet" href="../css/styles.css" />
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Sign in</title>
    <style>
      body{
        height: 100%;
      }
      #log-messages {
      	font-size:13px;
      	margin-bottom: 3px;
      }
    </style>
  </head>
  <body>
    
    <header class="welcome-header">
      <h1 class="welcome-header__title">Sign in</h1>
    </header>

    <form action="#" method="post" id="login-form">
    	<input type="text" placeholder="이름"/> 
    	<input type="email" placeholder="이메일 주소"/>
		<input type="password" placeholder="비밀번호"/>
		<div id="log-messages">문자,숫자,기호를 조합하여 8자 이상을 사용하세요</div>
		<input type="password" placeholder="비밀번호 확인"/>
		<input type="submit" value="다음"/>
    </form>

    <div id="no-mobile">
      <span>Your screen is too big</span>
    </div>

    <script src="https://kit.fontawesome.com/6478f529f2.js" crossorigin="anonymous"></script>
  </body>
</html>