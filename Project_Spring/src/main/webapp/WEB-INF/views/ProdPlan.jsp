<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, project.dto.ProductionPlan_DTO, project.dto.Products_DTO" %>

<%
/* 세션에서 데이터 가져오기 */
List<ProductionPlan_DTO> planList = (List<ProductionPlan_DTO>) session.getAttribute("planList");

/* 사용자 정보 */
String username = (String) session.getAttribute("username");
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>HHMES 생산관리</title>
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/prodplan.css">
<script src="js/prodplan.js"></script>
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
				<td><input type="text" name="Prodsearch" class="searchlayer">
					<input type="submit" class="submitlayer" value="Search"></td>
			</tr>
		</tbody>
	</table>

	<table class="name-layer">
		<tr class="menufacturer-info">
			<td class="menufacturer-info-list">
				<div class="menufacturer-info-name">생성인</div> 
				<input type="text" class="menufacturer-info-completion" value="<%= (username != null) ? username : "알 수 없음" %>" readonly>
			</td>
			<td class="menufacturer-info-list">
				<div class="menufacturer-info-name">생산기간</div> 
				<input type="text" class="menufacturer-info-completion" value="<%=(planList != null && !planList.isEmpty()) ? planList.get(0).getStartDate() + " ~ " + planList.get(0).getEndDate() : "데이터 없음"%>" readonly>
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
			<%
			if (planList != null) {
				for (ProductionPlan_DTO plan : planList) {
			%>
			<tr name="prodPlanList" class="order-info-content wolist" data-id="<%=plan.getPlanId()%>" data-pi="<%= plan.getProductId() %>">
				<td>
					<%=(plan.getProduct() != null) ? plan.getProduct().getProductname() : "데이터 없음"%>
					<%="["%><%=(plan.getProduct() != null) ? plan.getProduct().getSpec() : "데이터 없음"%>
					<%=(plan.getProduct() != null) ? plan.getProduct().getUnit() : "데이터 없음"%><%="]"%>
				</td>
				<td><%=(plan.getProduct() != null) ? plan.getProduct().getLotnumber() : "데이터 없음"%></td>
				<td><%=(plan.getProduct() != null) ? plan.getProduct().getUnit() : "데이터 없음"%></td>
				<td><%=(plan.getProduct() != null) ? plan.getProduct().getWarehouse() : "데이터 없음"%></td>
				<td><%=plan.getDeliveryDest()%></td>
				<td><%=(plan.getProduct() != null) ? plan.getProduct().getPartnumber() : "데이터 없음"%></td>
				<td><%=plan.getTotalqty()%></td>
				<td><%=plan.getCreateDate()%></td>
				<td><%=plan.getStartDate()%></td>
				<td><%=plan.getEndDate()%></td>
				<td><a>MRP 계산</a></td>
				<td><%=plan.getPlanStatus()%></td>
				<td><%=plan.getPlanCause()%></td>
				<td><%=plan.getPlanNotes()%></td>
			</tr>
			<%
				}
			} else {
			%>
			<tr><td colspan="14">데이터가 없습니다.</td></tr>
			<%
			}
			%>
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
</body>
</html>
