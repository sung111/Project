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

								table,
								tr,
								th,
								td {
									/* 중복 테두리 제거 코드 */
									border-collapse: collapse;
									border: 1px solid #007bff;
								}

								table {
									width: 100%;
									border-collapse: collapse;
								}

								th,
								td {
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
									width: 15%;
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

								.button {
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

								.manu-name5 {
									width: 150px;
								}

								.text_hide {
									width: 60%;
								}



								/* 넓이에따른 if문 0~600px까지만 적용  */
								@media screen and (max-width: 767px) {
									.text_hide {
										width: 20px;
										font-size: 7px;
									}
									.text_width{
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
									.btn{
										width: 10px;
										height: 10px;
										font-size: 7px;
										box-sizing: content-box;
									}
									.manu-name5{
										width: 50px;
									}

									
									.button_mo{
										width: 80px;
										box-sizing: border-box;
										font-size: 10px;
										padding: 8px;
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
								

							
							</style>
						</head>

						<body>
							<div id="title">
								<h1>원재료/완제품 조회</h1>
							</div>
							<div id="top-contain">
								<form method="get" action="standard">

									<select name="view_value" id="check_option">
										<option value="1">원재료 조회</option>
										<option value="2">완재품 조회</option>
										<option value="3">전체 조회</option>
									</select> <input type="submit" value="조회" class="button " id="check_view"  >

								</form>



								<c:if test="${Field == 'admin'}">
									
									<input type="button" value="원재료생성" id="materials_hide" name="generation" class="button button_mo">
									<input type="button" value="완제품생성" id="finished_hide" name="generation" class="button button_mo">
									
								</c:if>

							</div>


							<div id="mid-contain" class="none">
								<div class="mid-contain-article" id="materials_id1">
									제품명:<input type="text" class="mid-data" name="materialname" id="m_materialname">
								</div>
								<div class="mid-contain-article" id="materials_id2">
									가격:<input type="text" class="mid-data" name="price" id="m_price">
								</div>
								<div class="mid-contain-article" id="materials_id3">
									규격:<input type="text" class="mid-data" name="spec" id="m_spec">
								</div>
								<div class="mid-contain-article" id="materials_id4">
									단위:<input type="text" class="mid-data" name="unit" id="m_unit">
								</div>
								<br>
								<div class="mid-contain-article" id="materials_id5">
									공급업체:<input type="text" class="mid-data" name="supplier" id="m_supplier">
								</div>
								<div class="mid-contain-article" id="materials_id6">
									품번:<input type="text" class="mid-data" name="partNumber" id="m_partNumber">
								</div>
								<div class="mid-contain-article" id="materials_id7">
									LotNo:<input type="text" class="mid-data" name="lotnumber" id="m_lotnumber">
								</div>
								<div class="mid-contain-article" id="materials_id8">
									창고위치:<input type="text" class="mid-data" name="warehouse" id="m_warehouse">
								</div>

								<div class="mid-contain-article " id="materials_id9">

									<input type="hidden" name="type" value="creat">
									 <input type="button" value="생성" id="materials_c" class="button btn"> 
										<input type="button" value="취소"
										id="matecera_can" class="button btn">
								</div>
							</div>



							<div id="mid-contain2" class="none">
								<div class="mid-contain-article" id="finished_id1">
									완제품명:<input type="text" class="mid-data" name="productname" id="f_productname">
								</div>
								<div class="mid-contain-article" id="finished_id2">
									품번:<input type="text" class="mid-data" name="partnumber" id="f_partnumber">
								</div>
								<div class="mid-contain-article" id="finished_id4">
									보관창고위치:<input type="text" class="mid-data" name="warehouse" id="f_warehouse">
								</div>
								<br>
								<div class="mid-contain-article" id="finished_id5">
									가격:<input type="text" class="mid-data" name="price" id="f_price">
								</div>
								<div class="mid-contain-article" id="finished_id6">
									규격:<input type="text" class="mid-data" name="spec" id="f_spec">
								</div>
								<div class="mid-contain-article" id="finished_id7">
									단위:<input type="text" class="mid-data" name="unit" id="f_unit">
								</div>
								<div class="mid-contain-article" id="finished_id8">
									LotNo:<input type="text" class="mid-data" name="lotnumber" id="f_lotnumber">
								</div>
								<div class="mid-contain-article " id="finished_id9">

									<input type="hidden" value="finished_creat" name="type"> 
									<input type="button" value="생성" id="finished_c"  class="button btn"> 
										<input type="button" value="취소" id="produc_can"
										class="button btn">
								</div>

							</div>




							<div id="main_contain" class="none">
								<!-- 원재료 테이블 / 전체테이블-->
								<table id="start_table">
									<tr>
										<th class="manu-name poom">제품명</th>
										<th>가격</th>
										<th>규격</th>
										<th>단위</th>
										<th class="manu-name5">공급업체</th>
										<th>품번</th>
										<th class="lotno">LotNo</th>
										<th>창고위치</th>
										<c:if test="${Field == 'admin'}">
											<th class="ud">수정/삭제</th>
										</c:if>
									</tr>

									<c:if test="${not empty map.list1}">
										<c:forEach var="dto" items="${map.list1}">

											<tr class="table_tr">

												<td><span class="text_view">${dto.materialname}</span> <input
														type="text" value="${dto.materialname}" class="text_hide none"
														id="materialname2">
													<input type="hidden" value="${dto.materialname}" name="origin">
												</td>
												<td><span class="text_view">${dto.price}</span> <input type="text"
														value="${dto.price}" class="text_hide none" id="price2"></td>

												<td><span class="text_view">${dto.spec}</span> <input type="text"
														value="${dto.spec}" class="text_hide none" id="spec2"></td>
												<td><span class="text_view">${dto.unit}</span><input type="text"
														value="${dto.unit}" class="text_hide none" id="unit2"></td>

												<c:if test="${not empty dto.supplier}">
												<td><span class="text_view text_view_hide">${dto.supplier}</span><input
														type="text" value="${dto.supplier}"
														class="text_hide text_hide_hide none" id="supplier2"></td>
												</c:if>
												<c:if test="${empty dto.supplier}">
												<td>
													<input type="hidden" id="supplier2" value="-">
												</td>
												</c:if>

												<td><span class="text_view">${dto.partNumber}</span>
													<input type="text" value="${dto.partNumber}" class="text_hide none"
														id="partNumber2">
												</td>
												<td><span class="text_view">${dto.lotnumber}</span><input type="text"
														value="${dto.lotnumber}" class="text_hide text_width none"
														id="lotnumber2">
												</td>
												<td><span class="text_view">${dto.warehouse}</span><input type="text"
														value="${dto.warehouse}" class="text_hide none" id="warehouse2"></td>

												<c:if test="${Field == 'admin'}">
													<td>
														<div class="edit_delete_box">
															<div class="edit_delete_box">
																<input type="hidden" value="${dto.materialid}" id="materialid">
																<input type="hidden" value="${dto.type}" id="matetype">
																<input type="button" value="수정" class="update user_none btn button">
																<input type="button" value="확인" class="ok none btn button"> 
																<input type="button" value="취소" class="cancel none btn button">
															</div>
															<input type="hidden" value="del" name="type"> <input
															type="hidden" value="${dto.materialid}" name="materialidValue"> 
															<input type="hidden" value="typeValue" name="type"> 
																<input type="hidden" value="${dto.type}" name="matetype">
																<input type="button" value="삭제" class="delet user_none btn button">
														

														

														</div>

													</td>
												</c:if>

											</tr>

										</c:forEach>
									</c:if>
									<c:if test="${empty map.list1}">
										<tr>
											<td colspan=9>원재료/완재품 조회 내용이 없습니다</td>
										</tr>
									</c:if>
								</table>
							</div>

							<div id="finish_contain" class="none">
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
										<c:if test="${Field == 'admin'}">
											<th class="ud">수정/삭제</th>
										</c:if>

									</tr>
									<c:if test="${not empty map.list2}">
										<c:forEach var="dto" items="${map.list2}">
											<tr class="table_tr">

												<td><span class="text_view">${dto.productname}</span>
													 <input type="text" value="${dto.productname}" class="text_hide" id="productname">
													
												</td>

												<td><span class="text_view">${dto.partnumber}</span> <input type="text"
														value="${dto.partnumber}" class="text_hide" id="partnumber">
												</td>

												<td><span class="text_view">${dto.warehouse}</span> <input type="text"
														value="${dto.warehouse}" class="text_hide" id="warehouse">
												</td>

												<td><span class="text_view">${dto.price}</span><input type="text"
														value="${dto.price}" class="text_hide" id="price"></td>

												<td><span class="text_view">${dto.spec}</span><input type="text"
														value="${dto.spec}" class="text_hide" id="spec"></td>

												<td><span class="text_view">${dto.unit}</span><input type="text"
														value="${dto.unit}" class="text_hide" id="unit"></td>

												<td><span class="text_view">${dto.lotnumber}</span><input type="text"
														value="${dto.lotnumber}" class="text_hide text_width"
														id="lotnumber">
												</td>

												<c:if test="${Field == 'admin'}">
													<td>
														<div class="edit_delete_box">
															<div class="edit_delete_box">
																<input type="button" value="수정"
																	class="user_none product_up btn button">
																<input type="hidden" name="type" value="finish_update button">
																<input type="button" value="확인" class="product_ok btn button">
																<input type="button" value="취소" class="product_can btn button">
															</div>

															<input type="hidden" value="finish_del" name="type">
															 <input type="hidden" value="${dto.productid}" id="productid">
															<input type="button" value="삭제" class="product_del user_none btn button">


														</div>
													</td>
												</c:if>

											</tr>

										</c:forEach>
									</c:if>
									<c:if test="${empty map.list2}">
										<tr>
											<td colspan=8>완제품조회 내용이 없습니다</td>
										</tr>
									</c:if>
								</table>
							</div>



							</div>

							<div id="page-container">
								<% int pageNo=1; int viewCount=10; // model에 담은건 request에서 꺼낼 수 있다  
									Map map=(Map)request.getAttribute("map");
									if((Materials_DTO)request.getAttribute("mDTO")==null) 
									{ Products_DTO dto=(Products_DTO)request.getAttribute("products_DTO"); pageNo=dto.getPage();
									viewCount=dto.getViewCount(); System.out.println(">>>>>>>>> map :"+map +" : "+ "dto:"+dto);
									}else if((Products_DTO)request.getAttribute("pDTO") == null){
									Materials_DTO dto = (Materials_DTO)request.getAttribute("materials_DTO");
									pageNo = dto.getPage();
									viewCount = dto.getViewCount();
									System.out.println(">>>>>>>>> map :"+map +" : "+ "dto :"+dto);
									}
									int total = (Integer)map.get("count");

									// 1401 / 10 = 140.1 올림해서 141
									int lastPage = (int)Math.ceil((double)total / viewCount);

									int groupCount = 5; // 한번에 보여줄 페이지 개수
									int groupPosition = (int)Math.ceil((double)pageNo / groupCount);
									int begin = ((groupPosition-1) * groupCount) + 1;
									// int end = begin + groupCount - 1;
									int end = groupPosition * groupCount;
									if(end > lastPage) end = lastPage;
									%>
									<c:if test="<%= begin == 1 %>">
										[이전]
									</c:if>
									<c:if test="<%= begin != 1 %>">
										<a href="standard?page=<%= begin-1 %>&view_value=${view_value}">[이전]</a>
									</c:if>

									<c:forEach var="i" begin="<%= begin %>" end="<%= end %>">
										<c:if test="${i == dto.page }">
											<c:set var="clazz" value="bold" />
										</c:if>
										<c:if test="${ not (i == dto.page) }">
											<c:set var="clazz" value="" />
										</c:if>

										<a href="standard?page=${ i }&view_value=${view_value}" class="${clazz }">${ i
											}</a>
									</c:forEach>

									<c:if test="<%= end == lastPage %>">
										[다음]
									</c:if>
									<c:if test="<%= end != lastPage %>">
										<a href="standard?page=<%= end+1 %>&view_value=${view_value}">[다음]</a>
									</c:if>
							</div>
						
							<script >
								

								window
									.addEventListener(
										"load",
										function () {
											



											let = text_hides = document.querySelectorAll(".text_hide")
											for (let i = 0; i < text_hides.length; i++) {
												text_hides[i].classList.add("none")
											}
											// 완제품수정삭제버튼 처음에안보이게하기
											let product_ok = document.querySelectorAll(".product_ok")
											let product_can = document.querySelectorAll(".product_can")
											for(let i = 0; i<product_ok.length; i++){
												product_ok[i].classList.add("none")
												product_can[i].classList.add("none")
											}
											//완제품 수정버튼클릭시보이게 나머지는감추게
											let product_up = document.querySelectorAll(".product_up")
											for(let i = 0; i<product_up.length; i++){
												product_up[i].addEventListener("click",function(e){
													console.log(e.target.parentNode.parentNode.parentNode.parentNode)
													console.log(e.target.parentNode.parentNode)
													let text_views = e.target.parentNode.parentNode.parentNode.parentNode.querySelectorAll(".text_view")
													let text_hides = e.target.parentNode.parentNode.parentNode.parentNode.querySelectorAll(".text_hide")
													for(let ii=0; ii<text_views.length; ii++){
														text_views[ii].classList.add("none")
														text_hides[ii].classList.remove("none")
													}
													e.target.classList.add("none")
													e.target.parentNode.parentNode.querySelector(".product_del").classList.add("none")
													 e.target.parentNode.querySelector(".product_ok").classList.remove("none")
													e.target.parentNode.querySelector(".product_can").classList.remove("none")
															//완제품 수정이벤트
															e.target.parentNode.querySelector(".product_ok").addEventListener("click",function(e){
																	
																	const productname = e.target.parentNode.parentNode.parentNode.parentNode.querySelector("#productname").value
																	const partnumber = e.target.parentNode.parentNode.parentNode.parentNode.querySelector("#partnumber").value
																	const warehouse = e.target.parentNode.parentNode.parentNode.parentNode.querySelector("#warehouse").value
																	const price = e.target.parentNode.parentNode.parentNode.parentNode.querySelector("#price").value
																	const spec = e.target.parentNode.parentNode.parentNode.parentNode.querySelector("#spec").value
																	const unit = e.target.parentNode.parentNode.parentNode.parentNode.querySelector("#unit").value
																	const lotnumber = e.target.parentNode.parentNode.parentNode.parentNode.querySelector("#lotnumber").value
									
																	const productid = e.target.parentNode.parentNode.querySelector("#productid").value
																	console.log(e.target.parentNode.parentNode.parentNode.parentNode.querySelector("#productname").value)
																	console.log(e.target.parentNode.parentNode.parentNode.parentNode.querySelector("#partnumber").value)
																	console.log(e.target.parentNode.parentNode.parentNode.parentNode.querySelector("#warehouse").value)
																	console.log(e.target.parentNode.parentNode.parentNode.parentNode.querySelector("#price").value)
																	console.log(e.target.parentNode.parentNode.parentNode.parentNode.querySelector("#spec").value)
																	console.log(e.target.parentNode.parentNode.parentNode.parentNode.querySelector("#unit").value)
																	console.log(e.target.parentNode.parentNode.parentNode.parentNode.querySelector("#lotnumber").value)
																	console.log(e.target.parentNode.parentNode.querySelector("#productid").value)
																	console.log("--",e.target.parentNode.parentNode.parentNode.parentNode)
																	console.log("--",e.target.parentNode)
																	const material = {
																		productname: productname,
																		partnumber: partnumber,
																		warehouse: warehouse,
																		price: price,
																		spec: spec,
																		unit: unit,
																		lotnumber: lotnumber,
																		productid : productid
																	}

																	if (productname.trim().length == 0 || !isNaN(productname)) {
																		alert('제품명을 다시 입력하세요')
																		e.target.parentNode.parentNode.parentNode.parentNode.querySelector("#productname").focus()

																	} else if (partnumber.trim().length == 0 ) {
																		alert('품번을 다시 입력하세요')
																		e.target.parentNode.parentNode.parentNode.parentNode.querySelector("#partnumber").focus()

																	} else if (warehouse.trim().length == 0 ) {
																		alert('보관창고위치를 다시 입력하세요')
																		e.target.parentNode.parentNode.parentNode.parentNode.querySelector("#warehouse").focus()

																	} else if (price.trim().length == 0 || isNaN(price) || Number(price) < 0)  {
																		alert('가격을 다시 입력하세요')
																		e.target.parentNode.parentNode.parentNode.parentNode.querySelector("#price").focus()

																	} else if (spec.trim().length == 0 || isNaN(spec) || Number(spec) < 0) {
																		alert('규격을 다시 입력하세요')
																		e.target.parentNode.parentNode.parentNode.parentNode.querySelector("#spec").focus()

																	} else if (unit.trim().length == 0) {
																		alert('단위를 다시 입력하세요')
																		e.target.parentNode.parentNode.parentNode.parentNode.querySelector("#unit").focus()

																	} else if (lotnumber.trim().length == 0) {
																		alert('LotNo를 다시 입력하세요')
																		e.target.parentNode.parentNode.parentNode.parentNode.querySelector("#lotnumber").focus()

																	} else {

																		// ajax
																		const xhr = new XMLHttpRequest();
																		xhr.open('put', 'products_update')

																		xhr.setRequestHeader('Content-Type', 'application/json')

																		xhr.send(JSON.stringify(material))

																		xhr.onload = function () {
																			if (xhr.responseText == "1") {
																				console.log(xhr.responseText)
																				alert("수정이되었습니다")
																				location.href = "standard?view_value=${view_value}"
																			} else {
																				console.log(xhr.responseText)
																				alert('수정 실패')
																			}
																		}
																	}
																})
															




													e.target.parentNode.querySelector(".product_can").addEventListener("click",function(ev){
														let text_views = ev.target.parentNode.parentNode.parentNode.parentNode.querySelectorAll(".text_view")
														let text_hides = ev.target.parentNode.parentNode.parentNode.parentNode.querySelectorAll(".text_hide")
														for(let ii=0; ii<text_views.length; ii++){
														text_views[ii].classList.remove("none")
														text_hides[ii].classList.add("none")
														ev.target.classList.add("none")
														ev.target.parentNode.parentNode.querySelector(".product_del").classList.remove("none")
														ev.target.parentNode.querySelector(".product_ok").classList.add("none")
														ev.target.parentNode.querySelector(".product_up").classList.remove("none")
														
													}
													})
												})
												
											}

											document.querySelector("#finish_table").classList
												.add("none")

											let vv = '${view_value}'

											if (vv == 1 || vv == '') {
												document.querySelector("#check_option").value = 1;
												document.querySelector("#start_table").classList
													.remove("none");
												document.querySelector("#finish_table").classList
													.add("none");
												document.querySelector("#main_contain").classList
													.remove("none")
												document.querySelector("#finish_contain").classList
													.add("none")
												let totals = document
													.querySelectorAll(".total");
												for (let i = 0; i < totals.length; i++) {
													totals[i].classList.add("none");
												}

											} else if (vv == 2) {
												document.querySelector("#check_option").value = 2;
												document.querySelector("#start_table").classList
													.add("none");
												document.querySelector("#finish_table").classList
													.remove("none");
												document.querySelector("#main_contain").classList
													.add("none")
												document.querySelector("#finish_contain").classList
													.remove("none")
											} else if (vv == 3) {
												document.querySelector("#check_option").value = 3;
												document.querySelector("#main_contain").classList
													.remove("none")
												document.querySelector("#finish_contain").classList
													.add("none")
												document.querySelector("#start_table").classList
													.remove("none");
												document.querySelector("#finish_table").classList
													.add("none");
										
											}

											//처음 항목 출력 
											document.querySelector("#finished_c").classList
												.remove("none")
											document.querySelector("#mid-contain").classList
												.add("none")
											document.querySelector("#mid-contain2").classList
												.add("none")
											//원재료 생성 클릭 이벤트
											document.querySelector("#materials_hide").addEventListener("click", function (ev) {
												document
													.querySelector("#mid-contain").classList
													.remove("none")
												document
													.querySelector("#mid-contain2").classList
													.add("none")
												console.log("ev.target.parentNode", ev.target.parentNode.parentNode)
												ev.target.parentNode.parentNode.querySelector("#matecera_can").addEventListener("click", function (e) {
													e.target.parentNode.parentNode.classList.add("none")

												})
												ev.target.parentNode.parentNode.querySelector("#materials_c").addEventListener("click", function (e) {
													const m_materialname = document.querySelector("#m_materialname").value
													const m_price = document.querySelector("#m_price").value
													const m_spec = document.querySelector("#m_spec").value
													const m_unit = document.querySelector("#m_unit").value
													const m_supplier = document.querySelector("#m_supplier").value
													const m_partNumber = document.querySelector("#m_partNumber").value
													const m_lotnumber = document.querySelector("#m_lotnumber").value
													const m_warehouse = document.querySelector("#m_warehouse").value
													const material = {
														materialname: m_materialname,
														price: m_price,
														spec: m_spec,
														unit: m_unit,
														supplier: m_supplier,
														partNumber: m_partNumber,
														lotnumber: m_lotnumber,
														warehouse: m_warehouse
													}

													if (m_materialname.trim().length == 0 || !isNaN(m_materialname)) {
														alert('제품명을 다시 입력하세요')
														document.querySelector("#m_materialname").focus()

													} else if (m_price.trim().length == 0 || isNaN(m_price) || Number(m_price) < 0) {
														alert('가격을 다시 입력하세요')
														document.querySelector("#m_price").focus()

													} else if (m_spec.trim().length == 0 || isNaN(m_spec) || Number(m_spec) < 0) {
														alert('규격을 다시 입력하세요')
														document.querySelector("#m_spec").focus()

													} else if (m_unit.trim().length == 0) {
														alert('단위를 다시 입력하세요')
														document.querySelector("#m_unit").focus()

													} else if (m_supplier.trim().length == 0) {
														alert('공급업체를 다시 입력하세요')
														document.querySelector("#m_supplier").focus()

													} else if (m_partNumber.trim().length == 0) {
														alert('품번을 다시 입력하세요')
														document.querySelector("#m_partNumber").focus()

													} else if (m_lotnumber.trim().length == 0) {
														alert('LotNo를 다시 입력하세요')
														document.querySelector("#m_lotnumber").focus()

													} else if (m_warehouse.trim().length == 0 || !isNaN(m_warehouse)) {
														alert('창고위치를 다시 입력하세요')
														document.querySelector("#m_warehouse").focus()

													} else {

														// ajax
														const xhr = new XMLHttpRequest();
														xhr.open('post', 'standard_insert')

														xhr.setRequestHeader('Content-Type', 'application/json')

														xhr.send(JSON.stringify(material))

														xhr.onload = function () {
															if (xhr.responseText == "1") {
																console.log(xhr.responseText)
																alert('생성 완료')
																location.href = "standard?view_value=${view_value}"

															} else {
																console.log(xhr.responseText)
																alert('생성 실패')
															}
														}
													}


												})
											})
											//완제품 생성
											document
												.querySelector("#finished_hide")
												.addEventListener(
													"click",
													function (e) {
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
														
														document.querySelector("#finished_c").addEventListener("click", function (e) {
														const f_productname = document.querySelector("#f_productname").value
														const f_partnumber = document.querySelector("#f_partnumber").value
														const f_warehouse = document.querySelector("#f_warehouse").value
														const f_price = document.querySelector("#f_price").value
														const f_spec = document.querySelector("#f_spec").value
														const f_unit = document.querySelector("#f_unit").value
														const f_lotnumber = document.querySelector("#f_lotnumber").value
														
														console.log(f_productname)
														console.log(f_partnumber)
														console.log(f_warehouse)
														console.log(f_price)
														console.log(f_spec)
														console.log(f_unit)
														console.log(f_lotnumber)
											
														const products = {
															productname: f_productname,
															partnumber: f_partnumber,
															warehouse: f_warehouse,
															price: f_price,
															spec: f_spec,
															unit: f_unit,
															lotnumber: f_lotnumber
											
														}
	
														if (f_productname.trim().length == 0 || !isNaN(f_productname)) {
															alert('제품명을 다시 입력하세요')
															document.querySelector("#f_productname").focus()
	
														} else if (f_partnumber.trim().length == 0  ) {
															alert('품번을 다시 입력하세요')
															document.querySelector("#f_partnumber").focus()
	
														} else if (f_warehouse.trim().length == 0 || !isNaN(f_warehouse)) {
															alert('보관창고위치를 다시 입력하세요')
															document.querySelector("#f_warehouse").focus()
	
														} else if (f_price.trim().length == 0 || isNaN(f_price) || Number(f_price) < 0) {
															alert('가격을 다시 입력하세요')
															document.querySelector("#f_price").focus()
	
														} else if (f_spec.trim().length == 0  || isNaN(f_price) || Number(f_price) < 0) {
															alert('규격을 다시 입력하세요')
															document.querySelector("#f_spec").focus()
	
														} else if (f_unit.trim().length == 0 || !isNaN(f_unit)) {
															alert('단위를 다시 입력하세요')
															document.querySelector("#f_unit").focus()
	
														} else if (f_lotnumber.trim().length == 0) {
															alert('LotNo를 다시 입력하세요')
															document.querySelector("#f_lotnumber").focus()
	
														} else {
	
															// ajax
															const xhr = new XMLHttpRequest();
															xhr.open('post', 'products_insert')
	
															xhr.setRequestHeader('Content-Type', 'application/json')
	
															xhr.send(JSON.stringify(products))
	
															xhr.onload = function () {
																if (xhr.responseText == "1") {
																	console.log(xhr.responseText)
																	alert('완제품 생성 완료')
																	location.href = "standard?view_value=${view_value}"
	
																} else {
																	console.log(xhr.responseText)
																	alert('완제품 생성 실패')
																}
															}
														}
													})


													})
											//원재료 삭제이벤트
											let delets = document.querySelectorAll(".delet")
											for(let i =0; i < delets.length; i++){
												delets[i].addEventListener("click",function(e){
													console.log(e.target.parentNode.querySelector("#materialid").value)
													console.log(e.target.parentNode.querySelector("#matetype").value)
													const material = {
														materialid : e.target.parentNode.querySelector("#materialid").value
														,type : e.target.parentNode.querySelector("#matetype").value

													}

													const xhr = new XMLHttpRequest();
																			xhr.open('put', 'standard_delet')

																			xhr.setRequestHeader('Content-Type', 'application/json')

																			xhr.send(JSON.stringify(material))

																			xhr.onload = function () {
																				if (xhr.responseText == "1") {
																					console.log(xhr.responseText)
																					alert("삭제 되었습니다")
																					location.href = "standard?view_value=${view_value}"
																				} else {
																					console.log(xhr.responseText)
																					alert('삭제 실패하였습니다.')
																				}
																			}
													
												})
											}
											//완재품 삭제이벤트
											let product_dels = document.querySelectorAll(".product_del")
											for(let i =0; i < product_dels.length; i++){
												product_dels[i].addEventListener("click",function(e){
													console.log(e.target.parentNode.querySelector("#productid").value)
													const products = {
														productid : e.target.parentNode.querySelector("#productid").value

													}

													const xhr = new XMLHttpRequest();
																			xhr.open('put', 'products_delet')

																			xhr.setRequestHeader('Content-Type', 'application/json')

																			xhr.send(JSON.stringify(products))

																			xhr.onload = function () {
																				if (xhr.responseText == "1") {
																					console.log(xhr.responseText)
																					alert("삭제 되었습니다")
																					location.href = "standard?view_value=${view_value}"
																				} else {
																					console.log(xhr.responseText)
																					alert('삭제 실패하였습니다.')
																				}
																			}
													
												})
											}
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
										
											let updates = document.querySelectorAll(".update")
											for (let i = 0; i < updates.length; i++) {
													//수정이벤트
													updates[i].addEventListener("click",function (e) {
															console
																.log(e.target.parentNode.parentNode.parentNode)
															let update = e.target.parentNode.parentNode.parentNode.parentNode


															let textHides = update
																.querySelectorAll(".text_hide")
															let textViews = update
																.querySelectorAll(".text_view")
															let textVtext_hide_hide = update
																.querySelector(".text_hide_hide")

															let text_view_hide = update
																.querySelector(".text_view_hide")


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

															console.log("여기여기", e.target)
															console.log("여기여기", e.target.parentNode)
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

															console.log("토탈찾기 e.target", e.target.parentNode.parentNode.parentNode)
													
															e.target.parentNode
																.querySelector(
																	".ok")
																.addEventListener(
																	"click",
																	function (e) {

																		const materialname2 = e.target.parentNode.parentNode.parentNode.parentNode.querySelector("#materialname2").value
																		const price2 = e.target.parentNode.parentNode.parentNode.parentNode.querySelector("#price2").value
																		const spec2 = e.target.parentNode.parentNode.parentNode.parentNode.querySelector("#spec2").value
																		const unit2 = e.target.parentNode.parentNode.parentNode.parentNode.querySelector("#unit2").value
																		const supplier2 = e.target.parentNode.parentNode.parentNode.parentNode.querySelector("#supplier2").value
																		const partNumber2 = e.target.parentNode.parentNode.parentNode.parentNode.querySelector("#partNumber2").value
																		const lotnumber2 = e.target.parentNode.parentNode.parentNode.parentNode.querySelector("#lotnumber2").value
																		const warehouse2 = e.target.parentNode.parentNode.parentNode.parentNode.querySelector("#warehouse2").value
																		const materialid = e.target.parentNode.parentNode.querySelector("#materialid").value
																		const matetype = e.target.parentNode.parentNode.querySelector("#matetype").value
																		console.log("여기는 수정 확인버튼 구간임")
																		console.log(e.target.parentNode.parentNode.querySelector("#matetype").value)
																		console.log(e.target.parentNode.parentNode)
																		console.log(e.target.parentNode)
																		const material = {
																			materialname: materialname2,
																			price: price2,
																			spec: spec2,
																			unit: unit2,
																			supplier: supplier2,
																			partNumber: partNumber2,
																			lotnumber: lotnumber2,
																			warehouse: warehouse2,
																			materialid:  materialid,
																			type: matetype

																		}

																		if (materialname2.trim().length == 0 || !isNaN(materialname2)) {
																			alert('제품명을 다시 입력하세요')
																			e.target.parentNode.parentNode.parentNode.parentNode.querySelector("#materialname2").focus()

																		} else if (price2.trim().length == 0 || isNaN(price2) || Number(price2) < 0) {
																			alert('가격을 다시 입력하세요')
																			e.target.parentNode.parentNode.parentNode.parentNode.querySelector("#price2").focus()

																		} else if (spec2.trim().length == 0 || isNaN(spec2) || Number(spec2) < 0) {
																			alert('규격을 다시 입력하세요')
																			e.target.parentNode.parentNode.parentNode.parentNode.querySelector("#spec2").focus()

																		} else if (unit2.trim().length == 0) {
																			alert('단위를 다시 입력하세요')
																			e.target.parentNode.parentNode.parentNode.parentNode.querySelector("#unit2").focus()

																		} else if (supplier2.trim().length == 0) {
																			alert('공급업체를 다시 입력하세요')
																			e.target.parentNode.parentNode.parentNode.parentNode.querySelector("#supplier2").focus()

																		} else if (partNumber2.trim().length == 0) {
																			alert('품번을 다시 입력하세요')
																			e.target.parentNode.parentNode.parentNode.parentNode.querySelector("#partNumber2").focus()

																		} else if (lotnumber2.trim().length == 0) {
																			alert('LotNo를 다시 입력하세요')
																			e.target.parentNode.parentNode.parentNode.parentNode.querySelector("#lotnumber2").focus()

																		} else if (warehouse2.trim().length == 0 || !isNaN(warehouse2)) {
																			alert('창고위치를 다시 입력하세요')
																			e.target.parentNode.parentNode.parentNode.parentNode.querySelector("#warehouse2").focus()

																		} else {

																			// ajax
																			const xhr = new XMLHttpRequest();
																			xhr.open('put', 'standard_update')

																			xhr.setRequestHeader('Content-Type', 'application/json')

																			xhr.send(JSON.stringify(material))

																			xhr.onload = function () {
																				if (xhr.responseText == "1") {
																					console.log(xhr.responseText)
																					alert("수정이되었습니다")
																					location.href = "standard?view_value=${view_value}"
																				} else {
																					console.log(xhr.responseText)
																					alert('수정 실패')
																				}
																			}
																		}
																	})
														
															e.target.parentNode
																.querySelector(
																	".cancel")
																.addEventListener(
																	"click",
																	function (e) {
																		
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
																			console.log("여기가완제품인가요? e.target", e.target.parentNode)

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


												


										})
							</script>
						</body>

						</html>