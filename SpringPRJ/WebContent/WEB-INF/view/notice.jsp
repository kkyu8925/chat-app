<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
  	<script src="https://kit.fontawesome.com/54d6336788.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="../css/styles.css" />
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Settings</title>
    <style>
    	#home-icon {
    		font-size:25px;
    	}
    </style>
  </head>
  <body>

    <header class="alt-header">
      <div class="alt-header__column">
        <a href="/settings.do">
          <i class="fas fa-angle-left fa-3x"></i>
        </a>
      </div>
      <div class="alt-header__column">
        <h1 class="alt-header__title">Notice</h1>
      </div>
      <div class="alt-header__column">
      	<i class="fas fa-home" id="home-icon" onclick="location.href='/friends.do'"></i>
      </div>
    </header>

    <main class="main-screen">
        <div class="user-component">
          <div class="user-component__column">
            <div class="user-component__text">
              <h4 class="user-component__title">title</h4>
              <h6 class="user-component__subtitle">
               		이준우!!!!!
              </h6>
            </div>
          </div>
          <div class="user-component__column">
            <span class="user-component__time">21:22</span>
          </div>
        </div>
        
    </main>

    <div id="no-mobile">
      <span>Your screen is too big</span>
    </div>
    
   	<!-- 로그인 확인 체크 페이지 -->
	<%@include file="/WEB-INF/view/include/logincheck.jsp" %>
	
  </body>
</html>
