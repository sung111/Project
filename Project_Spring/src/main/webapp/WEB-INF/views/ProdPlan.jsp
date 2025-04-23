<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>HHMES 생산관리</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/prodplan.css">

</head>
<body>
	<table class="search-container">
		<thead>
			<tr>
				<td class="search-contaoner-name">전체 상품 생산계획</td>
				<td class="search-contaoner-name">일정별 상품 생산계획</td>
			</tr>
		</thead>
		<tbody>
			<tr class="search-table">
				<td class="ProdPlanbtnList">
					<button class="ProdPlanbtn">일간</button>
					<button class="ProdPlanbtn">주간</button>
					<button class="ProdPlanbtn">월간</button>
				</td>
				<td class="ProdPlanbtnList">
					<button class="ProdPlanbtn">일간</button>
					<button class="ProdPlanbtn">주간</button>
					<button class="ProdPlanbtn">월간</button>
				</td>
			</tr>
			<tr class="submitcontainer">
				<td>
					<input type="text" name="Prodsearch" class="searchlayer">
					<input type="submit" class="submitlayer" value="Search">
				</td>
			</tr>
		</tbody>
	</table>

	<table class="name-layer">
		<tr class="menufacturer-info">
			<td class="menufacturer-info-list">
				<div class="menufacturer-info-name">생성인</div>
				<c:choose>
  <c:when test="${not empty username}">
    <input type="text" class="menufacturer-info-completion" value="${username}" readonly />
  </c:when>
  <c:otherwise>
    <input type="text" class="menufacturer-info-completion" value="알 수 없음" readonly />
  </c:otherwise>
</c:choose>

			</td>
<td class="menufacturer-info-list">
	<div class="menufacturer-info-name">생산기간</div>
	<c:choose>
		<c:when test="${not empty planList}">
			<input type="text" class="menufacturer-info-completion"
				   value="${planList[0].startDate} ~ ${planList[0].endDate}" readonly>
		</c:when>
		<c:otherwise>
			<input type="text" class="menufacturer-info-completion"
				   value="데이터 없음" readonly>
		</c:otherwise>
	</c:choose>
</td>

		</tr>
	</table>

	<table class="new-workorder">
		<tbody>
			<tr class="order-info-list">
				<td>품명[규격]</td>
				<td>품목코드</td>
				<td>단위</td>
				<td>보관</td>
				<td>납품업체</td>
				<td>창고위치</td>
				<td>생산수량</td>
				<td>작업계획생성일</td>
				<td>생산시작일</td>
				<td>생산종료일</td>
				<td>MRP계산</td>
				<td>생산계획현황</td>
				<td>생산사유</td>
				<td>비고</td>
			</tr>

<c:choose>
  <c:when test="${not empty planList}">
    <c:forEach var="plan" items="${planList}">
      <tr name="prodPlanList" class="order-info-content wolist" data-id="${plan.productId}" data-pi="${plan.productId}">
        <td>
          <c:choose>
            <c:when test="${not empty plan.product}">
              ${plan.product.productname}[${plan.product.spec}${plan.product.unit}]
            </c:when>
            <c:otherwise>데이터 없음</c:otherwise>
          </c:choose>
        </td>
        <td>${plan.product.lotnumber}</td>
        <td>${plan.product.unit}</td>
        <td>${plan.product.warehouse}</td>
        <td>${plan.deliveryDest}</td>
        <td>${plan.product.partnumber}</td>
        <td>${plan.totalqty}</td>
        <td>${plan.createDate}</td>
        <td>${plan.startDate}</td>
        <td>${plan.endDate}</td>
        <td><a>MRP 계산</a></td>
        <td>${plan.planStatus}</td>
        <td>${plan.planCause}</td>
        <td>${plan.planNotes}</td>
      </tr>
    </c:forEach>
  </c:when>
  <c:otherwise>
    <tr>
      <td colspan="14">데이터가 없습니다.</td>
    </tr>
  </c:otherwise>
</c:choose>
		</tbody>

		<tfoot>
			<tr>
				<td colspan="14">
					<div id="pagination-container"></div>
				</td>
				<td colspan="14" class="order-buttonlayer">
					<button type="button" class="WO-buttonlist">수정</button>
					<button type="button" class="WO-buttonlist">삭제</button>
					<button type="button" class="WO-buttonlist">상품계획생성</button>
					<button type="button" class="WO-buttonlist">작업지시서</button>
				</td>
			</tr>
		</tfoot>
	</table>

<script src="${ pageContext.request.contextPath }/resources/js/prodplan.js"></script>
</body>

</html>
