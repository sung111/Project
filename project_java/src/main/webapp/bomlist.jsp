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
<title>bom리스트</title>
<style>
* {
	margin: 0;
	padding: 0;
}

body {
	width: 100%;
}

#back-button {
	margin: 10px;
}

#mid-contain {
	/* border: 1px solid #007bff;
            border-radius: 20px; */
	width: 100%;
	height: 50px;
}

table, th, td {
	border-collapse: collapse;
	border: 1px solid black;
}

th, td {
	text-align: center;
}

table {
	width: 100%;
}

th {
	height: 20px;
	font-size: 14px;
	background-color: #007bff;
	color: white;
}

.navigation {
	width: 90%;
	height: 60%;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
}

.navigation h2 {
	font-size: 16px;
	margin-left: 10px;
}

.mid-data {
	width: 60%;
	height: 20px;
}

.navigation-line {
	width: 100%;
	height: 33%;
	display: flex;
	justify-content: space-around;
}

.navigation-line-layer {
	width: 25%;
	display: flex;
	justify-content: space-between;
}

.navigation-line-layer h2 {
	display: flex;
	justify-content: center;
	width: 30%;
}

.article {
	margin-top: 10px;
	width: 25%;
	height: 30px;
}

.buttontd {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 50px;
}

.none {
	display: none;
}

.new-text {
	text-align: center;
	width: 80%;
}

#boodea {
	text-align: center;
	width: 100%;
	margin-bottom: 15px;
}

.btn {
	border-radius: 5px;
	background-color: #007bff;
	color: white;
	padding: 5px 10px;
	border: none;
	cursor: pointer;
	height: 35px;
	margin: 5px;
}

.input_field_outrine {
	
	border-radius: 20px;
	width: 50%;
	height: 100px;
	display: flex;
	justify-content: space-around;
	align-items: center;
}

#matesel {
	width: 150px;
	height: 30px;
}

.mleft {
	margin-top: 15px;
}

.textwithd {
	width: 100px;
}

#input_parent {
border: 1px solid #007bff;
	width: 100%;
	border-radius: 20px;
	display: flex;
}

#creatbutton {
	display: flex;
	justify-content: end;
}

#field_button {
	height: 100%;
	width: 100px;
	display: flex;
	justify-content: center;
	align-items: end;
}

.up {
	margin-bottom: 30px;
}

.title_insert_none {
	display: none;
	margin-bottom: 5px;
}

.show {
	display: block;
}

#crud_th {
	width: 140px;
}

.crud_contaner {
	width: 140px;
	display: flex;
	justify-content: center;
	border-width: 0px;
}

.quan_text {
	text-align: center;
	width: 50px;
}

@media screen and (max-width: 767px) {
	#back-button {
		width: 80px;
		height: 60px;
	}
	.article {
		margin: 0 0 20px 0;
		font-size: 12px;
	}
	th {
		font-size: 12px;
	}
	td{
		font-size: 10px;
	}
}
</style>
</head>

