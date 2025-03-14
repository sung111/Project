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
<script src="js\qualityControl.js"></script>
<link rel="stylesheet" href="">

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
						<input type="hidden" name="command" value="search"> <input
							type="datetime-local" class="date2" style="margin: 10px;"><input
							type="submit" class="btn1" value="조회">
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
						<div class="dex item">
							<div class="dateB">
								<fmt:formatDate value="${dto.reportTime}"
									pattern="yyyy-MM-dd HH:mm:ss" />
								<!-- gpt 사용했음 fmt 라이브러리 공부해야함. -->
							</div>
							<div class="emdwp">${dto.productNameST}</div>
							<div class="emdtn">${dto.productionCount}</div>
							<div class="text1">${dto.performanceComment}</div>
							<div class="emdId">${dto.userId}</div>
							<input type="hidden" name="performanceId"
								value="${dto.performanceId}" class="performId">
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
				style="border: 1px solid rgb(199, 196, 196);">
				<!-- form 여기있어요 -->
				<input type="hidden" name="command" value="insert">
				<input type="hidden" name="performanceId" class="performId" id="performId1">
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
							<input type="datetime-local" class="insertDate" name="date">
							<div>
								합격 갯수입력 : <input type="number" class="myInput" min="0" max="100"
									oninput="validity.valid||(value='')" placeholder="0"
									name="passPack"> pack
							</div>
							<div>
								불합 개수입력 : <input type="number" class="myInput" min="0" max="100"
									oninput="validity.valid||(value='')" placeholder="0"
									name="failPack"> pack
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
						<select class="dropBox hide" name="failreason">
							<option value="무게 미달">무게 미달</option>
							<option value="외관 불량">외관 불량</option>
							<option value="자재 불량">자재 불량</option>
						</select>
					</div>
				</div>
			</form>
		</div>
		<div class="box3">
			<form action="qualityControl" method="post" class="box3">
				<div class="box3Top">
					<div>
						<input type="text" placeholder="제품명" class="wp3">
					</div>
					<div class="date2">
						날짜 : <input type="datetime-local" class="indate1"> ~ <input
							type="datetime-local" class="indate2">
					</div>
					<div>
						결과 : <select class="dropBox2">
							<option value="">전체</option>
							<option value="">합격</option>
							<option value="">불합격</option>
						</select>
					</div>
					<div>
						불합격 사유 : <select class="dropBox2">
							<option value="">전체</option>
							<option value="">무게 미달</option>
							<option value="">외관 불량</option>
							<option value="">자재 불량</option>
						</select>
					</div>
					<div>
						<button class="btn4">검색</button>
					</div>
				</div>
			</form>
			<div class="dede">
				<div class="index">
					<div>날짜</div>
					<div>제품명</div>
					<div>합격/불합격</div>
					<div>불합격 사유</div>
					<div>코멘트</div>
					<div>등록인</div>
					<div>비고</div>
				</div>
			</div>
			<div class="box3View"></div>
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
				
			    console.log(e.target.parentNode.parentNode);
				const idValue = e.target.parentNode.parentNode.querySelector('.performId').value;
			    document.querySelector('#wpvnaaud').value = idValue;
			    document.querySelector('#performId1').value = idValue;
			    
			    document.querySelector('.wp').innerText = e.target.parentNode.parentNode.querySelector('.emdwp').innerText
			    document.querySelector('.wp2').innerText = e.target.parentNode.parentNode.querySelector('.emdwp').innerText
			    
			})
			
		}
	
		
		document.querySelector('.btn3').addEventListener('click', (e) => {
			if( document.querySelector('.wp2').innerText == "제품명" ){
				alert("제품이 선택되지않았습니다.");
				return;
			}
			alert("품질 등록이 완료되었습니다.")
		})
	
	</script>
</body>

</html>