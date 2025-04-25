<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시판 글쓰기</title>
    <link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" href="../css/06_글쓰기.css">
</head>
<style>
/* body {
    background-color: #f8f9fa;
    display: flex;
    flex-direction: column;
    align-items: center;
    padding: 20px;
}
 */
.box {
    width: 97%;
    margin: 20px;
    border: 1px solid #d9d9d9;
    padding: 20px;
    border-radius: 5px;
    background-color: #ffffff;
}

h1 {
    text-align: center;
    margin-bottom: 20px;
    padding-bottom: 10px;
    border-bottom: 1px solid #d9d9d9;
}


#post {
padding: 5px 10px; /* 패딩 조정 */
    font-size: 10px;
    border: none;
    border-radius: 5px;
    background-color: #007bff;
    color: white;
    cursor: pointer;
    margin-left: 95%; 
    white-space: nowrap;


}


.post {
    margin-bottom: 15px;
    
}

.post label:not(.file-label) {
    display: block; 
    margin-left: 5px;
}

.post input[type="text"] {
    width: 100%; 
    padding: 10px; 
    border: 1px solid #d9d9d9; 
    border-radius: 5px; 
    height: 40px; 
}

.post textarea {
    width: 100%; 
    height: 300px; 
    padding: 10px; 
    border: 1px solid #d9d9d9; 
    border-radius: 5px; 
}

.button-container {
    margin-top: 5px;
    margin-bottom: 10px;
    display: flex;
    align-items: center;
}

.button-post {
    margin-top: 5px;
    margin-bottom: 10px;
    text-align: right;
}

.button-container button,
.file-label{
    padding: 5px 10px; /* 패딩 조정 */
    font-size: 10px;
    border: none;
    border-radius: 5px;
    background-color: #007bff;
    color: white;
    cursor: pointer;
    margin-left: 5px; 
    white-space: nowrap; /* 텍스트가 줄 바꿈되지 않도록 설정 */
    position : absolute;
    bottom : 61.4%;
    left: 26.5%;
}

.file-label {
    display: inline-block; /* 버튼처럼 보이도록 설정 */
    text-align: center;
    margin-left: 0;
}

.postbtn {
    margin-bottom: 10px;
    margin-left: 5px;
}

.postbtn select {
    margin-left: 5px;
}
.popup {
    display: none; 
    position: fixed; 
    z-index: 1; 
    left: 0;
    top: 0;
    width: 100%; 
    height: 100%; 
    overflow: auto; 
    background-color: rgba(0,0,0,0.4); 
}

.popup-content {
    background-color: #fefefe;
    margin: 15% auto; 
    padding: 20px;
    border: 1px solid #888;
    width: 50%; /* 원하는 너비로 조정 */
    text-align: center;
    opacity: 0; /* 초기 상태에서 투명 */
    transform: translateY(-20px); /* 약간 위로 이동 */
    transition: opacity 0.3s ease, transform 0.3s ease; /* 트랜지션 효과 */
}

.popup.show .popup-content {
    opacity: 1; /* 보여질 때 불투명 */
    transform: translateY(0); /* 원래 위치로 */
}

.close {
    color: #aaa;
    float: right;
    font-size: 32px; /* 크기 증가 */
    font-weight: bold;
    cursor: pointer; /* 커서 모양 변경 */
    margin: -15px -10px 20px 0; /* 위치 조정 */
}

.close:hover,
.close:focus {
    color: black;
    text-decoration: none;
}
@media (max-width: 768px) {
    .box {
        width: 90%; /* 모바일에서는 너비를 줄임 */
    }

    .post textarea {
        height: 200px; /* 모바일에서는 텍스트 영역 높이 조정 */
    }

    .button-container button,.file-label {
        font-size: 12px; /* 버튼 텍스트 크기 조정 */
    }
}

