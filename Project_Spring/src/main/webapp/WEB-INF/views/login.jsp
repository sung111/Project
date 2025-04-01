<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<link rel="icon" href="${ pageContext.request.contextPath }/resources/img/icon.png" />
<title>HHMES:Login</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css">


</head>

<body>
	<!-- 로그인 페이지 -->
	<div class="login-container">
		<div class="mainlayer">
			<div class="imglayer">
				<img src="${ pageContext.request.contextPath }/resources/img/icon.png" alt="loginlogo">
				<h5>혁신적인 밀키트 생산관리 MES</h5>
			</div> 
			<form class="login-layer" id="login-layer" action="Login_controller"
				method="post">
				<h1>Login</h1>
				<input type="text" name="userId" id="username"
					placeholder="Username" required> <input type="password"
					name="userPw" id="password" placeholder="Password" required>
				<button type="submit" id="login-button">Login</button>
			</form>
			<form class="signup-layer" id="signup-layer">
				<h6>이름</h6>
				<input type="text" name="user_name" class="writing_layer"
					placeholder="이름을 입력해주세요.">
				<h6>아이디</h6>
				<input type="text" name="user_id" class="writing_layer"
					placeholder="사용하실 아이디를 입력해주세요.">
				<h6>비밀번호</h6>
				<input type="password" name="user_password" class="writing_layer"
					placeholder="비밀번호를 입력해주세요.">
				<h6>비밀번호 재확인</h6>
				<input type="password" name="user_password2" class="writing_layer"
					placeholder="비밀번호 재확인이 필요합니다.">
				<h6>이메일</h6>
				<input type="email" name="user_email" class="writing_layer"
					placeholder="이메일을 입력해주세요.">
				<h6>전화전호</h6>
				<input type="tel" name="user_tel" class="writing_layer"
					placeholder="전화번호를 입력해주세요.">
			</form>
			<form class="find-layer" id="find-layer">
				<h6>이메일 또는 전화번호로 인증하기</h6>
				<input type="text" name="find_Account_textarea"
					class="writing_layer find_account"
					placeholder="이메일 혹은 전화번호를 입력해주세요.">
				<ul class="certified">
					<h4>인증 수단을 클릭해주세요.</h4>
					<li><img src="${ pageContext.request.contextPath }/resources/img/phone.png">
						<p>휴대폰으로 본인인증</p></li>
					<li><img src="${ pageContext.request.contextPath }/resources/img/email.png">
						<p>이메일로 본인인증</p></li>
					<li><img src="${ pageContext.request.contextPath }/resources/img/card.png">
						<p>신용카드로 본인인증</p></li>
				</ul>
			</form>
		</div>
		<form class="sublayer">
			<button name="sign-up-button" class="sign-up" id="sign-up-button">Sign
				Up</button>
			<a name="findid_password-button" class="findid_password"
				id="findid_password-button">아이디 혹은 비밀번호를 잊으셨나요?</a>
			<button name="sign-up-completed-button" class="sign-up-completed"
				id="sign-up-completed-button">가입 완료</button>
			<button name="find-account-button" class="find-account"
				id="find-account-button">인증번호</button>
			<button name="cancel-button" class="cancel" id="cancel-button">뒤로
				가기</button>
		</form>
	</div>
</body>
<script src="${ pageContext.request.contextPath }/resources/js/login.js"></script>

</html>