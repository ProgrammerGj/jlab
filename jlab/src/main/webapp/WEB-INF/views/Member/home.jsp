<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.lang.*" %>
<%
	String id = (String) session.getAttribute("id");
	String pass = (String) session.getAttribute("pass");
	int parentNo = (Integer) session.getAttribute("parentNo");
	int empNo = (Integer) session.getAttribute("empNo");
	
	if((int)(Math.log10(empNo)+1) >2) {
		response.sendRedirect("/");
	}
%>
<html>
<head>
<!-- jQuery CDN -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>


<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style type="text/css">
th {
	text-align: center;
	background-color: #0000ee;
	color: #ffffff;
}

td {
	text-align: center;
}
</style>
<script>
	$(document).ready(function(){
		$("#btnLogout").on("click", function(){
			<%
				session.invalidate();
			%>
			location.href="/";
		});
	});
</script>
<title>관리 시스템</title>
</head>
<body>
	<div class="container">
		<h1 style="text-align: center">사원 목록</h1>
		<div style="text-align: right; margin-bottom: 10px;">
			<button class="btn btn-success btn-sm">직원 등록</button>
			<button class="btn btn-primary btn-sm">직원 수정</button>
			<button id="btnLogout" class="btn btn-danger btn-sm">로그아웃</button>
		</div>
		<table border="1" style="width: 100%; height: auto;"
			class="table-striped">
			<tr>
				<th>관리자번호</th>
				<th>알바번호</th>
				<th>알바명</th>
				<th>아이디</th>
				<th>직 급</th>
				<th>지 역</th>
			</tr>
			<c:choose>
				<c:when test="${empty MemberList}">
					<tr>
						<td colspan="6"
							style="background-color: #eee; color: #FF0000; text-align: center;">정보가
							없습니다.</td>
					</tr>
				</c:when>

				<c:when test="${parentNo eq 0}">
					<tr>
						<td colspan="6"
							style="background-color: #eee; color: #FF0000; text-align: center;">정보가
							없습니다.</td>
					</tr>
				</c:when>

				<c:otherwise>
					<c:forEach begin="0" items="${MemberList}" var="list">
						<tr>
							<td>${list.parentNo}</td>
							<td>${list.empNo}</td>
							<td>${list.name}</td>
							<td>${list.id}</td>
							<td>${list.jikgupValue}</td>
							<td>${list.deptValue}</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
	</div>
</body>
</html>
