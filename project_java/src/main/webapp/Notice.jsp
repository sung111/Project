<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" href="../css/02_공지사항.css">
</head>
<style>

body {
    background-color: #f8f9fa;
    display: flex;
    flex-direction: column; /* 세로 방향으로 정렬 */
    align-items: center; /* 중앙 정렬 */
    padding: 20px;
}

.box {
    width: 100%; /* 너비 조정 */
    margin: 20px;
    border: 1px solid #d9d9d9;
    padding: 20px;
    border-radius: 5px;
    background-color: #ffffff;
}

h1 {
    text-align: center;
    margin-bottom: 20px;
}

.post {
    margin-bottom: 15px;
    cursor: pointer;
    display: flex; /* Flexbox 사용 */
    justify-content: space-between; /* 양쪽 정렬 */
    align-items: center; /* 세로 중앙 정렬 */
    border-bottom: 1px solid #d9d9d9; /* 밑줄 추가 */
    padding-bottom: 10px; /* 아래 여백 추가 */
}

.post .date {
    font-size: 12px;
    color: #888;
    margin-left: 10px; /* 날짜와 제목 사이 여백 */
}

.post .content {
    color: black; /* 내용 색상 */
    font-weight: bold; /* 내용 볼드체 */
    flex-grow: 1; /* 내용이 남은 공간을 채우도록 설정 */
    margin-right: 10px; /* 오른쪽 여백 */
}

.post .author {
    font-size: 12px; /* 작성자 글자 크기 */
    color: #555; /* 작성자 색상 */
    margin-left: 10px; /* 날짜와 작성자 사이 여백 추가 */
}

.button-container {
    margin-top: 10px;
    text-align: right;
}

.button-container button {
    padding: 10px 15px;
    font-size: 16px;
    border: none;
    border-radius: 5px;
    background-color: #007bff;
    color: white;
    cursor: pointer;
}

.postbtn {
    margin-bottom: 20px; /* 글쓰기 버튼과 목록 간의 여백 */
    display: flex;
    justify-content: flex-end;
}

.postbtn button {
    padding: 10px 15px; /* 여백 조정 */
    font-size: 10px; /* 글자 크기 조정 */
    border: none; /* 기본 테두리 제거 */
    border-radius: 5px; /* 둥근 모서리 */
    background-color: #007bff; /* 배경 색상 */
    color: white; /* 글자 색상 */
    cursor: pointer; /* 커서 모양 변경 */
}

.pagination {
    margin-top: 20px;
    text-align: center;
}

.pagination button {
    padding: 10px 15px;
    border: 1px solid #007BFF;
    background-color: #ccc; /* 기본 배경색: 회색 */
    cursor: pointer;
    border-radius: 5px;
}

.pagination button.active {
    background-color: #007BFF; /* 활성화된 버튼: 파란색 */
}

.pagination button:hover {
    background-color: #0056b3; /* 호버 시 색상 */
}
</style>
<body>
    <div class="box">
        <h1>공지사항</h1>
        
         <form method="get" action="board">
        <div class="postbtn">
            <button type="submit" class="newpost">글 쓰기</button>
        </div>
        </form>
        
        <div class="post">
            <span class="content">시스템 업데이트가 완료되었습니다.</span>
            <span class="date">2025-01-22</span>
            <span class="author">안혜리</span>
        </div>
        <div class="post">
            <span class="content">1월 25일 정기 점검이 예정되어 있습니다.</span>
            <span class="date">2025-01-15</span>
            <span class="author">박혜성</span>
        </div>
        <div class="post">
            <span class="content">2월부터 새로운 자산 관리 시스템이 도입됩니다.</span>
            <span class="date">2025-01-10</span>
            <span class="author">김경민</span>
        </div>
        <div class="post">
            <span class="content">연말 정산 안내입니다..</span>
            <span class="date">2025-01-05</span>
            <span class="author">서영석</span>
        </div>
        <div class="post">
            <span class="content">부서별 연간 목표 설정 회의 일정.</span>
            <span class="date">2025-01-01</span>
            <span class="author">채민병</span>
        </div>
        <div class="pagination">
            <button onclick="changePage(currentPage - 1)" id="prevButton">이전</button>
            <button onclick="changePage(1)">1</button>
            <button onclick="changePage(2)">2</button>
            <button onclick="changePage(3)">3</button>
            <button onclick="changePage(4)">4</button>
            <button onclick="changePage(5)">5</button>
            <button onclick="changePage(currentPage + 1)" id="nextButton">다음</button>
        </div>
    </div>
    <script>
        let currentPage = 1; // 현재 페이지를 추적하는 변수

        function changePage(page) {
            // 페이지 범위 체크
            if (page < 1 || page > 5) return;

            // 현재 페이지 업데이트
            currentPage = page;

            // 모든 버튼에서 'active' 클래스 제거
            const buttons = document.querySelectorAll('.pagination button');
            buttons.forEach(button => {
                button.classList.remove('active');
            });

            // 현재 페이지 버튼에 'active' 클래스 추가
            const activeButton = document.querySelector(`.pagination button:nth-child(${page + 1})`);
            if (activeButton) {
                activeButton.classList.add('active');
            }

        }

        // 페이지 로드 시 활성화된 버튼 설정
        document.addEventListener("DOMContentLoaded", function () {
            changePage(currentPage); // 초기 페이지 설정

            // userRole = 로그인한 사람이 user인지 admin인지 구분하기 위한 선언
            const userRole = window.parent.localStorage.getItem("userRole");
            const NewWorkorderbutton = document.querySelector(".newpost");

            // 버튼의 표시 여부 설정
            if (userRole === "admin") {
                NewWorkorderbutton.style.display = 'block'; // 어드민이면 버튼 보이기
            } else {
                NewWorkorderbutton.style.display = 'block'; // 유저이면 버튼 숨기기
            }

      <!--      NewWorkorderbutton.addEventListener("click", function () {
                if (userRole === "admin") {
                    const iframe = parent.document.querySelector("iframe");
                    iframe.src = "componant/06_글쓰기.html";
                } else {
                    alert("권한이 없습니다.");
                }
            });
        });    -->


    </script>
</body>

</html>