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
<title>재고현황조회</title>
<link rel="stylesheet" href="css\reset.css">
<link rel="stylesheet" href="css\Inventorycheck.css">
</head>

<body>
	<div class="box">
		<!--제목 -->
		<h1>재고 현황 조회</h1>
	</div>
	<div class="box">
		<div class="container">
			<label for="inventoryType">재고 유형 <select id="inventoryType">
					<option>선택</option>
					<option>원자재</option>
					<option>완제품</option>
					<option>LOT</option>
					<option>바코드</option>
					<option>입고 날짜</option>
					<option>출고 날짜</option>
			</select>
			</label> <label for="warehouse">창고 <select id="warehouse">
					<option>선택</option>
					<option>냉동 창고</option>
					<option>냉장 창고</option>
					<option>실온 창고</option>
			</select>
			</label>
			<div class="item">
				<label for="search" class="search">통합 검색</label> <input type="text"
					id="search" placeholder="검색어를 입력하세요.">
			</div>
			<div class="item">
				<button type="button" class="check">조회</button>
			</div>
		</div>
	</div>

	<div class="list">
		<div class="listbtn">
			<button type="button" id="addinven">재고 등록</button>
		</div>
		<table class="itemlist">
			<thead>
				<tr>
					<th>LOT NO</th>
					<th>품목</th>
					<th>품번</th>
					<th>재고 수량</th>
					<th>단위</th>
					<th>입고일</th>
					<th>유효기간</th>
					<th>관리</th>
					<!-- <th>제품 유형</th> -->
				</tr>
			</thead>
			<tbody id="inventoryTableBody">
				<c:forEach var="dto" items="${resultList}">
					<tr>
						<td>${ dto.maLotNo }</td>
						<td>${ dto.materialname }</td>
						<td>${ dto.maPartNum }</td>
						<td>${ dto.maQuantity }</td>
						<td>${ dto.maUnit }</td>
						<td>${ dto.receiptDate }</td>
						<td>${ dto.maExpDate }</td>
						<td>
							<form>
								<button class="modify" style="width: 55px; height: 35px;">수정</button>
								<input type="hidden" name="command" value="delete"> <input
									type="submit" name="delete" value="삭제" id="del"
									style="width: 55px; height: 35px;">
							</form>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>



	<div id="popup" class="popup">
		<div class="popup-content">
			<span class="close" onclick="closePopup()">&times;</span>
			<h2>재고 등록</h2>
			<form>
				<table class="addtable">
					<thead>
						<tr>
							<th>항목</th>
							<th>내용</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>LOT NO</td>
							<td><input type="text" id="addlotno"
								placeholder="LOT NO를 입력하세요."></td>
						</tr>
						<tr>
							<td>품목</td>
							<td><input type="text" id="additem" placeholder="품목을 입력하세요."></td>
						</tr>
						<tr>
							<td>품번</td>
							<td><input type="text" id="additemno"
								placeholder="품번을 입력하세요."></td>
						</tr>
						<tr>
							<td>재고 수량</td>
							<td><input type="text" id="addquantity"
								placeholder="재고 수량을 입력하세요."></td>
						</tr>
						<tr>
							<td>단위</td>
							<td>
								<div class="unit-container">
									<input type="text" id="addunit" placeholder="단위를 입력하세요."
										class="unit-input"> <select id="unitDropdown"
										class="unit-dropdown">
										<option value="g">g</option>
										<option value="kg">kg</option>
										<option value="ml">ml</option>
										<option value="캔">캔</option>
										<option value="개">개</option>
									</select>
								</div>
							</td>
						</tr>
						<tr>
							<td>제품 유형</td>
							<td>
								<div class="unit-container">
									<select id="itemtype" class="itemtype">
										<option value="완제품">완제품</option>
										<option value="원자재">원자재</option>
									</select>
								</div>
							</td>
						</tr>
						<tr>
							<td>입고일</td>
							<td><input type="date" id="addin_date" name="in_date"></td>
						</tr>
						<tr>
							<td>유효기간</td>
							<td><input type="date" id="addexp_date" name="exp_date"></td>
						</tr>
					</tbody>
				</table>
				<div class="addbtn">
					<button type="button">등록</button>
				</div>
			</form>
		</div>
	</div>

	<script>
		// 팝업 열기 (재고 등록)
		document.getElementById('addinven').onclick = function() {
			// 모든 입력 칸 비우기
			document.getElementById('addlotno').value = '';
			document.getElementById('additem').value = '';
			document.getElementById('additemno').value = '';
			document.getElementById('addquantity').value = '';
			document.getElementById('addunit').value = '';
			document.getElementById('addin_date').value = '';
			document.getElementById('addexp_date').value = '';
			document.getElementById('itemtype').value = '';

			editingIndex = null; // 수정 모드 초기화

			document.getElementById('popup').style.display = 'block';
		};

		// 팝업 닫기
		function closePopup() {
			document.getElementById('popup').style.display = 'none';
		}
	</script>
</body>

</html>