<body>
	<div id="mid-contain">
		<input type="button" class="button btn" value="목록이동" id="back-button">
	</div>
	</div>
	<div id="boodea">
		<div>
			<h2>${namevalue}</h2>
		</div>
	</div>
	<div id="creatbutton">
	<c:if test="${Field == 'ADMIN'}">
		<input type="button" value="생성" class="btn " id="input_show">
		</c:if>
	</div>
				
	<form method="post" action="Bom_controller">
		<div class="title_insert_none">
			<div id="input_parent">


				<div class="input_field_outrine">
					<div>

						<div>
							<span>제품명</span> <input type="hidden" value="${pvalue}"
								name="pvalueid"> <select name="materialsid" id="matesel">
								<c:forEach var="dto" items="${mname}">
									<option value="${dto.materiaid}">${dto.materialname}</option>
								</c:forEach>

							</select>
						</div>
					</div>


					<div>
						<div>
							<span>투입수량 입력</span> <input type="text" name="input_quantity"
								id="" value="" class="textwithd">
						</div>
					</div>


					<div id="field_button">
						<input type="hidden" name="type" value="insert"> 
						<input type="hidden" name="namevalue" value="${namevalue}"> 
						<input
							type="submit" value="확인" id="insert" class="btn up"> <input
							type="button" value="취소" id="input_hide" class="btn up">

					</div>
				</div>

			</div>
		</div>
	</form>




	<table id="maintable">

		<tr>
			<th>제품명</th>
			<th>투입수량</th>
			<th>가격</th>
			<th>단위</th>
			<th>재고수량</th>
			<th>규격</th>
			<th>공급업체</th>
			<th>LotNo</th>
			<th>창고위치</th>
			<th>품번</th>
			<c:if test="${Field == 'ADMIN'}">
			<th id="crud_th">수정/삭제</th>
			</c:if>
		</tr>
		
		<c:forEach var="dto" items="${total}">
			<tr>
				<td>${dto.materialname}</td>
				<c:choose>
					<c:when test="${dto.bom_quan == dto.bom_quan.intValue() }">
						<td>
							<div class="spbom_quan">${dto.bom_quan.intValue()}/개</div>
							<c:if test="${Field == 'ADMIN'}">
							 <input
							type="text" value="${dto.bom_quan.intValue()}" name="bom_quan"
							class="inputbom_quan quan_text quan1">
							</c:if>
						</td>
					</c:when>
					<c:otherwise>
						<td>
							<div class="spbom_quan">${dto.bom_quan}/개</div> 
							<c:if test="${Field == 'ADMIN'}">
							<input type="text" value="${dto.bom_quan}" name="bom_quan"class="inputbom_quan quan_text quan2">
								</c:if>
						</td>
					</c:otherwise>
				</c:choose>
				<td>${dto.price}</td>
				<td>${dto.unit}</td>
				<td>${dto.inven_quan}</td>
				<td>${dto.spec}</td>
				<td>${dto.supplier}</td>
				<td>${dto.lotnumber}</td>
				<td>${dto.warehouse}</td>
				<td>${dto.partNumber}</td>
				
				<c:if test="${Field == 'ADMIN'}">
				<td>
				
					<form action="Bom_controller" method="post">
						<div class="crud_contaner">
							<input type="hidden" name="quan_value" class="quan_value" value="0">
							<input type="hidden" value="${pvalue}" name="pvalueid"> <input
								type="hidden" value="${dto.bomid}" name="bomid"> <input
								type="hidden" value="update" name="type"> 
								<input type="hidden" name="namevalue" value="${namevalue}"> 
								<input
								type="button" value="확인" class="btn ok"> <input
								type="button" value="취소" class="btn cansle"> <input
								type="button" value="수정" class="btn update">
					</form>
					<form action="Bom_controller" method="post">
						<input type="hidden" value="${pvalue}" name="pvalueid"> <input
							type="hidden" value="${dto.bomid}" name="bomid">
							<input type="hidden" name="namevalue" value="${namevalue}"> 
							 <input
							type="hidden" value="delet" name="type"> <input
							type="submit" value="삭제" class="btn delet">
					</form>

					</div>
				</td>
				</c:if>
				
			</tr>
				
		</c:forEach>

	</table>


	<script>
		window
				.addEventListener(
						"load",
						function() {
							document.querySelector("#back-button").addEventListener("click",function() {
								window.location.href = "Finished_Product_BOM"
							})

							let oks = document.querySelectorAll(".ok")
							let cansles = document.querySelectorAll(".cansle")
							for (let i = 0; i < oks.length; i++) {
								oks[i].classList.add("none")
								cansles[i].classList.add("none")
							}
							let inputbom_quan = document
									.querySelectorAll(".inputbom_quan")
							for (let i = 0; i < oks.length; i++) {
								inputbom_quan[i].classList.add("none")

							}

							let updates = document.querySelectorAll(".update")
							for (let i = 0; i < updates.length; i++) {
								updates[i]
										.addEventListener(
												"click",
												function(e) {
													console
															.log(e.target.parentNode.parentNode.parentNode.parentNode)
													e.target.parentNode.parentNode.parentNode.parentNode
															.querySelector(".inputbom_quan").classList
															.remove("none")
													e.target.parentNode.parentNode.parentNode.parentNode
															.querySelector(".spbom_quan").classList
															.add("none")
													console
															.log(e.target.parentNode)
													e.target.classList
															.add("none")
													e.target.parentNode
															.querySelector(".delet").classList
															.add("none")
													e.target.parentNode
															.querySelector(".ok").classList
															.remove("none")
													e.target.parentNode
															.querySelector(".cansle").classList
															.remove("none")

													console
															.log(
																	"quan_value",
																	e.target.parentNode.parentNode
																			.querySelector("#quan_value"))
													console
															.log(
																	"inputbom_quan",
																	e.target.parentNode.parentNode.parentNode.parentNode
																			.querySelector(".inputbom_quan"))
													console
															.log(
																	"quan_value",
																	e.target.parentNode.parentNode.parentNode.parentNode
																			.querySelector(".spbom_quan"))

													console.log("여기 확인버튼",e.target.parentNode.querySelector(".ok"))
													
													console.log("여기 수정된데이터",e.target.parentNode.parentNode.parentNode.parentNode.querySelector(".inputbom_quan"))
													console.log("여기 확인버튼에 들어갈데이터",e.target.parentNode.parentNode.querySelector(".quan_value"))
													   
													e.target.parentNode.querySelector(".ok").addEventListener("click",function(ev){
										              let inputbom_quan = e.target.parentNode.parentNode.parentNode.parentNode.querySelector(".inputbom_quan")
										              let quan_value = e.target.parentNode.parentNode.querySelector(".quan_value")
										              quan_value.value = inputbom_quan.value;
										                this.type="submit"
										            })
													
													e.target.parentNode
															.querySelector(
																	".cansle")
															.addEventListener(
																	"click",
																	function(ev) {
																		console
																				.log(ev.target.parentNode)
																		ev.target.parentNode.parentNode.parentNode.parentNode
																				.querySelector(".inputbom_quan").classList
																				.add("none")
																		ev.target.parentNode.parentNode.parentNode.parentNode
																				.querySelector(".spbom_quan").classList
																				.remove("none")
																		ev.target.parentNode.parentNode
																				.querySelector(".delet").classList
																				.remove("none")
																		ev.target.parentNode.parentNode
																				.querySelector(".update").classList
																				.remove("none")
																		ev.target.classList
																				.add("none")
																		ev.target.parentNode
																				.querySelector(".ok").classList
																				.add("none")

																	});
												});
							}

							//         	  document.querySelector("#title_insert_none").classList.add("none")

							document
									.querySelector("#input_show")
									.addEventListener(
											"click",
											function() {
												//                   document.querySelector(".title_insert_none").classList.remove("title_insert_none")
												document
														.querySelector(".title_insert_none").classList
														.add("show")
											});

							document
									.querySelector("#input_hide")
									.addEventListener(
											"click",
											function() {
												document
														.querySelector(".title_insert_none").classList
														.remove("show")
												document
														.querySelector(".title_insert_none").classList
														.add("title_insert_none")
											});

							//             // URL에서 ?value=값 부분 가져오기
							//             let params = new URLSearchParams(window.location.search);
							//             let value = params.get("value"); // 'value' 값 가져오기
							//             // console.log("넘어온 값:", value);

							//             console.log(document.querySelector("#mid-contain-check"))
							//             //뒤로가기버튼
							
									
										

							//아래항목 추가 
						});
	</script>
</body>

</html>