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
									display: inline-block;
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
									text-align: center;
								}

								.quan_text {
									text-align: center;
									width: 50px;
								}

								.none {
									display: none;
								}
								td,
								th {
									border: 1px solid #ddd;
								
									border-collapse: collapse;
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
									#crud_th{
										width: 20%;
									}
									.quan_text{
										width: 10%;
									}
									.font_size{
										font-size: 8px;
									}
									.crud_contaner{
										display: flex;
										justify-content: center;
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
								<c:if test="${Field == 'admin'}">
									<input type="button" value="생성" class="btn " id="input_show">
								</c:if>
							</div>

							<div class="title_insert none">
								<div id="input_parent">
									<div class="input_field_outrine">
										<div>

											<div>
												<span>제품명</span>
												<input type="hidden" value="${pid}" id="pid">

												<select name="materialsid" id="matesel">
													<c:forEach var="dto" items="${mlist}">
														<option value="${dto.materialid}" selected="selected">${dto.materialname}</option>
													</c:forEach>

												</select>

											</div>
										</div>


										<div>
											<div>
												<span>투입수량 입력</span> 
												<input type="text"  id="inputValue" class="textwithd">
											</div>
										</div>


										<div id="field_button">

											<input type="button" value="확인" id="insert" class="btn up">
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
										<th>규격</th>
										<th>단위</th>
										<th>재고수량</th>
										<th>공급업체</th>
										<th>LotNo</th>
										<th>창고위치</th>
										<th>품번</th>
										<c:if test="${Field == 'admin'}">
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
									pidselect();

									document.querySelector("#back-button").addEventListener("click", () => {
										location.href = "bom_v2"
									})

									document.querySelector("#input_show").addEventListener("click", function (e) {
										console.log("sksks")
										console.log(e.target.parentNode.parentNode.parentNode.querySelector(".title_insert"))
										document.querySelector(".title_insert").classList.remove("none")

										//생성>확인 이벤트 아작스보내기
										document.querySelector("#insert").addEventListener("click", (e) => {
											console.log(document.querySelector("#matesel").value)
											console.log(document.querySelector("#inputValue").value)
											console.log(document.querySelector("#pid").value)
											let data = {
												quantity : document.querySelector("#inputValue").value,
												materialid : document.querySelector("#matesel").value,
												productid : document.querySelector("#pid").value
											
											}
												const xhr = new XMLHttpRequest();
												xhr.open('POST','bominsert')

												xhr.setRequestHeader('Content-Type', 'application/json')

												xhr.send(JSON.stringify(data))

												xhr.onload = function () {
													if(xhr.responseText == 1){
														alert("생성완료")
														pidselect();
													}else if(xhr.responseText == 0){
														alert("생성실패")
													}
												}
											// const xhr= new XMLHttpRequest();
											// xhr.open('post')
										})//생성>취소

										//생성>취소이벤트
										document.querySelector("#input_hide").addEventListener("click", (e) => {
											document.querySelector(".title_insert").classList.add("none")

											// const xhr= new XMLHttpRequest();
											// xhr.open('post')
										})//생성>취소 이벤트



									})
									//맨처음 화면 가져오는
									function pidselect() {
										const xhr = new XMLHttpRequest();
									xhr.open('get', 'bomlistSlect?pid='+document.querySelector("#pid").value )

									xhr.setRequestHeader('Content-Type', 'application/json')

									xhr.send()

									xhr.onload = function () {
										let data = (xhr.responseText)
										console.log(xhr.responseText)
										data=JSON.parse(data)
										console.log(data)
										let list = data.list;
										let Field = data.Field;
										document.querySelector("#bodyuphand").innerHTML = ` `
											list.forEach(dto => {
													let newdataHtml = document.createElement("tr")
												
													newdataHtml.innerHTML = `
																<td>\${dto.materialname}</td>
																<td>\${dto.bom_quan}/개</td>
																<td>\${dto.price}</td>
																<td>\${dto.spec}</td>
																<td>\${dto.unit}</td>`

																if(Number.isInteger(dto.inven_quan)){
																	newdataHtml.innerHTML += `
																	
																	<td>\${dto.inven_quan}/개</td>`
																}else if(!Number.isInteger(dto.inven_quan)){
																	newdataHtml.innerHTML += `
																	<td>\${dto.inven_quan}/개</td>`
																}
																newdataHtml.innerHTML += `
																<td>\${dto.supplier}</td>
																<td>\${dto.lotnumber}</td>
																<td>\${dto.warehouse}</td>
																<td>\${dto.partNumber}</td>`
																
																if(Field == 'admin'){
																	newdataHtml.innerHTML += `
																	<td>
																		<div class="crud_contaner">
																			<input type="hidden" value=\${dto.bomid} class="bomid">
																			<input type="button" value="수정" class="update btn font_size">
																			<input type="button" value="삭제" class="delete btn font_size">
																		</div>
																	</td>`
																}
																
																

														
																
																					
																						
																						
																document.querySelector("#bodyuphand").append(newdataHtml)
																
																
																
																//삭제이벤트
																newdataHtml.querySelector(".delete").addEventListener("click",function(e){
																		console.log("삭제할값",e.target.parentNode.querySelector(".bomid").value)
																
																		let dto = {
																			bomid : e.target.parentNode.querySelector(".bomid").value
																		}	

																		const xhr = new XMLHttpRequest();
																		xhr.open('PUT', 'bomDelete' )

																		xhr.setRequestHeader('Content-Type', 'application/json')

																		xhr.send(JSON.stringify(dto))

																		xhr.onload = function () {
																			if(xhr.responseText == 1){
																				alert("삭제성공")
																				pidselect();
																			}else if(xhr.responseText == 0){
																				alert("삭제실패")
																			}
																		}
																
																})

																//수정클릭시 데이터가져온후 확인버튼 이벤트
																newdataHtml.querySelector(".update").addEventListener("click",function(e){
																		console.log("수정값",e.target.parentNode.querySelector(".bomid").value)
																		console.log(e.target.parentNode.parentNode)
																		const xhr = new XMLHttpRequest();
																		xhr.open('get', 'bomlistSlectOne?bomid='+e.target.parentNode.querySelector(".bomid").value )

																		xhr.setRequestHeader('Content-Type', 'application/json')

																		xhr.send()

																		xhr.onload = function () {
																			let data = (xhr.responseText)
																			console.log("값임",xhr.responseText)
																			dto = JSON.parse(data)
																			console.log("값임",dto)
																			console.log("바뀌어야되는tr",e.target.parentNode.parentNode.parentNode)
																		
																				for(let i = 0; i <dto.length ; i++){
																				let newtext = `
																					
																							<td>\${dto[i].materialname}</td>
																							<td><input type="text" class="quan_text" value="\${dto[i].bom_quan}">/개</td>
																							<td>\${dto[i].price}</td>
																							<td>\${dto[i].spec}</td>
																							<td>\${dto[i].unit}</td>`

																							if(Number.isInteger(dto[i].inven_quan)){
																								newtext += `
																								
																								<td>\${dto[i].inven_quan}/개</td>`
																							}else if(!Number.isInteger(dto[i].inven_quan)){
																								newtext += `
																								<td>\${dto[i].inven_quan}/개</td>`
																							}
																							newtext += `
																							<td>\${dto[i].supplier}</td>
																							<td>\${dto[i].lotnumber}</td>
																							<td>\${dto[i].warehouse}</td>
																							<td>\${dto[i].partNumber}</td>`
																							
																							if(Field == 'admin'){
																							newtext += `
																								<td>
																									<div class="crud_contaner">
																										<input type="hidden" value=\${dto[i].bomid} class="bomid">
																										<input type="button" value="확인" class="ok btn font_size">
																										<input type="button" value="취소" class="can btn font_size">
																									</div>
																								</td>`
																							}
																							
																							//수정된값을 넣어주기
																					
																						
																						
																						
																						
																						e.target.parentNode.parentNode.parentNode.innerHTML = newtext
																						newdataHtml.querySelector(".ok").addEventListener("click",function(ee){
																							console.log("확인클릭",ee.target)
																							console.log("bomid",ee.target.parentNode.querySelector(".bomid").value)
																							console.log("수정할값",ee.target.parentNode.parentNode.parentNode.querySelector(".quan_text").value)

																							let data = {
																								quantity : ee.target.parentNode.parentNode.parentNode.querySelector(".quan_text").value,
																								bomid : ee.target.parentNode.querySelector(".bomid").value
																							
																							}
																								const xhr = new XMLHttpRequest();
																								xhr.open('PUT','bomUpdate')

																								xhr.setRequestHeader('Content-Type', 'application/json')

																								xhr.send(JSON.stringify(data))

																								xhr.onload = function () {
																									if(xhr.responseText == 1){
																										alert("수정환료")
																										pidselect();
																									}else if(xhr.responseText == 0){
																										alert("수정실패")
																									}
																								}


																						})
																						newdataHtml.querySelector(".can").addEventListener("click",function(ee){
																							pidselect();
																						})
																						 
																					}			
																				
																					
																					
																				}
																						
																})
											})
										}


									}





								})
							</script>
						</body>

						</html>