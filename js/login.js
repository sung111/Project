// 네비게이션 버튼 클릭 시, iframe 이동 스크립트 + 로컬 네비게이션
document.addEventListener("DOMContentLoaded", function () {
    const iframe = document.querySelector("iframe");
    const localBar = document.querySelector(".local-bar");

    function LocalNavigationbar(tagname, componantname) {
        localBar.innerHTML = `<li>Home</li> <li>> ${tagname}</li> <li>> ${componantname}</li>`;
    }

    const navigationItems = [
        { selector: "#nav-mainlogo", src: "componant/MainTitle.html", breadcrumb: "Home" },
        { selector: "#nav-bomlist", src: "componant/standard.html", breadcrumb: "기준관리, 부품코드" },
        { selector: "#nav-process", src: "componant/production_process.html", breadcrumb: "기준관리, 생산공정" },
        { selector: "#nav-inspection", src: "componant/Inspection_standards.html", breadcrumb: "기준관리, 검사기준" },
        { selector: "#nav-bom", src: "componant/bom_v2.html", breadcrumb: "기준관리, BOM" },
        { selector: "#nav-workorder", src: "componant/WorkOrder.html", breadcrumb: "생산관리, 생산계획" },
        { selector: "#nav-perfomanceRegistratio", src: "componant/performanceRegistration.html", breadcrumb: "생산관리, 실적등록" },
        { selector: "#nav-qualityControl", src: "componant/qualityControl.html", breadcrumb: "생산관리, 품질관리" },
        { selector: "#nav-inventory", src: "componant/01_재고조사현황.html", breadcrumb: "생산관리, 재고현황조회" },
        { selector: "#nav-perform", src: "componant/perform_0203.html", breadcrumb: "실적보고서, 실적보고서" },
        { selector: "#nav-report", src: "componant/report.html", breadcrumb: "실적보고서, 주요지표" },
        { selector: "#nav-chart", src: "componant/chart_0203.html", breadcrumb: "실적보고서, 대시보드" },
        { selector: "#nav-공지사항", src: "componant/02_공지사항.html", breadcrumb: "게시판, 공지사항" },
        { selector: "#nav-사내복지", src: "componant/03_사내복지.html", breadcrumb: "게시판, 사내복지" },
        { selector: "#nav-일반게시판", src: "componant/04_일반게시판.html", breadcrumb: "게시판, 일반게시판" }
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