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