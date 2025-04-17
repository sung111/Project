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
    <title>Document</title>
    <!-- <link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" href="../css/05_글내용.css"> -->
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
    margin-bottom: 30px;
}

.post-title {
    font-size: 24px;
    font-weight: bold;
    margin-bottom: 10px;
}

.post-info {
    font-size: 12px;
    color: #888;
    margin-bottom: 20px;
    border-bottom: 1px solid #d9d9d9;
}

.post-content {
    font-size: 16px;
    color: #333;
    margin-bottom: 20px;
}

.button-container {
    text-align: right;
    
}

.button-container button {
    
    padding: 10px 15px;
    font-size: 10px;
    border: none;
    border-radius: 5px;
    background-color: #007bff;
    color: white;
    cursor: pointer;
}
h2 {
    border-bottom: 1px solid #d9d9d9;
}
.comment-section {
    margin-top: 20px;
    padding-top: 10px;
}

.abc {
    display: flex;
    
}
.comment-section h2 {
    margin-bottom: 5px;
    font-size: 20px;
}

.comment-section textarea {
    width: 100%;
    height: 60px;
    border: 1px solid #d9d9d9;
    border-radius: 5px;
    padding: 10px;
    margin-bottom: 10px;
}

.comment-section button {
    padding: 10px 15px;
    font-size: 10px;
    border: none;
    border-radius: 5px;
    background-color: #007bff;
    color: white;
    cursor: pointer;
}
.comment {
    font-size: 14px;
    margin-bottom: 10px;
    padding: 5px;
    border-radius: 5px;
    border-bottom: 1px solid #d9d9d9;
    display: flex;
    flex-direction: row;
    justify-content: space-between;
}

.comment .author {
    font-weight: bold;
}

.comment .date {
    font-size: 12px;
    color: #888;
}

.ok {
    width: 50px;
    height: 33px;
}


#attach {


border: 2px solid lightgray;
border-top-left-radius:5px;
border-top-right-radius:5px;
border-bottom-right-radius:5px;
border-bottom-left-radius:5px;

    padding-top: 10px;
    padding-right: 10px;
    padding-bottom: 10px;
    padding-left: 10px;

margin-top : 5%;

width: 50%;

}













.modal {
  position: fixed;
  z-index: 1000;
  left: 0; top: 0;
  width: 100%; height: 100%;
  background-color: rgba(0,0,0,0.5);
  display: flex;
  align-items: center;
  justify-content: center;
}

.modal-content {
  background-color: white;
  padding: 20px;
  border-radius: 8px;
  width: 350px;
  position: relative;
  box-shadow: 0 4px 10px rgba(0,0,0,0.3);
}

.close {
  position: absolute;
  right: 10px;
  top: 10px;
  font-size: 20px;
  cursor: pointer;
}
</style>
<body>



    <div class="box">
        <div class="post-title">${con.title}</div>
        <div class="post-info"> 작성자: 안혜리 | 날짜: ${con.postdate} | 조회수: ${con.viewcount}</div>
        <div class="post-content">
          ${con.content}
         
        </div>

<br>
<br>
<br> <a href="${Linkselid.link}">${Linkselid.link}</a> 
<br>
<%-- <c:forEach var="dolink" items="${linklist}"> --%>
	<div><a href=${dolink.link}>${dolink.link}</a></div>
<%-- </c:forEach> --%>
<br>
<br>
<br>


 <c:forEach var="flink" items="${Fileselid}">
 <div id="attach">첨부된 파일 : 
<!-- <form method="post" action="downloads">  -->
 <a href="downloads?file_name=${flink.file_name}"  id="href">${flink.file_name}</a><br>
  <img src="/upload/${flink.file_name}" alt="첨부 이미지" width="300">
<!-- </form> -->
</div>
</c:forEach> 

      
      
    
             
      
        <div class="button-container">
        <!-- <form method ="post" action ="board"> -->
            <button type="submit" id="list"><a href="select">목록으로</a></button>
      <!--   </form> -->
        
        
        
    <%--  <c:forEach var="dyo" items="${idpost}">  --%>  
        <form method ="post" action ="conmod">
            <button type="submit" id="modify" name="postid" value="${con.postid}">수정</button>
        </form>
     <%--  </c:forEach>   --%> 
            
            
            
               <%-- <c:forEach var="dxo" items="${idpost}">  --%>   
                    <form method="post" action="condel">
                    <button class="commentbtn" type="submit" name="postid" value="${con.postid}">삭제</button>
                    </form>
              <%--  </c:forEach> --%> 
            
   
            
            
        </div>
        
        <div class="comment-section">
            <h2>댓글</h2>
            
            
            
     <div id="comment-space">
            
            
              <c:forEach var="ddt" items="${selcom}"> 
            
       <div class="comment">
            
                <div class="usercomment">
                    <span class="author">박혜성</span>
                    <span class="date">${ddt.commentdate}</span>
                    <p>${ddt.commenttext}</p>
                </div>
                
                
                <div class="cmtbtn">
                
                
                    <button class="commentbtn" type="submit" >수정</button>
                    
                    
                    <form method="post" action="delcon"> 
                    <input type="hidden" name="postid" value="${ddt.postid}" />
                    <input type="hidden" name="commentid" value="${ddt.commentid}">
                    <button class="commentbtndel" type="submit" value="${ddt.commentid}">삭제</button>
                    </form>
                    
                </div>
                    
                     <%-- <c:if test="${empty ddt.commentid}">
    <p>commentid가 비어있습니다!</p>
