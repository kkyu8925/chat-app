<%@page import="poly.util.CmmUtil"%>
<%@page import="poly.dto.UserDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
  	<script src="https://kit.fontawesome.com/54d6336788.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="../css/styles.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>find</title>
  	<style>
  		/* find css start */
		.container-1{
		  width: 250px;
		  vertical-align: middle;
		  white-space: nowrap;
		  position: relative;
		}
		.container-1 input#search{
		  width: 250px;
		  height: 50px;
		  font-size: 10pt;
		  float: left;
		  color: #63717f;
		  padding-left: 45px;
		  -webkit-border-radius: 5px;
		  -moz-border-radius: 5px;
		  border-radius: 5px;
		  border: 1px solid black;
		}
		.container-1 .icon{
		  position: absolute;
		  top: 50%;
		  margin-left: 17px;
		  margin-top: 17px;
		  z-index: 1;
		  color: #4f5b66;
		}
		/* find css end */
		
		/* input type=search x버튼 삭제 start */
		input::-ms-clear,
		input::-ms-reveal{
			display:none;width:0;height:0;
		}
		input::-webkit-search-decoration,
		input::-webkit-search-cancel-button,
		input::-webkit-search-results-button,
		input::-webkit-search-results-decoration{
			display:none;
		}
		/* input type=search x버튼 삭제 end */
		
		
	 </style>
  </head>
  <body>
    
    <header class="screen-header">
      	<div class="screen-header__icons">
        	<span style="margin-left:0px;"><a href="/friends.do"><i class="fas fa-angle-left fa-3x"></i></a></span>
      	</div>
      	<div class="box">
	  		<div class="container-1">
	    		<span class="icon"><i class="fa fa-search"></i></span>
	      		<input type="search" id="search" placeholder="Search..." onkeyup="search();"/>
	      		<span class="icon icon-last"><i class="fas fa-times" style="margin-left: -50px; cursor:pointer;" onclick="deleteVal()"></i></span>
	  		</div>
		</div>
    </header>

    <main id="resContainer" class="friends-screen">
    </main>


    <div id="no-mobile">
      <span>Your screen is too big</span>
    </div>
    
    <!-- 로그인 확인 체크 페이지 -->
	<%@include file="/WEB-INF/view/user/logincheck.jsp" %>
    
	<script>
		// userlist search ajax start 
		function search(){	
			//alert("search() 실행");
			var user_name = $('#search').val();
			console.log("user_name: "+user_name);
			
			if( $('#user_name').val()==""){
				$('#user_name').focus();
				return false;
			}
			
			$.ajax({
				url : '/user/getSearchList.do',
				type : 'post',
				data : {name :user_name}, // Controller에 보낼  key: value
				dataType:'json',
				success : function(data) { //성공시
					var resHTML ='';
					console.log(data);
					
					if(data.length==0) {
						resHTML +=      '<div class="friends-screen__channel">';
						resHTML +=        '<div class="user-component">';
						resHTML +=          '<div class="user-component__column">';
						resHTML +=           '<img src="../img/basic.gif" class="user-component__avatar user-component__avatar--sm"/>';
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
						resHTML +=           '<img src="../img/basic.gif" class="user-component__avatar user-component__avatar--sm"/>';
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
		// userlist search ajax end
	
		// search value delete start
		function deleteVal() {
			$('#search').val('');
		}
		// search value delete end
	</script>
  </body>
</html>
    