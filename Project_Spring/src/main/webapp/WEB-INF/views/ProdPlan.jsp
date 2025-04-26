<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>HHMES 생산관리</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/reset.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/prodplan.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
				<div class="menufacturer-info-name">생성인</div> <c:choose>
					<c:when test="${not empty username}">
						<input type="text" class="menufacturer-info-completion"
							value="${username}" readonly />
					</c:when>
					<c:otherwise>
						<input type="text" class="menufacturer-info-completion"
							value="알 수 없음" readonly />
					</c:otherwise>
				</c:choose>

			</td>
			<td class="menufacturer-info-list">
				<div class="menufacturer-info-name">생산기간</div> <c:choose>
					<c:when test="${not empty planList}">
						<input type="text" class="menufacturer-info-completion"
							value="${planList[0].startDate} ~ ${planList[0].endDate}"
							readonly>
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
		<tbody class="tb1">
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
				<td>명령</td>
			</tr>

			<c:choose>
				<c:when test="${not empty planList}">
					<c:forEach var="plan" items="${planList}">
						<tr name="prodPlanList" class="order-info-content wolist" data-id="${plan.productId}" data-pi="${plan.planId}">
<td class="productname">
    <p>${plan.product.productname}[${plan.product.spec}${plan.product.unit}]</p>
    <select name="productname" style="display: none;">
        <c:forEach var="product" items="${productList}">
            <option value="${product.productname}">
                ${product.productname}[${product.spec}${product.unit}]
            </option>
        </c:forEach>
    </select>
