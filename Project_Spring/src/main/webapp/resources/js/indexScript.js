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

    // 로컬 네비게이션 스크립트
    const localBar = document.querySelector(".local-bar");
    const contextPath = document.body.getAttribute("data-contextPath") || "/project";
    console.log("contextPath: ", contextPath);

    function LocalNavigationbar(tagname, componantname) {
        localBar.innerHTML = `<li>Home</li> <li>> ${tagname}</li> <li>> ${componantname}</li>`;
    }

    document.querySelector("#nav-mainlogo").addEventListener("click", function () {
        window.location.href = contextPath + "/maintitle";
    });

    // 메뉴 링크 연결 스크립트
    // 부품코드 페이지
    // document.querySelector("#nav-bomlist").addEventListener("click", function () {
    //     fetch(contextPath + "/standard")
    //         .then(response => response.text())
    //         .then(html => {
    //             if (mainContent) {
    //                 mainContent.innerHTML = html;

    //                 // URL을 변경해서 사용자가 직접 새로고침해도 같은 페이지로
    //                 history.pushState(null, null, contextPath + "/standard");

    //                 // 네비게이션 텍스트도 변경
    //                 LocalNavigationbar('공정관리', '부품코드');
    //             } else {
    //                 console.error("파일을 불러오는 중 오류가 발생했습니다.");
    //             }
    //         })
    //         .catch(err => {
    //             console.error('생산 계획 페이지 로드 실패:', err);
    //         });
    // });

    // // 검사기준 페이지
    // document.querySelector("#nav-inspection").addEventListener("click", function () {
    //     fetch(contextPath + "/inspectionStandards")
    //         .then(response => response.text())
    //         .then(html => {
    //             if (mainContent) {
    //                 mainContent.innerHTML = html;

    //                 // URL을 변경해서 사용자가 직접 새로고침해도 같은 페이지로
    //                 history.pushState(null, null, contextPath + "/inspectionStandards");

    //                 // 네비게이션 텍스트도 변경
    //                 LocalNavigationbar('공정관리', '검사기준');
    //             } else {
    //                 console.error("파일을 불러오는 중 오류가 발생했습니다.");
    //             }
    //         })
    //         .catch(err => {
    //             console.error('생산 계획 페이지 로드 실패:', err);
    //         });
    // });

    // document.querySelector("#nav-process").addEventListener("click", function () {
    //     fetch(contextPath + "/production_process")
    //         .then(response => response.text())
    //         .then(html => {
    //             if (mainContent) {
    //                 mainContent.innerHTML = html;

    //                 // URL을 변경해서 사용자가 직접 새로고침해도 같은 페이지로
    //                 history.pushState(null, null, contextPath + "/production_process");

    //                 // 네비게이션 텍스트도 변경
    //                 LocalNavigationbar('공정관리', '생산공정');
    //             } else {
    //                 console.error("파일을 불러오는 중 오류가 발생했습니다.");
    //             }
    //         })
    //         .catch(err => {
    //             console.error('생산 계획 페이지 로드 실패:', err);
    //         });
    // });

    // // BOM
    // document.querySelector("#nav-bom").addEventListener("click", function () {
    //     fetch(contextPath + "/bom_v2")
    //         .then(response => response.text())
    //         .then(html => {
    //             if (mainContent) {
    //                 mainContent.innerHTML = html;

    //                 // URL을 변경해서 사용자가 직접 새로고침해도 같은 페이지로
    //                 history.pushState(null, null, contextPath + "/bom_v2");

    //                 // 네비게이션 텍스트도 변경
    //                 LocalNavigationbar('공정관리', 'BOM');
    //             } else {
    //                 console.error("파일을 불러오는 중 오류가 발생했습니다.");
    //             }
    //         })
    //         .catch(err => {
    //             console.error('생산 계획 페이지 로드 실패:', err);
    //         });
    // });

    // // 생산관리 페이지
    // document.querySelector("#nav-workorder").addEventListener("click", function () {
    //     fetch(contextPath + "/prodplan")
    //         .then(response => response.text())
    //         .then(html => {
    //             if (mainContent) {
    //                 mainContent.innerHTML = html;

    //                 // URL 변경 
    //                 history.pushState(null, null, contextPath + "/prodplan");

    //                 // 로컬 네비게이션
    //                 LocalNavigationbar('생산관리', '생산계획');
    //             } else {
    //                 console.error("파일을 불러오는 중 오류가 발생했습니다.");
    //             }
    //         })
    //         .catch(err => {
    //             console.error('생산 계획 페이지 로드 실패:', err);
    //         });
    // });

    // // 실적등록 페이지
    // document.querySelector("#nav-perfomanceRegistratio").addEventListener("click", function () {
    //     fetch(contextPath + "/performance")
    //         .then(response => response.text())
    //         .then(html => {
    //             if (mainContent) {
    //                 mainContent.innerHTML = html;

    //                 // URL 변경 
    //                 history.pushState(null, null, contextPath + "/performance");

    //                 // 로컬 네비게이션
    //                 LocalNavigationbar('생산관리', '실적등록');
    //             } else {
    //                 console.error("파일을 불러오는 중 오류가 발생했습니다.");
    //             }
    //         })
    //         .catch(err => {
    //             console.error('생산 계획 페이지 로드 실패:', err);
    //         });
    // });

    // // 품질관리 페이지
    // document.querySelector("#nav-qualityControl").addEventListener("click", function () {
    //     fetch(contextPath + "/qual")
    //         .then(response => response.text())
    //         .then(html => {
    //             if (mainContent) {
    //                 mainContent.innerHTML = html;

    //                 // URL 변경 
    //                 history.pushState(null, null, contextPath + "/qual");

    //                 // 로컬 네비게이션
    //                 LocalNavigationbar('생산관리', '품질관리');
    //             } else {
    //                 console.error("파일을 불러오는 중 오류가 발생했습니다.");
    //             }
    //         })
    //         .catch(err => {
    //             console.error('생산 계획 페이지 로드 실패:', err);
    //         });
    // });

    // // 재고현황조회 페이지
    // document.querySelector("#nav-inventory").addEventListener("click", function () {
    //     fetch(contextPath + "/inven")
    //         .then(response => response.text())
    //         .then(html => {
    //             if (mainContent) {
    //                 mainContent.innerHTML = html;

    //                 // URL 변경 
    //                 history.pushState(null, null, contextPath + "/inven");

    //                 // 로컬 네비게이션
    //                 LocalNavigationbar('생산관리', '재고현황조회');
    //             } else {
    //                 console.error("파일을 불러오는 중 오류가 발생했습니다.");
    //             }
    //         })
    //         .catch(err => {
    //             console.error('생산 계획 페이지 로드 실패:', err);
    //         });
    // });

    // // 일반 게시판 페이지
    // document.querySelector("#nav-일반게시판").addEventListener("click", function () {
    //     fetch(contextPath + "/select")
    //         .then(response => response.text())
    //         .then(html => {
    //             if (mainContent) {
    //                 mainContent.innerHTML = html;

    //                 // URL 변경 
    //                 history.pushState(null, null, contextPath + "/select");

    //                 // 로컬 네비게이션
    //                 LocalNavigationbar('게시판', '일반게시판');
    //             } else {
    //                 console.error("파일을 불러오는 중 오류가 발생했습니다.");
    //             }
    //         })
    //         .catch(err => {
    //             console.error('생산 계획 페이지 로드 실패:', err);
    //         });
    // });

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
