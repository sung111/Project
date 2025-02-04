// 신규 작업지시서 생성
document.addEventListener("DOMContentLoaded", function () {
    // userRole = 로그인한 사람이 user인지 admin인지 구분하기위한 선언
    const userRole = window.parent.sessionStorage.getItem("userRole");
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

// 작업지시서 목록의 추가
document.addEventListener("DOMContentLoaded", function () {
    const workOrderList = document.querySelector(".workorderlist");

    if (!workOrderList) {
        console.error("❌ '.workorderlist' 요소를 찾을 수 없습니다. HTML 구조를 확인하세요.");
        return;
    }

    // 기존 작업 지시서 불러오기
    let workOrders = JSON.parse(sessionStorage.getItem("workOrders")) || [];
    console.log("✅ 불러온 작업 지시서:", workOrders);

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
            <li class="workorderlist-productplancalc"><button class="edit-workorder" data-index="${index}">수정</button></li>
        `;

        workOrderList.appendChild(listItem);
    });

    document.querySelectorAll(".edit-workorder").forEach(button => {
        button.addEventListener("click", function () {
            const index = this.getAttribute("data-index");
            sessionStorage.setItem("editWorkOrder", index);
            window.location.href = "NewWorkorder.html"; 
        });
    });
});