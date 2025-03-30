<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession, javax.servlet.http.HttpServletRequest, java.sql.*, project.dto.User_DTO" %>

<%
/* ========== 1. 세션이 없으면 쿠키 확인 후 자동 로그인 처리 ========== */
if (session == null || session.getAttribute("userId") == null) {
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if ("userId".equals(cookie.getName())) {
                String savedUserId = cookie.getValue();
                
                // 세션 생성 후 userId 저장
                session = request.getSession(); // 새로운 세션 생성
                session.setAttribute("userId", savedUserId);
            }
        }
    }
}
%>
<%
/* 세션 유지시간: 28800초= 8시간 */
session.setMaxInactiveInterval(28800);
%>
<%
/* 유저 ID 디버깅 */
String sessionUserId = (String) session.getAttribute("userId");
System.out.println("index.jsp - 현재 세션 userId: " + sessionUserId);

if (sessionUserId == null) {
    response.sendRedirect("login.jsp");
    return;
}
%>
<%
/* 로그인이 안되있으면 강제로 login.js[p로 이동하게 된다. */
String userId = (String) session.getAttribute("userId");
if (userId == null) {
	response.sendRedirect("login.jsp");
	return;
}
%>



<%
/* 기본값 설정 */
String helloUser = "로그인이 필요한 서비스입니다.";
String userRole = "";
String userName = "";

/* 세션에서 유저 정보 가져오기 */
User_DTO user = (User_DTO) session.getAttribute("user"); // DTO를 세션에서 직접 가져옴
if (user != null) {
    userRole = user.getJob();
    userName = user.getUserName();
    helloUser = userRole + " " + userName + "님, 환영합니다!";
}
%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<link rel="icon" href="img/icon.png" />
<title>혁신적인 밀키트 생산관리, HHMES</title>

<!-- css link -->
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/common.css">

</head>

<body class="index">
	<nav>
		<div class="logo-layer">
			<img src="img/mainlogo.png" alt="logo" class="logo" id="nav-mainlogo">
		</div>
		<div class="navigation">
			<button class="nav-button">기준관리</button>
			<ul class="nav-tag">
				<li id="nav-bomlist">부품코드</li>
				<li id="nav-inspection">검사기준</li>
				<li id="nav-process">생산공정</li>
				<li id="nav-bom">BOM</li>
			</ul>
			<button class="nav-button">생산관리</button>
			<ul class="nav-tag">
				<li id="nav-workorder">생산계획</li>
				<li id="nav-perfomanceRegistratio">실적등록</li>
				<li id="nav-qualityControl">품질관리</li>
				<li id="nav-inventory">재고현황조회</li>
			</ul>
			<button class="nav-button">실적보고서</button>
			<ul class="nav-tag">
				<li id="nav-perform">실적보고</li>
				<li id="nav-report">주요지표</li>
				<li id="nav-chart">대시보드</li>
			</ul>
			<button class="nav-button">게시판</button>
			<ul class="nav-tag">
				<li id="nav-공지사항">공지사항</li>
				<li id="nav-일반게시판">일반게시판</li>
			</ul>
		</div>
	</nav>
	<div class="gnb-bar">
		<div class="my-layer">
			<div class="my-populater">
				<div id="mypagePopup" class="mypage-layer">
					<div class="my-page">
						<img src="./img/mypage-img.png" class="mypage-img" id="mypage-img"
							alt="mypage-img">
					</div>
					<h6 class="login-button">
						<%=helloUser%>
					</h6>
				</div>
				<!-- mobile version nav bar -->
				<button type="button" class="mobnav-bar">
					<span class="mobnav bar1"></span> <span class="mobnav bar2"></span>
					<span class="mobnav bar3"></span>
				</button>
			</div>
			<ol class="local-bar">
				<li>Home</li>
				<li></li>
				<li></li>
			</ol>
		</div>
		<div class="navopen-shadow"></div>
		<iframe src="MainTitle.jsp" id="Mainiframe"></iframe>
	</div>
	<!-- 팝업창 -->
	<div id="popup" class="popup">
		<div id="popup-title" class="popup-title">
			<h2>
				안녕하세요.
				<%=userName%>
				님!
			</h2>
		</div>
		<p>
			현재
			<%=userName%>님의 권한은
			<%=userRole%>
			입니다.
		</p>
		<div name="popup-buttonlayer" id="popup-buttonlayer"
			class="popup-buttonlayer">
			<a id="mypage-a" class="mypopup-a">마이페이지</a> <a id="logout-a"
				class="mypopup-a">로그아웃</a>
			<button id="closePopupBtn" class="closebtn">닫기</button>
		</div>
	</div>
</body>
<!-- javascript link -->
<script src="js/indexScript.js"></script>
</html>