// 신규 작업지시서 생성
document.addEventListener("DOMContentLoaded", function () {
    // userRole = 로그인한 사람이 user인지 admin인지 구분하기위한 선언
    const userRole = window.parent.localStorage.getItem("userRole");
    const NewWorkorderbutton = document.querySelector(".new-workorder-button");
    NewWorkorderbutton.addEventListener("click", function () {
        // user권한은 생성 불가
        if (userRole == "user") {
            alert("권한이 없습니다.");
            // admin권한 생성
        } else if (userRole == "admin") {
            alert("환영합니다. admin님! 새로운 생산 작업계획서를 생성합니다.");
            const iframe = parent.document.querySelector("iframe");
            iframe.src = "componant/NewWorkorder.html";
        } else {
            alert("로그인이 필요합니다.");
        }
    })
})
// 신규 작업지시서 생성

// MRP계산 버튼
document.addEventListener("DOMContentLoaded", function () {
    const WorkorderWallpaper = document.querySelector(".workorder-shadowwallpaper");
    const workorderMRPbutton = document.querySelector(".workorderlist-MRPcalc");
    const workorderMRPcalc = document.querySelector(".workorder-MRPcalc");
    const workorderMRPcalcclose = document.querySelector(".workorder-MRPcalc-close span");
    workorderMRPbutton.addEventListener("click", function () {
        WorkorderWallpaper.style.display = "flex";
        workorderMRPcalc.style.display = "block";
    })
    workorderMRPcalcclose.addEventListener("click", function () {
        WorkorderWallpaper.style.display = "none";
        workorderMRPcalc.style.display = "none";
    })

    // 생산계획서 열람 버튼
    const ProductPlanstatus = document.querySelector(".workorderlist-productplanstatus");
    const SamplePage = document.querySelector(".sample");
    const MainPage1 = document.querySelector(".workorder-search-layer");
    const MainPage2 = document.querySelector(".workorder-layer");
    const MainPage3 = document.querySelector(".workorder-page");
    const MainPage4 = document.querySelector(".workorder-add");
    const MainPage5 = document.querySelector(".workorder-registration");
    const MainPage6 = document.querySelector(".workorder-delete");
    const MainClose = document.querySelector(".workorder-cancel");
    ProductPlanstatus.addEventListener("click", function () {
        SamplePage.style.display = "flex";
        MainPage1.style.display = "none";
        MainPage2.style.display = "none";
        MainPage3.style.display = "none";
        MainPage4.style.display = "none";
        MainPage5.style.display = "none";
        MainPage6.style.display = "none";
    })
    MainClose.addEventListener("click", function () {
        SamplePage.style.display = "none";
        MainPage1.style.display = "flex";
        MainPage2.style.display = "block";
        MainPage3.style.display = "flex";
    })
});



// 작업지시서 목록의 추가
document.addEventListener("DOMContentLoaded", function () {
    const workOrderList = document.querySelector(".workorderlist");
    if (!workOrderList) {
        console.error(" '.workorderlist' 요소를 찾을 수 없습니다.");
        return;
    }
    let workOrders = JSON.parse(localStorage.getItem("workOrders")) || [];
    console.log(" 불러온 작업 지시서:", workOrders); // 로그 확인
    workOrderList.innerHTML = "";

    if (workOrders.length === 0) {
        workOrderList.innerHTML = "<li></li>";
        return;
    }

    workOrders.forEach((order, index) => {
        console.log(` 작업 지시서 ${index}:`, order); // 개별 항목 로그 확인

        let listItem = document.createElement("ul");
        listItem.classList.add("workorderlist-content");

        listItem.innerHTML = `
        <li class="workorderlist-createdate">${order.createDate}</li>
        <li class="workorderlist-productplandate">${order.createDate}<br/>~<br/>${order.dueDate}</li>
        <li class="workorderlist-productplancalc">
            <button class="edit-workorder" data-index="${index}">수정</button>
        </li>
        <li class="workorderlist-MRPcalc"><a href="#">생성</a></li>
        <li class="workorderlist-productplanstatus"><a href="#">생산계획현황</a></li>
        <li class="workorderlist-name">${order.creator && order.creator.trim() !== "" ? order.creator : "비공개 작성자"}</li> 
    `;

        workOrderList.appendChild(listItem);
    });

    // "수정" 버튼 클릭 이벤트 추가
    document.querySelectorAll(".edit-workorder").forEach(button => {
        button.addEventListener("click", function () {
            const index = this.getAttribute("data-index");
            localStorage.setItem("editWorkOrder", index);
            window.location.href = "NewWorkorder.html";
        });
    });
});

