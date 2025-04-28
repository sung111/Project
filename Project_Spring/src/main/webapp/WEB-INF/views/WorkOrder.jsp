<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <script src="${pageContext.request.contextPath}/resources/js/workorder.js"></script>
</head>

<body>
    <form class="productinfo">
        <table>
            <tr class="productinfo-info">
                <td class="productinfo-info-list">
                    <div class="productinfo-info-name">LOTNO.</div>
                    <input type="text" class="productinfo-info-completion" id="lotno" alt="productinfo-LOTNO" readonly>
                </td>
                <td class="productinfo-info-list">
                    <div class="productinfo-info-name">단위</div>
                    <input type="text" class="productinfo-info-completion" id="danwi" alt="productinfo-단위" readonly>
                </td>
                <td class="productinfo-info-list" style="position:relative;">
                    <div class="productinfo-info-name">품명[규격]</div>
                    <input type="text" class="productinfo-info-productname" id="productname" alt="productinfo-품명[규격]" autocomplete="off">
                    <button type="button" class="productsearch" alt="조회">조회</button>
                    
                    <div id="productOptions" class="product-options" style="display:none;">
                        <ul>
                            <!-- productList가 서버에서 전달된 값으로 채워짐 -->
                            <c:forEach var="product" items="${productList}">
                                <li data-name="${product.productname}" data-spec="${product.spec}" data-unit="${product.unit}">
                                    <span class="product-name">${product.productname}</span> [${product.spec} ${product.unit}]
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </td>
                <td class="productinfo-info-list">
                    <div class="productinfo-info-name">제작 수량</div>
                    <input type="text" class="productinfo-info-completion" alt="productinfo-제작수량" readonly>
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
                        <iframe id="processFrame" src="production_process.html" style="display: none;"></iframe>
                    </td>
                </tr>
            </table>
        </div>
    </form>

    <script>
    //품명 내용을 클릭할 때 나오는 상품 리스트
    document.getElementById("productname").addEventListener("click", function () {
        var options = document.getElementById("productOptions");
        options.style.display = options.style.display === "none" ? "block" : "none";
    });

    document.querySelectorAll("#productOptions li").forEach(function (item) {
        item.addEventListener("click", function () {
            var productName = this.getAttribute("data-name");
            var productSpec = this.getAttribute("data-spec");
            var unit = this.getAttribute("data-unit");

            document.getElementById("productname").value = productName + "[" + productSpec + "]";
            document.getElementById("danwi").value = unit;
            document.getElementById("productOptions").style.display = "none";
        });
    });

    document.addEventListener("click", function (event) {
        var productInput = document.getElementById("productname");
        var options = document.getElementById("productOptions");

        if (!productInput.contains(event.target) && !options.contains(event.target)) {
            options.style.display = "none";
        }
    });
    </script>
</body>

</html>
