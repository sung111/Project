document.addEventListener("DOMContentLoaded", function () {
    //전체 상품 생산계획 조회버튼
    function getProductionPlan(range) {
        const today = new Date();
        const endOfWeek = new Date(today);
        const endOfMonth = new Date(today.getFullYear(), today.getMonth() + 1, 0);

        endOfWeek.setDate(today.getDate() + (5 - today.getDay())); // 이번 주 금요일
        let endDate;

        if (range === 'daily') {
            endDate = today;
        } else if (range === 'weekly') {
            endDate = endOfWeek;
        } else if (range === 'monthly') {
            endDate = endOfMonth;
        }

        // 데이터에서 오늘부터 endDate까지의 항목 필터링
        const filteredData = productionData.filter(item => {
            const productionDate = new Date(item.date);
            return productionDate >= today && productionDate <= endDate;
        });

        // 상품 이름별로 그룹화하고 수량 합산
        const groupedData = {};
        filteredData.forEach(item => {
            if (!groupedData[item.productName]) {
                groupedData[item.productName] = 0;
            }
            groupedData[item.productName] += item.quantity;
        });

        // 결과 리스트 생성
        const resultList = Object.keys(groupedData).map(name => ({
            productName: name,
            totalQuantity: groupedData[name]
        }));

        return resultList;
    }

    // 버튼 클릭 이벤트 핸들러
    document.getElementById("getPlanBtn").addEventListener("click", function () {
        const button = this;
        const isActive = button.classList.contains("active");
        if (isActive) {
            // 비활성화 (원래 색상으로 복구)
            button.classList.remove("active");
        } else {
            // 활성화 (색상 변경)
            button.classList.add("active");
            const range = document.querySelector('input[name="range"]:checked').value;
            const result = getProductionPlan(range);
            console.log(result); // 콘솔에 출력 (UI에 표시 가능)
        }
    });
    //일정별 상품 생산계획 조회버튼

    // Search 검색
    const searchButton = document.querySelector('.submitlayer');
    const searchInput = document.querySelector('input[name="Prodsearch"]');
    searchButton.addEventListener('click', function (event) {
        // 기본 폼 제출 X
        event.preventDefault();
        const searchText = searchInput.value.trim().toLowerCase();
        const rows = document.querySelectorAll('.order-info-content');
        // 검색 텍스트가 없으면 모든 행을 표시
        if (searchText === "") {
            rows.forEach(row => {
                row.style.display = "";
            });
        } else {
            // 검색 텍스트가 포함된 행만 표시됨
            rows.forEach(row => {
                const rowText = row.innerText.toLowerCase();
                if (rowText.includes(searchText)) {
                    // 텍스트가 포함된 행만 표시한다.
                    row.style.display = "";
                } else {
                    // 텍스트가 포함되지 않은 행은 숨긴다
                    row.style.display = "none";
                }
            });
        }
        // 작성하고 검색을 누르면 기존에 input에 썻던 내용은 초기화 된다.
        searchInput.value = "";
    });

    // Search 엔터 연결
    searchInput.addEventListener('keydown', function (event) {
        if (event.key === 'Enter') {
            // 기본되는 엔터 동작을 방지함
            event.preventDefault();
            searchButton.click();
        }
    });
    // 선택된 행을 저장할 변수
    let selectedRow = null;

    // 생산계획 행 선택
    document.querySelector(".new-workorder tbody").addEventListener("click", function (event) {
        const clickedRow = event.target.closest(".order-info-content");

        if (clickedRow) {
            if (selectedRow === clickedRow) {
                // 선택된 행을 다시 클릭하면 색상을 원래대로 복원된다.
                clickedRow.style.backgroundColor = "";
                selectedRow = null;

                // 생성인과 생산기간 초기화
                document.querySelector("input[name='delivery']").value = '';
                document.querySelector("input[name='writer']").value = '';
            } else {
                // 이전에 선택된 행이 있다면 색상 제거한다.
                if (selectedRow) {
                    selectedRow.style.backgroundColor = "";
                }

                // 새로 클릭한 행에 배경색 적용
                clickedRow.style.backgroundColor = "#999999"; // 선택된 행의 배경 색
                selectedRow = clickedRow;

                // 행을 선택하면 생성인과 생산기간이 자동으로 나타난다.
                let targetRow = event.target.closest("tr");
                if (targetRow && targetRow.dataset.userid) {
                    let userid = targetRow.dataset.userid;
                    let startDate = targetRow.dataset.startDate;
                    let endDate = targetRow.dataset.endDate;

                    console.log("선택한 생성인:", userid);
                    console.log("선택한 생산기간:", startDate, "~", endDate);

                    // 생성인과 생산기간을 해당 input 필드에 채우기
                    document.querySelector("input[name='delivery']").value = userid;
                    document.querySelector("input[name='writer']").value = startDate + " ~ " + endDate;
                }
            }
        }
    });

    // // 생산계획 행 선택
    // document.querySelector(".new-workorder tbody").addEventListener("click", function (event) {
    //     const clickedRow = event.target.closest(".order-info-content");
    //     if (clickedRow) {
    //         if (selectedRow === clickedRow) {
    //             // 선택된 행을 다시 클릭하면 색상을 원래대로 복원된다.
    //             clickedRow.style.backgroundColor = "";
    //             selectedRow = null;
    //         } else {
    //             // 이전에 선택된 행이 있다면 색상 제거한다.
    //             if (selectedRow) {
    //                 selectedRow.style.backgroundColor = "";
    //             }
    //             // 새로 클릭한 행에 배경색 적용
    //             clickedRow.style.backgroundColor = "#999999"; // 선택된 행의 변경되는 배경 색
    //             selectedRow = clickedRow;
    //         }
    //     }
    //     // 행을 선택하면 생성인과 생산기간이 자동으로 나타난다.
    //     let targetRow = event.target.closest("tr");
    //     if (targetRow && targetRow.dataset.userid) {
    //         let userid = targetRow.dataset.userid;
    //         let startDate = targetRow.dataset.startDate;
    //         let endDate = targetRow.dataset.endDate;

    //         console.log("선택한 생성인:", userid);
    //         console.log("선택한 생산기간:", startDate, "~", endDate);

    //         // 생성인과 생산기간을 해당 input 필드에 채우기
    //         document.querySelector("input[name='delivery']").value = userid;
    //         document.querySelector("input[name='writer']").value = startDate + " ~ " + endDate;
    //     }
    // });

    // 페이지네이션 초기화
    updatePagination();

    // 페이지네이션
    function updatePagination() {
        const rows = document.querySelectorAll(".order-info-content");
        const totalRows = rows.length;

        // 최소 1페이지는 생성이 된다.
        const totalPages = Math.max(1, Math.ceil(totalRows / rowsPerPage));
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

        // 페이지 번호 버튼 생성
        const startPage = Math.max(1, currentPage - 2);
        const endPage = Math.min(totalPages, currentPage + 2);

        for (let i = startPage; i <= endPage; i++) {
            const pageButton = document.createElement("a");
            pageButton.textContent = i;
            if (i === currentPage) {
                pageButton.style.fontWeight = "bold";
            }
            pageButton.addEventListener("click", function () {
                currentPage = i;
                displayPage(currentPage);
                updatePagination();
            });
            paginationContainer.appendChild(pageButton);
        }

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

    // 수정 버튼을 클릭하게 된다면 생성되는 이벤트
    document.getElementById("prodPlan-Modify").addEventListener("click", function () {
        if (!selectedRow) {
            alert("수정할 행을 선택하세요.");
            return;
        }

        let cells = selectedRow.children;
        let originalValues = [];

        // 모든 td를 input 필드로 변경
        for (let i = 0; i < cells.length - 1; i++) {
            let cell = cells[i];
            let originalText = cell.innerText.trim();
            originalValues.push(originalText);
            cell.innerHTML = `<input type="text" value="${originalText}">`;
        }

        // 확인 & 취소 버튼 추가
        let actionCell = document.createElement("td");
        actionCell.innerHTML = `
                <button id="saveChangesBtn">확인</button>
                <button id="cancelChangesBtn">취소</button>
            `;
        selectedRow.appendChild(actionCell);

        // 확인 버튼 클릭 이벤트
        document.getElementById("saveChangesBtn").addEventListener("click", function () {
            let inputs = selectedRow.querySelectorAll("input");
            let updatedData = {
                planId: selectedRow.getAttribute("data-id"),
                productName: inputs[0].value,
                lotNumber: inputs[1].value,
                unit: inputs[2].value,
                warehouse: inputs[3].value,
                deliveryDest: inputs[4].value,
                partNumber: inputs[5].value,
                totalQty: inputs[6].value,
                createDate: inputs[7].value,
                startDate: inputs[8].value,
                endDate: inputs[9].value,
                planStatus: inputs[10].value,
                planCause: inputs[11].value,
                planNotes: inputs[12].value
            };

            fetch("UpdateProductionPlan", {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify(updatedData)
            })
                .then(response => response.json())
                .then(data => {
                    if (data.success) {
                        alert("수정 완료!");
                        for (let i = 0; i < inputs.length; i++) {
                            cells[i].innerText = inputs[i].value;
                        }
                    } else {
                        alert("수정 실패: " + data.message);
                        resetRow();
                    }

                    // 확인 버튼 클릭 후 'actionCell' 삭제
                    resetRow();
                })
                .catch(error => {
                    console.error("Error:", error);
                    resetRow();
                });
        });

        // 취소 버튼 클릭 이벤트
        document.getElementById("cancelChangesBtn").addEventListener("click", function () {
            resetRow();
        });
        // 원래 상태로 복구하는 함수
        function resetRow() {
            for (let i = 0; i < originalValues.length; i++) {
                cells[i].innerText = originalValues[i];
            }
            selectedRow.removeChild(actionCell); // 'actionCell' 삭제
        }
    });

    // 삭제 버튼 클릭 이벤트
    document.getElementById("prodPlan-delete").addEventListener("click", function () {
        if (!selectedRow) {
            alert("삭제할 행을 선택하세요.");
            return;
        }

        // 확인 메시지 띄우기
        if (confirm("정말로 이 행을 삭제하시겠습니까?")) {
            const planId = selectedRow.getAttribute("data-id");

            // 서버에 삭제 요청 보내기
            fetch("http://localhost:8081/project_HHMES/ProductionPlan_controller?action=delete", {
                method: "POST",
                headers: {
                    "Content-Type": "application/x-www-form-urlencoded"
                },
                body: new URLSearchParams({ planId: 삭제할_아이디 }).toString()
            })
                .then(response => {
                    if (response.ok) {
                        console.log("삭제 성공!");
                        // 페이지를 새로고침한다.
                        location.reload();
                    } else {
                        console.error("삭제 실패");
                    }
                })
                .catch(error => console.error("에러 발생:", error));
        }
    });

    // 상품계획 생성 버튼
    // 상품계획 생성 버튼 클릭 이벤트
    document.getElementById("new-ProdPlan").addEventListener("click", function () {
        const tableBody = document.querySelector(".new-workorder tbody");
        const newRow = document.createElement("tr");
        newRow.classList.add("order-info-content", "wolist");
        newRow.innerHTML = `
            <td>
                <input type="text" class="product-input" placeholder="품명 선택">
            </td>
            <td>데이터 없음</td>
            <td>데이터 없음</td>
            <td>데이터 없음</td>
            <td>데이터 없음</td>
            <td>데이터 없음</td>
            <td>데이터 없음</td>
            <td>데이터 없음</td>
            <td>데이터 없음</td>
            <td>데이터 없음</td>
            <td>MRP 계산</td>
            <td>데이터 없음</td>
            <td>데이터 없음</td>
            <td>데이터 없음</td>
        `;
        tableBody.appendChild(newRow);
    });

    // 품명 입력창 클릭 시 상품 탭 표시 이벤트
    document.addEventListener("click", function (event) {
        if (event.target.classList.contains("product-input")) {
            const row = event.target.closest("tr");
            if (!row.nextElementSibling || !row.nextElementSibling.classList.contains("product-tab")) {
                const productTabRow = document.createElement("tr");
                productTabRow.classList.add("product-tab");
                productTabRow.innerHTML = `
<td colspan="14">
    <div class="product-tab-content">
        <span>상품 목록:</span>
        <ul>
            <% for (ProductionPlan_DTO planItem : planList) { %>
                <li>
                    <%=(planItem.getProduct() != null) ? planItem.getProduct().getProductname() : "데이터 없음"%>
                    [<%=(planItem.getProduct() != null) ? planItem.getProduct().getSpec() : "데이터 없음"%>
                    <%=(planItem.getProduct() != null) ? planItem.getProduct().getUnit() : "데이터 없음"%>]
                </li>
            <% } %>
        </ul>
    </div>
</td>
                `;
                row.parentNode.insertBefore(productTabRow, row.nextSibling);
            } else {
                row.nextElementSibling.remove();
            }
        }
    });

    // 작업지시서 버튼 클릭 시 iframe 변경
    document.getElementById("WO-select").addEventListener("click", function () {
        const iframe = parent.document.querySelector("iframe");
        if (iframe) {
            iframe.src = "WorkOrder.jsp";
        } else {
            console.log("iframe을 찾을 수 없습니다.");
        }
    });
});