</td>

							<td class="lotnumber">
								<p>${plan.product.lotnumber}</p> <input type="text" name="lotnumber" value="${plan.product.lotnumber}" style="display: none;" />
							</td>
							<td class="unit">
								<p>${plan.product.unit}</p> <input type="text" name="unit" value="${plan.product.unit}" style="display: none;" />
							</td>
							<td class="warehouse">
								<p>${plan.product.warehouse}</p> <input type="text"
								name="warehouse" value="${plan.product.warehouse}"
								style="display: none;" />
							</td>
							<td class="deliveryDest">
								<p>${plan.deliveryDest}</p> <input type="text"
								name="deliveryDest" value="${plan.deliveryDest}"
								style="display: none;" />
							</td>
							<td class="partnumber">
								<p>${plan.product.partnumber}</p> <input type="text"
								name="partnumber" value="${plan.product.partnumber}"
								style="display: none;" />
							</td>
							<td class="totalqty">
								<p>${plan.totalqty}</p> <input type="text" name="totalqty"
								value="${plan.totalqty}" style="display: none;" />
							</td>
							<td class="createDate">
								<p>${plan.createDate}</p> <input type="text" name="createDate"
								value="${plan.createDate}" style="display: none;" />
							</td>
							<td class="startDate">
								<p>${plan.startDate}</p> <input type="text" name="startDate"
								value="${plan.startDate}" style="display: none;" />
							</td>
							<td class="endDate">
								<p>${plan.endDate}</p> <input type="text" name="endDate"
								value="${plan.endDate}" style="display: none;" />
							</td>
							<td><a>MRP 계산</a></td>
							<td class="planStatus">
								<p>${plan.planStatus}</p> <input type="text" name="planStatus"
								value="${plan.planStatus}" style="display: none;" />
							</td>
							<td class="planCause">
								<p>${plan.planCause}</p> <input type="text" name="planCause"
								value="${plan.planCause}" style="display: none;" />
							</td>
							<td class="planNotes">
								<p>${plan.planNotes}</p> <input type="text" name="planNotes"
								value="${plan.planNotes}" style="display: none;" />
							</td>
							<td class="insdellayer">
									<button type="button" class="list-btn mdf-btn ins" id="mdf-btn">수정</button>

								<form
									action="${pageContext.request.contextPath}/prodplan/delete"
									method="post" onsubmit="return confirm('정말 삭제하시겠습니까?');"
									class="list-btn del">
									<input type="hidden" name="planId" value="${plan.planId}" /> <input
										type="submit" value="삭제" />
								</form>

								<form class="list-btn comp">
									<input type="hidden" name="planId" /><button type="button" class="com" id="comp-btn">확인</button>
								</form>

								<button type="button" class="list-btn cancel-btn" id="cancel-btn">취소</button>
							</td>
						</tr>


					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="14">데이터가 없습니다.</td>
						<td data-original-value="${plan.product.productname}"><c:choose>
								<c:when test="${not empty plan.product}">${plan.product.productname}</c:when>
								<c:otherwise>데이터 없음</c:otherwise>
							</c:choose></td>
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
					<button type="button" class="WO-buttonlist newProdPlan-btn">상품계획생성</button>
					<button type="button" class="WO-buttonlist workOrder-btn">
						<!-- 스타일로 버튼처럼 보이게 처리하는 게 좋아요 -->
						<a href="${pageContext.request.contextPath}/prodplan/workorder"
							class="workorder-a">작업지시서</a>
					</button>
				</td>
			</tr>
		</tfoot>
	</table>
	<script
		src="${pageContext.request.contextPath}/resources/js/prodplan.js"></script>
	<script>
	
	// 예시로 미리 상품 리스트 배열을 만든다고 치자
	const productList = [
	    { name: "상품A", spec: "규격A", unit: "kg" },
	    { name: "상품B", spec: "규격B", unit: "g" },
	    { name: "상품C", spec: "규격C", unit: "개" }
	];

	document.querySelectorAll('.product-input').forEach(input => {
	    input.addEventListener('click', function(e) {
	        const listDiv = this.nextElementSibling; // input 바로 다음 div
	        listDiv.innerHTML = ''; // 기존 리스트 초기화

	        productList.forEach(product => {
	            const item = document.createElement('div');
	            item.textContent = `${product.name}[${product.spec}${product.unit}]`;
	            item.style.padding = '5px';
	            item.style.cursor = 'pointer';

	            item.addEventListener('click', () => {
	                input.value = product.name;
	                listDiv.style.display = 'none';
	            });

	            listDiv.appendChild(item);
	        });

	        listDiv.style.display = 'block';
	    });
	});

	// 외부 클릭 시 목록 숨기기
	document.addEventListener('click', function(e) {
	    if (!e.target.classList.contains('product-input')) {
	        document.querySelectorAll('.product-list').forEach(list => {
	            list.style.display = 'none';
	        });
	    }
	});

	
	// 생성
    $(document).ready(function () {
        $(document).on('click', '.newProdPlan-btn', function () {
            let $tbody = $('.tb1');
            let newRow = `
                <tr class="order-info-content wolist">
                    <td><input type="text" class="productNameInput" placeholder="상품명" /></td>
                    <td><input type="text" class="lotNumberInput" placeholder="품목코드" /></td>
                    <td><input type="text" class="unitInput" placeholder="단위" /></td>
                    <td><input type="text" class="warehouseInput" placeholder="보관" /></td>
                    <td><input type="text" class="deliveryDestInput" placeholder="납품업체" /></td>
                    <td><input type="text" class="partNumberInput" placeholder="창고위치" /></td>
                    <td><input type="text" class="totalQtyInput" placeholder="생산수량" /></td>
                    <td><input type="text" class="createDateInput" placeholder="작업계획생성일" /></td>
                    <td><input type="text" class="startDateInput" placeholder="생산시작일" /></td>
                    <td><input type="text" class="endDateInput" placeholder="생산종료일" /></td>
                    <td><a>MRP 계산</a></td>
                    <td><input type="text" class="planStatusInput" placeholder="생산계획현황" /></td>
                    <td><input type="text" class="planCauseInput" placeholder="생산사유" /></td>
                    <td><input type="text" class="planNotesInput" placeholder="비고" /></td>
                    <td class="insdellayer">
					<form action="${pageContext.request.contextPath}/prodplan/insert" method="post" class="list-btn com">
					<input type="hidden" name="planId" value="${plan.planId}"  onsubmit="return confirm('상품 생산계획을 작성하시겠습니까?');"/> 
					<input type="submit" value="생성" />
				</form> 
				<form action="${pageContext.request.contextPath}/prodplan/insert" method="post" onsubmit="return confirm('정말 취소하시겠습니까?');" class="list-btn cancel">
					<input type="hidden" name="planId" value="${plan.planId}" /> <input type="submit" value="취소" />
				</form>
				</td>
                </tr>
            `;
            $tbody.append(newRow);
        });
    });

// 수정
document.querySelectorAll('.ins').forEach(button => {
    button.addEventListener('click', function() {
        const tr = this.closest('tr');
        editRow(tr);
    });
});

// 취소
document.querySelectorAll('.cancel-btn').forEach(button => {
    button.addEventListener('click', function() {
        const tr = this.closest('tr');
        cancelRow(tr);
    });
});

