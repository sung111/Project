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
    const loginContainer = document.querySelector(".login-container");
    const signUpButton = document.getElementById("sign-up-button");
    const cancelButton = document.getElementById("cancel-button");



    // 화원가입 버튼 클릭 시, 효과
    signUpButton.addEventListener("click", function (event) {
        event.preventDefault(); // 기본 행동 방지 (form 제출 방지)

        // 로그인 숨기고, 잠시 후 회원가입 보이기
        loginLayer.classList.add("hidden");
        setTimeout(function () {
            signUpLayer.classList.add("active");
        }, 100); // 100ms 후에 전환
    });

    cancelButton.addEventListener("click", function (event) {
        // 실질적으로 DB에 작성된 로그인, 아이디의 일치성을 확인하고 로그인을 할 수 있게 하는 기능
        event.preventDefault();

        // 회원가입 숨기고, 로그인 보이기
        signUpLayer.classList.remove("active");
        setTimeout(function () {
            loginLayer.classList.remove("hidden");
        }, 100); // 100ms 후에 전환
    });

    // 로그인 버튼 클릭 시 페이지가 새로 고침되는 것 방지
    let loginButton = document.getElementById("login-layer");
    loginButton.addEventListener("click", function (event) {
        // 실질적으로 DB에 작성된 로그인, 아이디의 일치성을 확인하고 로그인을 할 수 있게 하는 기능
      //  event.preventDefault(); // 기본 동작 방지 (정상 작동을 하기위해 주석처리 >영석씨 보세요)
        // 로그인 처리 함수 호출
    });

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

    //키보드연결
    loginButton.addEventListener("keypress", function (event) {
        if (event.key === "Enter") {
            // 기본되는 엔터 동작을 방지함
            event.preventDefault();
            document.getElementById("login-button").click(); // 로그인 버튼 클릭 실행
        }
    });
});