<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>OOOOO 생산 정보</title>
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/workorder.css">
<!-- js -->
<script src="js/workorder.js"></script>
</head>

<body>
	<div class="productinfo">
		<table>
			<tr class="productinfo-info">
				<td class="productinfo-info-list">
					<div class="productinfo-info-name">LOTNO.</div> <input type="text"
					class="productinfo-info-completion" id="lotno"
					alt="productinfo-LOTNO" readonly>
				</td>
				<td class="productinfo-info-list">
					<div class="productinfo-info-name">단위</div> <input type="text"
					class="productinfo-info-completion" id="danwi" alt="productinfo-단위"
					readonly>
				</td>
				<td class="productinfo-info-list">
					<div class="productinfo-info-name">품명[규격]</div> <input type="text"
					class="productinfo-info-productname" alt="productinfo-품명[규격]">
<ul id="finishi-list" class="finishi-list">
    <li>
    <%-- ${workOrder.product.productname} [${workOrder.product.spec} ${workOrder.product.unit}] --%>
            ${workOrder.product.productname != null ? workOrder.product.productname : "상품명 없음"}
        [${workOrder.product.spec != null ? workOrder.product.spec : "규격 없음"}]
        ${workOrder.product.unit != null ? workOrder.product.unit : "단위 없음"}
    </li>
    
</ul>
					<button type="button" class="productsearch" alt="조회">조회</button>
				</td>
				<td class="productinfo-info-list">
					<div class="productinfo-info-name">제작 수량</div>
					<input type="text" class="productinfo-info-completion"
					alt="productinfo-제작수량" readonly>
				</td>
			</tr>
		</table>
		<div class="material-info">
			<table>
				<tr class="material-info-tag">
					<th>명칭</th>
					<th>LOT/NO</th>
					<th>투입단위</th>
					<th>재고수량</th>
					<th>공급업체</th>
					<th>창고위치</th>
					<th>관리사항</th>
				</tr>
			</table>
		</div>
		<div class="check-info">
			<table>
				<tr class="check-info-title">
					<th>제조 과정</th>
				</tr>
				<tr class="check-info-process">
					<td>
						<!-- 제조과정 --> <iframe id="processFrame"
							src="production_process.html" style="display: none;"></iframe>
					</td>
				</tr>
				<tr class="check-info-buttoncontainer">
					<td class="check-info-buttonlayer">
						<button type="button" class="check-info-close">나가기</button>
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>

</html>