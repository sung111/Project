// 네비게이션 버튼 클릭 시, iframe 이동 스크립트 + 로컬 네비게이션
document.addEventListener("DOMContentLoaded", function () {
    const iframe = document.querySelector("iframe");
    const localBar = document.querySelector(".local-bar");
    // 로그인 상단 화면
    const loginLayer = document.getElementById("login-layer");
    const signUpLayer = document.getElementById("signup-layer");
    const findLayer = document.getElementById("find-layer");
    // 로그인 하단 버튼
    const signUpbutton = document.getElementById("sign-up-button");
    const findNickNameLink = document.getElementById("findid_password-button");
    const signUpConpleteButton = document.getElementById("sign-up-completed-button");
    const findAccountButton = document.getElementById("find-account-button");
    const cencelButton = document.getElementById("cancel-button");
    // 회원가입 버튼을 누르면 회원가입 창으로 바뀐다.
    signUpbutton.addEventListener("click", function () {
        // 상단
        loginLayer.style.display = "none";
        findLayer.style.display = "none";
        signUpLayer.style.display = "flex";
        // 하단
        findNickNameLink.style.display = "none";
        signUpConpleteButton.style.display = "flex";
        findAccountButton.style.display = "none";
        cencelButton.style.display = "flex";
    })



    function LocalNavigationbar(tagname, componantname) {
        localBar.innerHTML = `<li>Home</li> <li>> ${tagname}</li> <li>> ${componantname}</li>`;
    }

    const navigationItems = [
        { selector: "#nav-mainlogo", src: "MainTitle.jsp", breadcrumb: "Home" },
        { selector: "#nav-bomlist", src: "standard.jsp", breadcrumb: "기준관리, 부품코드" },
        { selector: "#nav-process", src: "production_process.jsp", breadcrumb: "기준관리, 생산공정" },
        { selector: "#nav-inspection", src: "Inspection_standards.jsp", breadcrumb: "기준관리, 검사기준" },
        { selector: "#nav-bom", src: "bom_v2.jsp", breadcrumb: "기준관리, BOM" },
        { selector: "#nav-workorder", src: "WorkOrder.jsp", breadcrumb: "생산관리, 생산계획" },
        { selector: "#nav-perfomanceRegistratio", src: "performanceRegistration.jsp", breadcrumb: "생산관리, 실적등록" },
        { selector: "#nav-qualityControl", src: "qualityControl.jsp", breadcrumb: "생산관리, 품질관리" },
        { selector: "#nav-inventory", src: "01_재고조사현황.jsp", breadcrumb: "생산관리, 재고현황조회" },
        { selector: "#nav-perform", src: "perform_0203.jsp", breadcrumb: "실적보고서, 실적보고서" },
        { selector: "#nav-report", src: "report.jsp", breadcrumb: "실적보고서, 주요지표" },
        { selector: "#nav-chart", src: "chart_0203.jsp", breadcrumb: "실적보고서, 대시보드" },
        { selector: "#nav-공지사항", src: "02_공지사항.jsp", breadcrumb: "게시판, 공지사항" },
        { selector: "#nav-사내복지", src: "03_사내복지.jsp", breadcrumb: "게시판, 사내복지" },
        { selector: "#nav-일반게시판", src: "04_일반게시판.jsp", breadcrumb: "게시판, 일반게시판" }
    ];

    navigationItems.forEach(item => {
        const menu = document.querySelector(item.selector);
        if (menu) {
            menu.addEventListener("click", function () {
                iframe.src = item.src;
                const [tag, component] = item.breadcrumb.split(", ");
                LocalNavigationbar(tag, component);
            });
        }
    });
});