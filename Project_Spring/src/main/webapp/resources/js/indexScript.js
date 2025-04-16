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
console.log(popup);

    if (!popup) {
        console.warn("popup 요소가 존재하지 않습니다.");
        return;
    }

    // 팝업창 기본 숨김
    popup.style.display = "none";

    // myPageImg 클릭 시 팝업 토글
    if (myPageImg) {
        myPageImg.addEventListener("click", function () {
            // 팝업을 열거나 닫기
            popup.style.display = (popup.style.display === "none" || popup.style.display === "") ? "flex" : "none";
        });
    } else {
        console.warn("mypage-img 요소가 존재하지 않습니다.");
    }

    // 닫기 버튼 클릭 시 팝업 닫기
    if (closePopupBtn) {
        closePopupBtn.addEventListener("click", function () {
            popup.style.display = "none";
        });
    } else {
        console.warn("closePopupBtn 요소가 존재하지 않습니다.");
    }


// 네비게이션 버튼 클릭 시, iframe 이동 스크립트 + 로컬 네비게이션

const localBar = document.querySelector(".local-bar");
var contextPath = document.body.getAttribute("data-contextPath");

function LocalNavigationbar(tagname, componantname) {
    localBar.innerHTML = `<li>Home</li> <li>> ${tagname}</li> <li>> ${componantname}</li>`;
}

// 메인 페이지(로고 클릭 시)
const logomenu = document.querySelector("#nav-mainlogo");
logomenu.addEventListener("click", function () {
    window.location.href = contextPath + "/maintitle";
});

// 기준관리 탭
document.querySelector("#nav-bomlist").addEventListener("click", function () {
    location.href = contextPath + "/part_code";
});
document.querySelector("#nav-process").addEventListener("click", function () {
    location.href = contextPath + "/ProductionProcess_controller";
});
document.querySelector("#nav-inspection").addEventListener("click", function () {
    location.href = contextPath + "/InspectionS";
});
document.querySelector("#nav-bom").addEventListener("click", function () {
    location.href = contextPath + "/Finished_Product_BOM";
});

// 생산관리 탭
document.querySelector("#nav-workorder").addEventListener("click", function () {
    location.href = contextPath + "/prodplan";
});
document.querySelector("#nav-perfomanceRegistratio").addEventListener("click", function () {
    location.href = contextPath + "/Performance";
});
document.querySelector("#nav-qualityControl").addEventListener("click", function () {
    location.href = contextPath + "/qualityControl";
});
document.querySelector("#nav-inventory").addEventListener("click", function () {
    location.href = contextPath + "/Inventorycheck";
});

// 실적보고서
document.querySelector("#nav-perform").addEventListener("click", function () {
    location.href = contextPath + "/perform_0203.jsp";
});
document.querySelector("#nav-report").addEventListener("click", function () {
    location.href = contextPath + "/report.jsp";
});
document.querySelector("#nav-chart").addEventListener("click", function () {
    location.href = contextPath + "/chart_0203.jsp";
});

// 게시판
document.querySelector("#nav-공지사항").addEventListener("click", function () {
    location.href = contextPath + "/notice"; // .jsp 대신 컨트롤러 경로면 더 좋아
});
document.querySelector("#nav-일반게시판").addEventListener("click", function () {
    location.href = contextPath + "/board";
});

// 마이페이지 클릭 효과
document.getElementById("mypage-a").addEventListener("click", function () {
    window.open(
        contextPath + "/mypage",
        "MyPagePopup",
        "width=500,height=400,top=100,left=100,resizable=no,scrollbars=yes"
    );
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


