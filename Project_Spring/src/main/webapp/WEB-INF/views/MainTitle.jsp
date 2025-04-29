<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*" %>
<%@ page import="project.dto.*" %>
<!-- CSS -->
	<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/maintitle.css" />
	
<!-- 공지사항 -->
<div class="noticelayer">
  <div class="noticelayer-title">
    <h2>공지사항</h2>
    <a class="Notice-more" href="select?notify=Y">더 보기</a>
  </div>
  <ul class="notice">

    <c:forEach var="dto" items="${Announcement}">
    <li class="notice-latestlist">
      <a class="content">${dto.title} 작성되었습니다.</a>
      <div><span class="date">${dto.postdate}</span></div>
    </li>
    </c:forEach>

  </ul>
</div>

<!-- 태그 타이틀 영역 전체 -->
<div class="tagtitlecontainer">

  <!-- 신규 상품등록 -->
  <div class="taglayer">
    <div class="noticelayer-title">
      <h2>신규 상품등록</h2>
      <a class="more" href="standard">더 보기</a>
    </div>
    <ul class="taglist">
      <c:forEach var="dto" items="${FinishedProduct}">
      <li><a>${dto.productname} 밀키트 업데이트</a><div><span>${dto.creatdate}</span></div></li>
      </c:forEach>
  
    </ul>
  </div>

  <!-- 품질관리 -->
  <div class="taglayer">
    <div class="noticelayer-title">
      <h2>품질관리</h2>
      <a class="more" href="qual">더 보기</a>
    </div>
    <ul class="taglist">
      <c:forEach var="dto" items="${QualityControl}">
        <li><a>${dto.productname} 밀키드 품질 점검 ${dto.result}</a><div><span>${dto.qualitycontroltime}</span></div></li>
      </c:forEach>
    </ul>
  </div>


  <!-- 일반게시판 -->
  <div class="taglayer">
    <div class="noticelayer-title">
      <h2>일반게시판</h2>
      <a class="more" href="select?notify=N">더 보기</a>
    </div>
    <ul class="taglist">
      <c:forEach var="dto" items="${GeneralBulletinBoard}">
      <li><a class="content">${dto.title}</a><div><span class="date">${dto.postdate}</span></div></li>
    </c:forEach>
    </ul>
  </div>

</div>

