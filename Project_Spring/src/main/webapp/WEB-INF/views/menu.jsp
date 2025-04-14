<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<nav>
    <div class="logo-layer">
        <img src="${pageContext.request.contextPath}/resources/img/mainlogo.png" alt="logo" class="logo" id="nav-mainlogo">
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
