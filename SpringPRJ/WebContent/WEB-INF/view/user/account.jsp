<%@page import="poly.dto.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	UserDTO rDTO = (UserDTO)request.getAttribute("rDTO");
%>    
<!DOCTYPE html>
<html lang="en">
  <head>
  	<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet"/>
  	<script src="/js/fontawesome.js"></script>
  	<script type = "text/javascript">
  	/* gauth일때, 버튼 비활성화, 안보이기 */
  	function blcokBox(){
  	  	var idBoxLink = document.getElementById("idBoxLink"); // 아이디 변경 박스
  	  	var passBox = document.getElementById("passBox"); // 비번 변경 박스
  	  	console.log("isGauth? " + <%=session.getAttribute("isGauth")%>);
	  	if (<%=session.getAttribute("isGauth")%> == 1) {
	  		idBoxLink.href = '';
	  		passBox.style.display = 'none';
	  	}
  	}
  	
    function PreviewImage() {
        var oFReader = new FileReader();
        oFReader.readAsDataURL(document.getElementById("uploadImage").files[0]);
        oFReader.onload = function (oFREvent) {
            document.getElementById("uploadPreview").src = oFREvent.target.result;
        };
    };
  	
  	</script>
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
      		
      		<label for="uploadImage" style="width:100%">
		  	<li class="settings__setting settings__setting-hover">
		    	<div class="settings__setting-column">
		        	<img id="uploadPreview" src="/img/basic.jpg" class="user-component__avatar user-component__avatar--sm"/>
					<input type="file" id="uploadImage" onchange="PreviewImage();" style="display:none">
		    	</div>
		    	
		        <div class="settings__setting-column">
		          	<i class="fas fa-angle-right"></i>
		    	</div>
		  	</li>
		  	</label>
	  	
		  	<li class="settings__setting">
		    	<div class="settings__setting-column">
		        	<span>Email</span>
		    	</div>
		        <div class="settings__setting-column">
		        	<span class="personal-text personal-text-email"><%=rDTO.getUser_email() %></span>
		    	</div>
		  	</li>	 
	  	
	  	<a id="idBoxLink" href="/user/chgName.do" >
		  	<li class="settings__setting settings__setting-hover">
		    	<div class="settings__setting-column">
		        	<span>Name</span>
		    	</div>
		        <div class="settings__setting-column">
		        	<span class="personal-text"><%=rDTO.getUser_name() %></span>
		          	<i class="fas fa-angle-right"></i>
		    	</div>
		  	</li>
	  	</a>
		
		
		<a href="/user/chgPW.do">
		  	<li id="passBox" class="settings__setting settings__setting-hover" >
		    	<div class="settings__setting-column">
		        	<span>Password</span>
		    	</div>
		        <div class="settings__setting-column">
		          	<i class="fas fa-angle-right"></i>
		    	</div>
		  	</li>
	  	</a>	  	
	  	<script>blcokBox()</script>
	  	
      </ul>
    </main>

    <div id="no-mobile">
      <span>Your screen is too big</span>
    </div>
    
   	<!-- 로그인 확인 체크 페이지 -->
	<%@include file="/WEB-INF/view/include/logincheck.jsp" %>
	
  </body>
</html>