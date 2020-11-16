<%@page import="poly.util.CmmUtil"%>
<%@page import="poly.dto.UserDTO"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    List<UserDTO> rList = (List<UserDTO>)request.getAttribute("rList");
%>
<!DOCTYPE html>
<html lang="en">
  <head>
	<script src="/js/fontawesome.js"></script>
	<script src="/js/jquery-3.4.1.min.js"></script>  
    <link rel="stylesheet" href="/css/styles.css" />
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Friends</title>
    <style>
    	/* 화면 조절 css start */
    	html, body, #resContainer{
    		height:100%;
    	}
    	body {
    		overflow-x:hidden;
    	}
    	.friends-screen__channel:first-child{
    		padding-top: 115px;
    	}
    	.friends-screen__channel:last-child{
    		margin-bottom:80px;
    	}
    	/* 화면 조절 css end */
    	
    </style>
  </head>
  <body id="body-all">
	<header class="screen-header">
		<h1 class="screen-header__title" style="padding-left:25px;">Friends</h1>
	    <div class="screen-header__icons" style="padding-right:25px;">
	    	<span><i class="fas fa-search fa-lg" onclick='UpFind();'></i></span>
	        <span><a href="/settings.do"><i class="fas fa-cog fa-lg"></i></a></span>
	    </div>
	</header>
		
    <main id="resContainer" class="friends-screen friend-mp">
    	<%
    		for(UserDTO uDTO : rList){
    	%>
		<div class="friends-screen__channel">
			<div class="user-component">
				<div class="user-component__column">
					<img src="../img/basic.jpg" class="user-component__avatar user-component__avatar--sm"/>
					<div class="user-component__text">
						<h4 class="user-component__title user-component__title--not-bold">
							<%=CmmUtil.nvl(uDTO.getUser_name()) %>
						</h4>
					</div>
				</div>
				<div class="user-component__column">
				</div>
			</div>
		</div>   
		<% } %> 	
    </main>
    
    <nav class="nav">
      <ul class="nav__list">
        <li class="nav__btn">
          <a class="nav__link" href="/friends.do">
            <i class="fas fa-user fa-2x"></i>
          </a>
        </li>
        <li class="nav__btn">
          <a class="nav__link" href="/chats.do">
            <i class="far fa-comment fa-2x"></i>
          </a>
        </li>
      </ul>
    </nav>
    <div id="splash-screen" style="background-color:white; color:red;">
      <i class="fab fa-youtube" ></i>
    </div>

    <div id="no-mobile">
      <span>Your screen is too big</span>
    </div>
    
    <!-- find jsp -->
    <%@include file="/WEB-INF/view/include/find.jsp" %>
    
	<!-- 로그인 확인 체크 페이지 -->
	<%@include file="/WEB-INF/view/include/logincheck.jsp" %>
	 
	<script>
		// userList 전체 list 가져오는 ajax 30초마다 실행 start
		function search(){	
			//alert("search() 실행");
			
			$.ajax({
				url : '/user/getUserList.do',
				type : 'post',
				dataType:'json',
				
				success : function(data) { //성공시
					var resHTML ='';
					console.log(data);
					if(data.length==0) {
						resHTML +=      '<div class="friends-screen__channel">';
						resHTML +=        '<div class="user-component">';
						resHTML +=          '<div class="user-component__column">';
						resHTML +=           '<img src="../img/basic.jpg" class="user-component__avatar user-component__avatar--sm"/>';
						resHTML +=            '<div class="user-component__text">';
						resHTML +=              '<h4 class="user-component__title user-component__title--not-bold">no search user</h4>';
						resHTML +=            '</div>';
						resHTML +=          '</div>';
						resHTML +=          '<div class="user-component__column">';
						resHTML +=          '</div>';
						resHTML +=        '</div>';
						resHTML +=      '</div>';	
					}
					
					for( var i=0; i<data.length;i++) {
						resHTML +=      '<div class="friends-screen__channel">';
						resHTML +=        '<div class="user-component">';
						resHTML +=          '<div class="user-component__column">';
						resHTML +=           '<img src="../img/basic.jpg" class="user-component__avatar user-component__avatar--sm"/>';
						resHTML +=            '<div class="user-component__text">';
						resHTML +=              '<h4 class="user-component__title user-component__title--not-bold">'+data[i].user_name+'</h4>';
						resHTML +=            '</div>';
						resHTML +=          '</div>';
						resHTML +=          '<div class="user-component__column">';
						resHTML +=          '</div>';
						resHTML +=        '</div>';
						resHTML +=      '</div>';	
					}
					$('#resContainer').html(resHTML); //HTML에 결과 추가
				}
			})
		}
		
		setInterval(search,30000);
		// userList 전체 list 가져오는 ajax 30초마다 실행 end
	</script>
  </body>
</html>
