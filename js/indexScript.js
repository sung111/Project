// PC version and nav accodian script
document.addEventListener('DOMContentLoaded', function () {
    const navButtons = document.querySelectorAll('.nav-button');
    navButtons.forEach(function (navbtn) {
        navbtn.addEventListener('click', function () {
            const navMenu = navbtn.nextElementSibling;
            const isOpen = navMenu.classList.contains('open');

            navButtons.forEach(function (btn) {
                btn.classList.remove('nav-blue');
                btn.nextElementSibling.classList.remove('open');
            });

            if (!isOpen) {
                navbtn.classList.add('nav-blue');
                navMenu.classList.add('open');
            } else {
                navbtn.classList.remove('nav-blue');
                navMenu.classList.remove('open');
            }
        });
    });

    // mobile Version
    if (window.innerWidth <= 767) { 
        const mobNavBar = document.querySelector('.mobnav-bar'); 
        const nav = document.querySelector('nav'); 
        const iframeOverlay = document.querySelector('.navopen-shadow'); 
        
        mobNavBar.addEventListener('click', function () {
            nav.classList.toggle('open'); 
            iframeOverlay.style.display = nav.classList.contains('open') ? 'block' : 'none'; 

            // X 모양으로 변경
            const bars = mobNavBar.querySelectorAll('.mobnav');
            if (nav.classList.contains('open')) {
                bars[0].style.transform = 'rotate(-45deg) translate(-5px, 6px)';
                bars[1].style.opacity = '0';
                bars[2].style.transform = 'rotate(45deg) translate(-5px, -6px)';
            } else {
                bars[0].style.transform = 'rotate(0deg) translate(0, 0)';
                bars[1].style.opacity = '1';
                bars[2].style.transform = 'rotate(0deg) translate(0, 0)';
            }
        });
    }
});

// 로그인
document.addEventListener("DOMContentLoaded", function () {
    const LoginButton = document.getElementById("login-button");
    
    LoginButton.addEventListener("click", function () {
        const username = document.getElementById("username").value;
        const password = document.getElementById("password").value;
        const LoginWellpaper = document.querySelector(".login-wallpaper");
        const LoginPage = document.querySelector(".login-container");
        const LoginUser = document.querySelector(".login-user");
        const LoginAdmin = document.querySelector(".login-admin");
        if (username == "user" && password == "user"){
            alert(username + "님, 로그인 성공!");
            sessionStorage.setItem("userRole", "user");
            LoginWellpaper.style.display = "none";
            LoginPage.style.display = "none";
            LoginUser.style.display = "block";
        }else if(username == "admin" && password == "admin"){
            alert(username + "님, 로그인 성공!");
            sessionStorage.setItem("userRole", "admin");
            LoginWellpaper.style.display = "none";
            LoginPage.style.display = "none";
            LoginAdmin.style.display = "block";
        } 
        else {
            alert("아이디 또는 비밀번호가 잘못되었습니다.");
        }
    });
});

// 네비게이션 버튼 클릭 시, iframe 이동 스크립트 + 로컬 네비게이션
document.addEventListener("DOMContentLoaded", function(){
    const iframe = document.querySelector("iframe")
    const localBar = document.querySelector(".local-bar");

    function LocalNavigationbar(tagname,componantname){
        localBar.innerHTML = `<li>Home</li> <li>> ${tagname}</li> <li>> ${componantname}</li>`;
    }
    // 메인 페이지(로고클릭 시)탭
    const logomenu = document.querySelector("#nav-mainlogo");
    logomenu.addEventListener("click", function(){
        iframe.src = "componant/MainTitle.html";
        localBar.innerHTML = `<li>Home</li>`; 
    })
    // 기준관리 탭
    const bomlistmenu = document.querySelector("#nav-bomlist")
    bomlistmenu.addEventListener("click", function(){
        iframe.src = "componant/bomlist.html"
        LocalNavigationbar("기준관리", "부품코드"); 
    })
    const processmenu = document.querySelector("#nav-process")
    processmenu.addEventListener("click", function(){
        iframe.src = "componant/process.html"
        LocalNavigationbar("기준관리", "생산공정/검사기준"); 
    })

    const bommenu = document.querySelector("#nav-bom")
    bommenu.addEventListener("click", function(){
        iframe.src = "componant/bom.html"
        LocalNavigationbar("기준관리", "BOM");
    })
    // 생산관리 탭
    const workOrdermenu = document.querySelector("#nav-workorder");
    workOrdermenu.addEventListener("click", function(){
        iframe.src = "componant/WorkOrder.html"
        LocalNavigationbar("생산관리", "생산계획"); 
    })
    const perfomanceRegistrationmenu = document.querySelector("#nav-perfomanceRegistratio");
    perfomanceRegistrationmenu.addEventListener("click", function(){
        iframe.src = "componant/performanceRegistration.html"
        LocalNavigationbar("생산관리", "실적등록"); 
    })
    const qualityControlmenu = document.querySelector("#nav-qualityControl");
    qualityControlmenu.addEventListener("click", function(){
        iframe.src = "componant/qualityControl.html"
        LocalNavigationbar("생산관리", "품질관리"); 
    })
    const 재고조사현황menu = document.querySelector("#nav-inventory");
    재고조사현황menu.addEventListener("click", function(){
        iframe.src = "componant/재고조사현황.html"
        LocalNavigationbar("생산관리", "재고현황조회"); 
    })
    // 실적 보고서
    const performmenu = document.querySelector("#nav-perform");
    performmenu.addEventListener("click", function(){
        iframe.src = "componant/perform.html"
        LocalNavigationbar("실적보고서", "실적보고서"); 
    })
    const chartmenu = document.querySelector("#nav-chart");
    chartmenu.addEventListener("click", function(){
        iframe.src = "componant/chart_0203.html"
        LocalNavigationbar("실적보고서", "대시보드"); 
    })
    // 게시판
    const 공지사항menu = document.querySelector("#nav-공지사항");
    공지사항menu.addEventListener("click", function(){
        iframe.src = "componant/공지사항.html"
        LocalNavigationbar("게시판", "공지사항"); 
    })
})
