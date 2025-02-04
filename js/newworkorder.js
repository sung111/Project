    // 추가 생성 버튼으로 새로운 상품 제조작업 지시
    document.addEventListener("DOMContentLoaded", function () {
        const userRole = window.parent.sessionStorage.getItem("userRole");
        const NewProductioninfo = document.querySelector(".workorder-add")
        NewProductioninfo.addEventListener("click", function () {
            if (userRole == "admin") {
                const iframe = parent.document.querySelector("iframe");
                iframe.src = "componant/ProductionInformation.html"
            }
            else if (userRole == "user") {
                alert("허가되지 계정 접근이 감지되었습니다.")
            }
            else{
                alert("로그인을 해주세요.")
            }
        })
    })

    document.addEventListener("DOMContentLoaded", function () {
        const userRole = window.parent.sessionStorage.getItem("userRole");
        const addButton = document.querySelector(".workorder-add"); // 추가 생성 버튼
        const tbody = document.querySelector(".new-workorder tbody"); // 테이블 본문
    
        addButton.addEventListener("click", function () {
            if (userRole == "admin") {
                // 새 행(tr) 생성
                const newRow = document.createElement("tr");
                newRow.classList.add("order-info-content");
    
                // 새로운 행의 내부 HTML 추가
                newRow.innerHTML = `
                    <td><input type="text" placeholder="품명[규격]"></td>
                    <td><input type="text" placeholder="품목코드"></td>
                    <td><input type="text" placeholder="단위"></td>
                    <td><input type="number" placeholder="제작수량"></td>
                    <td><input type="date"></td>
                    <td><input type="date"></td>
                    <td class="order-info-content-delete">삭제하기</td>
                `;
    
                // 테이블에 추가
                tbody.appendChild(newRow);
    
                // 삭제 버튼 기능 추가
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

