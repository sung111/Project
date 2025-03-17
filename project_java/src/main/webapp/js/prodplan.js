document.addEventListener("DOMContentLoaded", function () {
    // Search 검색
    const searchButton = document.querySelector('.submitlayer');
    const searchInput = document.querySelector('input[name="Prodsearch"]');
    
    searchButton.addEventListener('click', function(event) {
        // 기본 폼 제출 방지
        event.preventDefault(); 
        const searchText = searchInput.value.trim().toLowerCase();
        const rows = document.querySelectorAll('.order-info-content');
        
        // 검색 텍스트가 없으면 모든 행을 표시
        if (searchText === "") {
            rows.forEach(row => {
                row.style.display = "";
            });
        } else {
            // 검색 텍스트가 포함된 행만 표시
            rows.forEach(row => {
                const rowText = row.innerText.toLowerCase();
                if (rowText.includes(searchText)) {
                    // 텍스트가 포함된 행은 표시
                    row.style.display = ""; 
                } else {
                    // 텍스트가 포함되지 않은 행은 숨김
                    row.style.display = "none"; 
                }
            });
        }

        // 입력 필드 초기화
        searchInput.value = "";
    });


    // 생산계획 목록을 누르면 특정한 생산계획을 지정한다.
    let selectedRow = null;
    const rowsPerPage = 10;
    let currentPage = 1;

    // 생산계획 행 선택
    document.querySelector(".new-workorder tbody").addEventListener("click", function (event) {
        const clickedRow = event.target.closest(".order-info-content");

        if (clickedRow) {
            if (selectedRow === clickedRow) {
                // 선택된 행을 다시 클릭하면 색상을 원래대로 복원
                clickedRow.style.backgroundColor = "";
                selectedRow = null;
            } else {
                // 이전에 선택된 행이 있다면 색상 제거
                if (selectedRow) {
                    selectedRow.style.backgroundColor = "";
                }
                // 새로 클릭한 행에 배경색 적용
                clickedRow.style.backgroundColor = "#999999"; // 선택된 행의 배경색 회색으로 변경
                selectedRow = clickedRow;
            }
        }
    });
    

    // 페이지네이션 초기화
    updatePagination();

    // 페이지네이션
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
        pageButton.style.fontWeight = "bold";
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

    // 수정 버튼을 클릭하게 된다면 생성되는 이벤트
    document.getElementById("prodPlan-Modify").addEventListener("click", function () {
        if (!selectedRow) {
            alert("수정할 행을 선택하세요.");
            return;
        }

        let cells = selectedRow.children;
        let notesCell = cells[12]; // 비고 칸 (13번째 열, index는 12)

        if (notesCell.querySelector("input")) {
            return; // 이미 수정 중이라면 중복 실행 방지
        }

        let originalNotes = notesCell.innerText.trim();

        // 기존 텍스트를 숨기고 input 필드로 변경
        notesCell.innerHTML = `
            <input type="text" id="editNotesInput" value="${originalNotes}">
            <button id="saveNotesBtn">수정 완료</button>
            <button id="cancelNotesBtn">취소</button>
        `;

        // 수정 완료 버튼 이벤트
        document.getElementById("saveNotesBtn").addEventListener("click", function () {
            let newNotes = document.getElementById("editNotesInput").value;

            // 서버로 데이터 전송
            fetch("UpdateProductionPlan", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json"
                },
                body: JSON.stringify({
                    planId: selectedRow.getAttribute("data-id"), // 각 행의 고유 ID 필요
                    planNotes: newNotes
                })
            })
                .then(response => response.json())
                .then(data => {
                    if (data.success) {
                        alert("비고 수정 완료!");
                        notesCell.innerHTML = newNotes; // 수정된 값 적용
                    } else {
                        alert("수정 실패: " + data.message);
                        notesCell.innerHTML = originalNotes; // 원래 값 복구
                    }
                })
                .catch(error => {
                    console.error("Error:", error);
                    notesCell.innerHTML = originalNotes; // 오류 발생 시 복구
                });
        });

        // 수정 중간에 취소 버튼 이벤트
        document.getElementById("cancelNotesBtn").addEventListener("click", function () {
            notesCell.innerHTML = originalNotes; // 원래 값으로 복귀
        });
    });

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
