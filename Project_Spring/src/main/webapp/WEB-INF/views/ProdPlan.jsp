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
            <div class="menufacturer-info-name">생성인</div> 
            <input type="text" id="creator" name="creator" class="menufacturer-info-completion"
                value="${not empty username ? username : ''}" readonly />
        </td>

        <td class="menufacturer-info-list">
            <div class="menufacturer-info-name">생산기간</div>
            <input type="text" id="productionPeriod" name="productionPeriod" class="menufacturer-info-completion"
                value="" readonly />
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
            <tr name="prodPlanList" 
    class="order-info-content wolist" 
    data-id="${plan.productId}" 
    data-pi="${plan.planId}" 
    data-username="${plan.userId}" 
    data-startdate="${plan.startDate}" 
    data-enddate="${plan.endDate}">
            
<td class="productname">
    <p>${plan.product.productname}[${plan.product.spec}${plan.product.unit}]</p>
    <form action="${pageContext.request.contextPath}/prodplan/update" method="post">
    <select name="productname" id="productSelect" class="productSelect" style="display: none;">
        <c:forEach var="item" items="${planList}">
            <option value="${item.product.productname}">
                ${item.product.productname}[${item.product.spec}${item.product.unit}]
            </option>
        </c:forEach>
    </select>
</td>


                <td class="lotnumber">
                    <p>${plan.product.lotnumber}</p>
                    <input type="text" name="lotnumber" value="${plan.product.lotnumber}" style="display: none;" readonly/>
                </td>

                <td class="unit">
                    <p>${plan.product.unit}</p>
                    <input type="text" name="unit" value="${plan.product.unit}" style="display: none;" readonly/>
                </td>

                <td class="warehouse">
                    <p>${plan.product.warehouse}</p>
                    <input type="text" name="warehouse" value="${plan.product.warehouse}" style="display: none;" readonly/>
                </td>

                <td class="deliveryDest">
                    <p>${plan.deliveryDest}</p>
                    <input type="text" name="deliveryDest" value="${plan.deliveryDest}" style="display: none;" />
                </td>

                <td class="partnumber">
                    <p>${plan.product.partnumber}</p>
                    <input type="text" name="partnumber" value="${plan.product.partnumber}" style="display: none;" readonly/>
                </td>

                <td class="totalqty">
                    <p>${plan.totalqty}</p>
                    <input type="text" name="totalqty" value="${plan.totalqty}" style="display: none;" />
                </td>

                <td class="createDate">
                    <p>${plan.createDate}</p>
                    <input type="date" name="createDate" value="${plan.createDate}" style="display: none;" />
                </td>

                <td class="startDate">
                    <p>${plan.startDate}</p>
                    <input type="date" name="startDate" value="${plan.startDate}" style="display: none;" />
                </td>

                <td class="endDate">
                    <p>${plan.endDate}</p>
                    <input type="date" name="endDate" value="${plan.endDate}" style="display: none;" />
                </td>

                <td><a>MRP 계산</a></td>

                <td class="planStatus">
                    <p>${plan.planStatus}</p>
                    <input type="text" name="planStatus" value="${plan.planStatus}" style="display: none;" />
                </td>

                <td class="planCause">
                    <p>${plan.planCause}</p>
                    <input type="text" name="planCause" value="${plan.planCause}" style="display: none;" />
                </td>

                <td class="planNotes">
                    <p>${plan.planNotes}</p>
                    <input type="text" name="planNotes" value="${plan.planNotes}" style="display: none;" />
                </td>

                <td class="insdellayer">
<button type="button" class="list-btn mdf-btn ins" id="mdf-btn">수정</button>

<form action="${pageContext.request.contextPath}/prodplan/delete" method="post" onsubmit="return confirm('정말 삭제하시겠습니까?');" class="list-btn del">
    <input type="hidden" name="planId" value="${plan.planId}" />
    <input type="submit" value="삭제" class="delete-btn"/>
</form>

