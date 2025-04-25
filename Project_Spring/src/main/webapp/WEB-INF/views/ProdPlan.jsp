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
									method="post" class="list-btn ins">
									<input type="hidden" name="planId" value="${plan.planId}" /> <input
										type="submit" value="수정" />
								</form> 
								<!-- 삭제 form -->
								<form
									action="${pageContext.request.contextPath}/prodplan/delete"
									method="post" onsubmit="return confirm('정말 삭제하시겠습니까?');"
									class="list-btn del">
									<input type="hidden" name="planId" value="${plan.planId}" /> <input
										type="submit" value="삭제" />
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
        // 상품계획생성 버튼 클릭 시 새 행 추가
        $(document).ready(function () {
            // 상품계획생성 버튼 클릭 시 새 행 추가
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
                        <td><button class="mrpCalcBtn">MRP계산</button></td>
                        <td><input type="text" class="planStatusInput" placeholder="생산계획현황" /></td>
                        <td><input type="text" class="planCauseInput" placeholder="생산사유" /></td>
                        <td><input type="text" class="planNotesInput" placeholder="비고" /></td>
                        <td><button class="saveBtn">저장</button></td>
                    </tr>
                `;

                $tbody.append(newRow);
            });
        });

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

        // 테이블에서 상품 클릭 시 값 채우기
        $(document).on('click', '.product-item', function () {
            let name = $(this).find('td:eq(0)').text();
            let spec = $(this).find('td:eq(1)').text();
            let unit = $(this).find('td:eq(2)').text();
            let warehouse = $(this).find('td:eq(3)').text();

            let $tr = $(this).closest('tr').prevAll('tr').eq(0);
            $tr.find('.productNameInput').val(name);
            $tr.find('.specInput').val(spec);
            $tr.find('.unitInput').val(unit);
            $tr.find('.warehouseInput').val(warehouse);

            // 검색결과 테이블 제거
            $('.search-result-table').remove();
        });

        document.addEventListener("DOMContentLoaded", function () {
        	  const tbody = document.querySelector("#prodPlanTable tbody");

        	  // 수정 버튼 클릭 이벤트
        	  // 품목코드, 단위, 보관, 창고위치는 수정 불가
        	  tbody.addEventListener("click", function (e) {
        	    if (e.target.classList.contains("editBtn")) {
        	      const row = e.target.closest("tr");

        	      if (row.dataset.mode === "edit") return;

        	      row.dataset.mode = "edit";

        	      const cells = row.querySelectorAll("td");
        	      const originalData = [];

        	      for (let i = 1; i <= 8; i++) {
        	        originalData.push(cells[i].innerText.trim());
        	        if (i === 2 || i === 3 || i === 4 || i === 6) {
        	          continue; 
        	        }

        	        const input = document.createElement("input");
        	        input.type = "text";
        	        input.value = cells[i].innerText.trim();
        	        input.classList.add("editInput");
        	        cells[i].innerText = "";
        	        cells[i].appendChild(input);
        	      }

        	      // 명령 버튼 교체
        	      const actionCell = cells[9];
        	      const confirmBtn = document.createElement("button");
        	      confirmBtn.textContent = "확인";
        	      confirmBtn.className = "confirmBtn";

        	      const cancelBtn = document.createElement("button");
        	      cancelBtn.textContent = "취소";
        	      cancelBtn.className = "cancelBtn";

        	      actionCell.innerHTML = "";
        	      actionCell.appendChild(confirmBtn);
        	      actionCell.appendChild(cancelBtn);

        	      // 취소 버튼 이벤트
        	      cancelBtn.addEventListener("click", function () {
        	        for (let i = 1; i <= 8; i++) {
        	          cells[i].innerText = originalData[i - 1];
        	        }

        	        actionCell.innerHTML = "";
        	        const restoreBtn = document.createElement("button");
        	        restoreBtn.textContent = "수정";
        	        restoreBtn.className = "editBtn";
        	        actionCell.appendChild(restoreBtn);

        	        delete row.dataset.mode;
        	      });

        	      // 확인 버튼 이벤트
        	      confirmBtn.addEventListener("click", function () {
        	        const newData = {};
        	        newData.plan_no = cells[1].innerText.trim(); // plan_no는 수정불가

        	        // input이 있는 셀은 input 값, 아닌 셀은 텍스트
        	        newData.product_name = cells[2].innerText.trim(); // 수정불가
        	        newData.standard = cells[3].innerText.trim();      // 수정불가
        	        newData.unit = cells[4].innerText.trim();          // 수정불가
        	        newData.plan_date = cells[5].querySelector("input").value;
        	        newData.storage = cells[6].innerText.trim();       // 수정불가
        	        newData.quantity = cells[7].querySelector("input").value;
        	        newData.mrp_calculation = cells[8].querySelector("input").value;

        	        fetch("/project/prodplan/update", {
        	          method: "POST",
        	          headers: {
        	            "Content-Type": "application/json"
        	          },
        	          body: JSON.stringify(newData)
        	        })
        	          .then(response => {
        	            if (!response.ok) throw new Error("서버 오류");
        	            return response.json();
        	          })
        	          .then(data => {
        	            alert("수정되었습니다.");
        	            location.reload();
        	          })
        	          .catch(error => {
        	            console.error("수정 실패", error);
        	            alert("수정 실패");
        	          });
        	      });
        	    }
        	  });
        	});

        let $row = $(this).closest('.search-result-table').prevAll('tr.order-info-content').first();

        $row.find('.productNameInput').val(name + '[' + spec + ']');
        $row.find('.unitInput').val(unit);
        $row.find('.warehouseInput').val(warehouse);

        // 선택 후 검색창과 결과 테이블 제거
        $('.product-search-box').remove();
        $('.search-result-table').remove();
    });

    // 외부 클릭 시 검색 결과 박스 제거
    $(document).on('click', function (e) {
        if (!$(e.target).closest('.productNameInput, .product-search-box, .search-result-table').length) {
            $('.product-search-box').remove();
            $('.search-result-table').remove();
        }
    });

    </script>
</body>

</html>
