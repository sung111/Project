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
<title>원재료/완제품조회</title>

<style>
* {
	margin: 0;
	padding: 0;
}

body {
	width: 100%;
}

#top-contain {
	display: flex;
	justify-content: end;
	align-items: center;
}

#mid-contain {
	border: 1px solid #007bff;
	border-radius: 20px;
}

#mid-contain2 {
	border: 1px solid #007bff;
	border-radius: 20px;
}

.mid-contain-article {
	display: inline-block;
	margin: 10px;
}

#check {
	border-radius: 10px;
	width: 50px;
	height: 30px;
}

#main-contain {
	margin-top: 20px;
}

table, tr, th, td {
	/* 중복 테두리 제거 코드 */
	border-collapse: collapse;
	border: 1px solid #007bff;
}

table {
	width: 100%;
	border-collapse: collapse;
}

th, td {
	border: 1px solid #ddd;
	border-collapse: collapse;
	text-align: center;
}

th {
	color: white;
	background-color: #007bff;
}

.manu-name {
	width: 25%;
}

.lotno {
	width: 20%;
}

.ud {
	width: 15%;
}

.button:hover {
	background-color: rgb(149, 149, 155);
}

#check_option {
	border: 1px solid #007bff;
	/* border-radius: 20px; */
	width: 100px;
	height: 30px;
}

.none {
	display: none;
}

#page-container {
	/* border: 1px solid rebeccapurple; */
	margin: 0 auto;
	width: 200px;
	display: flex;
	justify-content: space-between;
}

.page-none {
	display: none;
}

.page1 {
	color: blueviolet;
	font-weight: 900;
	font-size: 20px;
}

.page-number:hover {
	font-weight: 900;
	font-size: 20px;
	color: blueviolet;
}

input[type=button] {
	border-radius: 5px;
	background-color: #007bff;
	color: white;
	padding: 6px 15px;
	border: none;
	cursor: pointer;
	margin: 5px;
}

input[type=submit] {
	border-radius: 5px;
	background-color: #007bff;
	color: white;
	width: 60px;
	height: 30px;
	border: none;
	cursor: pointer;
	margin: 5px;
}

.poom {
	width: 10%;
}

#radios {
	margin-left: 20px;
}

/* 넓이에따른 if문 0~600px까지만 적용  */
@media screen and (max-width: 767px) {
	.text_hide {
		width: 40px;
	}
	#check_option {
		width: 100px;
		height: 20px;
	}
	#check_option_button {
		width: 50px;
		height: 50px;
	}
	.mid-contain-article {
		font-size: 10px;
	}
	#id3 {
		margin-left: 10px;
	}
	#id4 {
		margin-left: 35px;
	}
	#id6 {
		margin-left: 15px;
	}
	#id7 {
		margin-left: 10px;
	}
	#id8 {
		margin-left: 15px;
	}
	table {
		width: 100%;
	}
	th {
		font-size: 11px;
	}
	td {
		font-size: 10px;
	}
}

#title {
	text-align: center;
}

#materials_hide:hover {
	background-color: #d9d9d9;
}

#finished_hide:hover {
	background-color: #d9d9d9;
}

.edit_delete_box {
	display: flex;
	justify-content: center;
}

.margin {
	margin-top: 100px;
}
.text_width {
width: 140px;
}
</style>
</head>

