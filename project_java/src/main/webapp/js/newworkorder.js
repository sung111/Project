// 로그인 권한 판독
document.addEventListener("DOMContentLoaded", function () {
    const userRole = window.parent.localStorage.getItem("userRole");
    const NewProductioninfo = document.querySelector(".workorder-add")
    NewProductioninfo.addEventListener("click", function () {
        if (userRole == "admin") {
            const iframe = parent.document.querySelector("iframe");
            iframe.src = "componant/ProductionInformation.html"
        }
        else if (userRole == "user") {
            alert("허가되지 계정 접근이 감지되었습니다.")
        }
        else {
            alert("로그인을 해주세요.")
        }
    })
})

// 상품제조 명령 창 스크립트
document.addEventListener("DOMContentLoaded", function () {
    const userRole = window.parent.localStorage.getItem("userRole");
    const addButton = document.querySelector(".workorder-add");
    const tbody = document.querySelector(".new-workorder tbody");
    addButton.addEventListener("click", function () {
        if (userRole == "admin") {
            const newRow = document.createElement("tr");
            newRow.classList.add("order-info-content");
            // 새로운 리스트가 추가된다.
            newRow.innerHTML = `
                    <td><input type="text" placeholder="품명[규격]"></td>
                    <td><input type="text" placeholder="품목코드"></td>
                    <td><input type="text" placeholder="단위"></td>
                    <td><input type="number" placeholder="제작수량"></td>
                    <td><input type="date"></td>
                    <td><input type="date"></td>
                    <td class="order-info-content-delete">삭제하기</td>
                `;
            tbody.appendChild(newRow);
            // 해당 리스트 삭제
            newRow.querySelector(".order-info-content-delete").addEventListener("click", function () {
                newRow.remove();
            });
        } else if (userRole == "user") {
            alert("허가되지 않은 계정 접근이 감지되었습니다.");
        } else {
            alert("로그인을 해주세요.");
        }
    });
});

// 신규 생성이 아닌, 기존 데이터 수정을 통해 들어온 NewWorkOrder.html페이지
document.addEventListener("DOMContentLoaded", function () {
    const tbody = document.querySelector(".new-workorder tbody");
    let workOrders = JSON.parse(localStorage.getItem("workOrders")) || []; // 기존 데이터 불러오기
    //  테이블을 렌더링하는 함수
    function renderTable() {
        // 테이블 초기화 전에 제목 행(order-info-title) 유지
        const titleRow = `
                <tr class="order-info-title">
                    <th>품명[규격]</th>
                    <th>품목코드</th>
                    <th>단위</th>
                    <th>제작수량</th>
                    <th>생산시작일</th>
                    <th>생산종료일</th>
                    <th>등록삭제</th>
                </tr>`;

        tbody.innerHTML = titleRow; //데이터 추가

        workOrders.forEach((data, index) => {
            const newRow = document.createElement("tr");
            newRow.classList.add("order-info-content");
            newRow.innerHTML = `
                    <td>${data.productName}</td>
                    <td>${data.lotno}</td>
                    <td>${data.unit}</td>
                    <td>${data.quantity}</td>
                    <td>${data.startDate}</td>
                    <td>${data.endDate}</td>
                    <td class="order-info-content-delete" data-index="${index}">삭제하기</td>
                `;
            tbody.appendChild(newRow);
        });

        // 삭제 버튼을 누르면 workOrders.html에서 생산계획 지시서가 삭제된다.
        document.querySelectorAll(".order-info-content-delete").forEach(button => {
            button.addEventListener("click", function () {
                const index = this.getAttribute("data-index");
                workOrders.splice(index, 1);
                localStorage.setItem("workOrders", JSON.stringify(workOrders));
                renderTable();
            });
        });
    }
    renderTable();
    // 등록을 누르면 작성했던 내용들이 workOrders.html로 나타나게 된다.
    document.getElementById("saveWorkOrder").addEventListener("click", function () {
        const creatorInput = document.querySelector('[name="writer"]').value.trim(); // 작성자 입력값 가져오기
        if (!creatorInput) {
            alert("작성자를 입력해주세요!");
            return;
        }
        const newWorkOrder = {
            createDate: document.querySelector('[name="createDate"]').value,
            dueDate: document.querySelector('[name="dueDate"]').value,
            creator: creatorInput,
            productName: "제품명",
            lotno: "1234",
            unit: "개",
            quantity: "10",
            startDate: "2025-02-01",
            endDate: "2025-02-10"
        };
        let workOrders = JSON.parse(localStorage.getItem("workOrders")) || [];
        workOrders.push(newWorkOrder);
        localStorage.setItem("workOrders", JSON.stringify(workOrders));
        alert("작업 지시서가 저장되었습니다!");
        window.location.href = "WorkOrder.html";
    });

    document.getElementById("saveWorkOrder").addEventListener("click", function () {
        const creatorInput = document.querySelector('[name="writer"]').value.trim();
        if (!creatorInput) {
            alert("작성자를 입력해주세요!");
            return;
        }
        const newWorkOrder = {
            createDate: document.querySelector('[name="createDate"]').value,
            dueDate: document.querySelector('[name="dueDate"]').value,
            creator: creatorInput,
            productName: "제품명",
            lotno: "1234",
            unit: "개",
            quantity: "10",
            startDate: "2025-02-01",
            endDate: "2025-02-10"
        };
        console.log("저장될 작업 지시서:", newWorkOrder);
        let workOrders = JSON.parse(localStorage.getItem("workOrders")) || [];
        workOrders.push(newWorkOrder);
        localStorage.setItem("workOrders", JSON.stringify(workOrders));
        alert("작업 지시서가 저장되었습니다!");
        window.location.href = "WorkOrder.html";
    });
    // "작업지시서 저장" 버튼 클릭 시 저장
    document.getElementById("saveWorkOrder").addEventListener("click", function () {
        const creatorName = document.getElementById("creatorName").value; // 작성자 입력값 가져오기

        if (!creatorName) {
            alert("작성자를 입력해주세요!");
            return;
        }

        const newWorkOrder = {
            createDate: document.getElementById("createDate").value,
            dueDate: document.getElementById("dueDate").value,
            creator: creatorName,
            productName: "제품명",
            lotno: "1234",
            unit: "개",
            quantity: "10",
            startDate: "2025-02-01",
            endDate: "2025-02-10"
        };

        workOrders.push(newWorkOrder);
        localStorage.setItem("workOrders", JSON.stringify(workOrders));

        alert("작업 지시서가 저장되었습니다!");
        window.location.href = "WorkOrder.html";
    });
});

