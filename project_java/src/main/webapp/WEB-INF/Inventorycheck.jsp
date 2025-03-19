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
<title>재고현황조회</title>
<link rel="stylesheet" href="css\reset.css">
<link rel="stylesheet" href="css\Inventorycheck.css">
</head>

<body>
	<div class="box">
		<!--제목 -->
		<h1>재고 현황 조회</h1>
	</div>
	<div class="box">
		<form class="container" style="font-size: 15px;" method="post"
			action="Inventorycheck" id="selectForm">
			<label for="inventoryType">제품 유형 :<select id="inventoryType"
				name="searchType">
					<option value="">선택</option>
					<option value="원자재">원자재</option>
					<option value="완제품">완제품</option>
			</select>
			</label> <label for="warehouse">검색 방식 :<select id="warehouse"
				name="searchWay">
					<option value="">선택</option>
					<option value="품명">품명</option>
					<option value="품번">품번</option>
					<option value="LotNo">Lot No</option>
			</select>
			</label>
			<div class="item">
				<label for="search" class="search">검색 : </label> <input type="text"
					id="search" placeholder="검색어를 입력하세요.">
			</div>
			<div class="item">
				<button type="button" class="check">조회</button>
			</div>
		</form>
	</div>

	<div class="list">
		<div class="listhead">
			<button type="button" id="addinven" style="font-size: 15px;">재고
				등록</button>
		</div>
		<table class="itemlist">
			<thead>
				<tr>
					<th>LOT NO</th>
					<th>품명</th>
					<th>제품유형</th>
					<th>품번</th>
					<th style="width: 8%;">재고 수량</th>
					<th>규격</th>
					<th>단위</th>
					<th>입고일</th>
					<th>유효기간</th>
					<th colspan="2">관리</th>
					<!-- <th>제품 유형</th> -->
				</tr>
			</thead>
			<tbody id="inventoryTableBody">
				<c:forEach var="dto" items="${resultList}">

					<tr>
						<td id="lotNo">${ dto.maLotNo }</td>
						<td id="materialname">${ dto.materialname }</td>
						<td id="dbgud">원자재</td>

						<td id="maPartNum">${ dto.maPartNum }</td>
						<td id="maQuantity">${ dto.maQuantity }</td>
						<td id="maSpec">${ dto.maSpec }</td>
						<td id="maUnit">${ dto.maUnit }</td>
						<td id="receiptDate">${ dto.receiptDate }</td>
						<td id="maExpDate">${ dto.maExpDate }</td>
						<td colspan="2">
							<form method="post" action="Inventorycheck" id="updateForm1">
								<button class="modify" style="width: 55px; height: 35px;">수정</button>
								<input type="hidden" name="command" value="delete"> <input
									type="submit" name="delete" value="삭제" id="del"
									style="width: 55px; height: 35px;">
							</form>
						</td>
						<td style="display: none;"><input type="hidden"
							name="inventoryId" value="${ dto.inventoryId }" id="inventoryId"></td>
					</tr>
				</c:forEach>
				<c:forEach var="dto" items="${resultList2}">
					<tr>
						<td id="prLotNo">${ dto.prLotNo }</td>
						<td id="productname">${ dto.productname }</td>
						<td id="dbgud">완제품</td>
						<td id="prPartNum">${ dto.prPartNum }</td>
						<td id="prQuantity">${ dto.prQuantity }</td>
						<td id="prSpec">${ dto.prSpec }</td>
						<td id="prUnit">${ dto.prUnit }</td>
						<td id="makeDate">${ dto.makeDate }</td>
						<td id="prExpDate">${ dto.prExpDate }</td>
						<td colspan="2">
							<form method="post" action="Inventorycheck" id="updateForm2">
								<button class="modify" style="width: 55px; height: 35px;">수정</button>
								<input type="hidden" name="command" value="delete"> <input
									type="submit" name="delete" value="삭제" id="del"
									style="width: 55px; height: 35px;">
							</form>
						</td>
						<td style="display: none;"><input type="hidden"
							name="productinvenid" value="${ dto.productinvenId }"
							id="productinvenid"></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>



	<div id="popup" class="popup">
		<div class="popup-content">
			<span class="close" onclick="closePopup()">&times;</span>
			<h1>재고 등록</h1>
			<form method="post" action="Inventorycheck" id="inputForm">
				<table class="addtable">
					<thead>
						<tr>
							<th>항목</th>
							<th>내용</th>
						</tr>
					</thead>
					<tbody>
						<!-- <tr>
							<td>등록 날짜</td>
							<td><input type="date" id="addlotno"
								placeholder="LOT NO를 입력하세요." class="popInput" name="date"></td>
						</tr> -->
						<tr>
							<td>품명</td>
							<td><input type="text" id="additem" placeholder="품명을 입력하세요."
								class="popInput" list="suggestions" name="name"> <datalist
									id="suggestions">
									<c:forEach var="dto" items="${resultList}">
										<option value="${ dto.materialname }"></option>
									</c:forEach>
									<c:forEach var="dto" items="${resultList2}">
										<option value="${ dto.productname }"></option>
									</c:forEach>
								</datalist></td>
						</tr>
						<!-- <tr>
							<td>품번</td>
							<td><input type="text" id="additemno"
								placeholder="품번을 입력하세요." class="popInput"></td>
						</tr> -->
						<tr>
							<td>입고 수량</td>
							<td><input type="number" id="addquantity" name="ea"
								placeholder="입고 수량을 입력하세요." class="popInput"
								style="width: 90%; text-align: center;"></td>
						</tr>
						<!-- <tr>
							<td>단위</td>
							<td style="display: flex; justify-content: center;">
								<div class="unit-container" style="width: 90%;">
									<input type="number" id="addunit" placeholder="개수를 입력하세요."
										class="unit-input popInput" style="width: 100%;"> <select
										id="unitDropdown" class="unit-dropdown popInput" name="unit">
										<option value="g">g</option>
										<option value="kg">kg</option>
										<option value="ml">ml</option>
										<option value="캔">캔</option>
										<option value="개">개</option>
									</select>
								</div>
							</td>
						</tr> -->
						<tr>
							<td>제품 유형</td>
							<td>
								<div class="unit-container">
									<select id="itemtype" class="itemtype popInput" name="type">
										<option value="완제품">완제품</option>
										<option value="원자재">원자재</option>
									</select>
								</div>
							</td>
						</tr>
						<tr>
							<td>입고일</td>
							<td><input type="date" id="addin_date" name="in_date"
								class="popInput"></td>
						</tr>
						<tr>
							<td>유효기간</td>
							<td><input type="date" id="addexp_date" name="exp_date"
								class="popInput"></td>
						</tr>
					</tbody>
				</table>
				<div class="addbtn">
					<input type="submit" value="등록"
						style="font-size: 20px; background: #ccc; padding: 10px; margin: 10px; width: 100px; border: 1px solid #15579e;">
				</div>
			</form>
		</div>
	</div>

	<script>
			// 팝업 열기 (재고 등록)
			document.getElementById('addinven').onclick = function() {
	
				editingIndex = null; // 수정 모드 초기화
	
				document.getElementById('popup').style.display = 'block';
			};

		    document.querySelector('#popup').addEventListener('click', (e)=>{
			    console.log(e.target.classList.contains("popup"))
			    if(e.target.classList.contains("popup")){
					document.getElementById('popup').style.display = 'none';
			    }
			})
			
			// 팝업 닫기
			function closePopup() {
				document.getElementById('popup').style.display = 'none';
			}
		    
		    
		    const modify = document.querySelectorAll('.modify');
		    console.log(modify.length);
		    for(let i = 0 ; i < modify.length ; i++){
		    	modify[i].addEventListener('click', (e)=>{
		    		e.preventDefault()
		    		// console.log(e.target.parentNode.parentNode.parentNode);
		    		const trModify = e.target.closest("tr");
		    		const dbgud = trModify.querySelector('#dbgud').innerText
		    		console.log(trModify, dbgud)
		    		
		    		const form = document.createElement("form");
		            form.method = "POST";
		            form.action = "Inventorycheck";
		            // `<input>` 요소를 생성하여 `command=modify1` 값을 숨겨서 전달
		            const input1 = document.createElement("input");
		            input1.type = "hidden";
		            input1.name = "command";
		            const input2 = document.createElement("input");
		            input2.type = "hidden";
		            const input3 = document.createElement("input");
		            input3.type = "hidden";
		            const input4 = document.createElement("input");
		            input4.type = "hidden";
		    		if( dbgud == "원자재"){
		    			
		    			// 원자재
		    			const lotNo = trModify.querySelector('#lotNo').innerText
			    		const materialname = trModify.querySelector('#materialname').innerText
			    		const maPartNum = trModify.querySelector('#maPartNum').innerText
			    		const maQuantity = trModify.querySelector('#maQuantity').innerText
			    		const maSpec = trModify.querySelector('#maSpec').innerText
			    		const maUnit = trModify.querySelector('#maUnit').innerText
			    		const receiptDate = trModify.querySelector('#receiptDate').innerText
			    		const maExpDate = trModify.querySelector('#maExpDate').innerText
			    		const inventoryId = trModify.querySelector('#inventoryId').value
		    			trModify.innerHTML =`
									<td id="lotNo">\${lotNo}</td>
									<td id="materialname">\${materialname}</td>
									<td>\${dbgud}</td>
									<td id="maPartNum">\${maPartNum}</td>
									<td id="maQuantity"><input type="number" name="maQuantity" value="\${maQuantity}" style="text-align: center; font-size: 12px;" id="maQuantity1"></td>
									<td id="maSpec">\${maSpec}</td>
									<td id="maUnit">\${maUnit}</td>
									<td id="receiptDate"><input type="date" name="receiptDate" value="\${receiptDate}" style="font-size: 12px;" id="receiptDate1"></td>
									<td id="maExpDate">\${maExpDate}</td>
									<td colspan="2">
											<input type="hidden" name="command" value="modify1">
											<input type="submit" name="modify" value="완료" id="yes"
												style="width: 55px; height: 35px;">
											<button class="cancel" style="width: 55px; height: 35px;">취소</button>
									</td>
									<td style="display: none;"><input type="hidden" name="inventoryId" value="\${inventoryId}" id="inventoryId"></td>
							`
						
		    		} else {
		    			
		    			// 완제품
		    			const prLotNo = trModify.querySelector('#prLotNo').innerText
			    		const productname = trModify.querySelector('#productname').innerText
			    		const prPartNum = trModify.querySelector('#prPartNum').innerText
			    		const prQuantity = trModify.querySelector('#prQuantity').innerText
			    		const prSpec = trModify.querySelector('#prSpec').innerText
			    		const prUnit = trModify.querySelector('#prUnit').innerText
			    		const makeDate = trModify.querySelector('#makeDate').innerText
			    		const prExpDate  = trModify.querySelector('#prExpDate ').innerText
			    		const productinvenid  = trModify.querySelector('#productinvenid ').value
			    		
		    			trModify.innerHTML =`
									<td id="prLotNo">\${prLotNo}</td>
									<td id="productname">\${productname}</td>
									<td>\${dbgud}</td>
									<td id="prPartNum">\${prPartNum}</td>
									<td id="prQuantity"><input type="number" name="prQuantity" value="\${prQuantity}" style="text-align: center; font-size: 12px;" id="prQuantity1"></td>
									<td id="prSpec">\${prSpec}</td>
									<td id="prUnit">\${prUnit}</td>
									<td id="makeDate"><input type="date" name="makeDate" value="\${makeDate}" style="font-size: 12px;" id="makeDate1"</td>
									<td id="prExpDate">\${prExpDate}</td>
									<td colspan="2">
											<input type="hidden" name="command" value="modify2">
											<input type="submit" name="modify" value="완료" id="yes"
												style="width: 55px; height: 35px;">
											<button class="cancel" style="width: 55px; height: 35px;">취소</button>
									</td>
									<td style="display: none;"><input type="hidden" name="productinvenid" value="\${productinvenid}" id="productinvenid"></td>
							`
						
		    		}
		    		
					document.querySelector('#yes').addEventListener('click', (e)=>{
						
						if( dbgud == "원자재"){
							input1.value = "modify1"; // 수정 명령어 값
			    			// 5. `<input>` 요소를 생성하여 `inventoryId` 값을 숨겨서 전달
				            input2.name = "inventoryId";
				            input3.name = "maQuantity";
				            input4.name = "receiptDate";
				            input2.value = trModify.querySelector('#inventoryId').value;
				            input3.value = trModify.querySelector('#maQuantity1').value
				            input4.value = trModify.querySelector('#receiptDate1').value
						} else{
							input1.value = "modify2"; // 수정 명령어 값
			    			// 5. `<input>` 요소를 생성하여 `inventoryId` 값을 숨겨서 전달
				            input2.name = "productinvenid";
				            input3.name = "prQuantity";
				            input4.name = "makeDate";
				            input2.value = trModify.querySelector('#productinvenid').value;
				            input3.value = trModify.querySelector('#prQuantity1').value
				            input4.value = trModify.querySelector('#makeDate1').value
						}
						// 6. 생성한 `<input>` 요소들을 `<form>`에 추가
			            form.appendChild(input1);
			            form.appendChild(input2);
			            form.appendChild(input3);
			            form.appendChild(input4);
			            // 7. `<form>`을 현재 문서의 `<body>`에 추가 (보이지 않지만 존재해야 함)
			            document.body.appendChild(form);
			            // 8. 폼을 자동으로 제출 (서버에 데이터 전송)
			            form.submit();
						alert("수정되었습니다.")
					})
					
					
					document.querySelector('.cancel').addEventListener('click', (e)=>{
						if( dbgud == "원자재"){
							trModify.innerHTML =`
											<td id="lotNo">\${lotNo}</td>
											<td id="materialname">\${materialname}</td>
											<td id="dbgud">\${dbgud}</td>
											<td id="maPartNum">\${maPartNum}</td>
											<td id="maQuantity">\${maQuantity}</td>
											<td id="maSpec">\${maSpec}</td>
											<td id="maUnit">\${maUnit}</td>
											<td id="receiptDate">\${receiptDate}</td>
											<td id="maExpDate">\${maExpDate}</td>
											<td colspan="2">
												<form method="post" action="Inventorycheck" id="updateForm1">
													<button class="modify" style="width: 55px; height: 35px;">수정</button>
													<input type="hidden" name="command" value="delete">
													<input type="submit" name="delete" value="삭제" id="del" style="width: 55px; height: 35px;">
												</form>
											</td>
											<td style="display: none;"><input type="hidden" name="inventoryId" value="31" id="inventoryId"></td>
											`
						} else {
							trModify.innerHTML =`
											<td id="prLotNo">\\${prLotNo}</td>
											<td id="productname">\${productname}</td>
											<td id="dbgud">\${dbgud}</td>
											<td id="prPartNum">\${prPartNum}</td>
											<td id="prQuantity">\${prQuantity}</td>
											<td id="prSpec">\${prSpec}</td>
											<td id="prUnit">\${prUnit}</td>
											<td id="makeDate">\${makeDate}</td>
											<td id="prExpDate">\${prExpDate}</td>
											<td colspan="2">
												<form method="post" action="Inventorycheck" id="updateForm2">
													<button class="modify" style="width: 55px; height: 35px;">수정</button>
													<input type="hidden" name="command" value="delete"> <input type="submit" name="delete" value="삭제" id="del" style="width: 55px; height: 35px;">
												</form>
											</td>
											<td style="display: none;"><input type="hidden" name="productinvenid" value="0" id="productinvenid"></td>
											`
						}
						
					})
					
		    	})
		    }
		    
		
		
	</script>
</body>

</html>