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
				<td>수정/삭제</td>
			</tr>

			<c:choose>
				<c:when test="${not empty planList}">
					<c:forEach var="plan" items="${planList}">
						<tr name="prodPlanList" class="order-info-content wolist"
							data-id="${plan.productId}" data-pi="${plan.planId}">
							<td><c:choose>
									<c:when test="${not empty plan.product}">
              ${plan.product.productname}[${plan.product.spec}${plan.product.unit}]
            </c:when>
									<c:otherwise>데이터 없음</c:otherwise>
								</c:choose></td>
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
							<td class="insdellayer">
								<!-- 수정 form -->
								<form
									action="${pageContext.request.contextPath}/prodplan/update"
									method="post" style="display: inline;">
									<input type="hidden" name="planId" value="${plan.planId}" /> <input
										type="submit" value="수정" class="list-btn ins" />
								</form> <!-- 삭제 form -->
								<form
									action="${pageContext.request.contextPath}/prodplan/delete"
									method="post" style="display: inline;"
									onsubmit="return confirm('정말 삭제하시겠습니까?');">
									<input type="hidden" name="planId" value="${plan.planId}" /> <input
										type="submit" value="삭제" class="list-btn del" />
								</form>
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
					<button type="button" class="WO-buttonlist">상품계획생성</button>
					<button type="button" class="WO-buttonlist">작업지시서</button>
				</td>
			</tr>
		</tfoot>
	</table>

	<script
		src="${ pageContext.request.contextPath }/resources/js/prodplan.js"></script>
	<script>
	
	document.querySelector('.WO-buttonlist').addEventListener('click', function () {
	    // 이미 생성된 입력 행이 있으면 추가 방지
	    if (document.querySelector('.order-info-content.editing')) {
	        alert("이미 작성 중인 행이 있습니다.");
	        return;
	    }

	    const tbody = document.querySelector('.new-workorder tbody');
	    const newRow = document.createElement('tr');
	    newRow.className = 'order-info-content wolist editing';

	    // 컬럼 순서에 맞춰서 input 생성 (입력 필드)
	    newRow.innerHTML = `
	        <td><input type="text" name="productname" required placeholder="상품명[규격]"></td>
	        <td><input type="text" name="lotnumber" required></td>
	        <td><input type="text" name="unit" required></td>
	        <td><input type="text" name="warehouse" required></td>
	        <td><input type="text" name="deliveryDest" required></td>
	        <td><input type="text" name="partnumber" required></td>
	        <td><input type="number" name="totalqty" required></td>
	        <td><input type="date" name="createDate" required></td>
	        <td><input type="date" name="startDate" required></td>
	        <td><input type="date" name="endDate" required></td>
	        <td><button type="button" class="mrp-btn">MRP 계산</button></td>
	        <td><input type="text" name="planStatus" required></td>
	        <td><input type="text" name="planCause" required></td>
	        <td><input type="text" name="planNotes"></td>
	        <td class="insdellayer">
	            <button type="button" class="confirm-new">확인</button>
	            <button type="button" class="cancel-new">취소</button>
	        </td>
	    `;
	    tbody.appendChild(newRow);

	    // MRP 버튼 동작 (필수 기능)
	    newRow.querySelector('.mrp-btn').addEventListener('click', () => {
	        alert('MRP 계산 로직은 여기서 연결됩니다.');
	    });

	    // 확인 버튼 이벤트
	    newRow.querySelector('.confirm-new').addEventListener('click', function () {
	        const inputs = newRow.querySelectorAll('input');
	        const formData = {};
	        let valid = true;

	        inputs.forEach(input => {
	            if (input.required && !input.value.trim()) {
	                valid = false;
	            }
	            formData[input.name] = input.value.trim();
	        });

	        // productname 필드 검사
	        if (!isValidProductName(formData.productname)) {
	            alert("상품명을 정확히 입력해주세요 (예: 제품명[규격단위])");
	            return;
	        }

	        if (!valid) {
	            alert("모든 필수 정보를 입력해주세요.");
	            return;
	        }

	        // 전송
	        fetch('/project/prodplan/insert', {
	            method: 'POST',
	            headers: {
	                'Content-Type': 'application/json'
	            },
	            body: JSON.stringify(formData)
	        })
	        .then(res => res.json())
	        .then(data => {
	            if (data.success) {
	                alert("상품계획이 등록되었습니다.");
	                location.reload();
	            } else {
	                alert("등록 실패: " + data.message);
	            }
	        })
	        .catch(err => {
	            console.error("등록 오류", err);
	            alert("서버 오류가 발생했습니다.");
	        });
	    });

	    // 취소 버튼 이벤트
	    newRow.querySelector('.cancel-new').addEventListener('click', function () {
	        if (confirm("작성을 취소하시겠습니까?")) {
	            newRow.remove();
	        }
	    });
	});

	// 상품명 유효성 검사 함수
	function isValidProductName(name) {
	    return /\[.+\]/.test(name);  // 예: 제품명[규격] 형태
	}

	
