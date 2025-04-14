<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ page import="java.util.*"%>
<%@ page import="project.dto.*"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>재고현황조회</title>
<link rel="stylesheet" href="resources\css\Inventorycheck.css">
<script src="resources/js/Inventory.js"></script>
</head>

<body>
	<div class="box">
		<h1>재고 현황 조회</h1>
	</div>
	<div class="box">
		<form class="container" style="font-size: 15px;" method="post"
			action="invenSearch" id="selectForm">
			<label for="inventoryType">제품 유형 :<select id="inventoryType"
				name="searchType">
					<option value="">선택</option>
					<option value="원자재">원자재</option>
					<option value="완제품">완제품</option>
					<option value="용기">용기</option>
			</select>
			</label> <label for="warehouse">검색 방식 :<select id="warehouse"
				name="searchWay">
					<option value="">선택</option>
					<option value="품명">품명</option>
					<option value="품번">품번</option>
					<option value="LotNo">Lot No</option>
					<option value="입고일">입고일</option>
					<option value="유효기간">유효기간</option>
			</select>
			</label>
			<div class="item">
				<label for="search" class="search">검색 : </label> <input type="text"
					id="search" name="search" placeholder="검색어를 입력하세요.">
					<div class="go hide">
						<div class="searchDateBox" id="searchDateBox">
							<input type="date" name="receiptDate" id="receiptDate" disabled style="font-size: 16px;">  ~  <input type="date" id="expDate" name="expDate" disabled style="font-size: 16px;">
						</div>
					</div>
			</div>
			<div class="item">
				<button type="submit" class="check">조회</button>
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
				</tr>
			</thead>
			<tbody id="inventoryTableBody">
				<c:forEach var="dto" items="${list}">
					<tr>
						<td id="lotNo">${ dto.lotnumber }</td>
						<td id="materialname">${ dto.productname }</td>

						<td id="dbgud">
							<c:choose>
								<c:when test="${fn:substring(dto.lotnumber, 0, 3)== 'ING' }">
									원자재
								</c:when>
								<c:when test="${fn:substring(dto.lotnumber, 0, 3)== 'WPD' }">
									완제품
								</c:when>
								<c:when test="${fn:substring(dto.lotnumber, 0, 3)== 'PKG' }">
									용기
								</c:when>
								<c:otherwise>
									기타
								</c:otherwise>
							</c:choose>
						</td>

						<td id="maPartNum">${ dto.partnumber }</td>
						<td id="maQuantity">${ dto.quantity }</td>
						<td id="maSpec">${ dto.spec }</td>
						<td id="maUnit">${ dto.unit }</td>
						<td id="receiptDate">${ dto.makeDate }</td>
						<td id="maExpDate">${ dto.expDate }</td>
						<td>
							<form method="post" action="invenDelete" id="updateForm1"
								class="delFrom">
								<button class="modify" style="width: 55px; height: 35px;">수정</button>
								<input
									type="submit" name="delete" value="삭제" id="del" class="del"
									style="width: 55px; height: 35px;">
								<input
									type="hidden" name="productinvenid" value="${ dto.productinvenid }"
									>
								<input
									type="hidden" name="lotnumber" value="${ dto.lotnumber }"
									>
							</form>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>


