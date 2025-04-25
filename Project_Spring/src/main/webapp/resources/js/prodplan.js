document.addEventListener("DOMContentLoaded", function () {
    //전체 상품 생산계획 조회버튼
    function getProductionPlan(range) {
        const today = new Date(); const endOfWeek = new Date(today); const endOfMonth = new Date(today.getFullYear(), today.getMonth() + 1, 0);
        endOfWeek.setDate(today.getDate() + (5 - today.getDay())); // 이번 주 금요일
        let endDate;
        if (range === 'daily') { endDate = today;
        } else if (range === 'weekly') { endDate = endOfWeek;
        } else if (range === 'monthly') { endDate = endOfMonth; }
        // 데이터에서 오늘부터 endDate까지의 항목 필터링
        const filteredData = productionData.filter(item => {
            const productionDate = new Date(item.date);
            return productionDate >= today && productionDate <= endDate; });
        // 상품 이름별로 그룹화하고 수량 합산
        const groupedData = {};
        filteredData.forEach(item => { if (!groupedData[item.productName]) { groupedData[item.productName] = 0; } groupedData[item.productName] += item.quantity;
        });
        // 결과 리스트 생성
        const resultList = Object.keys(groupedData).map(name => ({ productName: name, totalQuantity: groupedData[name] }));
        return resultList;
    }

    // Search 검색
    const searchButton = document.querySelector('.submitlayer'); const searchInput = document.querySelector('input[name="Prodsearch"]');
    searchButton.addEventListener('click', function (event) {
        // 기본 폼 제출 X
        event.preventDefault(); const searchText = searchInput.value.trim().toLowerCase(); const rows = document.querySelectorAll('.order-info-content');
        // 검색 텍스트가 없으면 모든 행을 표시
        if (searchText === "") {
            rows.forEach(row => { row.style.display = ""; });
        } else {
            // 검색 텍스트가 포함된 행만 표시됨
            rows.forEach(row => { const rowText = row.innerText.toLowerCase();
                if (rowText.includes(searchText)) {
                    // 텍스트가 포함된 행만 표시한다.
                    row.style.display = ""; } else {
                    // 텍스트가 포함되지 않은 행은 숨긴다
                    row.style.display = "none";
                }
            });
        }
        // 작성하고 검색을 누르면 기존에 input에 썻던 내용은 초기화 된다.
        searchInput.value = "";
    });
    // Search 엔터 연결
    searchInput.addEventListener('keydown', function (event) { if (event.key === 'Enter') {
            // 기본되는 엔터 동작을 방지함
            event.preventDefault(); searchButton.click();
        }
    });
    
    // 생산계획 행 선택
    // 선택된 행을 저장할 변수
    let selectedRow = null;
    document.querySelector(".new-workorder tbody").addEventListener("click", function (event) { const clickedRow = event.target.closest(".order-info-content");
        if (clickedRow) { if (selectedRow === clickedRow) {
                // 선택된 행을 다시 클릭하면 색상을 원래대로 복원된다.
                clickedRow.style.backgroundColor = ""; selectedRow = null;
                // 생성인과 생산기간 초기화
                document.querySelector("input[name='delivery']").value = ''; document.querySelector("input[name='writer']").value = '';
            } else {
                // 이전에 선택된 행이 있다면 색상 제거한다.
                if (selectedRow) { selectedRow.style.backgroundColor = ""; }
                // 새로 클릭한 행에 배경색 적용
                clickedRow.style.backgroundColor = "#999999"; selectedRow = clickedRow;

                // 행을 선택하면 생성인과 생산기간이 자동으로 나타난다.
                let targetRow = event.target.closest("tr");
                if (targetRow && targetRow.dataset.userid) {
                    let userid = targetRow.dataset.userid; let startDate = targetRow.dataset.startDate; let endDate = targetRow.dataset.endDate;
                    console.log("선택한 생성인:", userid);
                    console.log("선택한 생산기간:", startDate, "~", endDate);
                    // 생성인과 생산기간을 해당 input 필드에 채우기
                    document.querySelector("input[name='delivery']").value = userid;
                    document.querySelector("input[name='writer']").value = startDate + " ~ " + endDate;
                }
            }
        }
    });



});