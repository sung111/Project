<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
			<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
				<%@ page import="java.util.*" %>
					<%@ page import="project.dto.*" %>
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

									width: 100%;
									height: 50px;
								}

								table,
								th,
								td {
									border-collapse: collapse;
									border: 1px solid black;
								}

								th,
								td {
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

								.title_insert {

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

								.none {
									display: none;
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

									td {
										font-size: 10px;
									}
								}
							</style>
						</head>

						<body>
							<div id="mid-contain">
								<input type="button" class="button btn" value="목록이동" id="back-button">
							</div>

							<div id="boodea">
								<div>
									<h2>${pname}</h2>
								</div>
							</div>
							<div id="creatbutton">
								<c:if test="${Field == 'ADMIN'}">
									<input type="button" value="생성" class="btn " id="input_show">
								</c:if>
							</div>

							<div class="title_insert none">
								<div id="input_parent">
									<div class="input_field_outrine">
										<div>

											<div>
												<span>제품명</span>
												<input type="hidden" value="${pvalue}" name="pvalueid">

												<select name="materialsid" id="matesel">

													<c:forEach var="dto" items="${mlist}">
														<option value="${dto.materialid}">${dto.materialname}</option>
													</c:forEach>

												</select>

											</div>
										</div>


										<div>
											<div>
												<span>투입수량 입력</span> <input type="text" name="input_quantity" id=""
													value="" class="textwithd">
											</div>
										</div>


										<div id="field_button">


											<input type="submit" value="확인" id="insert" class="btn up">
											<input type="button" value="취소" id="input_hide" class="btn up">

										</div>
									</div>

								</div>
							</div>




							<table id="maintable">
								<thead>
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
								</thead>
								<tbody id="bodyuphand">

									


								


								</tbody>
							</table>


							<script>
								window.addEventListener("load", function () {
									//목록이동버튼
									
									document.querySelector("#back-button").addEventListener("click", () => {
										location.href = "bom_v2"
									})

									document.querySelector("#input_show").addEventListener("click", function (e) {
										console.log("sksks")
										console.log(e.target.parentNode.parentNode.parentNode.querySelector(".title_insert"))
										document.querySelector(".title_insert").classList.remove("none")

										//생성>확인 이벤트 아작스보내기
										document.querySelector("#input_hide").addEventListener("click", (e) => {
											document.querySelector(".title_insert").classList.add("none")

											// const xhr= new XMLHttpRequest();
											// xhr.open('post')
										})//생성>확인 이벤트 아작스보내기



									})
									
									function pidselect() {
										const xhr = new XMLHttpRequest();
									xhr.open('get', 'bomlistSlect?pid='+ "${pid}")

									xhr.setRequestHeader('Content-Type', 'application/json')

									xhr.send()

									xhr.onload = function () {
										let data = (xhr.responseText)
										console.log(xhr.responseText)
										data=JSON.parse(data)
										console.log(data)
										let list = data.list;
										document.querySelector("#appendbody").innerHTML = ` `
											list.forEach(dto => {
													let newdataHtml = document.createElement("tr")
												
													newdataHtml.innerHTML = `
																<td>\${dto.materialname}</td>`

																if(dto.bom_quan == dto.bom_quan.intValue()){
																	`<td>
																				<div class="spbom_quan">\${dto.bom_quan}/개</div>
																				`
																				if(Field == 'ADMIN'){
																					`<input type="text" value="\${dto.bom_quan}" name="bom_quan"
																							class="inputbom_quan quan_text quan2">
`
																				}
																				`
																			</td>`
																		}
																			
																			`
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
																					<input type="hidden" name="quan_value" class="quan_value"
																					value="0">
																					<input type="hidden" value="${pvalue}" name="pvalueid"> <input
																					type="hidden" value="${dto.bomid}" name="bomid"> <input
																					type="hidden" value="update" name="type"> <input
																					type="hidden" name="namevalue" value="${namevalue}"> <input
																					type="button" value="확인" class="btn ok"> <input
																					type="button" value="취소" class="btn cansle"> <input
																					type="button" value="수정" class="btn update">
																					</form>
																					<form action="Bom_controller" method="post">
																						<input type="hidden" value="${pvalue}" name="pvalueid"> <input
																						type="hidden" value="${dto.bomid}" name="bomid"> <input
																						type="hidden" name="namevalue" value="${namevalue}"> <input
																						type="hidden" value="delet" name="type">
																						<input type="submit" value="삭제" class="btn delet">
																						</form>
																						
																						</div>
																						</td>
																						</c:if>
																						
																						`
																						document.querySelector("#bodyuphand").append(newdataHtml)
																						
																						
																						
																						
																						newdataHtml.querySelector(".move").addEventListener("click",function(e){
																							
																							let pvalue = e.target.parentNode.querySelector(".productid").value
																							let productname = e.target.innerHTML
																							console.log(pvalue)
																							console.log(pvalue)
																							location.href = "bomlist?pid=" + pvalue + "&pname="+productname;
																							
																						
														})
											})
										}


									}





								})
							</script>
						</body>

						</html>