<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
  <head>
  	<script src="https://kit.fontawesome.com/54d6336788.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="../css/styles.css" />
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="google-signin-scope" content="profile email">
    <meta name="google-signin-client_id" content="967750790060-v9ro6kgih816p02fq4mvnafmf3fv04kg.apps.googleusercontent.com">
    <meta name="google-signin-clientSecret" content="ddd_AQLZ7DMwIkjwVeo4UpNi">
    <script src="https://apis.google.com/js/platform.js" async defer></script>
 	<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css">
  	<script src="https://apis.google.com/js/api:client.js"></script>
  	<style>
  		#customBtn {
			display: inline-block;
			background: white;
			color: #444;
			width: 190px;
		 	border-radius: 5px;
			border: thin solid #888;
			box-shadow: 1px 1px 1px grey;
			white-space: nowrap;
		}
		#customBtn:hover {
		  cursor: pointer;
		}
		span.label {
		  font-family: serif;
		  font-weight: normal;
		}
		span.icon {
		  display:flex;
		  justify-content:center;
		  margin-top: 25px;
		  background-color: #4285F4;
		  cursor: pointer;
		  padding: 20px 0px;
		  border-radius: 5px;
		}
		span.buttonText {
		  display: inline-block;
		  vertical-align: middle;
		  padding-left: 42px;
		  padding-right: 42px;
		  font-size: 14px;
		  font-weight: bold;
		  background-color: #4285F4;
		  font-family: 'Roboto', sans-serif;
		}
		.g-signin2 {
	  		margin: 90px 0px;
	  		text-align: center;
	  		display: flex;
	 	 	flex-direction: column;
	  		align-items: center;
		}
  	</style>
  </head>
    <script>
    function onSignIn(googleUser) {
    	  var profile = googleUser.getBasicProfile();
    	  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
    	  console.log('Name: ' + profile.getName());
    	  console.log('Image URL: ' + profile.getImageUrl());
    	  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
    	  checkLoginStatus();
    }
    </script>
    <title>Log in</title>
    <style>
      body{
        height: 50%;
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

    <form action="/user/userLoginProc.do" method="get" id="login-form">
      <input name="user_email" type="text" placeholder="Email or phone number" />
      <input name="user_pw" type="password" placeholder="Password" />
      <input type="submit" value="Log In"/>
      <input type="button" value="Sign In" onClick="location.href='/user/userSignin.do'" style="cursor:pointer; background-color: #FFFFFF; border: 1.5px solid #4285F4; border-radius: 5px;">
      <a href="#">Find Account or Password</a>
    
	<script>
		var googleUser = {};
		var startApp = function() {
		  gapi.load('auth2', function(){
		    // Retrieve the singleton for the GoogleAuth library and set up the client.
		    auth2 = gapi.auth2.init({
		      client_id: '967750790060-v9ro6kgih816p02fq4mvnafmf3fv04kg.apps.googleusercontent.com',
		      cookiepolicy: 'single_host_origin',
		      // Request scopes in addition to 'profile' and 'email'
		      //scope: 'additional_scope'
		    });
		    attachSignin(document.getElementById('customBtn'));
		  });
		};
		
		function attachSignin(element) {
		  console.log(element.id);
		  auth2.attachClickHandler(element, {},
		      function(googleUser) {
			  	window.location = "/friends.do";
		        /*document.getElementById('name').innerText = "Signed in: " +
		            googleUser.getBasicProfile().getName();*/
		      }, function(error) {
		        alert(JSON.stringify(error, undefined, 2));
		      });
		}	
		</script>
		
		<!-- In the callback, you would hide the gSignInWrapper element on a
		successful sign in -->
		<div id="gSignInWrapper">
		  <div id="customBtn" class="customGPlusSignIn">
		    <span class="icon"></span>
		    <span class="buttonText">구글로 로그인</span>
		  </div>
		</div>
		<div id="name"></div>
		<script>startApp();</script>
    
    </form>
   
   <footer class="footer-box">
   </footer>
	
    <div id="no-mobile">
      <span>Your screen is too big</span>
    </div>

    <script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>
    
  </body>
</html>