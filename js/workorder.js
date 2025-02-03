// 신규 작업지시서 생성
document.addEventListener("DOMContentLoaded", function () {
    // userRole = 로그인한 사람이 user인지 admin인지 구분하기위한 선언
    const userRole = window.parent.sessionStorage.getItem("userRole");
    const NewWorkorderbutton = document.querySelector(".new-workorder-button");
    NewWorkorderbutton.addEventListener("click", function () {
        if (userRole == "user") {
            alert("권한이 없습니다.");
        } else if (userRole == "admin") {
            alert("환영합니다. admin님! 새로운 생산 작업계획서를 생성합니다.");
            // NewWorkorder.html로 이동해야 한다.
        } else {
            alert("로그인이 필요합니다.");
        }
    })
})