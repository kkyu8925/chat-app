<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String SS_USER_NAME = (String)session.getAttribute("SS_USER_NAME");
	String SS_USER_NO = (String)session.getAttribute("SS_USER_NO");
%>    
<!DOCTYPE html>
<html lang="en">
  <head>
  	<script src="/js/fontawesome.js"></script>
    <link rel="stylesheet" href="/css/styles.css" />
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Account</title>
    <style>
    	.settings__setting-hover:hover {
    		background-color: #f9f9fa;
    		cursor:pointer;
    	}
    	
    	.settings__setting i {
    		margin-left:10px;
    	}
    	
    	.personal-text{
    		font-size:18px;
    		opacity: 0.5;
    	}
    	
    	.personal-text-email {
    		margin-right: 43px;
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
        <h1 class="alt-header__title">Account</h1>
      </div>
      <div class="alt-header__column">
        <span><i class="fas fa-home fa-2x" onclick="location.href='/friends.do'"></i></span>
      </div>
    </header>

    <main class="main-screen">
      <ul class="settings-list">
	  	<li class="settings__setting settings__setting-hover">
	    	<div class="settings__setting-column">
	        	<img src="../img/basic.gif" class="user-component__avatar user-component__avatar--sm"/>
	    	</div>
	        <div class="settings__setting-column">
	          	<i class="fas fa-angle-right"></i>
	    	</div>
	  	</li>
	  	
		  	<li class="settings__setting">
		    	<div class="settings__setting-column">
		        	<span>Email</span>
		    	</div>
		        <div class="settings__setting-column">
		        	<span class="personal-text personal-text-email">email@email.com</span>
		    	</div>
		  	</li>	 
	  	
	  	<a href="/user/chgName.do">
		  	<li class="settings__setting settings__setting-hover">
		    	<div class="settings__setting-column">
		        	<span>Name</span>
		    	</div>
		        <div class="settings__setting-column">
		        	<span class="personal-text"><%=SS_USER_NAME %></span>
		          	<i class="fas fa-angle-right"></i>
		    	</div>
		  	</li>
	  	</a>
		
		<a href="/user/chgPW.do">
		  	<li class="settings__setting settings__setting-hover">
		    	<div class="settings__setting-column">
		        	<span>Password</span>
		    	</div>
		        <div class="settings__setting-column">
		          	<i class="fas fa-angle-right"></i>
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
