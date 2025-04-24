<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HHMES 생산관리</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/prodplan.css">
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
                <c:choose>
                    <c:when test="${not empty username}">
                        <input type="text" class="menufacturer-info-completion" value="${username}" readonly />
                    </c:when>
                    <c:otherwise>
                        <input type="text" class="menufacturer-info-completion" value="알 수 없음" readonly />
                    </c:otherwise>
                </c:choose>

            </td>
            <td class="menufacturer-info-list">
                <div class="menufacturer-info-name">생산기간</div>
                <c:choose>
                    <c:when test="${not empty planList}">
                        <input type="text" class="menufacturer-info-completion" value="${planList[0].startDate} ~ ${planList[0].endDate}" readonly>
                    </c:when>
                    <c:otherwise>
                        <input type="text" class="menufacturer-info-completion" value="데이터 없음" readonly>
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
                        <tr name="prodPlanList" class="order-info-content wolist" data-id="${plan.productId}" data-pi="${plan.planId}">
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
                                <form action="${pageContext.request.contextPath}/prodplan/update" method="post" style="display: inline;">
                                    <input type="hidden" name="planId" value="${plan.planId}" />
                                    <input type="submit" value="수정" class="list-btn ins" />
                                </form>
                                <!-- 삭제 form -->
                                <form action="${pageContext.request.contextPath}/prodplan/delete" method="post" style="display: inline;" onsubmit="return confirm('정말 삭제하시겠습니까?');">
                                    <input type="hidden" name="planId" value="${plan.planId}" />
                                    <input type="submit" value="삭제" class="list-btn del" />
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <tr>
                        <td colspan="14">데이터가 없습니다.</td>
                        <td data-original-value="${plan.product.productname}">
                            <c:choose>
                                <c:when test="${not empty plan.product}">${plan.product.productname}</c:when>
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
                    <button type="button" class="WO-buttonlist">상품계획생성</button>
                    <button type="button" class="WO-buttonlist">작업지시서</button>
                </td>
            </tr>
        </tfoot>
    </table>

    <script src="${pageContext.request.contextPath}/resources/js/prodplan.js"></script>
    <script>
        // 상품계획생성 버튼 클릭 시 새 행 추가
        $(document).ready(function () {
            // 상품계획생성 버튼 클릭 시 새 행 추가
            $(document).on('click', '.WO-buttonlist', function () {
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

    </script>
</body>

</html>
