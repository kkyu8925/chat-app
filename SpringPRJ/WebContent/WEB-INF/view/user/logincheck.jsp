<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
 if(<%=session.getAttribute("SS_USER_NAME") %>==null){
	 alert("로그인 해주세요");
	 location.href = "index.do";
 }
	 
</script>