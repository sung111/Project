<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ page import="java.util.*"%>
<%@ page import="project.dto.*"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>실적등록</title>
<link rel="stylesheet" href="resources\css\Performance.css">
<link rel="stylesheet" href="resources\css\prodplan.css">
<script src="resources\js\Performance.js"></script>

</head>

<body>
	<div id="myModal" class="modal">
		<div class="modal-content">
			<span class="close">&times;</span>
			<p>여기는 모달창 내용 영역입니다.</p>
		</div>
	</div>
	<div class="warrap">
		<div class="instruction">
			<div class="instTop">
				<div class="wkr">작업지시서</div>
			</div>
			<div class="instView"></div>
		</div>
		<div>
			<!-- 			<div class="bord"> -->
			<!-- 				<div class="inBord"> -->
			<!-- 					<div>현재 진행률</div> -->
			<!-- 					<div>%</div> -->
			<!-- 					<div>(제품별)</div> -->
			<!-- 				</div> -->
			<!-- 				<div class="inBord"> -->
			<!-- 					<div>불량률</div> -->
			<!-- 					<div>%</div> -->
			<!-- 					<div>(제품별)</div> -->
			<!-- 				</div> -->
			<!-- 			</div> -->
			<div class="box2">
				<div class="criteria">
					<div class="wp">제품명</div>
					<div class="btn2B">
						<button class="btn2">제품 합격/불합격 기준</button>
					</div>
				</div>
				<div class="registration">
					<form method="post" action="performInsert" id="insertForm">
						<div class="rightTop">
							<div class="wp2">제품명</div>
							<div>
								<input type="datetime-local" class="date1" name="searchDateStart">
<!-- 								<input type="date" class="date1" name="reporttime" step="1"> -->
							</div>
							<button class="btn3">등록</button>
						</div>
						<div>
							<div id="ea">
								생산갯수 : <input type="number" id="myInput" min="1" max="100"
									oninput="validity.valid||(value='')" value="10" name="productioncount"> pack <input
									type="hidden" value="" id="productid" name="productid"> <input
									type="hidden" value="" id="planid" name="planid">
							</div>
						</div>
						<textarea name="performancecomment" id="" class="textarea1" rows="5"></textarea>
					</form>
				</div>
			</div>
			<div class="box3">
				<form>
					<div class="box3Top" style="margin: 5px;">
						<div style="font-size: 16px;">
							<input type="text" class="wp3" name="productname"
								placeholder="제품명" style="margin-right: 10px;"
								value="${param.productname}">
						</div>
						<div class="date2">
							<input type="datetime-local" class="indate1"
								name="searchDateStart" value="${ param.searchDateStart }">
							~ <input type="datetime-local" class="indate2"
								name="searchDateEnd" value="${ param.searchDateEnd }">
						</div>
						<div>
							<button class="btn4">조회</button>
						</div>
					</div>
				</form>
				<div class="indexBox">
					<div class="indexsss">
						<div>날짜</div>
						<div>제품명</div>
						<div>수량</div>
						<div>코멘트</div>
						<div>등록인</div>
						<div>비고</div>
					</div>
				</div>
				<div class="box3View">
					<c:forEach var="dto" items="${ list }">
						<div class="dex item">
							<form method="post" action="performanceDelete"
								class="kk deleteForm">
								<div class="dateB">
									<!-- gpt 사용했음 fmt 라이브러리 공부해야함. -->
									<fmt:formatDate value="${dto.reporttime}"
										pattern="yyyy-MM-dd HH:mm:ss" />
								</div>
								<div class="emdwp">${dto.productname}</div>
								<div class="emdtn">${dto.productioncount}</div>
								<div class="text1">${dto.performancecomment}</div>
								<div class="emdId">${dto.username}</div>
								<div style="display: flex; justify-content: center;">
									<!-- css안먹어서 그냥박아버림 -->
									<button class="tn" style="height: 26px;">수정</button>
									<!-- <form method="post" action="Performance">
									<input type="hidden" name="command" value="update">
									<input type="submit" value="수정">
								</form>-->
									<input type="hidden" name="performanceid" class="performId"
										value="${dto.performanceid}"> <input type="submit"
										value="삭제" style="height: 26px;" class="delete">
								</div>
							</form>
						</div>
					</c:forEach>

				</div>

				<div id="page-container" style="text-align: center;">
					<%
					int total = (Integer) request.getAttribute("totalCount");
					Performance_DTO dto = (Performance_DTO) request.getAttribute("dto");
					int pageNo = dto.getPage();
					int viewCount = dto.getViewCount();
					int lastPage = (int) Math.ceil((double) total / viewCount);

					int groupCount = 5; // 한번에 보여줄 페이지 개수
					int groupPosition = (int) Math.ceil((double) pageNo / groupCount);
					int begin = ((groupPosition - 1) * groupCount) + 1;
					//             int end = begin + groupCount - 1;
					int end = groupPosition * groupCount;
					if (end > lastPage) {
						end = lastPage;
					}
					%>

					<c:if test="<%=begin == 1%>">
                  [이전]
                </c:if>
					<c:if test="<%=begin != 1%>">
						<c:url var="prevLink" value="/performance">
							<c:param name="page" value="<%=String.valueOf(begin - 1)%>" />
							<c:if test="${not empty param.productname}">
								<c:param name="productname" value="${param.productname}" />
							</c:if>
							<c:if test="${not empty param.searchDateStart}">
								<c:param name="searchDateStart" value="${param.searchDateStart}" />
							</c:if>
							<c:if test="${not empty param.searchDateEnd}">
								<c:param name="searchDateEnd" value="${param.searchDateEnd}" />
							</c:if>
						</c:url>
						<a href=" ${ prevLink }">[이전]</a>
					</c:if>


					<c:forEach var="i" begin="<%=begin%>" end="<%=end%>">
						<c:if test="${i == dto.page }">
							<c:set var="clazz" value="bold" />
						</c:if>
						<c:if test="${ not (i == dto.page) }">
							<c:set var="clazz" value="" />
						</c:if>

						<c:url var="pageLink" value="/performance">
							<c:param name="page" value="${ i }" />
							<c:param name="productname" value="${ param.productname }" />
							<c:param name="searchDateStart"
								value="${ param.searchDateStart }" />
							<c:param name="searchDateEnd" value="${ param.searchDateEnd }" />
						</c:url>


						<a href="${pageLink}" class="${clazz}">${ i }</a>
					</c:forEach>


					<c:if test="<%=end == lastPage%>">
                  [다음]
               </c:if>
					<c:if test="<%=end != lastPage%>">
						<c:url var="nextLink" value="/performance">
							<c:param name="page" value="<%=String.valueOf(end + 1)%>" />

							<c:if test="${not empty param.productname}">
								<c:param name="productname" value="${param.productname}" />
							</c:if>
							<c:if test="${not empty param.searchDateStart}">
								<c:param name="searchDateStart" value="${param.searchDateStart}" />
							</c:if>
							<c:if test="${not empty param.searchDateEnd}">
								<c:param name="searchDateEnd" value="${param.searchDateEnd}" />
							</c:if>
						</c:url>
						<a href="${nextLink}">[다음]</a>
					</c:if>
				</div>
			</div>
		</div>
	</div>
	<script>
		
	</script>
</body>

</html>