@media (max-width: 480px) {
    h1 {
        font-size: 24px; /* 모바일에서 제목 크기 조정 */
    }

    .post input[type="text"],
    .post textarea {
        padding: 8px; /* 입력 필드 패딩 조정 */
    }

    .button-container {
        flex-direction: column; /* 버튼 세로 정렬 */
    }

    .button-container button {
        width: 100%; /* 버튼을 전체 너비로 설정 */
        margin-left: 0; /* 왼쪽 여백 제거 */
        margin-top: 5px; /* 위쪽 여백 추가 */
    }

    .file-label {
        width: 100%; /* 파일 라벨도 전체 너비로 설정 */
    }

    .popup-content {
        width: 90%; /* 팝업 너비 조정 */
    }
}






#link-input-container {


    padding: 5px 10px; /* 패딩 조정 */
    font-size: 10px;
    border: none;
    border-radius: 5px;
    background-color: #007bff;
    color: white;
    cursor: pointer;
    margin-left: 45px; 
    position: absolute;
    top: 36%;
    white-space: nowrap;
   
    
}



#file {

display : none;


}



</style>
<body>


    <div class="box">
        <h1>게시판 글쓰기</h1>
        <div class="postbtn">
        <form method="post" action="insert" enctype="multipart/form-data">
            <label for="category">게시판 선택</label>
            <select id="category" name="category">
                                   <!--  이것만 전송 -->
                <option value="choice" id="choice" name="choice" selected disabled hidden>-- 카테고리를 선택해주세요 --</option>
                <option value="normal" id="normal" name="normal">일반 게시판</option>
                <option value="notify" id="special" name="special">공지사항</option>
                
            </select>
        </div>
       
        
        
       
  
        
        <!-- enctype="multipart/form-data" -->
        
       
       
             <!-- 제목 -->
	        <div class="post">
	            <label for="title">제목</label>
	            <input type="text" id="title" name="title" />
	        </div>
	        
	        <div class="post">
	            <label for="content">내용</label>
	            <div class="button-container">
	            
	            
	                      <!-- 파일올리기 --> 
	                <div id="file-input-container" margin-top: 10px;">        
	                <label for="file" id="link-input-container">
	                첨부 파일
	                </label>                       
	                <input type="file" id="file" name="file_name" multiple>
	                </div>
	                
	                
	                <button type="button" class="link-button" id="link-button">링크 첨부</button>
	                <!-- <button type="button" class="schedule-button" id="schedule-button">일정</button> -->
	                </div>
	            
	            <!-- 내용 -->
	            <textarea id="content" rows="5"  name="content"></textarea>
	
	
	
	             
	            <div id="link-input-container" style="display:none; margin-top: 10px;">
	                <label for="link">링크 입력</label>
	                <input type="text" id="link" name="link" placeholder="링크를 입력하세요" />	                
	            </div>
	                
	                
	                
	                
	            <!-- <div id="schedule-input-container" style="display:none; margin-top: 10px;">
	                <label for="schedule-date">일정</label>
	                <input type="date" id="schedule-date" />
	            </div>
	        </div>
	        <div class="button-post"> -->
	        
	        
	        
	        
	        <%-- <%
    String userId = (String) session.getAttribute("userId");
    String notify = "M"; // 기본값은 일반 사용자
    if (userId != null && userId.contains("admin")) {
        notify = "S"; // 관리자일 경우 
    }
%> --%>
	        
	        
	        
	        
	            <input type="hidden" name="userid" value="<%= session.getAttribute("userId")%>">
				<input type="hidden" name="notify" value="notify">
	            <button type="submit" id="post">게시하기</button>
	        <!-- </form> -->
        
        </form>
        
        
       
    
	
        
        
        
        </div>
        <div id="notification" style="display:none; color: green; margin-top: 10px;"></div>
    </div>

    <div id="popup" class="popup" style="display:none;">
        <div class="popup-content">
            <span class="close" id="close-popup">&times;</span>
            <p>게시글이 등록 되었습니다.</p>
        </div>
    </div>

    <script>
    
    
    
    
    // 일반 유저 글 안보이기 
    <%
    String userIds = (String) session.getAttribute("userId");
    boolean isNormalUser = userIds != null && userIds.contains("user");
