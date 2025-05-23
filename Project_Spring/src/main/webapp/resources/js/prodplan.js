document.addEventListener('DOMContentLoaded', function () {
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
            event.preventDefault(); searchButton.click();
        }
    });

    //특정한 행 지정
    const creatorInput = document.getElementById('creator'); const productionPeriodInput = document.getElementById('productionPeriod');
    if (creatorInput && productionPeriodInput) {
        let selectedRow = null;
        document.querySelectorAll('tr[name="prodPlanList"]').forEach(tr => {
            tr.addEventListener('click', function () {
                const username = this.dataset.username || '알 수 없음';
                const startDate = this.dataset.startdate || '';
                const endDate = this.dataset.enddate || '';

                // 이전에 선택된 tr이 있으면 배경색을 원래대로 복원
                if (selectedRow && selectedRow !== this) {
                    selectedRow.style.backgroundColor = '';
                }

                // 이미 클릭된 tr인지 확인
                if (this.classList.contains('selected')) {
                    // 이미 선택된 tr을 다시 클릭하면 값 비우기
                    creatorInput.value = ''; productionPeriodInput.value = '';
                    this.classList.remove('selected'); this.style.backgroundColor = '';
                    selectedRow = null;
                } else {
                    // 새 tr을 클릭하면 기존 값 채우기
                    creatorInput.value = username; productionPeriodInput.value = startDate + ' ~ ' + endDate;
                    this.classList.add('selected'); this.style.backgroundColor = '#999999';
                    selectedRow = this;
                }
            });
        });
    } else {
        console.error('creatorInput or productionPeriodInput is not found');
    }
});