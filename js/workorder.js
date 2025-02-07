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
MainClose.addEventListener("click", function(){
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
        console.error("❌ '.workorderlist' 요소를 찾을 수 없습니다.");
        return;
    }

    let workOrders = JSON.parse(localStorage.getItem("workOrders")) || [];
    console.log("✅ 불러온 작업 지시서:", workOrders); // 로그 확인

    workOrderList.innerHTML = "";

    if (workOrders.length === 0) {
        workOrderList.innerHTML = "<li></li>";
        return;
    }

    workOrders.forEach((order, index) => {
        console.log(`✅ 작업 지시서 ${index}:`, order); // 개별 항목 로그 확인

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
