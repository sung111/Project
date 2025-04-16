<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="project.dto.User_DTO" %>
<%
    User_DTO user = (User_DTO) session.getAttribute("user");
    String userName = user != null ? user.getUserName() : "";
    String userRole = user != null ? user.getJob() : "";
%>

    <div id="popup-title" class="popup-title">
        <h2>안녕하세요. <%=userName%> 님!</h2>
        <div id="chatbot-icon" class="chatbot-icon"></div>
    </div>
    <p>현재 <%=userName%>님의 권한은 <%=userRole%>입니다.</p>
    <div id="popup-buttonlayer" class="popup-buttonlayer">
        <a id="mypage-a" class="mypopup-a">마이페이지</a>
        <a id="logout-a" class="mypopup-a" href="${pageContext.request.contextPath}/logout">로그아웃</a>
        <button id="closePopupBtn" class="closebtn">닫기</button>
    </div>
