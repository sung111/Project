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
<title>재고현황조회</title>
<link rel="stylesheet" href="resources\css\Inventorycheck.css">
<script src="resources/js/Inventory.js"></script>
</head>

<body>
	<div class="box">
		<h1>재고 현황 조회</h1>
	</div>
	<div class="box">
		<form class="container" style="font-size: 15px;" method="GET"
			action="inven" id="selectForm">
			<label for="inventoryType">제품 유형 :<select id="inventoryType"
				name="searchType">
					<option value="" ${param.searchType == '' ? 'selected' : ''}>전체</option>
					<option value="원자재" ${param.searchType == '원자재' ? 'selected' : ''}>원자재</option>
					<option value="완제품" ${param.searchType == '완제품' ? 'selected' : ''}>완제품</option>
					<option value="용기" ${param.searchType == '용기' ? 'selected' : ''}>용기</option>
			</select>
			</label> <label for="warehouse">검색 방식 :<select id="warehouse"
				name="searchWay">
					<option value="" ${param.searchWay == ''  ? 'selected' : ''}>전체</option>
					<option value="품명" ${param.searchWay == '품명'  ? 'selected' : ''}>품명</option>
					<option value="품번" ${param.searchWay == '품번'  ? 'selected' : ''}>품번</option>
					<option value="LotNo" ${param.searchWay == 'LotNo'  ? 'selected' : ''}>Lot No</option>
					<option value="입고일" ${param.searchWay == '입고일'  ? 'selected' : ''}>입고일</option>
					<option value="유효기간" ${param.searchWay == '유효기간'  ? 'selected' : ''}>유효기간</option>
			</select>
			</label>
			<div class="item">
				<label for="search" class="search">검색 : </label> <input type="text"
					id="search" name="search" placeholder="검색어를 입력하세요." value=${param.search}>
					<div class="go hide">
						<div class="searchDateBox" id="searchDateBox">
							<input type="date" name="dateStart" id="receiptDate" disabled style="font-size: 16px;"
							value="${ param.dateStart }">  ~  
							<input type="date" id="expDate" name="dateEnd" disabled style="font-size: 16px;"
							value="${ param.dateEnd }">
						</div>
					</div>
			</div>
			<div class="item">
				<button type="submit" class="check">조회</button>
			</div>
		</form>
	</div>

	<div class="list">
		<div class="listhead">
			<button type="button" id="addinven" style="font-size: 15px;">재고
				등록</button>
		</div>
		<table class="itemlist">
			<thead>
				<tr>
					<th>LOT NO</th>
					<th>품명</th>
					<th>제품유형</th>
					<th>품번</th>
					<th style="width: 8%;">재고 수량</th>
					<th>규격</th>
					<th>단위</th>
					<th>입고일</th>
					<th>유효기간</th>
					<th colspan="2">관리</th>
				</tr>
			</thead>
			<tbody id="inventoryTableBody">
<!-- 			리스트 보여주기 -->
				<c:forEach var="dto" items="${list}">
					<tr>
						<td id="lotNo">${ dto.lotnumber }</td>
						<td id="materialname">${ dto.productname }</td>

						<td id="dbgud">
							<c:choose>
								<c:when test="${fn:substring(dto.lotnumber, 0, 3)== 'ING' }">
									원자재
								</c:when>
								<c:when test="${fn:substring(dto.lotnumber, 0, 3)== 'WPD' }">
									완제품
								</c:when>
								<c:when test="${fn:substring(dto.lotnumber, 0, 3)== 'PKG' }">
									용기
								</c:when>
								<c:otherwise>
									기타
								</c:otherwise>
							</c:choose>
						</td>

						<td id="maPartNum">${ dto.partnumber }</td>
						<td id="maQuantity">${ dto.quantity }</td>
						<td id="maSpec">${ dto.spec }</td>
						<td id="maUnit">${ dto.unit }</td>
						<td id="receiptDate">${ dto.makeDate }</td>
						<td id="maExpDate">${ dto.expDate }</td>
						<td>
							<form method="post" action="invenDelete" id="updateForm1"
								class="delFrom">
								<button type="button" class="modify" style="width: 55px; height: 35px;">수정</button>
								<input
									type="submit" name="delete" value="삭제" id="del" class="del"
									style="width: 55px; height: 35px;">
								<input
									type="hidden" name="productinvenid" value="${ dto.productinvenid }" id="productinvenid"
									>
								<input
									type="hidden" name="lotnumber" value="${ dto.lotnumber }"
									>
							</form>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>