%>


    <% if (isNormalUser) { %>
        document.addEventListener("DOMContentLoaded", function() {
            const btn = document.querySelector(".postbtn");
            if (btn) {
                btn.style.display = "none";
            }
        });
    <% } %>

    
    // 선택 누르고 게시할시 막아버리기 
     /* let ch = document.querySelector("#choice");
     let no = document.querySelector("#normal");
     let sp = document.querySelector("#special");
      */
     // value기준
     /* let po = document.querySelector("#post");
      po.addEventListener("click", function(e) {
    	  
    	if(ch.value == "choice") {
    		console.log("카테고리선택함?")
    	    alert("카테고리를 선택해주세요");
    	} 
    	
    	 if(no.value == "normal") {
    		console.log("카테고리선택함?")
    	    alert("글 작성이 완료되었습니다");
    	} 
    	
    	if(sp.value == "notify") {
    		console.log("카테고리선택함?")
    	    alert("글 작성이 완료되었습니다");
    	} 
    }); */
     
     
            /* po.addEventListener("click", function(e) {
    	    // 카테고리 선택이 '선택'이면 중단
    	    if (ch.value == "1") {
    	        console.log("카테고리선택함?");
    	        alert("카테고리를 선택해주세요");
    	        return; // 아래 로직 실행 안 하고 중단
    	    }
    	    console.log("현재 선택된 카테고리:", ch.value);
    	    console.log("현재 선택된 카테고리:", no.value);
    	    console.log("현재 선택된 카테고리:", sp.value);
    	    // 여기부터는 카테고리가 정상 선택된 경우
    	    if (no.value == "2") {
    	        console.log("카테고리말고 다른거선택함?");
    	        alert("글 작성이 완료되었습니다");
    	    } else {
    	        alert("글 작성이 완료되었습니다");
    	    }
    	});
     */
    
    
   
        document.getElementById('link-button').addEventListener('click', function () {
            const linkInputContainer = document.getElementById('link-input-container');
            linkInputContainer.style.display = (linkInputContainer.style.display === 'none' || linkInputContainer.style.display === '') ? 'block' : 'none';
        });

        document.getElementById('schedule-button').addEventListener('click', function () {
            const scheduleInputContainer = document.getElementById('schedule-input-container');
            scheduleInputContainer.style.display = (scheduleInputContainer.style.display === 'none' || scheduleInputContainer.style.display === '') ? 'block' : 'none';
        });

        document.querySelector('.button-post button').addEventListener('click', function () {
            const title = document.getElementById('title').value.trim();
            const content = document.getElementById('content').value.trim();

            if (!title || !content) {
                alert('제목과 내용을 입력해 주세요.'); // 입력 검증
                return; // 함수 종료
            }

            const popup = document.getElementById('popup');
            popup.style.display = 'block'; // 팝업을 표시
            setTimeout(() => {
                popup.classList.add('show'); // 팝업 열기
            }, 10); // 약간의 지연 후 클래스를 추가
        });

        document.getElementById('close-popup').addEventListener('click', function () {
            const popup = document.getElementById('popup');
            popup.classList.remove('show'); // 팝업 닫기
            setTimeout(() => {
                popup.style.display = 'none'; // 팝업 숨기기
            }, 300); // 애니메이션 시간과 동일하게 설정
        });

        window.onclick = function (event) {
            if (event.target === document.getElementById('popup')) {
                const popup = document.getElementById('popup');
                popup.classList.remove('show'); // 팝업 외부 클릭 시 닫기
                setTimeout(() => {
                    popup.style.display = 'none'; // 팝업 숨기기
                }, 300); // 애니메이션 시간과 동일하게 설정
            }
        }

        //글 내용에서 수정 버튼 클릭 시
        // 페이지 로드 시 기존 내용 채우기
        document.addEventListener("DOMContentLoaded", function () {
            const title = localStorage.getItem('postTitle');
            const content = localStorage.getItem('postContent');

            if (title) {
                document.getElementById('title').value = title;
                localStorage.removeItem('postTitle'); // 저장된 데이터 삭제
            }

            if (content) {
                document.getElementById('content').value = content;
                localStorage.removeItem('postContent'); // 저장된 데이터 삭제
            }
        });
    </script>
</body>

</html>