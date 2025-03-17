<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.sql.*, java.util.List, dao.ProductionPlan_DAO, dto.ProductionPlan_DTO "%>
	<!-- , dto.Products_DTO -->
<%
ProductionPlan_DAO dao = new ProductionPlan_DAO();
List<ProductionPlan_DTO> planList = dao.getAllProductionPlans();
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
				<td class="search-contaoner-name">전체 상품 생성계획</td>
				<td class="search-contaoner-name">일정별 상품 생산계획</td>
			</tr>
		</thead>
		<tbody>
			<tr class="search-table">
				<td>
					<button>일간</button>
					<button>주간</button>
					<button>월간</button>
				</td>
				<td>
					<button>일간</button>
					<button>주간</button>
					<button>월간</button>
				</td>
			</tr>
			<tr class="submitcontainer">
				<td><input type="text" name="Prodsearch" class="searchlayer">
					<input type="submit" class="submitlayer" value="Search"></td>
			</tr>
		</tbody>
		<tfoot></tfoot>
	</table>
	<table class="name-layer">
		<tr class="menufacturer-info">
			<td class="menufacturer-info-list">
				<div class="menufacturer-info-name">생성인</div> <input type="text"
				name="delivery" class="menufacturer-info-completion">
			</td>
			<td class="menufacturer-info-list">
				<div class="menufacturer-info-name">생산기간</div> <input type="text"
				name="writer" class="menufacturer-info-completion">
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
			for (ProductionPlan_DTO plan : planList) {
			%>
			<tr name="prodPlanList" class="order-info-content wolist">
				<td>
				 <%= (plan.getProduct() != null) ? plan.getProduct().getProductname() : "데이터 없음" %> 
				</td>
				<td><%=plan.getUserId()%></td>
				<td>
				 <%= (plan.getProduct() != null) ? plan.getProduct().getUnit() : "데이터 없음" %> 
				</td>
				<td>
				 <%= (plan.getProduct() != null) ? plan.getProduct().getWarehouse() : "데이터 없음" %> 
				</td>
				 <td>
				 <%=plan.getDeliveryDest()%>
				 </td> 
				<td></td>
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
			%>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="13">
					<div class="order-buttonlayer-pagenation" id="pagination-container">
						<!-- 원래 정적으로 동작한 pagenation -->
						<!-- <a><img src="img/lefticon.png" alt="pagenationleft"
							class="pagenationicon"></a> <a>1</a> <a>2</a> <a>3</a> <a>4</a>
						<a>5</a> <a>6</a> <a>7</a> <a>8</a> <a>9</a> <a>10</a> <a><img
							src="img/righticon.png" alt="pagenationright"
							class="pagenationicon"></a> -->
					</div>
				</td>
				<td colspan="13" class="order-buttonlayer">
					<button type="button" name="prodPlan-Modify" id="prodPlan-Modify"
						class="WO-buttonlist">수정</button>
					<button type="button" name="prodPlan-delete" id="prodPlan-delete"
						class="WO-buttonlist">삭제</button>
					<button type="button" name="new-ProdPlan" id="new-ProdPlan"
						class="WO-buttonlist">상품계획생성</button>
					<button type="button" name="WO-select" id="WO-select"
						class="WO-buttonlist">작업지시서</button>
				</td>
			</tr>
		</tfoot>
	</table>
</body>
</html>