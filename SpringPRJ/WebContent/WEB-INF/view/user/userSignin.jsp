<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
  <head>
  	<script src="https://kit.fontawesome.com/54d6336788.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="../css/styles.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Sign in</title>
    <script type="text/javascript">
	   
    	// 회원가입 유효성 체크 start
		function doRegUserCheck(f) {
	      if (f.user_name.value == "") {
	         alert("이름를 입력하세요.");
	         f.user_name.focus();
	         return false;
	      }
	      if (f.user_email.value == "") {
		         alert("이메일을 입력하세요.");
		         f.user_email.focus();
		         return false;
		      }
		
	      if (f.user_pw.value == "") {
	         alert("비밀번호를 입력하세요.");
	         f.user_pw.focus();
	         return false;
	      }
	      if (f.user_pw2.value == "") {
	         alert("비밀번호확인을 입력하세요.");
	         f.user_pw2.focus();
	         return false;
	      }

	      if (f.user_pw.value !== f.user_pw2.value) {
	         alert("비밀번호와 비밀번호확인이 같은지 확인하세요.");
	         f.user_pw.focus();
	         return false;
	      }
		}
		// 회원가입 유효성 체크 end
    	
	</script>

  </head>
  <body>
    
    <header class="welcome-header">
      <h1 class="welcome-header__title">Sign in</h1>
    </header>

    <form action="/user/insertUserInfo.do" method="post" id="login-form" onsubmit="return doRegUserCheck(this);">
    	<input type="text" placeholder="이름" name="user_name"/> 
    	<input type="email" placeholder="이메일 주소" id="user_email" name="user_email" onkeyup="emailCheck();"/>
    	<div class="log-messages email-log-messages divEmail" style="color:red;">이미 가입하신 이메일 주소입니다.</div>
		<input type="password" placeholder="비밀번호" name="user_pw"/>
		<div class="log-messages">문자,숫자,기호를 조합하여 8자 이상을 사용하세요</div>
		<input type="password" placeholder="비밀번호 확인" name="user_pw2"/>
		<input type="submit" value="다음"/>
		<input type="button" value="이전" onClick="location.href='/index.do'" />
    </form>

    <div id="no-mobile">
      <span>Your screen is too big</span>
    </div>
	
	<script>
		// 이메일 중복 확인 메세지 추가  ajax start
		function emailCheck() {
			$.ajax({
				type: 'POST',
				url: '/emailCheckForAjax.do',
				data : {user_email : $('#user_email').val()},
				success: function(data) {
					//console.log(data);
					
					if(data == "1") {
						$('.divEmail').addClass('email-log-messages');
					} else if (data == "0") {
						$('.divEmail').removeClass('email-log-messages');
					}

				}
			})
		}
		// 이메일 중복 확인 메세지 추가  ajax end
			
	</script>
  </body>
</html>