<!-- 		페이지네이션 -->
		<div id="page-container">
			<%
			int total = (Integer)request.getAttribute("totalCount");
			InvenCheck_DTO dto = (InvenCheck_DTO)request.getAttribute("dto");
			int pageNo = dto.getPage();
			int viewCount = dto.getViewCount();
			// 1401 / 10 = 140.1 올림해서 141
			int lastPage = (int) Math.ceil((double) total / viewCount);

			int groupCount = 5; // 한번에 보여줄 페이지 개수
			int groupPosition = (int) Math.ceil((double) pageNo / groupCount);
			int begin = ((groupPosition - 1) * groupCount) + 1;
			//             int end = begin + groupCount - 1;
			int end = groupPosition * groupCount;
			if (end > lastPage){
				end = lastPage;
			}
			%>
			
			<c:if test="<%=begin == 1%>">
                  [이전]
               </c:if>
			<c:if test="<%=begin != 1%>">
				<a href="inven?page=<%=begin - 1%>">[이전]</a>
			</c:if>
			
			
			<c:forEach var="i" begin="<%=begin%>" end="<%=end%>">
				<c:if test="${i == dto.page }">
					<c:set var="clazz" value="bold" />
				</c:if>
				<c:if test="${ not (i == dto.page) }">
					<c:set var="clazz" value="" />
				</c:if>
				
				<c:url var="pageLink" value="inven">
					<c:param name="page" value="${ i }" />
					<c:param name="searchType" value="${ param.searchType }" />
					<c:param name="searchWay" value="${ param.searchWay }" />
					<c:param name="search" value="${ param.search }" />
					<c:param name="dateStart" value="${ param.dateStart }" />
					<c:param name="dateEnd" value="${ param.dateEnd }" />
				</c:url>
				
				
				<a href="${ pageLink }" class="${clazz}">${ i }</a>
			</c:forEach>


			<c:if test="<%=end == lastPage%>">
                  [다음]
               </c:if>
			<c:if test="<%=end != lastPage%>">
				<a href="inven?page=<%=end + 1%>">[다음]</a>
			</c:if>
		</div>
	</div>



	<div id="popups1" class="popups1">
		<div class="popup-content">
			<span class="close" onclick="closePopup()">&times;</span>
			<h1>재고 등록</h1>
			<form method="post" action="matInsertInven" id="inputForm">
				<input type="hidden" name="command" value="inputForm">
				<table class="addtable">
					<thead>
						<tr>
							<th>항목</th>
							<th>내용</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>품명</td>
							<td>
								<input type="text" id="additem" placeholder="품명을 입력하세요."
									class="popInput" list="suggestions" name="name">
								<input type="hidden" id="hiddenInventoryId" name="inventoryid">
								<datalist id="suggestions">
									<c:forEach var="dto" items="${matDB}">
										<option value="${dto.optionMaterialname}"
											data-id="${dto.optionMaterialid}" data-type="원자재"></option>
									</c:forEach>
									<c:forEach var="dto" items="${prodDB}">
										<option value="${dto.optionProductname}" data-id="${dto.optionProductid}"
											data-type="완제품"></option>
									</c:forEach>
								</datalist>
							</td>
						</tr>
						<tr>
							<td>입고 수량</td>
							<td>
								<input type="number" id="addquantity" name="quantity"
									placeholder="입고 수량을 입력하세요." class="popInput"
									style="width: 90%; text-align: center;">
							</td>
						</tr>
						<tr>
							<td>제품 유형</td>
							<td>
								<div class="unit-container">
									<select id="itemtype" class="itemtype popInput" name="type">
										<option value="">선택</option>
										<option value="완제품">완제품</option>
										<option value="원자재">원자재</option>
									</select>
								</div>
							</td>
						</tr>
						<tr>
							<td>입고일</td>
							<td>
								<input type="date" id="addin_date" name="receiptDate"
									class="popInput">
							</td>
						</tr>
					</tbody>
				</table>
				<div class="addbtn">
					<input type="submit" value="등록" id="insertBtn"
						style="font-size: 20px; background: #ccc; padding: 10px; margin: 10px; width: 100px; border: 1px solid #15579e;">
				</div>
			</form>
		</div>
	</div>

	<script>

	</script>
</body>

</html>