document.addEventListener("DOMContentLoaded", function() {
    // 수정 버튼 클릭 시
    const editButtons = document.querySelectorAll('.edit-btn');
    
    editButtons.forEach((button) => {
        button.addEventListener('click', function() {
            const row = button.closest('tr');  
            const cells = row.querySelectorAll('td');
            
            // 각 td를 input으로 변경
            cells.forEach((cell, index) => {
                if (index !== cells.length - 1) {  // 마지막 칸(수정/삭제 버튼 제외)
                    const value = cell.textContent.trim();
                    cell.innerHTML = `<input type="text" value="${value}">`;
                }
            });

            // 수정/삭제 버튼을 확인/취소 버튼으로 변경
            const actionCell = row.querySelector('.insdellayer');
            actionCell.innerHTML = `
                <button class="confirm-btn">확인</button>
                <button class="cancel-btn">취소</button>
            `;

            // 확인 버튼 클릭 시
            row.querySelector('.confirm-btn').addEventListener('click', function() {
                const updatedData = [];
                cells.forEach((cell, index) => {
                    if (index !== cells.length - 1) {
                        updatedData.push(cell.querySelector('input').value);  // 입력값 추출
                    }
                });

                const planId = row.getAttribute('data-id');  // 행의 data-id 속성에서 planId 가져오기
                updatePlan(planId, updatedData);  // 서버로 수정된 데이터 전송
            });

            // 취소 버튼 클릭 시
            row.querySelector('.cancel-btn').addEventListener('click', function() {
                // 원래 상태로 되돌리기
                cells.forEach((cell, index) => {
                    if (index !== cells.length - 1) {
                        const originalValue = cell.getAttribute('data-original-value');
                        cell.textContent = originalValue;  // 원래 값으로 복구
                    }
                });

                // 수정/삭제 버튼 복원
                actionCell.innerHTML = `
                    <form action="/prodplan/update" method="post" style="display:inline;">
                        <input type="hidden" name="planId" value="${planId}" />
                        <input type="submit" value="수정" class="list-btn ins" />
                    </form>
                    <form action="/prodplan/delete" method="post" style="display:inline;" 
                        onsubmit="return confirm('정말 삭제하시겠습니까?');">
                        <input type="hidden" name="planId" value="${planId}" />
                        <input type="submit" value="삭제" class="list-btn del" />
                    </form>
                `;
            });
        });
    });
});

// 서버로 수정된 데이터 전송
function updatePlan(planId, updatedData) {
    fetch('/prodplan/update', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            planId: planId,
            updatedData: updatedData
        })
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            alert("수정이 완료되었습니다.");
            location.reload();  // 수정 후 페이지 새로고침
        } else {
            alert("수정 실패");
        }
    })
    .catch(error => {
        console.error("수정 오류:", error);
    });
}

</script>
</body>

</html>