</c:if>
<c:if test="${not empty ddt.commentid}">
    <p>commentid: ${ddt.commentid}</p>
</c:if>      --%>
                    
                             <!-- 모달 레이어 -->
<div id="commentModal" class="modal" style="display: none;">
  <div class="modal-content">
    <span class="close" id="closeModal">&times;</span>
    <h3>댓글 수정</h3>
    
    <form method="post" action="comup">
      <input type="hidden" name="commentid" value="${ddt.commentid}" />
      <input type="hidden" name="postid" value="${ddt.postid}" />
      <textarea rows="4" name="commenttext" value="${ddt.commenttext}" style="width: 95%;">${ddt.commenttext}</textarea>
      <br/>
      <button type="submit">저장</button>
    </form>
      
      <button type="button" id="cancelModal">취소</button>
  </div>
</div>
                   
               
                    
                    </div>
                         </c:forEach> 
                         
                         
              </div>
                    
                    
             <form method="post" action="comment"> 
            <div class="comment-section abc">
                <input type="hidden" value="${con.postid}" name="postid">
                <textarea placeholder="댓글을 입력하세요." name="commenttext"></textarea>
                <button type="submit" class="ok">등록</button>
            </div>
           </form> 
                    
                    
            </div>
           
       </div>
             
  
             
            
            
            
            
            
            
            
            <%-- <c:forEach var="dpo" items="${idpost}">   --%>      
          
              <%-- <c:if test="${empty con.postid}">
    <p>postid가 비어있습니다!</p>
</c:if>
<c:if test="${not empty con.postid}">
    <p>postid: ${con.postid}</p>
</c:if>   --%>
        
        <%-- </c:forEach>  --%>
            
         
         
         
    
        
         
         
            
           </div>
        
        
        
        
      
        
        
        
        
        
        <script>
        
        
        
       /*  const list = document.querySelector('#commod')
        list.addEventListener('click', function () {
                console.log("안녕하세요")
        }); */
        
            let btnList = document.querySelectorAll(".commentbtn");
        
        btnList.forEach(function (btn) {
            btn.addEventListener('click', function() {
            	
            	console.log("버튼");
        	  document.getElementById("commentModal").style.display = "flex"; 
        	  
        	});
        });

        	document.getElementById("closeModal").addEventListener("click", function() {
        	  document.getElementById("commentModal").style.display = "none";
        	});

        	document.getElementById("cancelModal").addEventListener("click", function() {
        	  document.getElementById("commentModal").style.display = "none";
        	});

        	// 바깥 영역 클릭 시 닫기
        	window.addEventListener("click", function(e) {
        	  if (e.target.id === "commentModal") {
        	    document.getElementById("commentModal").style.display = "none";
        	  }
        	});
        
        
        
         /*    const list = document.querySelector('#list');
            const iframe = parent.document.querySelector("iframe");

            list.addEventListener('click', function () {
                iframe.src = "../componant/03_사내복지.html";
            });

            // 권한 확인을 위한 변수
            const userRole = window.parent.localStorage.getItem("userRole");

            // 수정 버튼 클릭 시
            document.addEventListener("DOMContentLoaded", function () {
                const modifyButton = document.querySelector('#modify');

                // 권한이 'admin'인 경우에만 수정 가능
                if (userRole === 'admin') {
                    modifyButton.addEventListener('click', function () {
                        const title = document.querySelector('.post-title').textContent;
                        const content = document.querySelector('.post-content').textContent;

                        // localStorage에 저장
                        localStorage.setItem('postTitle', title);
                        localStorage.setItem('postContent', content);

                        // 글쓰기 페이지로 이동
                        iframe.src = "../componant/06_글쓰기.html";
                    });
                } else {
                    modifyButton.addEventListener('click', function () {
                        alert("권한이 없습니다."); // 권한이 없을 때 경고 메시지
                    });
                }
            }); */
            
            

        </script>
    </div>
</body>

</html>