<!-- 		페이지네이션 -->
		<div id="page-container">
			<%
			int total = (Integer)request.getAttribute("totalCount");
			InvenCheck_DTO dto = (InvenCheck_DTO)request.getAttribute("dto");
			int pageNo = dto.getPage();
			int viewCount = dto.getViewCount();
			System.out.println("dddddddddddddd"+viewCount);
			// 1401 / 10 = 140.1 올림해서 141
			int lastPage = (int) Math.ceil((double) total / viewCount);

			int groupCount = 5; // 한번에 보여줄 페이지 개수
			int groupPosition = (int) Math.ceil((double) pageNo / groupCount);
			int begin = ((groupPosition - 1) * groupCount) + 1;
			//             int end = begin + groupCount - 1;
			int end = groupPosition * groupCount;
			if (end > lastPage){
				end = lastPage;
			}
			%>
			<c:if test="<%=begin == 1%>">
                  [이전]
               </c:if>
			<c:if test="<%=begin != 1%>">
				<a href="inven?page=<%=begin - 1%>">[이전]</a>
			</c:if>
			<c:forEach var="i" begin="<%=begin%>" end="<%=end%>">
				<c:if test="${i == dto.page }">
					<c:set var="clazz" value="bold" />
				</c:if>
				<c:if test="${ not (i == dto.page) }">
					<c:set var="clazz" value="" />
				</c:if>
				<a href="inven?page=${ i }" class="${clazz }">${ i }</a>
			</c:forEach>

			<c:if test="<%=end == lastPage%>">
                  [다음]
               </c:if>
			<c:if test="<%=end != lastPage%>">
				<a href="inven?page=<%=end + 1%>">[다음]</a>
			</c:if>
		</div>
	</div>



	<div id="popup" class="popup">
		<div class="popup-content">
			<span class="close" onclick="closePopup()">&times;</span>
			<h1>재고 등록</h1>
			<form method="post" action="Inventorycheck" id="inputForm">
				<input type="hidden" name="command" value="inputForm">
				<table class="addtable">
					<thead>
						<tr>
							<th>항목</th>
							<th>내용</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>품명</td>
							<td>
								<input type="text" id="additem" placeholder="품명을 입력하세요."
									class="popInput" list="suggestions" name="name">
								<input
									type="hidden" id="hiddenInventoryId" name="inventoryId">
								<input type="hidden" id="hiddenProductInvenId"
								name="productinvenid">
								<datalist id="suggestions">
									<c:forEach var="dto" items="${matDB}">
										<option value="${dto.materialname}"
											data-id="${dto.materialId}" data-type="원자재"></option>
									</c:forEach>
									<c:forEach var="dto" items="${prodDB}">
										<option value="${dto.productname}" data-id="${dto.productId}"
											data-type="완제품"></option>
									</c:forEach>
								</datalist>
							</td>
						</tr>
						<tr>
							<td>입고 수량</td>
							<td>
								<input type="number" id="addquantity" name="ea"
									placeholder="입고 수량을 입력하세요." class="popInput"
									style="width: 90%; text-align: center;">
							</td>
						</tr>
						<tr>
							<td>제품 유형</td>
							<td>
								<div class="unit-container">
									<select id="itemtype" class="itemtype popInput" name="type">
										<option value="">선택</option>
										<option value="완제품">완제품</option>
										<option value="원자재">원자재</option>
									</select>
								</div>
							</td>
						</tr>
						<tr>
							<td>입고일</td>
							<td>
								<input type="date" id="addin_date" name="indate"
									class="popInput">
							</td>
						</tr>
					</tbody>
				</table>
				<div class="addbtn">
					<input type="submit" value="등록" id="insertBtn"
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
			    //console.log(e.target.classList.contains("popup"))
			    if(e.target.classList.contains("popup")){
					document.getElementById('popup').style.display = 'none';
			    }
			})
			
			// 팝업 닫기
			function closePopup() {
				document.getElementById('popup').style.display = 'none';
			}
		    
		    
		    
		    
		    // 수정
		    const modify = document.querySelectorAll('.modify');
		    console.log(modify.length);
		    for(let i = 0 ; i < modify.length ; i++){
		    	modify[i].addEventListener('click', (e)=>{
		    		e.preventDefault()
		    		// console.log(e.target.parentNode.parentNode.parentNode);
		    		const trModify = e.target.closest("tr");
		    		const dbgud = trModify.querySelector('#dbgud').innerText
		    		
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
									<td>
										<input type="submit" value="확인"  class="yes"
											style="width: 55px; height: 35px;">
										<button class="cancel" style="width: 55px; height: 35px;">취소</button>
										<input type="hidden" name="inventoryId" value="\${ inventoryId }"
											id="inventoryId">
									</td>
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
									<td>
										<input type="submit" value="확인"  class="yes"
											style="width: 55px; height: 35px;">
										<button class="cancel" style="width: 55px; height: 35px;">취소</button>
										<input type="hidden" name="productinvenid"
											value="\${ productinvenid }" id="productinvenid">
									</td>
							`
						
		    		}
		    		const yes = document.querySelectorAll('.yes');
		    		yes[i].addEventListener('click', (e)=>{
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

					}) // yes event end


					const cancel = document.querySelectorAll('.cancel');
		    		cancel[i].addEventListener('click', (e)=>{
		    			location.reload();
	    			})


		    	}) // modify addevent end
		    } // for end


		    document.querySelector('#insertBtn').addEventListener('click', (e)=>{
		    	e.preventDefault();
		    	let hiddenInventoryId = document.querySelector('#hiddenInventoryId');
		    	let hiddenProductInvenId = document.querySelector('#hiddenProductInvenId');
		    	let itemtype = document.querySelector('#itemtype').value;
		    	let inputBox = document.querySelector('#additem')
		    	let addquantity = document.querySelector('#addquantity');
		    	let addin_date = document.querySelector('#addin_date');
		    	let datalist = document.querySelector('#suggestions');
		    	let options = datalist.querySelectorAll('option');
		    	
		    	if( inputBox.value == ''){
		    		alert("품명을 입력해주시기 바랍니다.")
		    		return;
		    	} else if( addquantity.value == '' ){
		    		alert("입고수량을 입력해주시기 바랍니다.")
		    		return;
		    	} else if ( addin_date.value == '' ){
		    		alert("입고일을 입력해주시기 바랍니다.")
		    		return;
		    	}

		    	for( let option of options ){
		    		if( option.value === inputBox.value){
		    			let data = option.getAttribute('data-id');
		    			let type = option.getAttribute('data-type');
		    			if( data ){
		    				hiddenInventoryId.value = data;
		                    hiddenProductInvenId.value = data;
			    			if(itemtype != type){
			    				alert("제품유형을 다시 선택해주시기 바랍니다.");
			    				return;
			    			}
		    			}
			    		break;
		    		}
		    	}
		    	document.querySelector('#inputForm').submit();
		    })

		    
		    // 삭제
			const del = document.querySelectorAll('.del');
			const delF = document.querySelectorAll('.delFrom');
			for(let i = 0; i < del.length; i++){
				del[i].addEventListener('click', (e)=>{
					e.preventDefault()
					const tt = confirm("정말로 삭제하시겠습니까?")
					if(tt){
						delF[i].submit();
						alert("삭제되었습니다.");
					}
				})
			}



	</script>
</body>

</html>