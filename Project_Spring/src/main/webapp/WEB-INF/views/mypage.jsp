<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page session="true"%>
<%@ page import="project.dto.User_DTO"%>

<%
User_DTO user = (User_DTO) session.getAttribute("user");
String userName = user != null ? user.getUserName() : "알 수 없음";
String userId = user != null ? user.getUserId() : "알 수 없음";
String userRole = user != null ? user.getJob() : "알 수 없음";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<style>
body {
	font-family: sans-serif; padding: 20px;
}

h2{
color: #007bff
}

.userinfo {
	border: 1px solid #007bff; padding: 15px; border-radius: 10px; background: #f9f9f9;
	}
.button-wrapper {
	display: flex; justify-content: flex-end; margin-top: 10px;
}

.mypage-close{
 width: 43px; height: 27px; background: #999999; border: none; border-radius: 5px;
}
</style>
</head>
<body>
	<h2>마이페이지</h2>
	<div class="userinfo">
	<p><strong>이름:</strong> ${user.userName}</p>
	<p><strong>아이디:</strong> ${user.userId}</p>
	<p><strong>직책:</strong> ${user.job}</p>
</div>

<div class="button-wrapper">
	<button onclick="window.close()" id="mypage-close" class="mypage-close">닫기</button>
</div>

</html>
