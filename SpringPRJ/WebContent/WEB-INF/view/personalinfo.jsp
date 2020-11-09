<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
  	<script src="https://kit.fontawesome.com/54d6336788.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="../css/styles.css" />
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Personal-info</title>
    <style>
    	.settings__setting:hover {
    		background-color: #f9f9fa;
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
        <h1 class="alt-header__title">Settings</h1>
      </div>
      <div class="alt-header__column">
        <span><i class="fas fa-home fa-2x" onclick="location.href='/friends.do'"></i></span>
      </div>
    </header>

    <main class="main-screen">
      <ul class="settings-list">
      	<a href="#">
	        <li class="settings__setting">
	          <div class="settings__setting-column">
	            <i class="far fa-id-card"></i>
	            <span>image</span>
	          </div>
	          <div class="settings__setting-column">
	          	
	          </div>
	        </li>
        </a>
   
      </ul>
    </main>

    <div id="no-mobile">
      <span>Your screen is too big</span>
    </div>
    
   	<!-- 로그인 확인 체크 페이지 -->
	<%@include file="/WEB-INF/view/include/logincheck.jsp" %>
	
  </body>
</html>