<input type="hidden" name="planId" value="${plan.planId}" />
<button type="button" class="comp">확인</button>   <!-- ★ type="button" 수정 -->
<button type="button" class="list-btn cancel-btn">취소</button>
                </td>
            </tr>
        </c:forEach>
    </c:when>

    <c:otherwise>
        <tr>
            <td colspan="14">데이터가 없습니다.</td>
            <td data-original-value="${plan.product.productname}">
                <c:choose>
                    <c:when test="${not empty plan.product}">
                        ${plan.product.productname}
                    </c:when>
                    <c:otherwise>데이터 없음</c:otherwise>
                </c:choose>
            </td>
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
						<a href="${pageContext.request.contextPath}/prodplan/workorder" class="workorder-a">작업지시서</a>
					</button>
				</td>
			</tr>
		</tfoot>
	</table>
	<script
		src="${pageContext.request.contextPath}/resources/js/prodplan.js"></script>
	<script>
	


	
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
                    <form action="${pageContext.request.contextPath}/prodplan/insert" method="post" class="list-btn com" id="newPlanForm">
                    <input type="hidden" name="planId" value="${plan.planId}" />
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

 // 수정 함수 호출
    document.querySelectorAll('.ins').forEach(button => { button.addEventListener('click', function() { const tr = this.closest('tr');  editRow(tr);  });  });
    // 취소
    document.querySelectorAll('.cancel-btn').forEach(button => { button.addEventListener('click', function() { const tr = this.closest('tr'); cancelRow(tr); }); });
    //수정 태그로 전환
    function editRow(trElement) { const pTags = trElement.querySelectorAll('p'); const originalValues = []; pTags.forEach(p => { originalValues.push(p.textContent.trim());});
        pTags.forEach((p, index) => { p.style.display = 'none'; const nextElement = p.nextElementSibling; 
        if (nextElement && (nextElement.tagName === 'INPUT' || nextElement.tagName === 'SELECT'))  { nextElement.style.display = 'inline'; 
        if (nextElement.tagName === 'INPUT') { nextElement.value = originalValues[index]; } }
        });

        
        const editButton = trElement.querySelector('.ins');
        const deleteButton = trElement.querySelector('.delete-btn');
        const confirmButton = trElement.querySelector('.comp');
        const cancelButton = trElement.querySelector('.cancel-btn');

        if (editButton) editButton.style.display = 'none'; if (deleteButton) deleteButton.style.display = 'none';
        if (confirmButton) confirmButton.style.display = 'inline'; if (cancelButton) cancelButton.style.display = 'inline';

        if (confirmButton) {
            confirmButton.onclick = function () {
                // 수정 후 수정 버튼, 확인 버튼 숨기기
                if (editButton) editButton.style.display = 'inline';
                if (deleteButton) deleteButton.style.display = 'inline';
                if (confirmButton) confirmButton.style.display = 'none';
                if (cancelButton) cancelButton.style.display = 'none';

                // 삭제 버튼 숨기기
                if (deleteButton) deleteButton.style.display = 'none'; 

                pTags.forEach((p, index) => {
                    p.style.display = 'inline';
                    const nextElement = p.nextElementSibling;
                    if (nextElement && (nextElement.tagName === 'INPUT' || nextElement.tagName === 'SELECT')) {
                        p.textContent = nextElement.value;
                        nextElement.style.display = 'none';
                    }
                });
            };
        }


        //취소 버튼
        if (cancelButton) { cancelButton.onclick = function () {
                if (editButton) editButton.style.display = 'inline'; if (deleteButton) deleteButton.style.display = 'inline';  if (confirmButton) confirmButton.style.display = 'none'; if (cancelButton) cancelButton.style.display = 'none';
                pTags.forEach((p, index) => { p.style.display = 'inline'; const nextElement = p.nextElementSibling;
                    if (nextElement && (nextElement.tagName === 'INPUT' || nextElement.tagName === 'SELECT')) { nextElement.style.display = 'none'; }
                });
            };
        }
    }

    function cancelRow(trElement) {
        const pTags = trElement.querySelectorAll('p');
        pTags.forEach(p => {
            p.style.display = 'inline';
            const input = p.nextElementSibling;
            if (input && (input.tagName === 'INPUT' || input.tagName === 'SELECT')) {
                input.style.display = 'none';
            }
        });

        const editButton = trElement.querySelector('.ins');
        const deleteButton = trElement.querySelector('.delete-btn'); // 🔥
        const confirmButton = trElement.querySelector('.comp');
        const cancelButton = trElement.querySelector('.cancel-btn');

        if (editButton) editButton.style.display = 'inline';
        if (deleteButton) deleteButton.style.display = 'inline'; // 🔥
        if (confirmButton) confirmButton.style.display = 'none';
        if (cancelButton) cancelButton.style.display = 'none';
    }



	//삭제
	function deleteRow(button) { var row = button.closest('tr'); row.parentNode.removeChild(row);  }

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
	                            `<tr class="product-item" data-id="${item.productId}">
	                                <td>${item.productname}</td>
	                                <td>${item.spec}</td>
	                                <td>${item.unit}</td>
	                                <td>${item.warehouse}</td>
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

	$(document).on('click', '.product-item', function () {
	    let productId = $(this).data('id');
	    let productName = $(this).find('td').eq(0).text(); // 상품명
	    let spec = $(this).find('td').eq(1).text(); // 규격
	    let unit = $(this).find('td').eq(2).text(); // 단위
	    let warehouse = $(this).find('td').eq(3).text(); // 창고

	    // 상품 정보가 선택된 tr에 자동으로 채워짐
	    let tr = $(this).closest('tr'); // 해당 행 (tr)

	    tr.find('input[name="productname"]').val(productName);
	    tr.find('input[name="spec"]').val(spec);
	    tr.find('input[name="unit"]').val(unit);
	    tr.find('input[name="warehouse"]').val(warehouse);

	    // p 태그도 업데이트
	    tr.find('.productname p').text(productName);
	    tr.find('.spec p').text(spec);
	    tr.find('.unit p').text(unit);
	    tr.find('.warehouse p').text(warehouse);

	    // 검색 박스와 결과 테이블 지우기
	    $('.search-result-table').remove();
	});

	function insertPlan(insertData) {
	    $.ajax({
	        url: `${pageContextPath}/prodplan/insert`, // 컨트롤러의 경로에 맞춰 수정
	        type: 'POST',
	        contentType: 'application/json',
	        data: JSON.stringify(insertData), // 데이터를 JSON 형식으로 전송
	        success: function(response) {
	            if (response === 'success') {
	                alert('생산계획 저장 성공!');
	                location.reload(); // 저장 후 새로고침
	            } else {
	                alert('저장 실패: ' + response);
	            }
	        },
	        error: function(xhr, status, error) {
	            alert('오류 발생: ' + error);
	        }
	    });
	}



</script>
</body>
</html>
