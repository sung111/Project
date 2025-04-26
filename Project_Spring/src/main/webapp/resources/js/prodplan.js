	/* 시간 */
	document.addEventListener('DOMContentLoaded', function () {
	    const today = new Date();
	    // 현재 활성화된 버튼을 기억하는 변수
	    let activeButton = null;
	    document.querySelectorAll('.ProdPlanbtn').forEach(button => {
	        button.addEventListener('click', function () {
	            const parentTd = this.closest('td');
	            const isOverall = parentTd.previousElementSibling?.innerText.includes('전체');
	            const type = this.innerText; // 일간 / 주간 / 월간

	            // 같은 버튼을 다시 누르면 초기화
	            if (activeButton === this) {
	                resetView();
	                resetButtonStyles();
	                activeButton = null;
	                return;
	            }

	            activeButton = this;

	            // 버튼 스타일 초기화 후 현재 버튼 스타일 적용
	            resetButtonStyles();
	            this.style.color = '#007bff';
	            this.style.border = '1px solid #007bff';

	            // 기간 설정
	            let startCheck, endCheck;
	            const now = new Date(); // 버튼 클릭 순간 기준으로 새로 계산

	            if (isOverall) {
	                if (type === '일간') {
	                    startCheck = new Date(now);
	                    endCheck = new Date(now);
	                } else if (type === '주간') {
	                    const day = now.getDay() || 7; // 일요일(0) -> 7로 조정
	                    startCheck = new Date(now);
	                    startCheck.setDate(now.getDate() - day + 1); // 월요일
	                    endCheck = new Date(startCheck);
	                    endCheck.setDate(startCheck.getDate() + 6); // 일요일
	                } else if (type === '월간') {
	                    startCheck = new Date(now.getFullYear(), now.getMonth(), 1);
	                    endCheck = new Date(now.getFullYear(), now.getMonth() + 1, 0);
	                }
	            } else {
	                if (type === '일간') {
	                    startCheck = new Date(now);
	                    endCheck = new Date(now);
	                } else if (type === '주간') {
	                    startCheck = new Date(now);
	                    const day = now.getDay() || 7; // 일요일(0) -> 7
	                    endCheck = new Date(now);
	                    endCheck.setDate(now.getDate() + (7 - day)); // 이번주 일요일
	                } else if (type === '월간') {
	                    startCheck = new Date(now);
	                    endCheck = new Date(now.getFullYear(), now.getMonth() + 1, 0); // 이번달 마지막날
	                }
	            }

	            // 모든 tr 돌면서 startDate와 endDate 비교
	            document.querySelectorAll('tr[name="prodPlanList"]').forEach(tr => {
	                const startInput = tr.querySelector('input[name="startDate"]');
	                const endInput = tr.querySelector('input[name="endDate"]');

	                if (!startInput || !endInput) {
	                    tr.style.display = 'none'; // start나 end 없으면 숨김
	                    return;
	                }

	                const startDate = new Date(startInput.value);
	                const endDate = new Date(endInput.value);

	                // 겹치는 구간이 있으면 보여주고 아니면 숨기기
	                if (startDate <= endCheck && endDate >= startCheck) {
	                    tr.style.display = '';
	                } else {
	                    tr.style.display = 'none';
	                }
	            });
	        });
	    });

	    function resetView() {
	        // 모든 tr 보여주기
	        document.querySelectorAll('tr[name="prodPlanList"]').forEach(tr => {
	            tr.style.display = '';
	        });
	    }

	    function resetButtonStyles() {
	        // 모든 버튼 스타일 초기화
	        document.querySelectorAll('.ProdPlanbtn').forEach(btn => {
	            btn.style.color = '#999999';
	            btn.style.border = '1px solid #999999';
	        });
	    }
	});

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


document.addEventListener('DOMContentLoaded', function() {



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

//특정한 행 지정
    const creatorInput = document.getElementById('creator'); const productionPeriodInput = document.getElementById('productionPeriod');
    if (creatorInput && productionPeriodInput) {
        let selectedRow = null; 
        document.querySelectorAll('tr[name="prodPlanList"]').forEach(tr => {
            tr.addEventListener('click', function() {
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
                    creatorInput.value = '';
                    productionPeriodInput.value = '';
                    this.classList.remove('selected');
                    this.style.backgroundColor = ''; 
                    selectedRow = null; 
                } else {
                    // 새 tr을 클릭하면 기존 값 채우기
                    creatorInput.value = username;
                    productionPeriodInput.value = startDate + ' ~ ' + endDate;
                    this.classList.add('selected'); 
                    this.style.backgroundColor = '#999999'; 
                    selectedRow = this; 
                }
            });
        });
    } else {
        console.error('creatorInput or productionPeriodInput is not found');
    }
    
    
    
});