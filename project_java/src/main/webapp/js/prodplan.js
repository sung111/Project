document.addEventListener("DOMContentLoaded", function () {
    // 생산계획 목록을 누르면 특정한 생산계획을 지정한다.
    let selectedRow = null;

    // 이벤트 위임을 사용하여 동적으로 추가된 항목에도 클릭 이벤트를 적용
    document.querySelector(".new-workorder tbody").addEventListener("click", function (event) {
        const clickedRow = event.target.closest(".order-info-content");
        
        if (clickedRow) {
            // 같은 행을 다시 클릭하면 선택 해제
            if (selectedRow === clickedRow) {
                clickedRow.classList.remove("selected-row");
                selectedRow = null;
            } else {
                // 기존 선택된 행이 있으면 스타일 제거
                if (selectedRow) {
                    selectedRow.classList.remove("selected-row");
                }

                // 새로운 행 선택
                clickedRow.classList.add("selected-row");
                selectedRow = clickedRow;
            }
        }
    });

    // 선택된 행 스타일을 위한 CSS 추가
    const style = document.createElement("style");
    style.innerHTML = `
        .selected-row {
            background-color: #999999 !important;
        }
    `;
    document.head.appendChild(style);

    // 상품계획 생성 버튼
    const tbody = document.querySelector(".new-workorder tbody");
    document.getElementById("new-ProdPlan").addEventListener("click", function () {
        const newRow = document.createElement("tr");
        newRow.setAttribute("name", "WorkOrder");
        newRow.classList.add("order-info-content", "wolist");

        newRow.innerHTML = `
            <td><input type="text" value="샘플"></td>
            <td><input type="text" value="샘플"></td>
            <td><input type="text" value="샘플"></td>
            <td><input type="text" value="샘플"></td>
            <td><input type="text" value="샘플"></td>
            <td><input type="text" value="샘플"></td>
            <td><input type="number" value="0"></td>
            <td><input type="date"></td>
            <td><input type="date"></td>
            <td><input type="date"></td>
            <td><button>MRP계산</button></td>
            <td><input type="text" value="샘플"></td>
            <td><input type="text" value="샘플"></td>
            <td><input type="text" value="샘플"></td>
        `;

        tbody.appendChild(newRow);
        updatePagination(); // 새로 추가된 항목에 대해 페이지네이션 갱신
    });

    // 페이지네이션 초기화
    updatePagination();

    // 페이지네이션
    let currentPage = 1;
    const rowsPerPage = 10;

    function updatePagination() {
        const rows = document.querySelectorAll(".order-info-content");
        const totalRows = rows.length;
        const totalPages = Math.max(1, Math.ceil(totalRows / rowsPerPage)); // 최소 1페이지 보장
        const paginationContainer = document.getElementById("pagination-container");

        // 페이지네이션 버튼 초기화
        paginationContainer.innerHTML = "";

        // 왼쪽 화살표 (이전 페이지)
        const prevButton = document.createElement("a");
        prevButton.innerHTML = `<img src="img/lefticon.png" alt="pagenationleft" class="pagenationicon">`;
        prevButton.addEventListener("click", function () {
            if (currentPage > 1) {
                currentPage--;
                displayPage(currentPage);
                updatePagination();
            }
        });
        paginationContainer.appendChild(prevButton);

        // 기본 페이지 번호 (1)
        const pageButton = document.createElement("a");
        pageButton.textContent = "1";
        pageButton.style.fontWeight = "bold"; // 현재 페이지 강조
        pageButton.addEventListener("click", function () {
            currentPage = 1;
            displayPage(currentPage);
            updatePagination();
        });
        paginationContainer.appendChild(pageButton);

        // 오른쪽 화살표 (다음 페이지)
        const nextButton = document.createElement("a");
        nextButton.innerHTML = `<img src="img/righticon.png" alt="pagenationright" class="pagenationicon">`;
        nextButton.addEventListener("click", function () {
            if (currentPage < totalPages) {
                currentPage++;
                displayPage(currentPage);
                updatePagination();
            }
        });
        paginationContainer.appendChild(nextButton);
    }

    function displayPage(page) {
        const rows = document.querySelectorAll(".order-info-content");
        const startIndex = (page - 1) * rowsPerPage;
        const endIndex = page * rowsPerPage;

        rows.forEach((row, index) => {
            row.style.display = index >= startIndex && index < endIndex ? "" : "none";
        });
    }

    // 작업지시서 버튼 클릭 시 iframe 변경
    document.getElementById("WO-select").addEventListener("click", function () {
        const iframe = parent.document.querySelector("iframe");
        if (iframe) {
            iframe.src = "ProductionInformation.jsp";
        } else {
            console.log("iframe을 찾을 수 없습니다.");
        }
    });
});
