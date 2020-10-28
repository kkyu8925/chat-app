<%@page import="poly.dto.TestDTO"%>
<%@page import="static poly.util.CmmUtil.nvl"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<TestDTO> rList = (List<TestDTO>) request.getAttribute("rList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div style="margin: auto; width: 800px;">
		<table border="1" style="width: 100%;">
			<thead>
				<tr>
					<td>test</td>
				</tr>
			</thead>
			<tbody>
				<%
					for (TestDTO e : rList) {
				%>
				<tr>
					<td><%=nvl(e.getNo())%></td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>

	</div>
</body>
</html>