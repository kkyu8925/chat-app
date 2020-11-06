<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
		
<div class="selectfindbody con-fixed">	 
    <div class="screen-header" style="background-color:white; border: none;">
      	<div class="screen-header__icons">
        	<span><i class="fas fa-angle-left fa-3x" onclick='DownFind();'></i></span>
      	</div>
      	<div class="box" style="margin-right: 25px;">
	  		<div class="container-1">
	    		<span class="icon"><i class="fa fa-search" style="cursor:default;"></i></span>
	      		<input type="search" id="search" placeholder="Search..." onkeyup="searchUser();"/>
	      		<span class="icon icon-last"><i class="fas fa-times" style="margin-left: -50px;" onclick="deleteVal()"></i></span>
	  		</div>
		</div>
    </div>

    <div id="resContainer-find" class="friends-screen">

    </div>
</div>    

	<script>
		function UpFind() {
			$('.selectfindbody').removeClass('con-fixed');
			$('.selectfindbody').addClass('find-container');
			$('#body-all').addClass('overflow-srcoll');
			$('#search').focus();
		}
		
		function DownFind() {
			$('.selectfindbody').addClass('con-fixed');
			$('.selectfindbody').removeClass('find-container');
			$('#body-all').removeClass('overflow-srcoll');
			deleteVal();
		}
		
		// userlist search ajax start 
		function searchUser(){	
			//alert("search() 실행");
			var user_name = $('#search').val();
			console.log("user_name: "+user_name);
			
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
						
						if(i>4){
							resHTML +=     '<div class="friends-screen__channel morefind"><i class="fas fa-ellipsis-v" style="font-size: 30px; cursor:default;"></i></div>';
							break;
						}
					}
					$('#resContainer-find').html(resHTML); //HTML에 결과 추가
				}
			})
		}
		// userlist search ajax end
	
		// search value delete start
		function deleteVal() {
			$('#search').val('');
			$('#search').focus();
		}
		// search value delete end
	</script>
    