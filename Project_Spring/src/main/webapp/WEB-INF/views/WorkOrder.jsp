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
<title>HHMES 작업지시서</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/workorder.css">
<!-- js -->
<script src="js/workorder.js"></script>
</head>

<body>
	<form class="productinfo">
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
			</table>
		</div>
	</form>
</body>

</html>