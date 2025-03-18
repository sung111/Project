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
				<jsp:include page="../ProdPlan.jsp"></jsp:include>
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
						<div class="rightTop" style="width: 100%;">
							<div class="wp2">제품명</div>
							<!-- 제품명 들어갈자리 hidden -->
							<input type="hidden" name="wpvnaaud" id="wpvnaaud">
							<div>
								<!-- 날짜데이터 삽입 -->
								<input type="datetime-local" class="date1" name="date" id="date11">
							</div>
							<input type="submit" class="btn3" value="등록">
						</div>
						<div style="width: 100%;">
							<div id="ea">
								생산갯수 : <input type="number" id="myInput" min="1" max="100"
									oninput="validity.valid||(value='')" value="10" name="ea">
								pack
							</div>
						</div>
						<textarea name="comment" class="textarea1" rows="3"
							style="font-size: 15px;"></textarea>
					</form>
				</div>
			</div>
			<div class="box3">
				<div style="display: flex;">
					<form method="post" class="box3Top"
						style="padding: 8px 10px 0 10px;width: 100%;">
						<div style="display: flex; flex-grow: 0.1; width: 26%;">
							<input type="text" class="wp3" name="searchName"
								placeholder="제품명" value="<%= request.getParameter("searchName") != null ? request.getParameter("searchName") : "" %>">
						</div>
						<div class="date2">
							<input type="datetime-local" class="indate1" name="startDate" value="<%= request.getParameter("startDate") != null ? request.getParameter("startDate") : "" %>">
							~ <input type="datetime-local" class="indate2" name="endDate" value="<%= request.getParameter("endDate") != null ? request.getParameter("endDate") : "" %>">
						</div>
						<div style="text-align: end;">
							<input type="hidden" name="command" value="search"> <input
								type="submit" value="조회" class="btn4" id="searchbtn">
							<button class="btn4" id="reset">초기화</button>
						</div>
					</form>
				</div>
				<div class="indexBox">
					<div class="index">
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
							<form method="post" action="Performance" class="kk deleteForm">
								<div class="dateB">
									<fmt:formatDate value="${dto.reportTime}"
										pattern="yyyy-MM-dd HH:mm:ss" />
									<!-- gpt 사용했음 fmt 라이브러리 공부해야함. -->
								</div>
								<div class="emdwp">${dto.productName}</div>
								<div class="emdtn">${dto.productionCount}</div>
								<div class="text1">${dto.performanceComment}</div>
								<div class="emdId">${dto.userId}</div>
								<input type="hidden" name="performanceId"
									value="${dto.performanceId}" class="performId">
								<div style="display: flex; justify-content: center;">
									<!-- css안먹어서 그냥박아버림 -->
									<button class="tn" style="height: 26px;">수정</button>
									<!-- <form method="post" action="Performance">
									<input type="hidden" name="command" value="update">
									<input type="submit" value="수정">
								</form>-->
									<input type="hidden" name="command" value="delete"> <input
										type="submit" value="삭제" style="height: 26px;" class="delete">
									<!-- 	<button class="tkr">삭제</button> -->
								</div>
							</form>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>


	<script>
	
	// 수정
	const tn = document.querySelectorAll('.tn')
	for(let tn1 of tn){
		tn1.addEventListener('click', (e)=>{
		  	/* 출력해봄 */
		    console.log(e.target.parentNode.parentNode);
		    const tarGet = e.target.parentNode.parentNode;
		    const date = tarGet.querySelector('.dateB').innerText;
		    const emdwp = tarGet.querySelector('.emdwp').innerText;
		    const emdtn = tarGet.querySelector('.emdtn').innerText;
		    const text1 = tarGet.querySelector('.text1').innerText;
		    const emdId = tarGet.querySelector('.emdId').innerText;
		    const performId1 = tarGet.querySelector('.performId').value;
		    console.log(date, emdwp, emdtn, text1, emdId, performId1);
		    
		    tarGet.innerHTML = `
								<form method="post" action="Performance" class="kk">
								<input type="hidden" name="command" value="update">
		    					<div class="dateB">
		    						<input type="datetime-local" class="date1" name="date2" value="\${date}" style="font-size:15px">
									<!-- gpt 사용했음 fmt 라이브러리 공부해야함. -->
								</div>
								<div class="emdwp">\${emdwp}</div>
								<div class="emdtn"><input type="text" name="number2" value="\${emdtn}" style="font-size:15px"></div>
								<div class="text1"><input type="text" name="comment2" value="\${text1}" style="font-size:15px"></div>
								<div class="emdId">\${emdId}</div>
								<div style="display: flex; justify-content: center;">
									<!-- css안먹어서 그냥 박아버림 -->
									<!-- <button class="tn">수정</button> -->
									<input type="hidden" name="performanceId2" value="\${performId1}">
									<input type="submit" value="확인" style="height: 26px;" id="yes">
									<!-- <form method="post" action="Performance">
										<input type="hidden" name="command" value="delete">
										<input type="submit" value="삭제">
									</form> -->
									<button class="cnlth">취소</button>
								</div>
								</form>
							`
		  	document.querySelector('#yes').addEventListener('click', (e)=>{
				alert("수정되었습니다.")
			})
		})
		
	}

		// 삭제 버튼
	const del = document.querySelectorAll('.delete')
	const deleteF = document.querySelectorAll('.deleteForm')
	for(let i = 0; i < del.length; i++){
		del[i].addEventListener('click', (e)=>{
			e.preventDefault()
			const tt = confirm("정말로 삭제하시겠습니까?")
			if(tt){
				deleteF[i].submit();
			}
		})
	}
	
	//조회버튼
	document.querySelector('#searchbtn').addEventListener('click',(e)=>{
	    e.preventDefault()
	    if( document.querySelector('.indate1').value == '' || document.querySelector('.indate2').value == ''){
	    	alert("날짜값을 입력해야합니다.")
	    } else {
	    	document.querySelector('#searchForm').submit();
	    }
	})
		
	// 초기화 버튼
  	document.querySelector('#reset').addEventListener('click',(e)=>{
	    e.preventDefault()
	    document.querySelector('.wp3').value = '';
	    document.querySelector('.indate1').value = '';
	    document.querySelector('.indate2').value = '';
 	})
	


	</script>
</body>

</html>