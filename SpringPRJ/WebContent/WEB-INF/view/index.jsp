<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Log in</title>
    <link rel="stylesheet" href="/css/ryan-style.css">
    <link rel="stylesheet" href="/css/components/no-mobile.css">
    <meta name="google-signin-client_id" content="967750790060-v9ro6kgih816p02fq4mvnafmf3fv04kg.apps.googleusercontent.com">
    <meta name="google-signin-clientSecret" content="ddd_AQLZ7DMwIkjwVeo4UpNi">
    <!-- gauth 로직 -->
    <script>
    	var cnt = 0;
	    function checkLoginStatus() {
			var gauthLoginState = document.querySelector('#gauthLoginState');
			cnt++;
	  		if(gauth.isSignedIn.get()){
	  			gauthLoginState.value = 'Login';
	  			console.log('signed');
	  			/* 로그인 정보 객체화 */
	  			googleUser = gauth.currentUser.get();
	  			profile = googleUser.getBasicProfile();
	  			//var id_token = googleUser.getAuthResponse().id_token; //id 토큰
		    	console.log('name? ' + profile.getName());
		    	console.log('cnt???' + cnt);
	  			if(gauthLoginState.value == 'Login'){
	  				console.log("자동인증됨")
	  				if(cnt>2){// 자동 이동 막기 //
			  			/* 값 전달 */
			  			// 폼만들기
			  			var form = document.createElement('form');
				        form.setAttribute('method', 'post'); 
				        form.setAttribute('action', '/user/usergauthProc.do');
				        //params
				        var params = {'user_email': profile.getEmail(),
					                'user_pw': 'gauthUser',
					                'user_id': profile.getId(),
					                'user_name': profile.getName(),
					                'user_Image': profile.getImageUrl(),
					                'user_isGUser': 'yes'};
				        /* 삽입,전송 */
				        for (var p in params) {
				            var input = document.createElement('input');
				            input.setAttribute('type', 'hidden');
				            input.setAttribute('name', p);
				            input.setAttribute('value', params[p]);
				            form.appendChild(input);
				          }
				        document.body.appendChild(form);
				        console.log('moving to chat page');
				      //gapi.auth2.getAuthInstance().disconnect(); //연결 끊기
				        form.submit();
		  			}
	  			}
	  		}else{
	  			console.log('not signed');
				<%session.removeValue("isGauth");%>//Gauth세션 삭제
	  			gauthLoginState.value = 'Logout';
	  		}console.log("isGauth? :" + <%=session.getAttribute("isGauth")%>);
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
	  	} 
    </script>
    <style>
     .gooContainer{
     	display: flex;
	    justify-content: space-between;
	    margin-top: 17px;
	    height: 30px;
     }
    </style>
</head>
<body>
    <form action="/user/userLoginProc.do" method="post" id="login-form">
        <svg id="ryan" viewBox="0 0 120 120" xmlns="http://www.w3.org/2000/svg">
            <path d="M0,150 C0,65 120,65 120,150" fill="#e0a243" stroke="#000" stroke-width="2.5" />
            <g class="ears">
                <path d="M46,32 L46,30 C46,16 26,16 26,30 L26,32" fill="#e0a243" stroke="#000" stroke-width="2.5" stroke-linecap="round" transform="rotate(-10,38,24)" />
                <path d="M74,32 L74,30 C74,16 94,16 94,30 L94,32" fill="#e0a243" stroke="#000" stroke-width="2.5" stroke-linecap="round" transform="rotate(10,82,24)" />
            </g>
            <circle cx="60" cy="60" r="40" fill="#e0a243" stroke="#000" stroke-width="2.5" />
            <g class="eyes">
                <!-- left eye and eyebrow-->
                <line x1="37" x2="50" y1="46" y2="46" stroke="#000" stroke-width="3" stroke-linecap="round" />
                <circle cx="44" cy="55" r="3" fill="#000" />
                <!-- right eye and eyebrow -->
                <line x1="70" x2="83" y1="46" y2="46" stroke="#000" stroke-width="3" stroke-linecap="round" />
                <circle cx="76" cy="55" r="3" fill="#000" />
            </g>
            <g class="muzzle">
                <path d="M60,66 C58.5,61 49,63 49,69 C49,75 58,77 60,71 M60,66 C61.5,61 71,63 71,69 C71,75 62,77 60,71" fill="#fff" />
                <path d="M60,66 C58.5,61 49,63 49,69 C49,75 58,77 60,71 M60,66 C61.5,61 71,63 71,69 C71,75 62,77 60,71" fill="#fff" stroke="#000" stroke-width="2.5" stroke-linejoin="round" stroke-linecap="round" />
                <polygon points="59,63.5,60,63.4,61,63.5,60,65" fill="#000" stroke="#000" stroke-width="5" stroke-linejoin="round" />
            </g>
            <path d="M40,105 C10,140 110,140 80,105 L80,105 L70,111 L60,105 L50,111 L40,105" fill="#fff" />
        </svg>
        <input type="text" name="user_email" placeholder="Email"/>
        <input type="password" name="user_pw" placeholder="Password"/>
        <input type="submit" value="Log In" style="background-color:#F9AC3A; cursor:pointer"/>
        <input type="button" value="Sign In" onclick="location.href='/user/userSignin.do'" style="background-color:#CD5604;cursor:pointer"/>
        <div class="gooContainer">
	        <!-- gauth 버튼, gauth 체크용 hidden 버튼 -->
	        <div class="g-signin2" data-onsuccess="checkLoginStatus" data-theme="dark"></div>
	        <a href="/findPW.do">Forgot password?</a>
        </div>
    </form>
    
    	<form action="/user/usergauthLoginProc.do" method="post" id="gauthLoginState" style='display:none' value="Logout">
	    	<input type="hidden" name="user_email" />
	    	<input type="hidden" name="user_pw" />
	    </form>
    

    <div id="no-mobile">
        <span>Your screen is too big</span>
    </div>
<script src="/js/ryan-script.js"></script>
<script src="/js/jquery-3.4.1.min.js"></script>
<script src="https://apis.google.com/js/platform.js?onload=init" async defer></script>
</body>
</html>