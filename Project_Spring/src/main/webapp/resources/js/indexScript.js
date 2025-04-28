document.addEventListener('DOMContentLoaded', function () {
    // PC 버전 및 내비게이션 아코디언 스크립트
    const navButtons = document.querySelectorAll('.nav-button');
    navButtons.forEach(function (navbtn) {
        navbtn.addEventListener('click', function () {
            const navMenu = navbtn.nextElementSibling;
            const isOpen = navMenu.classList.contains('open');

            // 다른 열려있는 메뉴 닫기
            document.querySelectorAll('.nav-tag.open').forEach(function (menu) {
                if (menu !== navMenu) {
                    menu.classList.remove('open');
                }
            });

            // 현재 메뉴 토글
            navMenu.classList.toggle('open', !isOpen);
        });
    });

    // 모바일 메뉴 열기
    const mobNavBtn = document.querySelector('.mobnav-bar');
    const nav = document.querySelector('nav');
    const shadow = document.querySelector('.navopen-shadow');

    if (mobNavBtn && nav && shadow) {
        mobNavBtn.addEventListener('click', function () {
            nav.classList.toggle('open');
        });

        shadow.addEventListener('click', function () {
            nav.classList.remove('open');
        });
    }

    // 마이페이지 팝업
    const myPageImg = document.getElementById("mypage-img");
    const popup = document.getElementById("popup-page");
    const closePopupBtn = document.getElementById("closePopupBtn");
    const mainContent = document.querySelector(".mainframe");

    if (myPageImg) {
        myPageImg.addEventListener("click", function () {
            popup.style.display = (popup.style.display === "none" || popup.style.display === "") ? "flex" : "none";
        });
    } else {
        console.warn("mypage-img 요소가 존재하지 않습니다.");
    }

    if (closePopupBtn) {
        closePopupBtn.addEventListener("click", function () {
            popup.style.display = "none";
        });
    } else {
        console.warn("closePopupBtn 요소가 존재하지 않습니다.");
    }

document.addEventListener("DOMContentLoaded", function() {
    const contextPath = document.body.getAttribute('data-contextPath');  // 정확한 contextPath 가져오기

    // 메뉴 항목들에 클릭 이벤트 추가
    const menuItems = document.querySelectorAll('.nav-tag a');
    
    menuItems.forEach(function(item) {
        item.addEventListener("click", function(event) {
            event.preventDefault();  // 기본 동작인 링크 이동을 막습니다.

            // 클릭된 메뉴의 href 값을 가져옵니다.
            const url = item.getAttribute('href');

            // 해당 메뉴 클릭 시 페이지를 mainframe 영역에 로드합니다.
            loadPage(url);
        });
    });

    // 페이지를 mainframe에 로드하는 함수
    function loadPage(url) {
        // `contextPath`를 경로 앞에 추가해줍니다.
        const fullUrl = contextPath + url;

        // 해당 URL로 Ajax 요청을 보냄
        fetch(fullUrl)
            .then(response => response.text())
            .then(html => {
                // mainframe 영역에 로드된 페이지를 삽입
                document.querySelector('.mainframe').innerHTML = html;

                // URL을 변경하여 페이지 상태를 기록 (브라우저 뒤로가기 등을 처리하기 위함)
                history.pushState(null, null, fullUrl);
            })
            .catch(err => {
                console.error('페이지 로드 실패:', err);
            });
    }

    // 뒤로가기 버튼 등에서 발생할 수 있는 이벤트를 처리하여 history 상태를 관리
    window.onpopstate = function(event) {
        loadPage(location.pathname);
    };
});

    

    // 마이페이지 팝업
    document.getElementById("mypage-a").addEventListener("click", function () {
        window.open(
            contextPath + "/mypage",
            "MyPagePopup",
            "width=500,height=400,top=100,left=100,resizable=no,scrollbars=yes"
        );
    });

    // 로그아웃 처리
    const logoutLink = document.getElementById("logout-a");
    if (logoutLink) {
        logoutLink.addEventListener("click", function () {
            if (confirm("로그아웃 하시겠습니까?")) {
                window.location.href = contextPath + "/logout";
            }
        });
    }

    // 챗봇 팝업
    document.getElementById("chatbot-icon").addEventListener("click", function () {
        document.getElementById("chatbotPopup").style.display = "block";
    });

    document.getElementById("chatbotCloseBtn").addEventListener("click", function () {
        document.getElementById("chatbotPopup").style.display = "none";
    });

    document.getElementById("chatSendBtn").addEventListener("click", function () {
        const input = document.getElementById("chatInput").value.trim();
        const body = document.getElementById("chatbotBody");

        if (input !== "") {
            const userMessage = document.createElement("p");
            userMessage.innerHTML = `<strong> 나:</strong> ${input}`;
            body.appendChild(userMessage);

            const botMessage = document.createElement("p");
            if (input.includes("생산계획")) {
                botMessage.innerHTML = "<strong> HHBot:</strong> 생산계획은 '기준관리 > 생산계획' 메뉴에서 등록할 수 있어요.";
            } else if (input.includes("재고")) {
                botMessage.innerHTML = "<strong> HHBot:</strong> '생산관리 > 재고현황조회' 메뉴에서 확인 가능합니다.";
            } else {
                botMessage.innerHTML = "<strong> HHBot:</strong> 죄송해요, 아직 그 질문에 대한 답변은 준비 중이에요.";
            }

            body.appendChild(botMessage);
            body.scrollTop = body.scrollHeight;
            document.getElementById("chatInput").value = "";
        }
    });
});
