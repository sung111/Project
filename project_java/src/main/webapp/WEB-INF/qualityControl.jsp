<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>품질관리</title>
<link rel="stylesheet" href="css\qualityControl.css">
<link rel="stylesheet" href="css\reset.css">
<script src="js\qualityControl.js"></script>
</head>

<body>
	<div id="myModal" class="modal">
		<div class="modal-content">
			<span class="close">&times;</span>
			<p>여기는 모달창 내용 영역입니다.</p>
		</div>
	</div>
	<div class="warrap">
		<div class="wkr">
			<div class="wkrTop">
				<div class="wkrwl">실적 조회</div>
				<div>
					<form action="qualityControl" method="post">
						<input type="hidden" name="command" value="search1"> <input
							name="date" type="date" class="date2" style="margin: 10px;"
							id="date3"
							value="<%=request.getParameter("date") != null ? request.getParameter("date") : ""%>">
						<input type="submit" class="btn1" value="조회">
					</form>
				</div>
			</div>
			<div class="wkrView">
				<div class="indexBox" id="index">
					<div class="index">
						<div>등록시간</div>
						<div>제품명</div>
						<div>수량</div>
						<div>코멘트</div>
						<div>등록인</div>
						<div>비고</div>
					</div>
				</div>
				<div class="perForm">
					<c:forEach var="dto" items="${resultList}">
						<div class="dex item" style="width: 99%;">
							<div class="dateB">
								<fmt:formatDate value="${dto.reportTime}"
									pattern="yyyy-MM-dd HH:mm:ss" />
								<!-- gpt 사용했음 fmt 라이브러리 공부해야함. -->
							</div>
							<div class="emdwp">${dto.productName}</div>
							<div class="emdtn">${dto.productionCount}</div>
							<div class="text1">${dto.performanceComment}</div>
							<div class="emdId">${dto.userId}</div>
							<input type="hidden" name="productid" value="${dto.productId}"
								class="productid"> <input type="hidden"
								name="performanceId" value="${dto.performanceId}"
								class="performId">
							<div>
								<button class="selectItem">선택</button>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
		<div class="bord">
			<div class="inBord">
				<div>검사완료율</div>
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
			<div class="left">
				<div class="wp">제품명</div>
				<div class="btn2B">
					<button class="btn2">제품 합격 / 불합격 기준</button>
				</div>
			</div>
			<form method="post" action="qualityControl" class="right"
				style="border: 1px solid rgb(199, 196, 196);" id="formK">
				<!-- form 여기있어요 -->
				<input type="hidden" name="command" value="insert"> <input
					type="hidden" name="performanceId" class="performId"
					id="performId1">
				<div class="right" style="width: 100%;">
					<div class="rightTop">
						<div class="wp2">제품명</div>
						<input type="hidden" name="wpvnaaud" id="wpvnaaud">
					</div>
					<div>
						<div>
							<input type="radio" name="ra" checked="checked" class="rad"
								value="합격"> 합격 <input type="radio" name="ra" class="rad"
								value="불합격"> 불합격
						</div>
						<div>
							<input type="datetime-local" class="insertDate" name="date"
								style="font-size: 15px;">
							<div>
								합격 갯수입력 : <input type="number" class="myInput" min="0" max="100"
									oninput="validity.valid||(value='')" placeholder="0"
									name="passPack" id="passInput"> pack
							</div>
							<div>
								불합 개수입력 : <input type="number" class="myInput" min="0" max="100"
									oninput="validity.valid||(value='')" placeholder="0"
									name="failPack" id="failInput"> pack
							</div>
						</div>
					</div>
					<div class="insert">
						<textarea placeholder="기타사항" class="textBox" rows="2"
							name="comment"></textarea>
						<input type="submit" class="btn3" value="등록">
					</div>
					<div class="BB">
						<div class="BB2 hide">불합격 사유 :</div>
						<select class="dropBox hide" name="failreason" disabled>
							<option value="무게 미달">무게 미달</option>
							<option value="외관 불량">외관 불량</option>
							<option value="자재 불량">자재 불량</option>
						</select>
					</div>
				</div>
			</form>
		</div>
		<div class="box3">
			<form action="qualityControl" method="post" class="box3"
				id="searchForm">
				<input type="hidden" name="command" value="search">
				<div class="box3Top">
					<div>
						<input type="text" placeholder="제품명" class="wp3"
							name="productName"
							value="<%=request.getParameter("productName") != null ? request.getParameter("productName") : ""%>">
					</div>
					<div class="date2">
						날짜 : <input type="datetime-local" class="indate1" name="startDate"
							value="<%=request.getParameter("startDate") != null ? request.getParameter("startDate") : ""%>">
						~ <input type="datetime-local" class="indate2" name="endDate"
							value="<%=request.getParameter("endDate") != null ? request.getParameter("endDate") : ""%>">
					</div>
					<div>
						결과 : <select class="dropBox2" name="result">
							<option value=""
								<%="전체".equals(request.getParameter("result")) ? "selected" : ""%>>전체</option>
							<option value="합격"
								<%="합격".equals(request.getParameter("result")) ? "selected" : ""%>>합격</option>
							<option value="불합격"
								<%="불합격".equals(request.getParameter("result")) ? "selected" : ""%>>불합격</option>
						</select>
					</div>
					<div>
						불합격 사유 : <select class="dropBox2" name="failreason">
							<option value=""
								<%="전체".equals(request.getParameter("failreason")) ? "selected" : ""%>>전체</option>
							<option value="무게 미달"
								<%="무게 미달".equals(request.getParameter("failreason")) ? "selected" : ""%>>무게
								미달</option>
							<option value="외관 불량"
								<%="외관 불량".equals(request.getParameter("failreason")) ? "selected" : ""%>>외관
								불량</option>
							<option value="자재 불량"
								<%="자재 불량".equals(request.getParameter("failreason")) ? "selected" : ""%>>자재
								불량</option>
						</select>
					</div>
					<div>
						<input type="submit" class="btn4" value="검색" id="searchbtn">
						<button class="btn4" id="reset">초기화</button>
					</div>
				</div>
			</form>
			<div class="dede">
				<div class="index" style="margin-left: 6px;">
					<div>날짜</div>
					<div>제품명</div>
					<div>합격/불합격</div>
					<div>불합격 사유</div>
					<div>코멘트</div>
					<div>등록인</div>
					<div>비고</div>
				</div>
			</div>
			<div class="box3View">
				<c:forEach var="ttT" items="${ result }">
					<form method="post" action="qualityControl"
						class="dex item deleteForm" style="width: 98%;">
						<input type="hidden" name="command" value="delete"> <input
							type="hidden" id="qualityControlId" name="qualityControlId"
							value="${ ttT.qualityControlId }">
						<div class="dateB" id="qualitydate">
							<fmt:formatDate value="${ttT.reportTime}"
								pattern="yyyy-MM-dd HH:mm:ss" />
						</div>
						<div class="emdwp" id="qualityName">${ttT.productNameST}</div>
						<div class="emdgkq" id="qualityResult">${ttT.result}</div>
						<div class="tkdb" id="qualityFailreason">${ttT.failreason}</div>
						<div class="text1" id="qualityComments">${ttT.comments}</div>
						<div class="text1" id="qualityUserId">${ttT.userId}</div>
						<div
							style="display: flex; justify-content: center; align-items: center;">
							<button style="font-size: 12px; height: 25px;" class="modify">수정</button>
							<input type="submit" name="tn" value="삭제" class="tkr"
								style="font-size: 12px; height: 25px;">

						</div>
					</form>
				</c:forEach>
			</div>
		</div>
	</div>



	<script>
	
		// 실적 조회 박스에서 선택버튼 선택시 
		// performanceId
		const selectItem = document.querySelectorAll('.selectItem')
		for(let i = 0 ; i < selectItem.length ; i++){
			selectItem[i].addEventListener('click', (e)=>{
				
				const item  = document.querySelectorAll('.item')
				for(let j = 0 ; j < item.length ; j++){
			    	item[j].classList.remove('viewSelect');
				}
			    
			    e.target.parentNode.parentNode.classList.add('viewSelect');
				
				const idValue = e.target.parentNode.parentNode.querySelector('.performId').value;
				const idValue2 = e.target.parentNode.parentNode.querySelector('.productid').value;
			    document.querySelector('#wpvnaaud').value = idValue2;
			    document.querySelector('#performId1').value = idValue;
			    
			    document.querySelector('.wp').innerText = e.target.parentNode.parentNode.querySelector('.emdwp').innerText
			    document.querySelector('.wp2').innerText = e.target.parentNode.parentNode.querySelector('.emdwp').innerText
			    
			})
			
		}
	
		
		// 등록 버튼
		document.querySelector('.btn3').addEventListener('click', (e) => {
			
			e.preventDefault()
			
			const pass = document.querySelector('#passInput').value
			const fail = document.querySelector('#failInput').value
			
			if( document.querySelector('.wp2').innerText == "제품명" ){
				alert("제품이 선택되지않았습니다.");
				return;
			} 
			if ( pass == null || pass == "" || fail == null || fail == "" || (pass < 0 && pass < 100) || (fail < 0 && fail < 100) ) {
				alert("합격갯수 불합격갯수를 입력해주세요.\n합격 : 0 ~ 100개\n불합격 : 0~100개")
				return;
			} else{
				alert("품질등록이 완료되었습니다.");
				document.querySelector('#formK').submit();
			}
		})
		
		
		// 수정버튼
		const modify = document.querySelectorAll('.modify')
		 for(let i = 0 ; i < modify.length ; i++){ 
	 		modify[i].addEventListener('click', (e)=>{
				const view = e.target.parentNode.parentNode;
				const ControlId = view.querySelector('#qualityControlId').value
				const date = view.querySelector('#qualitydate').innerText
				const name = view.querySelector('#qualityName').innerText
				const result = view.querySelector('#qualityResult').innerText
				const failreason = view.querySelector('#qualityFailreason').innerText
				const comments = view.querySelector('#qualityComments').innerText
				const userId = view.querySelector('#qualityUserId').innerText
				
				view.innerHTML = "";
			       view.innerHTML += `
									<form method="post" action="qualityControl" class="dex item">
							    	    <input type="hidden" name="command" value="update">
							    	    <input type="hidden" name="qualityControlId" value="\${ ControlId }">
										<div class="dateB" id="qualitydate">
					    	  				<input type="datetime-local" class="date1" name="date22" value="\${date}" style="font-size:10px">
					       				</div>
										<div class="emdwp" id="qualityName">\${name}</div>
										<div class="emdgkq" id="qualityResult">
												<select name="qualityResult22" id="selectPass" class="emdgkq" style="font-size:12px">
										            <option value="합격">합격</option>
										            <option value="불합격">불합격</option>
									           	</select></div>
										<div class="tkdb" id="qualityFailreason" style="display: flex; justify-content: center;">
											<select class="dropBox" name="failreason22" style="font-size:12px">
											<option value="">없음</option>
											<option value="무게 미달">무게 미달</option>
											<option value="외관 불량">외관 불량</option>
											<option value="자재 불량">자재 불량</option>
											</select>
										</div>
										<div class="text1" id="qualityComments"> <input type="text" value="\${comments}" name="comment22" style="font-size:12px"></div>
										<div class="text1" id="qualityUserId">\${userId}</div>
										<div
											style="display: flex; justify-content: center; align-items: center;">
												<input type="submit" name="tn" value="완료" id="Comple"
													style="font-size: 12px; height: 25px;">
											<button style="font-size: 12px; height: 25px;" id="cancel">취소</button>
										</div>
									</form>
			                       `
			})
			
		}
		
		// 조회버튼
		document.querySelector('#searchbtn').addEventListener('click',(e)=>{
		    e.preventDefault()
		    if( document.querySelector('.indate1').value == '' || document.querySelector('.indate2').value == ''){
		    	alert("날짜를 입력해야합니다.")
		    } else {
		    	document.querySelector('#searchForm').submit();
		    }
		})
		
		const del = document.querySelectorAll('.tkr')
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
		
		// 초기화버튼
	  	document.querySelector('#reset').addEventListener('click',(e)=>{
		    e.preventDefault()
		    document.querySelector('.wp3').value = '';
		    document.querySelector('.indate1').value = '';
		    document.querySelector('.indate2').value = '';
	 	})
	
	</script>
</body>

</html>