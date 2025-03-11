<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>실적등록</title>
<link rel="stylesheet" href="css\Performance.css">
<script src="js\Performance.js"></script>

</head>

<body>
	<div id="myModal" class="modal">
		<div class="modal-content">
			<span class="close">&times;</span>
			<p>여기는 모달창 내용 영역입니다.</p>
		</div>
	</div>
	<div class="warrap">
		<div class="instruction">
			<div class="instTop">
				<div class="wkr">작업지시서</div>
				<div>
					<button class="btn1">조회</button>
				</div>
			</div>
			<div class="instView">
				<%-- <%@ page include  %> --%>
				<jsp:include page="../WorkOrder.jsp"></jsp:include>
				<!-- <iframe src="WorkOrder.jsp" style="width:100%; hieght:100%"></iframe> -->
			</div>
		</div>
		<div>
			<div class="bord">
				<div class="inBord">
					<div>현재 진행률</div>
					<div>%</div>
					<div>(제품별)</div>
				</div>
				<div class="inBord">
					<div>불량률</div>
					<div>%</div>
					<div>(제품별)</div>
				</div>
			</div>
			<div class="box2">
				<div class="criteria">
					<div class="wp">제품명</div>
					<div class="btn2B">
						<button class="btn2">제품 합격/불합격 기준</button>
					</div>
				</div>
				<div class="registration">
					<!-- form 여깄어요!! -->
					<form method="post" action="Performance">
						<!-- insert 폼인지 확인 -->
						<input type="hidden" name="command" value="insert">
						<div class="rightTop">
							<div class="wp2">제품명</div>
							<!-- 제품명 들어갈자리 hidden -->
							<input type="hidden" name="wpvnaaud" id="wpvnaaud">
							<div>
								<!-- 날짜데이터 삽입 -->
								<input type="datetime-local" class="date1" name="date">
							</div>
							<input type="submit" class="btn3" value="등록">
						</div>
						<div>
							<div id="ea">
								생산갯수 : <input type="number" id="myInput" min="1" max="100"
									oninput="validity.valid||(value='')" value="10" name="ea">
								pack
							</div>
						</div>
						<textarea name="comment" class="textarea1" rows="5"></textarea>
					</form>
				</div>
			</div>
			<div class="box3">
				<div class="box3Top">
					<div>
						<input type="text" class="wp3" placeholder="제품명">
					</div>
					<div class="date2">
						<input type="datetime-local" class="indate1"> ~ <input
							type="datetime-local" class="indate2">
					</div>
					<div>
						<button class="btn4">조회</button>
					</div>
				</div>
				<div class="indexBox">
					<div class="index" style="">
						<div>등록시간</div>
						<div>제품명</div>
						<div>수량</div>
						<div>코멘트</div>
						<div>등록인</div>
						<div>비고</div>
					</div>
				</div>
				<div class="box3View">
					<c:forEach var="dto" items="${resultList}">
						<div class="dex item">
							<div class="dateB">
								<fmt:formatDate value="${dto.reportTime}"
									pattern="yyyy-MM-dd HH:mm:ss" />
								<!-- gpt 사용했음 fmt 라이브러리 공부해야함. -->
							</div>
							<div class="emdwp">${dto.productName}</div>
							<div class="emdtn">${dto.productionCount}</div>
							<div class="text1">${dto.performanceComment}</div>
							<div class="emdId">${dto.userId}</div>
							<div style="display: flex; justify-content: center;">
								<!-- css안먹어서 그냥박아버림 -->
								<button class="tn">수정</button>
								<!-- <form method="post" action="Performance">
									<input type="hidden" name="command" value="update">
									<input type="submit" value="수정">
								</form>-->
								<form method="post" action="Performance">
									<input type="hidden" name="command" value="delete"> <input
										type="submit" value="삭제" style="height: 26px;">
								</form>
								<!-- 	<button class="tkr">삭제</button> -->
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<script>
		/* document.querySelector('#wpvnaaud').value = document
				.querySelector(".wp2").innerText;                   등록 버튼을 눌렀을때 값을넣고 전송하기위함. */
				
				
				
	  document.querySelector('.tn').addEventListener('click', (e)=>{
		  	/* 출력해봄 */
		    console.log(e.target.parentNode.parentNode);
		    const tarGet = e.target.parentNode.parentNode;
		    const date = tarGet.querySelector('.dateB').innerText;
		    const emdwp = tarGet.querySelector('.emdwp').innerText;
		    const emdtn = tarGet.querySelector('.emdtn').innerText;
		    const text1 = tarGet.querySelector('.text1').innerText;
		    const emdId = tarGet.querySelector('.emdId').innerText;
		    console.log(date, emdwp, emdtn, text1, emdId);
		    
		    tarGet.innerHTML = `
							 <form method="post" action="Performance">
		    					<div class="dateB">
		    						<input type="datetime-local" class="date1" name="date" value="\${date}">
									<!-- gpt 사용했음 fmt 라이브러리 공부해야함. -->
								</div>
								<div class="emdwp"><input type="text" value="\${emdwp}"></div>
								<div class="emdtn"><input type="text" value="\${emdtn}"></div>
								<div class="text1"><input type="text" value="\${text1}"></div>
								<div class="emdId">\${emdId}</div>
								<div style="display: flex; justify-content: center;">
									<!-- css안먹어서 그냥박아버림 -->
									<!-- <button class="tn">수정</button> -->
										<input type="hidden" name="command" value="update">
										<input type="submit" value="수정" style="
										    height: 26px;
										">
									<!-- <form method="post" action="Performance">
										<input type="hidden" name="command" value="delete">
										<input type="submit" value="삭제">
									</form> -->
									<button class="cnlth">취소</button>
								</div>
							</form>
							`
		  })
	</script>
</body>

</html>