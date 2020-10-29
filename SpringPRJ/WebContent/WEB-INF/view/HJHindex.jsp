<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
  <head>
    <link rel="stylesheet" href="css/styles.css" />
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="google-signin-scope" content="profile email">
    <meta name="google-signin-client_id" content="967750790060-v9ro6kgih816p02fq4mvnafmf3fv04kg.apps.googleusercontent.com">
    <meta name="google-signin-clientSecret" content="ddd_AQLZ7DMwIkjwVeo4UpNi">
    
    <script src="https://apis.google.com/js/platform.js" async defer></script>
  	<script>
  		function checkLoginStatus() {
  			var loginBtn = document.querySelector('#loginBtn');
  			var nameTxt = document.querySelector('#name');
	  		if(gauth.isSignedIn.get()){
	  			console.log('signed');
	  			loginBtn.value = 'Logout';
	  			profile = gauth.currentUser.get().getBasicProfile()
		    	console.log('name? ' + profile.getName());
	  			nameTxt.innerHTML = 'Welcome <strong>' +profile.getName() +'</strong> ';
	  			console.log('moving to chat page');
	  			window.location.href = 'http://localhost:9000/friends.do';
	  		}else{
	  			console.log('not signed');
	  			loginBtn.value = 'Login';
	  			nameTxt.innerHTML = '';
	  		}
		}
	  	function init() {
	  		console.log('init auth2');
			gapi.load('auth2', function() {
	  	    /* Ready. Make a call to gapi.auth2.init or some other API */
	  		});
	  		console.log('auth2 Obj');
	  		window.gauth = gapi.auth2.init({
		  		client_id: '967750790060-v9ro6kgih816p02fq4mvnafmf3fv04kg.apps.googleusercontent.com'
		  	})
		  	gauth.then(function(){
	  			console.log('gauth2 success');
	  			checkLoginStatus();
	  			}, function(){
	  				console.log('gauth2 fail');
		  	});
	  		//console.log('signed? ' + gauth.isSignedIn.get());
	  	}
  	</script>
  	
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

    <form action="/friends.do" method="get" id="login-form">
      <input name="username" type="text" placeholder="Email or phone number" />
      <input name="password" type="password" placeholder="Password" />
      <input type="submit" value="Log In" />
      <a href="#">Find Account or Password</a>
    </form>
   
   <footer class="footer-box">
    <span id='name' ></span><input type="button" id="loginBtn" value="checking..." onclick="
  		if (this.value == 'Login') {
  			gauth.signIn({
  				scope: 'https://www.googleapis.com/auth/calendar'
  			}).then(function() {
	    	console.log('gauth.signInPopup');
	    	checkLoginStatus();
			})
		} else {
  			gauth.signOut().then(function() {
	    	console.log('gauth.signOutPopup');
	    	checkLoginStatus();
			})
		}
  	">
    <div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark"></div>
    </footer>

    <div id="no-mobile">
      <span>Your screen is too big</span>
    </div>

    <script
      src="https://kit.fontawesome.com/6478f529f2.js"
      crossorigin="anonymous"
    ></script>
    <script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>
  </body>
</html>