function editRow(trElement) {
    const pTags = trElement.querySelectorAll('p');
    const originalValues = [];

    // p 태그들의 원래 값 저장
    pTags.forEach(p => {
        originalValues.push(p.textContent.trim());
    });

    // p 태그 숨기고, input 또는 select 보이기
    pTags.forEach((p, index) => {
        p.style.display = 'none';

        const nextElement = p.nextElementSibling;
        if (nextElement && (nextElement.tagName === 'INPUT' || nextElement.tagName === 'SELECT')) {
            nextElement.style.display = 'inline';
            // input이면 value 설정, select면 selectedIndex 맞추는 처리도 가능
            if (nextElement.tagName === 'INPUT') {
                nextElement.value = originalValues[index];
            }
            // select는 따로 선택된 값 세팅 안 해줘도 돼. (기본값 세팅되어 있다고 가정)
        }
    });

    // 버튼 토글
    const editButton = trElement.querySelector('.ins');
    const deleteButton = trElement.querySelector('.del');
    const confirmButton = trElement.querySelector('.comp');
    const cancelButton = trElement.querySelector('.cancel-btn');

    if (editButton) editButton.style.display = 'none';
    if (deleteButton) deleteButton.style.display = 'none';
    if (confirmButton) confirmButton.style.display = 'inline';
    if (cancelButton) cancelButton.style.display = 'inline';
}

function cancelRow(trElement) {
    const pTags = trElement.querySelectorAll('p');

    // p 태그 다시 보이고 input/select 숨기기
    pTags.forEach(p => {
        p.style.display = 'inline';

        const nextElement = p.nextElementSibling;
        if (nextElement && (nextElement.tagName === 'INPUT' || nextElement.tagName === 'SELECT')) {
            nextElement.style.display = 'none';
        }
    });

    // 버튼 토글
    const editButton = trElement.querySelector('.ins');
    const deleteButton = trElement.querySelector('.del');
    const confirmButton = trElement.querySelector('.comp');
    const cancelButton = trElement.querySelector('.cancel-btn');

    if (editButton) editButton.style.display = 'inline';
    if (deleteButton) deleteButton.style.display = 'inline';
    if (confirmButton) confirmButton.style.display = 'none';
    if (cancelButton) cancelButton.style.display = 'none';
}


function cancelRow(trElement) {
    // tr 안의 모든 p 태그 가져오기
    const pTags = trElement.querySelectorAll('p');

    // 모든 input 태그 숨기고 p 태그 다시 보이게 처리
    pTags.forEach(p => { p.style.display = 'inline';
        // 해당 p에 대응하는 input을 숨김
        const input = p.nextElementSibling;  if (input && input.tagName === 'INPUT') { input.style.display = 'none'; } });
    // 수정, 삭제 버튼 보이게 하고 확인, 취소 버튼 숨기기
    const editButton = trElement.querySelector('.ins'); const deleteButton = trElement.querySelector('.del'); const confirmButton = trElement.querySelector('.comp'); const cancelButton = trElement.querySelector('.cancel-btn');
    if (editButton) editButton.style.display = 'inline';  if (deleteButton) deleteButton.style.display = 'inline'; if (confirmButton) confirmButton.style.display = 'none';  if (cancelButton) cancelButton.style.display = 'none'; 
}

	//삭제
	function deleteRow(button) { var row = button.closest('tr'); row.parentNode.removeChild(row);  }

	// 상품명 클릭 시 product 리스트 조회
	$(document).on('click', '.productNameInput', function () {
		let $input = $(this);

		// 이전 검색결과 테이블을 지우기
		$('.search-result-table').remove();

		// 상품 검색박스 추가
		let searchBox = $('<input type="text" class="product-search-box" placeholder="상품명 검색">');
		searchBox.insertAfter($input).focus();

		// 검색박스에 키입력 시 상품명 검색
		searchBox.on('keyup', function () {
			let searchTerm = $(this).val();

			if (searchTerm.length > 1) {
				$.ajax({
					url: '/project/prodplan/products',
					method: 'GET',
					data: { searchTerm: searchTerm },
					success: function (data) {
						let $table = $('<table class="search-result-table"></table>');
						$table.append('<tr><th>상품명</th><th>규격</th><th>단위</th><th>창고</th></tr>');

						data.forEach(item => {
							$table.append(
								`<tr class="product-item" data-id="${item.product.productId}">
									<td>${item.product.productname}</td>
									<td>${item.product.spec}</td>
									<td>${item.product.unit}</td>
									<td>${item.product.warehouse}</td>
								</tr>`
							);
						});

						// 검색결과 테이블 표시
						$table.insertAfter(searchBox);
					}
				});
			}
		});
	});

</script>
</body>
</html>
