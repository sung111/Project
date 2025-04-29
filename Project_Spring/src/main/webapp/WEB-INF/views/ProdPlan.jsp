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
				<div class="menufacturer-info-name">생성인</div> <input type="text"
				id="creator" name="creator" class="menufacturer-info-completion"
				value="${not empty username ? username : ''}" readonly />
			</td>

			<td class="menufacturer-info-list">
				<div class="menufacturer-info-name">생산기간</div> <input type="text"
				id="productionPeriod" name="productionPeriod"
				class="menufacturer-info-completion" value="" readonly />
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
						<tr name="prodPlanList" class="order-info-content wolist"
							data-id="${plan.productId}" data-pi="${plan.planId}"
							data-username="${plan.userId}" data-startdate="${plan.startDate}"
							data-enddate="${plan.endDate}">

<td class="productname">
    <p id="productDisplay">${plan.product.productname}[${plan.product.spec}${plan.product.unit}]</p>
    <input type="hidden" name="productname" id="productnameInput" value="${plan.product.productname}">
    <input type="text" id="productInput" class="productInput" value="${plan.product.productname}" readonly>
    <form action="${pageContext.request.contextPath}/product/select" method="post" id="productForm" class="productForm" style="display: none";">
    <select id="productSelect" name="selectedProduct" class="productSelect">
        <c:forEach var="item" items="${planList}">
            <option value="${item.product.productname}">
                ${item.product.productname}[${item.product.spec}${item.product.unit}]
            </option>
        </c:forEach>
    </select>
    <input type="submit" style="display: none;">
</form>
</td>

							<td class="lotnumber">
								<p>${plan.product.lotnumber}</p> <input type="text"
								name="lotnumber" value="${plan.product.lotnumber}"
								style="display: none;" readonly />
							</td>

							<td class="unit">
								<p>${plan.product.unit}</p> <input type="text" name="unit"
								value="${plan.product.unit}" style="display: none;" readonly />
							</td>

							<td class="warehouse">
								<p>${plan.product.warehouse}</p> <input type="text"
								name="warehouse" value="${plan.product.warehouse}"
								style="display: none;" readonly />
							</td>

							<td class="deliveryDest">
								<p>${plan.deliveryDest}</p> <input type="text"
								name="deliveryDest" value="${plan.deliveryDest}"
								style="display: none;" />
							</td>

							<td class="partnumber">
								<p>${plan.product.partnumber}</p> <input type="text"
								name="partnumber" value="${plan.product.partnumber}"
								style="display: none;" readonly />
							</td>

							<td class="totalqty">
								<p>${plan.totalqty}</p> <input type="text" name="totalqty"
								value="${plan.totalqty}" style="display: none;" />
							</td>

							<td class="createDate">
								<p>${plan.createDate}</p> <input type="date" name="createDate"
								value="${plan.createDate}" style="display: none;" />
							</td>

							<td class="startDate">
								<p>${plan.startDate}</p> <input type="date" name="startDate"
								value="${plan.startDate}" style="display: none;" />
							</td>

							<td class="endDate">
								<p>${plan.endDate}</p> <input type="date" name="endDate"
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
									action="/project/prodplan/delete"
									method="post" onsubmit="return confirm('정말 삭제하시겠습니까?');"
									class="list-btn del">
									<input type="hidden" name="planId" value="${plan.planId}" /> <input
										type="submit" value="삭제" class="delete-btn" />
								</form> <input type="hidden" name="planId" value="${plan.planId}" />
								<button type="button" class="comp">확인</button> <!-- ★ type="button" 수정 -->
								<button type="button" class="list-btn cancel-btn">취소</button>
							</td>
						</tr>
					</c:forEach>
				</c:when>

				<c:otherwise>
					<tr>
						<td colspan="14">데이터가 없습니다.</td>
						<td data-original-value="${plan.product.productname}"><c:choose>
								<c:when test="${not empty plan.product}">
                                            ${plan.product.productname}
                                        </c:when>
								<c:otherwise>데이터 없음</c:otherwise>
							</c:choose></td>
					</tr>
				</c:otherwise>
			</c:choose>

		</tbody>

		<tfoot>
			<tr>
				<!-- 페이지네이션 -->
<!-- 페이지네이션 -->
<%-- <td colspan="14">
    <div id="pagination-container">
        <ul class="pagination">
            <!-- 첫 페이지로 이동 버튼 -->
            <c:if test="${pageNo > 1}">
                <li><a href="?pageNo=1&viewCount=${viewCount}">&lt;&lt; 첫 페이지</a></li>
            </c:if>

            <!-- 이전 페이지 -->
            <c:if test="${pageNo > 1}">
                <li><a 
                href="?pageNo=${pageNo - 1}&viewCount=${viewCount}"
                > 이전</a></li>
            </c:if>

            <!-- 페이지 번호 -->
            <c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
                <li class="${i == pageNo ? 'active' : ''}">
                    <a href="?pageNo=${i}&viewCount=${viewCount}">${i}</a>
                </li>
            </c:forEach>

            <!-- 다음 페이지 -->
            <c:if test="${pageNo < lastPage}">
                <li><a 
                href="?pageNo=${pageNo + 1}&viewCount=${viewCount}"
                >다음 </a></li>
            </c:if>

            <!-- 마지막 페이지로 이동 버튼 -->
            <c:if test="${pageNo < lastPage}">
                <li><a href="?pageNo=${lastPage}&viewCount=${viewCount}">마지막 페이지 &gt;&gt;</a></li>
            </c:if>
        </ul>
    </div>
