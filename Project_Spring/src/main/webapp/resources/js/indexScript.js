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
});
// mobile Version
document.addEventListener("DOMContentLoaded", function () {
    const mobileNavButton = document.querySelector(".mobnav-bar");
    const navMenu = document.querySelector("nav");
    const navShadow = document.querySelector(".navopen-shadow");

    if (mobileNavButton && navMenu) {
        mobileNavButton.addEventListener("click", function () {
            navMenu.classList.toggle("open");

            // 그림자 배경 처리
            if (navShadow) {
                navShadow.style.display = navMenu.classList.contains("open") ? "block" : "none";
            }

            // X 버튼 애니메이션 적용
            const bars = document.querySelectorAll('.mobnav');
            if (bars.length === 3) {
                if (navMenu.classList.contains('open')) {
                    bars[0].style.transform = 'rotate(-45deg) translate(-5px, 6px)';
                    bars[1].style.opacity = '0';
                    bars[2].style.transform = 'rotate(45deg) translate(-5px, -6px)';
                } else {
                    bars[0].style.transform = 'rotate(0deg) translate(0, 0)';
                    bars[1].style.opacity = '1';
                    bars[2].style.transform = 'rotate(0deg) translate(0, 0)';
                }
            }
        });

        // 모바일 메뉴 그림자 클릭시 닫기
        if (navShadow) {
            navShadow.addEventListener("click", function () {
                navMenu.classList.remove("open");
                navShadow.style.display = "none";

                //  X 버튼
                const bars = document.querySelectorAll('.mobnav');
                if (bars.length === 3) {
                    bars[0].style.transform = 'rotate(0deg) translate(0, 0)';
                    bars[1].style.opacity = '1';
                    bars[2].style.transform = 'rotate(0deg) translate(0, 0)';
                }
            });
        }
    }
});

document.addEventListener("DOMContentLoaded", function () {
    const myPageImg = document.getElementById("mypage-img");
    const popup = document.getElementById("popup");
    const closePopupBtn = document.getElementById("closePopupBtn");

    // 팝업창을 기본적으로 숨김
    popup.style.display = "none";

    // 이미지 클릭 시 팝업 토글
    myPageImg.addEventListener("click", function () {
        popup.style.display = (popup.style.display === "none" || popup.style.display === "") ? "flex" : "none";
    });

    // 닫기 버튼 클릭 시 팝업 숨기기
    closePopupBtn.addEventListener("click", function () {
        popup.style.display = "none";
    });

// 네비게이션 버튼 클릭 시, iframe 이동 스크립트 + 로컬 네비게이션

    const iframe = document.querySelector("iframe")
    const localBar = document.querySelector(".local-bar");
    var contextPath = document.body.getAttribute("data-contextPath");
    
    function LocalNavigationbar(tagname, componantname) {
        localBar.innerHTML = `<li>Home</li> <li>> ${tagname}</li> <li>> ${componantname}</li>`;
    }
    // 메인 페이지(로고클릭 시)탭
    const logomenu = document.querySelector("#nav-mainlogo");
    logomenu.addEventListener("click", function () {
         iframe.src = contextPath + "/maintitle"; 
        console.log("Navigating to:", iframe.src);
        localBar.innerHTML = `<li>Home</li>`;
    })
    // 기준관리 탭
    const bomlistmenu = document.querySelector("#nav-bomlist")
    bomlistmenu.addEventListener("click", function () {
        iframe.src = contextPath + "/part_code"; 
        LocalNavigationbar("기준관리", "부품코드");
    })
    const processmenu = document.querySelector("#nav-process")
    processmenu.addEventListener("click", function () {
        iframe.src =  contextPath + "/ProductionProcess_controller"; 
        LocalNavigationbar("기준관리", "생산공정");
    })
    const inspection = document.querySelector("#nav-inspection")
    inspection.addEventListener("click", function () {
        iframe.src = contextPath + "/InspectionS"
        LocalNavigationbar("기준관리", "검사기준");
    })
    const bommenu = document.querySelector("#nav-bom")
    bommenu.addEventListener("click", function () {
        iframe.src = contextPath + "/Finished_Product_BOM"
        LocalNavigationbar("기준관리", "BOM");
    })
    // 생산관리 탭
    const prodPlanmenu = document.querySelector("#nav-workorder");
    prodPlanmenu.addEventListener("click", function () {
        iframe.src = contextPath + "/prodplan"
        LocalNavigationbar("생산관리", "생산계획");
    })
    const perfomanceRegistrationmenu = document.querySelector("#nav-perfomanceRegistratio");
    perfomanceRegistrationmenu.addEventListener("click", function () {
        iframe.src = contextPath + "Performance"
        LocalNavigationbar("생산관리", "실적등록");
    })
    const qualityControlmenu = document.querySelector("#nav-qualityControl");
    qualityControlmenu.addEventListener("click", function () {
        iframe.src = contextPath + "qualityControl"
        LocalNavigationbar("생산관리", "품질관리");
    })
    const 재고조사현황menu = document.querySelector("#nav-inventory");
    재고조사현황menu.addEventListener("click", function () {
        iframe.src = contextPath + "Inventorycheck"
        LocalNavigationbar("생산관리", "재고현황조회");
    })
    // 실적 보고서
    const performmenu = document.querySelector("#nav-perform");
    performmenu.addEventListener("click", function () {
        iframe.src = contextPath + "perform_0203.html"
        LocalNavigationbar("실적보고서", "실적보고서");
    })
    const reportmenu = document.querySelector("#nav-report");
    reportmenu.addEventListener("click", function () {
        iframe.src = contextPath + "report.html"
        LocalNavigationbar("실적보고서", "주요지표");
    })
    const chartmenu = document.querySelector("#nav-chart");
    chartmenu.addEventListener("click", function () {
        iframe.src = contextPath + "chart_0203.html"
        LocalNavigationbar("실적보고서", "대시보드");
    })
    // 게시판
    const 공지사항menu = document.querySelector("#nav-공지사항");
    공지사항menu.addEventListener("click", function () {
        iframe.src = contextPath + "02_공지사항.html";
        LocalNavigationbar("게시판", "공지사항");
    })
    const 일반게시판menu = document.querySelector("#nav-일반게시판");
    일반게시판menu.addEventListener("click", function () {
        iframe.src = contextPath + "board"
        LocalNavigationbar("게시판", "일반게시판");
    });
    
    //마이페이지 클릭 효과
document.getElementById("mypage-a").addEventListener("click", function () {
    window.open(
        contextPath + "/mypage",
        "MyPagePopup",
        "width=500,height=400,top=100,left=100,resizable=no,scrollbars=yes"
    );
});

    //로그아웃 버튼 클릭 효과
    const logoutLink = document.getElementById("logout-a");
    if (logoutLink) {
        logoutLink.addEventListener("click", function () {
            if (confirm("로그아웃 하시겠습니까?")) {
                window.location.href = contextPath + "/logout";
            }
        });
    }

// 챗봇 아이콘 클릭 시 팝업 열기
document.getElementById("chatbot-icon").addEventListener("click", function () {
	document.getElementById("chatbotPopup").style.display = "block";
});

// 닫기 버튼 클릭 시 팝업 닫기
document.getElementById("chatbotCloseBtn").addEventListener("click", function () {
	document.getElementById("chatbotPopup").style.display = "none";
});

// 간단한 응답 처리
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


