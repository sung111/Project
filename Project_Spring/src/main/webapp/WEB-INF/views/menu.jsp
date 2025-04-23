<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<nav>
    <div class="logo-layer">
    <a href="${pageContext.request.contextPath}/maintitle/MainTitle">
        <img src="${pageContext.request.contextPath}/resources/img/mainlogo.png" alt="logo" class="logo" id="nav-mainlogo">
        </a>
    </div>
    <div class="navigation">
        <button class="nav-button">기준관리</button>
        <ul class="nav-tag">
        <li><a href="${pageContext.request.contextPath}/maintitle/standard">부품코드</a></li>
            <%-- <li><a href="${pageContext.request.contextPath}/standard">부품코드</a></li> --%>
            <li><a href="${pageContext.request.contextPath}/maintitle/inspectionStandards">검사기준</a></li>
            <li><a href="${pageContext.request.contextPath}/maintitle/production_process">생산공정</a></li>
            <li><a href="${pageContext.request.contextPath}/maintitle/bom_v2">BOM</a></li>
        </ul>
        <button class="nav-button">생산관리</button>
        <ul class="nav-tag">
            <li><a href="${pageContext.request.contextPath}/maintitle/ProdPlan">생산계획</a></li>
            <li><a href="${pageContext.request.contextPath}/maintitle/Performance">실적등록</a></li>
            <li><a href="${pageContext.request.contextPath}/maintitle/qualityControl">품질관리</a></li>
            <li><a href="${pageContext.request.contextPath}/maintitle/inventorycheck">재고현황조회</a></li>
        </ul>
        <button class="nav-button">실적보고서</button>
        <ul class="nav-tag">
            <li id="nav-perform">실적보고</li>
            <li id="nav-report">주요지표</li>
            <li id="nav-chart">대시보드</li>
        </ul>
        <button class="nav-button">게시판</button>
        <ul class="nav-tag">
            <li><a href="${pageContext.request.contextPath}/maintitle/standard">공지사항</a></li>
            <li><a href="${pageContext.request.contextPath}/maintitle/board">일반게시판</a></li>
        </ul>
    </div>
</nav>