// 작성일자를 오늘로 시작
document.addEventListener("DOMContentLoaded", function () {
    function getTodayDate() {
        const today = new Date();
        const year = today.getFullYear();
        const month = String(today.getMonth() + 1).padStart(2, '0');
        const day = String(today.getDate()).padStart(2, '0');
        return `${year}-${month}-${day}`;
    }
    const dateInput = document.querySelector('[name="createDate"]');
    if (dateInput) {
        dateInput.value = getTodayDate();
    }
});

// 작업지시서 내용의 저장
document.addEventListener("DOMContentLoaded", function () {
    const registerButton = document.querySelector(".workorder-registration");

    if (!registerButton) {
        console.error(" '등록' 버튼을 찾을 수 없습니다.");
        return;
    }

    registerButton.addEventListener("click", function () {
        console.log(" 등록 버튼 클릭됨!");

        //  여기에서 입력 필드 가져오기
        const deliveryInput = document.querySelector('[name="delivery"]');
        const writerInput = document.querySelector('[name="writer"]');
        const createDateInput = document.querySelector('[name="createDate"]');
        const dueDateInput = document.querySelector('[name="dueDate"]');

        // 요소가 존재하는지 확인
        if (!deliveryInput || !writerInput || !createDateInput || !dueDateInput) {
            console.error(" 필수 입력 필드 중 하나를 찾을 수 없습니다.");
            alert(" 모든 필수 정보를 입력해주세요.");
            return;
        }

        // 입력값 가져오기
        const delivery = deliveryInput.value.trim();
        const writer = writerInput.value.trim();
        const createDate = createDateInput.value.trim();
        const dueDate = dueDateInput.value.trim();

        if (!delivery || !writer || !createDate || !dueDate) {
            alert(" 모든 필수 정보를 입력해주세요.");
            return;
        }

        //  기존 작업 지시서 목록 불러오기
        let workOrders = JSON.parse(localStorage.getItem("workOrders")) || [];

        //  새로운 작업 지시서 추가
        let newOrder = { delivery, writer, createDate, dueDate };
        workOrders.push(newOrder);

        //  업데이트된 데이터 저장
        localStorage.setItem("workOrders", JSON.stringify(workOrders));

        console.log(" 작업 지시서 저장 완료:", workOrders);

        //  WorkOrder.html로 이동
        window.location.href = "WorkOrder.html";
    });
});