</td> --%>

<td colspan="14">
    <div id="pagination-container">
        <ul class="pagination">
            <!-- 이전 페이지 -->
                <li><button class="pagenation-btn"><</button></li>
            <!-- 페이지 번호 -->
                <li class="pagenation-number">
                    <a >1</a>
                </li>
            <!-- 다음 페이지 -->
                <li><button class="pagenation-btn">></button></li>
        </ul>
    </div>
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
    // 시간별 필터링 (일간, 주간, 월간)
    function getProductionPlan(range) {
        const today = new Date();
        const endOfWeek = new Date(today);
        const endOfMonth = new Date(today.getFullYear(), today.getMonth() + 1, 0);

        endOfWeek.setDate(today.getDate() + (5 - today.getDay()));
        let endDate;
        if (range === 'daily') endDate = today;
        else if (range === 'weekly') endDate = endOfWeek;
        else if (range === 'monthly') endDate = endOfMonth;

        const filteredData = productionData.filter(item => {
            const productionDate = new Date(item.date);
            return productionDate >= today && productionDate <= endDate;
        });

        const groupedData = {};
        filteredData.forEach(item => {
            if (!groupedData[item.productName]) groupedData[item.productName] = 0;
            groupedData[item.productName] += item.quantity;
        });

        return Object.keys(groupedData).map(name => ({
            productName: name,
            totalQuantity: groupedData[name]
        }));
    }

    let activeButton = null;
    document.querySelectorAll('.ProdPlanbtn').forEach(button => {
        button.addEventListener('click', function () {
            const parentTd = this.closest('td');
            const isOverall = parentTd.previousElementSibling?.innerText.includes('전체');
            const type = this.innerText;

            if (activeButton === this) {
                resetView();
                resetButtonStyles();
                activeButton = null;
                return;
            }
            activeButton = this;

            resetButtonStyles();
            this.style.color = '#007bff';
            this.style.border = '1px solid #007bff';

            let startCheck, endCheck;
            const now = new Date();

            if (isOverall) {
                if (type === '일간') {
                    startCheck = new Date(now);
                    endCheck = new Date(now);
                } else if (type === '주간') {
                    const day = now.getDay() || 7;
                    startCheck = new Date(now);
                    startCheck.setDate(now.getDate() - day + 1); // 월요일
                    endCheck = new Date(startCheck);
                    endCheck.setDate(startCheck.getDate() + 6); // 일요일
                } else if (type === '월간') {
                    startCheck = new Date(now.getFullYear(), now.getMonth(), 1);
                    endCheck = new Date(now.getFullYear(), now.getMonth() + 1, 0);
                }
            } else {
                if (type === '일간') {
                    startCheck = new Date(now);
                    endCheck = new Date(now);
                } else if (type === '주간') {
                    const day = now.getDay() || 7;
                    startCheck = new Date(now);
                    endCheck = new Date(now);
                    endCheck.setDate(now.getDate() + (7 - day));
                } else if (type === '월간') {
                    startCheck = new Date(now);
                    endCheck = new Date(now.getFullYear(), now.getMonth() + 1, 0);
                }
            }

            document.querySelectorAll('tr[name="prodPlanList"]').forEach(tr => {
                const startInput = tr.querySelector('input[name="startDate"]');
                const endInput = tr.querySelector('input[name="endDate"]');

                if (!startInput || !endInput) {
                    tr.style.display = 'none';
                    return;
                }

                const startDate = new Date(startInput.value);
                const endDate = new Date(endInput.value);

                if (startDate <= endCheck && endDate >= startCheck) {
                    tr.style.display = '';
                } else {
                    tr.style.display = 'none';
                }
            });
        });
    });

    function resetView() {
        document.querySelectorAll('tr[name="prodPlanList"]').forEach(tr => {
            tr.style.display = '';
        });
    }

    function resetButtonStyles() {
        document.querySelectorAll('.ProdPlanbtn').forEach(btn => {
            btn.style.color = '#999999';
            btn.style.border = '1px solid #999999';
        });
    }

    document.querySelectorAll('.product-input').forEach(input => {
        input.addEventListener('click', function () {
            const listDiv = this.nextElementSibling;
            listDiv.innerHTML = '';

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

    document.addEventListener('click', function (e) {
        if (!e.target.classList.contains('product-input')) {
            document.querySelectorAll('.product-list').forEach(list => {
                list.style.display = 'none';
            });
        }
    });

    // 생성 버튼 클릭
   $(document).ready(function () {
    $(document).on('click', '.newProdPlan-btn', function () {
        let $tbody = $('.tb1');
        let newRow = `
            <tr name="prodPlanList" class="order-info-content wolist">
                <td><input type="text" class="productNameInput" placeholder="상품명" /></td>
                <td><input type="text" class="lotnumberInput" placeholder="품목코드" /></td>
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
                        <input type="submit" value="생성" />
                    </form>
                    <form action="${pageContext.request.contextPath}/prodplan/cancel" method="post" onsubmit="return confirm('정말 취소하시겠습니까?');" class="list-btn cancel">
                        <input type="submit" value="취소" />
                    </form>
                </td>
            </tr>`;

        // 테이블에 새로운 행을 추가
        $tbody.append(newRow);

        // 페이지네이션을 새로 계산 (예시로 페이지 번호를 1 증가시키는 코드)
        let currentPage = getCurrentPageNumber(); // 현재 페이지 번호를 가져오는 함수
        updatePagination(currentPage + 1); // 페이지네이션을 새로 업데이트하는 함수
    });
});

// 페이지 번호를 가져오는 예시 함수 (구현 필요)
function getCurrentPageNumber() {
    return parseInt($('#pagination-container .pagination .active').text(), 10);
}

// 페이지네이션을 업데이트하는 예시 함수 (구현 필요)
function updatePagination(pageNumber) {
    // 페이지네이션 로직을 여기에 구현
    console.log("페이지 번호 업데이트: ", pageNumber);
}


    // 수정 버튼 클릭
 // 수정 버튼 클릭
document.querySelectorAll('.ins').forEach(button => {
    button.addEventListener('click', function () {
        const tr = this.closest('tr');
        editRow(tr);
    });
});

// 취소 버튼 클릭
document.querySelectorAll('.cancel-btn').forEach(button => {
    button.addEventListener('click', function () {
        const tr = this.closest('tr');
        cancelRow(tr);
    });
});


const productSelect = trElement.querySelector('#productForm');

function editRow(trElement) {
    const pTags = trElement.querySelectorAll('p');
    const originalValues = [];

    pTags.forEach(p => {
        originalValues.push(p.textContent.trim());
    });

    pTags.forEach((p, index) => {
        p.style.display = 'none'; // p 태그 숨기기

        const nextElement = p.nextElementSibling;

        if (nextElement && (nextElement.tagName === 'INPUT' || nextElement.tagName === 'SELECT')) {
            nextElement.style.display = 'inline'; // input, select 보이게 하기

            if (nextElement.tagName === 'INPUT') {
                nextElement.value = originalValues[index];
            }
        }
    });

    // 수정 시 입력 필드와 select 필드를 보이게 함
    const productInput = trElement.querySelector('#productInput');
    const productSelect = trElement.querySelector('#productForm');

    
    if (productInput) productInput.style.display = 'inline'; 
    if (productSelect) productSelect.style.display = 'inline'; 

    const editButton = trElement.querySelector('.ins');
    const deleteButton = trElement.querySelector('.delete-btn');
    const confirmButton = trElement.querySelector('.comp');
    const cancelButton = trElement.querySelector('.cancel-btn');

    if (editButton) editButton.style.display = 'none';
    if (deleteButton) deleteButton.style.display = 'none';
    if (confirmButton) confirmButton.style.display = 'inline';
    if (cancelButton) cancelButton.style.display = 'inline';
}

function cancelRow(trElement) {
    trElement.querySelectorAll('p').forEach(p => p.style.display = 'inline'); // p 태그 다시 보이기
    trElement.querySelectorAll('input, select').forEach(input => input.style.display = 'none'); // input, select 숨기기

    const editButton = trElement.querySelector('.ins');
    const deleteButton = trElement.querySelector('.delete-btn');
    const confirmButton = trElement.querySelector('.comp');
    const cancelButton = trElement.querySelector('.cancel-btn');

    if (editButton) editButton.style.display = 'inline';
    if (deleteButton) deleteButton.style.display = 'inline';
    if (confirmButton) confirmButton.style.display = 'none';
    if (cancelButton) cancelButton.style.display = 'none';
    if (productSelect) productSelect.style.display = 'none';
}

    
    
    
    
document.addEventListener('DOMContentLoaded', function() {
    const inputField = document.getElementById("productInput");
    inputField.addEventListener("click", toggleSelect);
});

function toggleSelect() {
    var inputField = document.getElementById("productInput");
    var selectList = document.getElementById("productSelect");

    if (selectList.style.display === "none" || selectList.style.display === "") {
        inputField.style.display = "none"; 
        selectList.style.display = "block"; 
    } else {
        inputField.style.display = "block"; 
        selectList.style.display = "none"; 
    }
}

function updateProductName() {
    var selectList = document.getElementById("productSelect");
    var selectedValue = selectList.options[selectList.selectedIndex].value;
    document.getElementById("productInput").value = selectedValue;  
    document.getElementById("productnameInput").value = selectedValue; 
    selectList.style.display = "none"; 
    document.getElementById("productInput").style.display = "block"; 
}

</script>

</body>

</html>