<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
	<script src="/js/fontawesome.js"></script>  
    <link rel="stylesheet" href="/css/styles.css" />
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Settings</title>
    <style>
    	.settings__setting:hover {
    		background-color: #f9f9fa;
    	}
    	
    	#non-hover:hover {
    		background-color: white;
    	}
    </style>
  </head>
  <body>

    <header class="alt-header">
      <div class="alt-header__column">
        <a href="/friends.do">
          <i class="fas fa-angle-left fa-3x"></i>
        </a>
      </div>
      <div class="alt-header__column">
        <h1 class="alt-header__title">Settings</h1>
      </div>
      <div class="alt-header__column">
        <span><!-- <i class="fas fa-search fa-lg" style="cursor:pointer"></i> --></span>
      </div>
    </header>

    <main class="main-screen">
      <ul class="settings-list">
      	<a href="/user/account.do">
	        <li class="settings__setting">
	          <div class="settings__setting-column">
	            <i class="far fa-id-card"></i>
	            <span>Personal Info</span>
	          </div>
	          <div class="settings__setting-column">
	          	<i class="fas fa-angle-right"></i>
	          </div>
	        </li>
        </a>
      	<a href="/notice.do">
	        <li class="settings__setting">
	          <div class="settings__setting-column">
	            <i class="fas fa-bullhorn"></i>
	            <span>Notices</span>
	          </div>
	          <div class="settings__setting-column">
	          	<i class="fas fa-angle-right"></i>
	          </div>
	        </li>
        </a>
        <li class="settings__setting" id="non-hover">
          <div class="settings__setting-column">
            <i class="fas fa-info-circle" style="cursor:default;"></i>
            <span>Version</span>
          </div>
          <div class="settings__setting-column" style="opacity:0.5;">Latest Version</div>
        </li>
        <li class="settings__setting" style="cursor:pointer;" onclick="LogOut();">
          <div class="settings__setting-column">
         	 <i class="fas fa-sign-out-alt"></i>
            <span>Log Out</span>
          </div>
        </li>
      </ul>
    </main>

    <div id="no-mobile">
      <span>Your screen is too big</span>
    </div>
    
   	<!-- 로그인 확인 체크 페이지 -->
	<%@include file="/WEB-INF/view/include/logincheck.jsp" %>
	
	<script>
	 	function LogOut(){
	 		location.href = "/user/userLogOut.do";
	 	}
	</script>
	
  </body>
</html>