// 페이지네이션
document.addEventListener("DOMContentLoaded", function () {
    // 두 개의 리스트를 가져옴
    const workOrderList1 = Array.from(document.querySelectorAll(".workorderlist-content"));
    const workOrderList2 = Array.from(document.querySelectorAll(".workorderlist-content2"));
    const itemsPerPage = 7; 
    let currentPage = 1; 

    // 두 리스트를 합쳐서 중복 없는 배열 생성 아아앍 샘플이랑 섞어하자니 힘들어
    const combinedWorkOrders = [...workOrderList1, ...workOrderList2];
    // 페이지네이션 렌더링을 위한 대상 컨테이너
    const workOrderListContainer = document.querySelector(".workorderlist");
    // 현재 페이지 항목을 렌더링
    function renderPage(page) {
        // 컨테이너 초기화
        workOrderListContainer.innerHTML = "";
        // 현재 페이지에 해당하는 항목 가져오기
        const start = (page - 1) * itemsPerPage;
        const end = start + itemsPerPage;
        const pagedItems = combinedWorkOrders.slice(start, end);

        // 페이지 항목을 렌더링
        pagedItems.forEach(item => {
            workOrderListContainer.appendChild(item); // 기존 DOM 요소를 이동
        });
    }

    // 페이지네이션 버튼 렌더링
    function renderPagination() {
        const paginationContainer = document.querySelector(".workorder-pagenation");
        paginationContainer.innerHTML = ""; // 기존 버튼 초기화

        const totalPages = Math.ceil(combinedWorkOrders.length / itemsPerPage); // 전체 페이지 수 계산

        for (let i = 1; i <= totalPages; i++) {
            const pageButton = document.createElement("button");
            pageButton.textContent = i;

            // 현재 페이지 강조 스타일
            if (i === currentPage) {
                pageButton.style.fontWeight = "bold";
                pageButton.style.textDecoration = "underline";
            }

            // 페이지 버튼 클릭 이벤트
            pageButton.addEventListener("click", function () {
                currentPage = i;
                renderPage(currentPage);
                renderPagination(); // 버튼 다시 렌더링
            });

            paginationContainer.appendChild(pageButton);
        }
    }

    // 초기 렌더링
    renderPage(currentPage); // 첫 번째 페이지 렌더링
    renderPagination(); // 페이지네이션 버튼 렌더링
});

// 검색 페이지
document.addEventListener("DOMContentLoaded", function () {
    // 검색 입력 필드와 버튼 가져오기
    const searchInput = document.querySelector(".workorder-search");
    const searchButton = document.querySelector(".workorder-search-button");
    const workorderLists = document.querySelectorAll(".workorderlist-content2");

    // 검색 버튼 클릭 이벤트 추가
    searchButton.addEventListener("click", function (event) {
        event.preventDefault(); // 폼 제출 방지

        const query = searchInput.value.toLowerCase();

        // 모든 리스트 아이템을 확인
        workorderLists.forEach((listItem) => {
            const textContent = listItem.textContent.toLowerCase();
            if (textContent.includes(query)) {
                listItem.style.display = "flex";
            } else {
                listItem.style.display = "none";
            }
        });
    });
    const noResultMessage = document.createElement("div");
    noResultMessage.textContent = "검색 결과가 없습니다.";
    noResultMessage.style.display = "none";
    document.querySelector(".workorder-layer").appendChild(noResultMessage);

    workorderLists.forEach((listItem) => {
        if (textContent.includes(query)) {
            listItem.style.display = "flex";
            hasResult = true;
        } else {
            listItem.style.display = "none";
        }
    });

    noResultMessage.style.display = hasResult ? "none" : "block";
});


// 일간 주간 월간 조회
document.addEventListener("DOMContentLoaded", function () {
    const dailyBtn = document.querySelector(".workorder-inquiry-daily");
    const weeklyBtn = document.querySelector(".workorder-inquiry-week");
    const monthlyBtn = document.querySelector(".workorder-inquiry-month");
    let workOrderItems = document.querySelectorAll(".workorderlist-content");
    const workOrderListContainer = document.querySelector(".workorderlist");
    const currentDate = new Date();

    function formatDate(date) {
        return date.toISOString().split("T")[0];
    }

    function isWithinRange(dateStr, startDate, endDate) {
        const date = new Date(dateStr);
        return date >= startDate && date <= endDate;
    }

    function filterByDateRange(startDate, endDate) {
        const filteredItems = [];
        workOrderItems.forEach(item => {
            const createdDateStr = item.getAttribute("data-createdate");
            if (isWithinRange(createdDateStr, startDate, endDate)) {
                filteredItems.push(item);
            }
        });
        workOrderListContainer.innerHTML = "";
        filteredItems.forEach(item => workOrderListContainer.appendChild(item));
    }

    dailyBtn.addEventListener("click", function () {
        filterByDateRange(currentDate, currentDate);
    });

    weeklyBtn.addEventListener("click", function () {
        const weekStart = new Date(currentDate);
        weekStart.setDate(weekStart.getDate() - weekStart.getDay() + 1);
        const weekEnd = new Date(weekStart);
        weekEnd.setDate(weekStart.getDate() + 6);
        filterByDateRange(weekStart, weekEnd);
    });

    monthlyBtn.addEventListener("click", function () {
        const monthStart = new Date(currentDate.getFullYear(), currentDate.getMonth(), 1);
        const monthEnd = new Date(currentDate.getFullYear(), currentDate.getMonth() + 1, 0);
        filterByDateRange(monthStart, monthEnd);
    });
});