<body>
	<div id="title">
		<h1>원재료/완제품 조회</h1>
	</div>
	<div id="top-contain">
		<form method="get" action="part_code">

			<select name="view_value" id="check_option">
				<option value="1">원재료 조회</option>
				<option value="2">완재품 조회</option>
				<option value="3">전체 조회</option>
			</select> <input type="submit" value="조회" class="button" id="check_view">

		</form>



		<c:if test="${Field == 'ADMIN'}">
			<input type="button" value="원재료생성" id="materials_hide"
				name="generation">
			<input type="button" value="완제품생성" id="finished_hide"
				name="generation">

		</c:if>

	</div>

	<form method="post" action="part_code">
		<div id="mid-contain">
			<div class="mid-contain-article" id="materials_id1">
				제품명:<input type="text" class="mid-data" name="materialname">
			</div>
			<div class="mid-contain-article" id="materials_id2">
				가격:<input type="text" class="mid-data" name="price">
			</div>
			<div class="mid-contain-article" id="materials_id3">
				규격:<input type="text" class="mid-data" name="spec">
			</div>
			<div class="mid-contain-article" id="materials_id4">
				단위:<input type="text" class="mid-data" name="unit">
			</div>
			<br>
			<div class="mid-contain-article" id="materials_id5">
				공급업체:<input type="text" class="mid-data" name="supplier">
			</div>
			<div class="mid-contain-article" id="materials_id6">
				품번:<input type="text" class="mid-data" name="partNumber">
			</div>
			<div class="mid-contain-article" id="materials_id7">
				LotNo:<input type="text" class="mid-data" name="lotnumber">
			</div>
			<div class="mid-contain-article" id="materials_id8">
				창고위치:<input type="text" class="mid-data" name="warehouse">
			</div>

			<div class="mid-contain-article " id="materials_id9">

				<input type="hidden" name="type" value="creat"> <input
					type="submit" value="생성" id="materials_c" class="button"> <input
					type="button" value="취소" id="matecera_can" class="button">
			</div>
		</div>
	</form>

	<form method="post" action="part_code">
		<div id="mid-contain2">
			<div class="mid-contain-article" id="finished_id1">
				완제품명:<input type="text" class="mid-data" name="productname">
			</div>
			<div class="mid-contain-article" id="finished_id2">
				품번:<input type="text" class="mid-data" name="partnumber">
			</div>
			<div class="mid-contain-article" id="finished_id4">
				보관창고위치:<input type="text" class="mid-data" name="warehouse">
			</div>
			<br>
			<div class="mid-contain-article" id="finished_id5">
				가격:<input type="text" class="mid-data" name="price">
			</div>
			<div class="mid-contain-article" id="finished_id6">
				규격:<input type="text" class="mid-data" name="spec">
			</div>
			<div class="mid-contain-article" id="finished_id7">
				단위:<input type="text" class="mid-data" name="unit">
			</div>
			<div class="mid-contain-article" id="finished_id8">
				LotNo:<input type="text" class="mid-data" name="lotnumber">
			</div>
			<div class="mid-contain-article " id="finished_id9">

				<input type="hidden" value="finished_creat" name="type"> <input
					type="submit" value="생성" id="finished_c"> <input
					type="button" value="취소" id="produc_can" class="button">
			</div>

		</div>
	</form>



	<div id="main_contain">
		<!-- 원재료 테이블 -->
		<table id="start_table">
			<tr>
				<th class="manu-name poom">제품명</th>
				<th>가격</th>
				<th>규격</th>
				<th>단위</th>
				<th>공급업체</th>
				<th>품번</th>
				<th class="lotno">LotNo</th>
				<th>창고위치</th>
				<c:if test="${Field == 'ADMIN'}">
					<th class="ud">수정/삭제</th>
				</c:if>
			</tr>


			<c:forEach var="dto" items="${resultList}">

				<tr class="table_tr">
					<form method="post" action="part_code">
						<td><span class="text_view">${dto.materialname}</span> <input
							type="text" value="${dto.materialname}" class="text_hide"
							name="materialname2"> <input type="hidden"
							value="${dto.materialname}" name="origin"></td>
						<td><span class="text_view">${dto.price}</span> <input
							type="text" value="${dto.price}" class="text_hide" name="price2"></td>

						<td><span class="text_view">${dto.spec}</span> <input
							type="text" value="${dto.spec}" class="text_hide" name="spec2"></td>
						<td><span class="text_view">${dto.unit}</span><input
							type="text" value="${dto.unit}" class="text_hide" name="unit2"></td>
						<td><span class="text_view">${dto.supplier}</span><input
							type="text" value="${dto.supplier}" class="text_hide"
							name="supplier2"></td>
						<td><span class="text_view">${dto.partNumber}</span><input
							type="text" value="${dto.partNumber}" class="text_hide"
							name="partNumber2"></td>
						<td><span class="text_view">${dto.lotnumber}</span><input
							type="text" value="${dto.lotnumber}" class="text_hide text_width"
							name="lotnumber2"></td>
						<td><span class="text_view">${dto.warehouse}</span><input
							type="text" value="${dto.warehouse}" class="text_hide"
							name="warehouse2"></td>

						<c:if test="${Field == 'ADMIN'}">
							<td>
								<div class="edit_delete_box">
									<div class="edit_delete_box">
										<input type="hidden" value="${dto.materiaid}" name="materiaid">
										<input type="hidden" value="${dto.type}" name="matetype">
										<input type="button" value="수정" class="update user_none">
										<input type="hidden" name="type" value="update"> <input
											type="submit" value="확인" class="ok"> <input
											type="button" value="취소" class="cancel">
									</div>
					</form>

					<form method="post" action="part_code">
						<input type="text" value="${dto.materialname}" name="delvalue"
							class="delvalue"> <input type="hidden" value="del"
							name="type"> <input type="hidden"
							value="${dto.materiaid}" name="materiaidValue"> <input
							type="hidden" value="typeValue" name="type"> <input
							type="submit" value="삭제" class="delet user_none">
					</form>


					<!--전체조회 삭제 -->
					<form method="post" action="part_code">

						<input type="hidden" value="${dto.materiaid}" name="materiaid">
						<input type="hidden" value="${dto.type}" name="matetype">
						<input type="hidden" value="viewall_del" name="type"> <input
							type="submit" value="삭제" class="total user_none" id="viewall">
					</form>
					</div>

					</td>
					</c:if>

				</tr>

			</c:forEach>

		</table>
	</div>

	<div id="finish_contain">
		<!-- 완제품 테이블 -->
		<table id="finish_table">
			<tr id="finish=tr">
				<th class="manu-name poom">완제품명</th>
				<th>품번</th>
				<th>보관창고 위치</th>
				<th>가격</th>
				<th>규격</th>
				<th>단위</th>
				<th class="lotno">LotNo</th>
				<c:if test="${Field == 'ADMIN'}">
					<th class="ud">수정/삭제</th>
				</c:if>

			</tr>

			<c:forEach var="dto" items="${finishiList}">
				<tr class="table_tr">
					<form method="post" action="part_code">
						<td><span class="text_view">${dto.productname}</span> <input
							type="text" value="${dto.productname}" class="text_hide"
							name="productname"> <input type="hidden"
							value="${dto.productname}" name="origin"></td>

						<td><span class="text_view">${dto.partnumber}</span> <input
							type="text" value="${dto.partnumber}" class="text_hide"
							name="partnumber"></td>

						<td><span class="text_view">${dto.warehouse}</span> <input
							type="text" value="${dto.warehouse}" class="text_hide"
							name="warehouse"></td>

						<td><span class="text_view">${dto.price}</span><input
							type="text" value="${dto.price}" class="text_hide" name="price"></td>

						<td><span class="text_view">${dto.spec}</span><input
							type="text" value="${dto.spec}" class="text_hide" name="spec"></td>

						<td><span class="text_view">${dto.unit}</span><input
							type="text" value="${dto.unit}" class="text_hide" name="unit"></td>

						<td><span class="text_view">${dto.lotnumber}</span><input
							type="text" value="${dto.lotnumber}" class="text_hide text_width"
							name="lotnumber"></td>
							
						<c:if test="${Field == 'ADMIN'}">
							<td >
								<div class="edit_delete_box">
									<div class="edit_delete_box">
											<input type="button" value="수정" class="update user_none product_up">
											<input type="hidden" name="type" value="finish_update">
											<input type="submit" value="확인" class="ok">
											<input type="button" value="취소" class="cancel">
										</div>
					</form>

									<form method="post" action="part_code">
										<input type="text" value="${dto.productname}" name="delvalue"
											class="delvalue"> <input type="hidden" value="finish_del"
											name="type"> <input type="hidden"
											value="${dto.productid}" name="materiaidValue"> <input
											type="submit" value="삭제" class="delet user_none">
									</form>

								</div>
							</td>
					</c:if>

				</tr>

			</c:forEach>

		</table>
	</div>


	</div>
	<script>
		window
				.addEventListener(
						"load",
						function() {
							let = text_hides = document.querySelectorAll(".text_hide")
							for(let i=0; i<text_hides.length; i++){
								text_hides[i].classList.add("none")
							}
						
							
							document.querySelector("#finish_table").classList
									.add("none")

							let vv = '${viewValue}'

							if (vv == 1 || vv == '') {
								document.querySelector("#start_table").classList
										.remove("none");
								document.querySelector("#finish_table").classList
										.add("none");
								let totals = document
										.querySelectorAll(".total");
								for (let i = 0; i < totals.length; i++) {
									totals[i].classList.add("none");
								}

							} else if (vv == 2) {
								document.querySelector("#start_table").classList
										.add("none");
								document.querySelector("#finish_table").classList
										.remove("none");
							} else if (vv == 3) {
								document.querySelector("#start_table").classList
										.remove("none");
								document.querySelector("#finish_table").classList
										.add("none");
								let delets = document
										.querySelectorAll(".delet");
								for (let i = 0; i < delets.length; i++) {
									delets[i].classList.add("none");
								}
							}

							//처음 항목 출력 
							document.querySelector("#finished_c").classList
									.remove("none")
							document.querySelector("#mid-contain").classList
									.add("none")
							document.querySelector("#mid-contain2").classList
									.add("none")
							//  			document.querySelector("#finish_table").classList.add("none")
							document.querySelector("#materials_hide").addEventListener("click",function(ev) {
												document
														.querySelector("#mid-contain").classList
														.remove("none")
												document
														.querySelector("#mid-contain2").classList
														.add("none")
								console.log("ev.target.parentNode",ev.target.parentNode.parentNode)
								    ev.target.parentNode.parentNode.querySelector("#matecera_can").addEventListener("click", function (e) {
               				 e.target.parentNode.parentNode.classList.add("none")
               
           							 })
											})
							document
									.querySelector("#finished_hide")
									.addEventListener(
											"click",
											function(e) {
												document
														.querySelector("#mid-contain").classList
														.add("none")
												document
														.querySelector("#mid-contain2").classList
														.remove("none")
								console.log("e.target.parentNode:", e.target.parentNode)
								
									    e.target.parentNode.parentNode.querySelector("#produc_can").addEventListener("click", function (e) {
               				 e.target.parentNode.parentNode.classList.add("none")
               
           							 })
								
								
											})
							let oks = document.querySelectorAll(".ok")
							let cancels = document.querySelectorAll(".cancel")
							let hides = document.querySelectorAll(".text_hide")
							let delvalues = document
									.querySelectorAll(".delvalue")
							for (let i = 0; i < hides.length; i++) {
								hides[i].classList.add("none")
							}
							for (let i = 0; i < cancels.length; i++) {
								cancels[i].classList.add("none")
							}
							for (let i = 0; i < oks.length; i++) {
								oks[i].classList.add("none")
							}
							for (let i = 0; i < oks.length; i++) {
								delvalues[i].classList.add("none")
							}
							let updates = document.querySelectorAll(".update")
							for (let i = 0; i < updates.length; i++) {
								//수정이벤트
								updates[i]
										.addEventListener(
												"click",
												function(e) {
													console
															.log(e.target.parentNode.parentNode.parentNode)
													let update = e.target.parentNode.parentNode.parentNode.parentNode
													let textHides = update
															.querySelectorAll(".text_hide")
													let textViews = update
															.querySelectorAll(".text_view")

													for (let y = 0; y < textHides.length; y++) {
														textHides[y].classList
																.remove("none")
													}
													for (let y = 0; y < textHides.length; y++) {
														textViews[y].classList
																.add("none")
													}
													console
															.log(
																	"하이드텍스트",
																	e.target.parentNode.parentNode.parentNode)
													//확인버튼 보이기
													e.target.parentNode.parentNode
															.querySelector(".ok").classList
															.remove("none")
															
															console.log("여기여기",e.target)
															console.log("여기여기",e.target.parentNode)
													//취소보튼 보이기
													e.target.parentNode.parentNode
															.querySelector(".cancel").classList
															.remove("none")
															
													//수정 삭제버튼 안보이기
													e.target.parentNode.parentNode.parentNode
															.querySelector(".delet").classList
															.add("none")
															
													e.target.classList
															.add("none")
													console.log("테스트")
													
													//전체 삭제버튼 안보이게하기
// 													let totals = document
// 															.querySelectorAll(".total");
// 													for (let i = 0; i < totals.length; i++) {
// 														totals[i].classList
// 																.add("none");
// 													}
													console.log("토탈찾기 e.target",e.target.parentNode.parentNode.parentNode)
													e.target.parentNode.parentNode.parentNode.querySelector(".total").classList
													.add("none")

													//확인버튼 클릭시 수정알람
													e.target.parentNode
															.querySelector(
																	".ok")
															.addEventListener(
																	"click",
																	function(e) {
																		alert("수정이되었습니다")
																	})
													//취소 누를시 하이드 텍스트 안보이게하기
													// 					console.log("하이드텍스트",e.target.parentNode.parentNode.parentNode)
													// 					console.log("취소버튼",e.target.parentNode)
													e.target.parentNode
															.querySelector(
																	".cancel")
															.addEventListener(
																	"click",
																	function(e) {
																		// 						console.log("하이드텍스트",e.target.parentNode.parentNode.parentNode)
																		for (let y = 0; y < textHides.length; y++) {
																			textHides[y].classList
																					.add("none")
																		}
																		for (let y = 0; y < textHides.length; y++) {
																			textViews[y].classList
																					.remove("none")

																			//확인버튼 보이기
																			e.target.parentNode
																					.querySelector(".ok").classList
																					.add("none")
																			console.log("여기가완제품인가요? e.target",e.target.parentNode)
																		
																			//취소보튼 보이기
																			e.target
																					.classList
																					.add("none")
																			//수정 삭제버튼 안보이기
																			e.target.parentNode
																					.querySelector(".update").classList
																					.remove("none")
																					
																			e.target.parentNode.parentNode
																					.querySelector(".delet").classList
																					.remove("none")
																					
																			e.target.classList
																					.add("none")

																		}

																	})

												})
							}

							// 			 document.querySelector("#check_option").addEventListener("change", function (e) {
							// 			        if (e.target.value == 1) {
							// 			            console.log("e.target.value"+ e.target.value)
							// 			            document.querySelector("#start_table").classList.remove("none")
							// 			            document.querySelector("#finish_table").classList.add("none")

							// 			        }else if (e.target.value == 2) {
							// 			            console.log("e.target.value"+ e.target.value)
							// 			            document.querySelector("#start_table").classList.add("none")
							// 			            document.querySelector("#finish_table").classList.remove("none")

							// 			        }

							// 			 })

						})
	</script>
</body>

</html>