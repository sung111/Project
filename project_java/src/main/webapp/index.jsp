<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="java.sql.*, javax.servlet.http.*, javax.servlet.*" session="true"%>
<%
/* 로그인이 안되있으면 강제로 login.js[p로 이동하게 된다. */
    String userId = (String) session.getAttribute("userId");
    if (userId == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    %>
 <%--     <%
    /* 로그인을 성공했다면 index.html에 들어갈 수 있다. */
    String userId = request.getParameter("userId"); // 로그인 성공한 userId
    session.setAttribute("userId", userId); // 세션에 저장됨
    response.sendRedirect("index.jsp"); // 메인 페이지 이동함
%> --%> 
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <link rel="icon" href="img/icon.png" />
    <title>혁신적인 밀키트 생산관리, HHMES</title>

    <!-- css link -->
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/common.css">
        <!-- javascript link -->
        <script src="js/indexScript.js"></script>
        <%
        
        String DB_URL = "jdbc:oracle:thin:@125.181.132.133:51521:xe"; 
        //ㅈㅁㅈㅁ
        
        %>
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
                <li id="nav-사내복지">사내복지</li>
                <li id="nav-일반게시판">일반게시판</li>
            </ul>
        </div>
    </nav>
    <div class="gnb-bar">
        <div class="my-layer">
            <div class="my-populater">
<div class="mypage-layer">
                <div class="my-page">
                    <img src="./img/mypage-img.png" class="mypage-img" alt="mypage-img">
                </div>
                <div class="login-user">환영합니다! user님!</div>
                <div class="login-admin">환영합니다! admin님!</div>
                <h6 class="login-button">로그인이 필요한 서비스입니다.</h6>
            </div>
                <!-- mobile version nav bar -->
                <button type="button" class="mobnav-bar">
                    <span class="mobnav bar1"></span>
                    <span class="mobnav bar2"></span>
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

<script>
    
</script>

</body>
</html>