// 기존 작업 지시서의 수정
document.addEventListener("DOMContentLoaded", function () {
    const workOrderList = document.querySelector(".workorderlist");
    let workOrders = JSON.parse(localStorage.getItem("workOrders")) || [];
    console.log(" 불러온 작업 지시서:", workOrders);
    function renderWorkOrderList() {
        workOrderList.innerHTML = ""; // 기존 목록 초기화
        if (workOrders.length === 0) {
            workOrderList.innerHTML = "<li>등록된 작업 지시서가 없습니다.</li>";
            return;
        }
        workOrders.forEach((order, index) => {
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
                            <li class="workorderlist-etc"></li>
                        `;

            workOrderList.appendChild(listItem);
        });

        // "수정" 버튼 이벤트 추가
        document.querySelectorAll(".edit-workorder").forEach(button => {
            button.addEventListener("click", function () {
                const index = this.getAttribute("data-index");
                localStorage.setItem("editWorkOrder", index);
                window.location.href = "NewWorkorder.html";
            });
        });
    }
    renderWorkOrderList();
});

// 추가
document.addEventListener("DOMContentLoaded", function () {
    const manufacturerInput = document.querySelector(".menufacturer-info-completion");

    if (!manufacturerInput) {
        console.error("'menufacturer-info-completion' 요소를 찾을 수 없습니다.");
        return;
    }

    manufacturerInput.addEventListener("input", function () {
        console.log("입력값 변경:", manufacturerInput.value);
    });
});
const targetElement = document.querySelector(".menufacturer-info-completion");
if (targetElement) {
    targetElement.innerHTML = "새로운 값";
} else {
    console.error("'menufacturer-info-completion' 요소를 찾을 수 없습니다.");
}
// 삭제
document.addEventListener("DOMContentLoaded", function () {
    const deleteButton = document.getElementById("deleteWorkOrder");

    // "WorkOrder.html"에서 삭제 버튼 동작 설정
    if (deleteButton) {
        deleteButton.addEventListener("click", function () {
            if (confirm("정말 삭제하시겠습니까?")) {
                // 작업 지시서 삭제 (로컬스토리지에서 삭제)
                let workOrders = JSON.parse(localStorage.getItem("workOrders")) || [];
                const editIndex = localStorage.getItem("editWorkOrder"); // 수정 중인 작업 지시서 인덱스
                if (editIndex !== null) {
                    workOrders.splice(editIndex, 1); // 해당 작업지시서 삭제
                    localStorage.setItem("workOrders", JSON.stringify(workOrders)); // 변경된 데이터 저장
                    alert("작업 지시서가 삭제되었습니다.");
                } else {
                    alert("삭제할 작업 지시서를 찾을 수 없습니다.");
                }
                window.location.href = "WorkOrder.html";
            }
        });
    }

    // 작업 지시서 목록을 WorkOrder.html에서 가져와서 렌더링하는 코드
    const workOrderList = document.querySelector(".workorderlist");
    let workOrders = JSON.parse(localStorage.getItem("workOrders")) || [];

    function renderWorkOrderList() {
        workOrderList.innerHTML = ""; // 기존 목록 초기화

        if (workOrders.length === 0) {
            workOrderList.innerHTML = "<li>등록된 작업 지시서가 없습니다.</li>";
            return;
        }

        workOrders.forEach((order, index) => {
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
                <li class="workorderlist-etc"></li>
            `;
            workOrderList.appendChild(listItem);
        });

        // "수정" 버튼 이벤트 추가
        document.querySelectorAll(".edit-workorder").forEach(button => {
            button.addEventListener("click", function () {
                const index = this.getAttribute("data-index");
                localStorage.setItem("editWorkOrder", index); // 수정할 작업 지시서 인덱스 저장
                window.location.href = "NewWorkorder.html"; // 수정 페이지로 이동
            });
        });
    }
    renderWorkOrderList();
});

// 취소 버튼 클릭 이벤트
document.addEventListener("DOMContentLoaded", function () {
    const cancelButton = document.getElementById("cancelWorkOrder"); // 취소 버튼 ID를 사용

    if (cancelButton) {
        cancelButton.addEventListener("click", function () {
            // 사용자가 취소를 확인하는 알림 창
            const confirmation = confirm("지금 작성한 내용을 모두 취소할까요?");
            if (confirmation) {
                // 취소 시 입력한 내용 초기화 (예시로 입력 필드들 초기화)
                document.querySelector('[name="writer"]').value = "";
                document.querySelector('[name="createDate"]').value = "";
                document.querySelector('[name="dueDate"]').value = "";
                document.querySelector('[name="delivery"]').value = "";
                // 추가로 필요한 다른 입력 필드들도 초기화 가능
                alert("작성 중이던 내용이 취소되었습니다.");
                window.location.href = 'WorkOrder.html';
            } else {
                // 취소하지 않으면 아무 동작 안 함
                console.log("취소를 취소했습니다.");
            }
        });
    }
});