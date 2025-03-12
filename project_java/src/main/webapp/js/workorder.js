document.addEventListener("DOMContentLoaded", function () {
    // 생산계획 리스트 클릭 시 색상 변경
    const prodPlanList = document.querySelector(".order-info-content");
    if (prodPlanList) {
        prodPlanList.addEventListener("click", function () {
            prodPlanList.style.backgroundColor = "#999999";
        });
    } else {
        console.log(" order-info-content 요소가 존재하지 않습니다.");
    }

    // 수정 버튼
    document.getElementById("prodPlan-Modify").addEventListener("click", function () {
        const woSelect = document.querySelector('.order-info-content');
        if (!woSelect) {
            console.log(" 생산계획서가 지정되어 있어야 수정을 진행할 수 있습니다.");
        }
    });

    // 상품계획 생성 버튼
    const tbody = document.querySelector(".new-workorder tbody");
    document.getElementById("new-ProdPlan").addEventListener("click", function () {
        const newRow = `
            <tr name="WorkOrder" class="order-info-content wolist">
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
            </tr>`;
        tbody.insertAdjacentHTML("beforeend", newRow);
    });

    // 작업지시서 버튼 클릭 시 iframe 변경
    document.getElementById("WO-select").addEventListener("click", function () {
        const iframe = parent.document.querySelector("iframe");
        if (iframe) {
            iframe.src = "ProductionInformation.jsp";
        } else {
            console.log(" iframe을 찾을 수 없습니다.");
        }
    });
});
