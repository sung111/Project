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
							<title>검사기준</title>
							<style>
								* {
									margin: 0;
									padding: 0;
								}

								body {
									width: 100%;
								}

								.de {
									display: none;
								}

								#contain-grandfatder {
									margin: 20px 0 100px 0;
									border: 1px solid black;
									width: 100%;
								}

								.contain-parents {
									border: 1px solid red;
									display: flex;
									justify-content: space-between;
									align-items: center;
								}

								.contain-child {
									/* height: 500px; */
									text-align: center;
									/* width: 100%; */
									border: 1px solid black;
								}

								.contain-arrow {
									text-align: center;
									width: 100%;
								}

								

								.arrow {
									height: 20px;
									width: 20px;
								}

								.imeg {
									width: 200px;
									height: 200px;
									border-radius: 50px;
								}

								.arrow {
									width: 40px;
									height: 50px;
								}

								li {
									font-size: 20px;
								}

								table {
									width: 100%;
									margin-bottom: 100px;
								}

								table,
								td,
								td {
									border: 1px solid black;
									border-collapse: collapse;
									font-size: 20px;
								}

								th {
									color: white;
									background-color: #007bff;
									border: 1px solid black;
								}

								.none {
									display: none;
								}
								.file{
									margin-top: 20px;
								}

								@media screen and (max-width: 600px) {
									.imeg {
										width: 100px;
										height: 100px;
										border-radius: 10px;
									}

									.contain-child {
										font-size: 13px;
									}

									.arrow {
										height: 20px;
										width: 20px;
									}

									li {
										font-size: 13px;
									}

									table {
										width: 100vw;
									}

									td {
										font-size: 10px;
									}

									.standards-font-charild {
										font-size: 10px;
									}

									.standards-font-contain {
										width: 100%;
									}
								}

								#header-bacor {
									/* background-color: #007bff; */
									border-radius: 20px;
									padding-top: 1px;
									height: 150px;
								}

								#header {
									border: 1px solid white;
									margin-left: 20px;
									width: 60%;
									height: 50px;
								}

								#header-name {
									border: 1px solid white;
									width: 300px;
									margin: 20px 20px;
									color: white;
									font-size: 40px;
								}

								.standards-top {
									display: flex;
									flex-wrap: wrap;
									justify-content: center;
								}

								.standards-contain {
									border: 1px solid #007bff;
									border-radius: 20px;
									margin: 10px;
									width: 45%;
								}

								.standards-imege-contain {
									width: 100%;
									/* border: 1px solid blue; */
									text-align: center;
								}

								.standards-imege {
									width: 200px;
									height: 200px;
								}

								.standards-font-parent {
									margin: 0 auto;
									vertical-align: top;
									width: 49%;
								}

								.standards-font-charild {
									padding: 2px;
									width: 95%;
									height: 10%;
									text-align: start;
								}

								.manu-name {
									color: gray;
									font-size: 20px;
									font-weight: 900;
								}

								.standards-font-contain {
									display: flex;
								}

								#title {
									/* border: 1px solid black; */
									/* margin-top: 20px; */
									width: 100%;
									text-align: center;
								}

								#navigation-title-parent {
									display: flex;
									justify-content: center;
									margin-bottom: 20px;
								}

								#navigation-title {
									width: 50%;
									display: flex;
									justify-content: space-around;
								}

								.navigation-title-article {
									width: 300px;
									display: flex;
									justify-content: space-around;
									align-items: center;
									height: 40px;
								}

								.navigation-title-article2 {
									width: 50%;
									display: flex;
									/* border: 1px solid ; */
								}

								.navigation-title-button-parent {
									margin-left: 20px;
									align-items: center;
								}

								.btn {
									border-radius: 5px;
									background-color: #007bff;
									color: white;
									padding: 5px 10px;
									border: none;
									cursor: pointer;
									margin: 5px;
								}

								.btncenter {
									text-align: center;
									margin-bottom: 20px;
								}

								#navigation-title-text {
									/* border: 1px solid black; */
									width: 130px;
								}

								#navigation-title-search {
									padding: 5px;
									width: 100px;
								}

								.center {
									margin: 20px 0 20px 0;
								}

								.selects {
									margin-bottom: 80px;
								}

								.file {
									margin-bottom: 100px;
								}

								.hidetext {
									height: 80px;
								}

								.showtext {
									height: 150px;
									width: 98%;
								}

								.showtext2 {
									height: 150px;
									width: 98%;
								}

								.titlecenter {
									text-align: center;
								}

								#top-border {
									border: 1px solid #007bff;
								}

								#page-container {
									text-align: center;
								}
								.pname{
									text-align: center;
									font-size: 20px;
									
								}

								@media screen and (max-width: 600px) {
									#navigation-title-text {
										font-size: 10px;
									}

									#navigation-title-search {
										width: 100%;
									}
									.standards-imege{
										width: 100%;
										height: 100%;
									}
									.pname{
										width: 80%;
									}
									.standards-contain{
										width: 40%;
										padding: 1px;
									}
									.manu-name{
										height: 50px;
									}
								
								}
							</style>
						</head>

						<body>

							<body>
								<div id="top-border">
									<div id="title">
										<h1>검사기준</h1>
									</div>
									<div id="navigation-title-parent">
										<div id="navigation-title">
											<div class="navigation-title-article">

												<div id="navigation-title-text">밀키트 검색</div>

												<div>
													<input type="text" id="navigation-title-search" value="${nameserch}">
												</div>


												<div class="navigation-title-button-parent">
													
													<input type="button" value="검색" class="btn " id="search" ">
													
												</div>

											</div>
										</div>
									</div>
								</div>


								
							
									<div id="preant">
										<div class="standards-top" id="original">
											<c:if test="${not empty map.list}">
												<c:forEach var="dto" items="${map.list}">

													<div class="standards-contain">

														<div class="standards-imege-contain">
															<div class="center">
																<div class="manu-name text-serch">${dto.productname}밀키트</div>
																<input type="hidden" value="${dto.productid}" class="pid">
															</div>
															<img src="download?filename=${dto.productimage}" class="standards-imege">
															
														</div>
														<div class="standards-font-contain">
															<div class="standards-font-parent">

																<div class="standards-font-charild">

																	<div class="titlecenter">
																		<h2>정상제품기준</h2>
																	</div>
																	<div class="hidetext">${dto.normalcriteria}</div>
																
																</div>

															</div>
															<div class="standards-font-parent">

																<div class="standards-font-charild">

																	<div class="titlecenter">
																		<h2>비정상제품기준</h2>
																	</div>
																	<div class="hidetext2">${dto.abnormalcriteria}</div>
																
																</div>
															</div>
														</div>
														<c:if test="${Field == 'admin'}">
															<div class="btncenter">
											

																<input type="button" value="수정" class="btn u">

																
															</div>
														</c:if>
													</div>
														

												</c:forEach>
											</c:if>
											<c:if test="${empty map.list}">
												<div>
													완제품조회 내용이 없습니다
												</div>
											</c:if>
										</div>
								</div>
								<div id="page-container">
									<% int pageNo=1; int viewCount=2; // model에 담은건 request에서 꺼낼 수 있다
									Map map=(Map)request.getAttribute("map"); 
									Products_DTO dto=(Products_DTO)request.getAttribute("pDTO"); pageNo=dto.getPage();
										viewCount=dto.getFinishViewCount(); System.out.println(">>>>>>>>> map :"+map +" : "+
										"dto :"+dto);

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
											<a href="inspectionStandards?page=<%= begin-1 %>&serch=${nameserch}">[이전]</a>
										</c:if>

										<c:forEach var="i" begin="<%= begin %>" end="<%= end %>">
											<c:if test="${i == dto.page }">
												<c:set var="clazz" value="bold" />
											</c:if>
											<c:if test="${ not (i == dto.page) }">
												<c:set var="clazz" value="" />
											</c:if>

											<a href="inspectionStandards?page=${ i }&serch=${nameserch}" class="${clazz }">${ i
												}</a>
										</c:forEach>

										<c:if test="<%= end == lastPage %>">
											[다음]
										</c:if>
										<c:if test="<%= end != lastPage %>">
											<a href="inspectionStandards?page=<%= end+1 %>&serch=${nameserch}">[다음]</a>
										</c:if>
								</div>



								<script>
									window.addEventListener("load", function () {

										

										//검색이벤트
										document.querySelector("#search").addEventListener("click", function (e) {
											console.log("검색버튼 클릭" + e.target.parentNode)
											console.log("전달값",document.querySelector("#navigation-title-search").value)
											let searchvalue = document.querySelector("#navigation-title-search").value.trim();
											console.log(searchvalue);
											//숫자만 ^문자열시작/ \d숫자하나 +앞에있는\d가 1개이상반복 $문자끝의미 .test() 문자열검사 메서드
											if(/^\d+$/.test(searchvalue)){
												alert("검색어는 숫자가 올 수 없습니다");
											}else if(searchvalue.length === 0){
												location.href="inspectionStandards?page=1"
												
											}else{
												
												//ajax
												const xhr = new XMLHttpRequest();
												xhr.open('get','insSelectone?serch='+searchvalue+'&page=1')
	
												xhr.setRequestHeader('Content-Type', 'application/json')
												
												xhr.send()
												
												xhr.onload = function () {
													let data = (xhr.responseText)
													console.log(xhr.responseText)
													data=JSON.parse(data)
													console.log(data)
													document.querySelector(".standards-top").innerHTML = ` `
													let page_container = document.querySelector("#page-container")
													page_container.innerHTML=``
													let picknameList = data.pickname.list;        // 밀키트 검색 결과
													let count = data.pickname.count;  	//카운트갯수
													let pDTO = data.pDTO    			//인덱스값
													let nameList = data.name_list;           // 전체 제품명 리스트
													let field = data.Field;					//계정 직급
													
													
													if ((picknameList)  && (picknameList.length > 0)) {
														picknameList.forEach(dto => {
													let newdataHtml = document.createElement("div")
													newdataHtml.setAttribute("class", "standards-contain")
															const ctrlHTML = `
														<div class="btncenter">
															<input type="hidden" value="update" name="type">
															<input type="button" value="수정" class="btn u">
															
														</div>
														` 
															newdataHtml.innerHTML = `
																		<div class="standards-imege-contain">
																			<div class="center">
																				<div class="manu-name text-serch">\${dto.productname}밀키트</div>
																				</div>
																					<input type="hidden" value="\${dto.productid}" class="pid">
																		
																				<img src="download?filename=\${dto.productimage}" class="standards-imege">
																			
																			</div>
																			<div class="standards-font-contain">
																			<div class="standards-font-parent">
			
																				<div class="standards-font-charild">
			
																					<div class="titlecenter">
																						<h2>정상제품기준</h2>
																					</div>
																					<div class="hidetext">\${dto.normalcriteria}</div>
																					
																				</div>
			
																			</div>
																			<div class="standards-font-parent">
			
																				<div class="standards-font-charild">
			
																					<div class="titlecenter">
																						<h2>비정상제품기준</h2>
																					</div>
																					<div class="hidetext2">\${dto.abnormalcriteria}</div>
																					
																				</div>
																			</div>
																		</div>
																		\${field == 'admin' ? ctrlHTML: ''}
																		</div>`
																			
																			
																		
																			
																		

																		
																		
																		document.querySelector(".standards-top").append(newdataHtml)

																	let us = newdataHtml.querySelectorAll(".u");
																	for (let i = 0; i < us.length; i++) {
																		us[i].addEventListener("click", function (e) {
																			console.log(e.target);
																			console.log(e.target.parentNode.parentNode.querySelector(".pid").value);
	
											
																		//수정클릭시 수정화면 아작스 이벤트
																		//ajax
																		const xhr = new XMLHttpRequest();
																		xhr.open('get', 'insSelectproductid?productid=' + e.target.parentNode.parentNode.querySelector(".pid").value)
							
																		xhr.setRequestHeader('Content-Type', 'application/json')
							
																		xhr.send()
							
																		xhr.onload = function () {
																			let data = (xhr.responseText)
																			console.log(xhr.responseText)
																			data=JSON.parse(data)
																			console.log(data)
																			document.querySelector(".standards-top").innerHTML = ` `
																			
																			let pickid = data.pickid;        // 밀키트 검색 결과
																			let nameList = data.name_list;           // 전체 제품명 리스트
																			let field = data.Field;
							
																			
																			if ((pickid)  && (pickid.length > 0)) {
																						pickid.forEach(dto => {
																										let newdataHtml = document.createElement("div")
																										newdataHtml.setAttribute("class", "standards-contain")
																											const ctrlHTML = `
																										<div class="btncenter">
																											<input type="button" value="확인" class="btn ok ">
																											<input type="button" value="취소" class="btn can ">
																										</div>
																										` 
																								newdataHtml.innerHTML = `
																									<div class="standards-imege-contain">
																									<div class="center">
																										
																										<input type="hidden" value="\${dto.productid}" class="pid">
																										<input type="text" value="\${dto.productname}" class="pname">			
																										</div>
																										<input type="file" class="file files " name="file_value" >
																									</div>
																									<div class="standards-font-contain">
																									<div class="standards-font-parent">
									
																										<div class="standards-font-charild">
									
																											<div class="titlecenter">
																												<h2>정상제품기준</h2>
																											</div>
																											
																											<textarea name="normalcriteria_value" class="showtext "
																												>\${dto.normalcriteria}</textarea>
																										</div>
									
																									</div>
																									<div class="standards-font-parent">
									
																										<div class="standards-font-charild">
									
																											<div class="titlecenter">
																												<h2>비정상제품기준</h2>
																											</div>
																											
																											<textarea name="abnormalcriteria_value" class="showtext2"
																												>\${dto.abnormalcriteria}</textarea>
																										</div>
																									</div>
																							
																									</div>
																									
																									\${ctrlHTML}
																									</div>`
																							
																								
																								
																							
																								;
																								document.querySelector(".standards-top").append(newdataHtml)

																								newdataHtml.querySelector(".ok").addEventListener("click",(e)=>{
																									console.log("file",e.target.parentNode.parentNode.querySelector(".file").value)
																									console.log("pname",e.target.parentNode.parentNode.querySelector(".pname").value)
																									console.log("pid",e.target.parentNode.parentNode.querySelector(".pid").value)
																									console.log("showtext",e.target.parentNode.parentNode.querySelector(".showtext").value) //가져옴 
																									console.log("showtext2",e.target.parentNode.parentNode.querySelector(".showtext2").value)//가져옴
																								
																									let pid = e.target.parentNode.parentNode.querySelector(".pid").value;
																									let pname = e.target.parentNode.parentNode.querySelector(".pname").value;
																									let normalProduct = e.target.parentNode.parentNode.querySelector(".showtext").value;
																									let abnormalProduct = e.target.parentNode.parentNode.querySelector(".showtext2").value;

																									var formData = new FormData();
																									var inputFile = e.target.parentNode.parentNode.querySelector(".file").files[0];
																									console.log("inputFile",inputFile)
																									
																									
																										formData.append("pid", pid);
																										formData.append("pname", pname);
																										formData.append("uplodeFile", inputFile);
																										formData.append("normalProduct", normalProduct);
																										formData.append("abnormalProduct", abnormalProduct);
																		
								
																					
																									//포멧데이터(파일)과 다른 값들을 같이 전송하는방법 찾아보기


																									xhr.open('post', 'upload')
																									
																									//formData는 내부적으로 multipart/from-data형식으로 전송
																									// xhr.setRequestHeader()
														
																									xhr.send(formData)
																									
																									xhr.onload = function () {
																									alert("수정완료")
																										console.log(xhr.responseText)
																										location.href = "inspectionStandards"
																										
																									}

																								})// 수정확인버튼 클릭이벤트

																									//수정버튼클릭후 취소버튼
																								newdataHtml.querySelector(".can").addEventListener("click",(e)=>{
																									alert("수정취소")
																									location.href = "inspectionStandards"
																								
																								
																								})//수정버튼클릭후 취소버튼

																							});
																						}

																								

																												
																			}//수정클릭시 수정화면 아작스 이벤트
																											




												
															//선택된 옵션의 텍스트 가져오는이벤트
															let slectname ;
															document.querySelector("#select").addEventListener("change", function (e) {
																let selectedOption = this.options[this.selectedIndex];
																slectname = selectedOption.text;
																console.log("slectname",slectname)
															})
													
																
													})// 수정버튼 클릭이벤트

												} // for end




																	});
																		console.log(data.pDTO.page)    //현제 페이지
																		console.log(data.pDTO.serch)	//검색어																	
																		console.log(data.pickname.count) //전체카운트
																		
																		let dtoo = data.pDTO
																		let pageNo = 1
																		let viewCount = 2 
																		
																		pageNo = data.pDTO.page
																		serch = data.pDTO.serch
																		viewCount = data.pDTO.finishViewCount
																		console.log(1,data.pDTO.finishViewCount)
																	
																		
																		let total = data.pickname.count // 전체 겟수
																		let lastPage = Math.ceil(total / viewCount) 
																		let groupCount = 5
																		let groupPosition = Math.ceil(pageNo / groupCount)
																		let begin = ((groupPosition-1) * groupCount) + 1;
																		let end = groupPosition * groupCount;
																		
																		let searchvalue = document.querySelector("#navigation-title-search").value.trim();
																		document.querySelector("#page-container").innerHTML=``
																		if(end > lastPage){
																			end = lastPage
																		} 
																		if( begin === 1 ){
																			page_container.innerHTML+=`
																			[이전]
																		
																			`
																		}else{
																			page_container.innerHTML+=`
																			
																			<a href="inspectionStandards?page="\${begin-1}&serch=\${searchvalue}">[이전]</a>
																		
																			`
																		
																		}	

																		for(let i = begin; i<=end ; i++){
																			if(i === pageNo){
																			
																				page_container.innerHTML+=`
																		
																				<a href="inspectionStandards?page=\${ i }&serch=\${searchvalue}" class="bold">\${ i}</a>
																				`
																			
																			}else {
																				
																				page_container.innerHTML+=`
																				<a href="inspectionStandards?page=\${ i }&serch=\${searchvalue}" class="">\${ i}</a>
																			
																				`
																			}
																			
																		}
																		if( end === lastPage ){
																			page_container.innerHTML+=`
																			[다음]
														
																			`
																		}else{
																			page_container.innerHTML+=`
																			<a href="inspectionStandards?page=\${end+1}&serch=\${searchvalue}">[다음]</a>
																			`
																			
																		}

																		
																		
																					// pageajax(page);//확인필욧
																		
																	} else {
																		newdataHtml = `
																		<div>
																			완제품조회 내용이 없습니다
																			</div>
																			`
																			document.querySelector(".standards-top").append(newdataHtml)
																		};
																	
																	
	
	
	
	
	
	
	
	
	
													} // if end
												}// 아작스 
											}) // 검색이벤트



											let btnok = document.querySelectorAll(" .ok")
											let btncan = document.querySelectorAll(".can")
											for (let i = 0; i < btnok.length; i++) {
												btnok[i].classList.add("none")
												btncan[i].classList.add("none")
											}


												document.querySelectorAll(".showtext").forEach(el => el.classList.add("none"));
												document.querySelectorAll(".showtext2").forEach(el => el.classList.add("none"));
												document.querySelectorAll(".file").forEach(el => el.classList.add("none"));
												document.querySelectorAll(".selects").forEach(el => el.classList.add("none"));
												document.querySelectorAll(".hidetext").forEach(el => el.classList.remove("none"));
												document.querySelectorAll(".hidetext2").forEach(el => el.classList.remove("none"));

												let us = document.querySelectorAll(".u");
												for (let i = 0; i < us.length; i++) {
													us[i].addEventListener("click", function (e) {
														console.log(e.target.parentNode.parentNode);
													

														e.target.classList.add("none");
													
													
														console.log("pid",e.target.parentNode.parentNode.querySelector(".pid").value)
														//수정클릭시 수정화면 아작스 이벤트
																		//ajax
																		const xhr = new XMLHttpRequest();
																		xhr.open('get', 'insSelectproductid?productid=' + e.target.parentNode.parentNode.querySelector(".pid").value)
							
																		xhr.setRequestHeader('Content-Type', 'application/json')
							
																		xhr.send()
							
																		xhr.onload = function () {
																			let data = (xhr.responseText)
																			console.log(xhr.responseText)
																			data=JSON.parse(data)
																			console.log(data)
																			document.querySelector(".standards-top").innerHTML = ` `
							
																			let pickid = data.pickid;        // 밀키트 검색 결과
																			let nameList = data.name_list;           // 전체 제품명 리스트
																			let field = data.Field;
							
																			
																			if ((pickid)  && (pickid.length > 0)) {
																						pickid.forEach(dto => {
																										let newdataHtml = document.createElement("div")
																										newdataHtml.setAttribute("class", "standards-contain")
																											const ctrlHTML = `
																										<div class="btncenter">
																											<input type="button" value="확인" class="btn ok ">
																											<input type="button" value="취소" class="btn can ">
																										</div>
																										` 
																								newdataHtml.innerHTML = `
																									<div class="standards-imege-contain">
																									<div class="center">
																										
																										<input type="hidden" value="\${dto.productid}" class="pid">
																										<input type="text" value="\${dto.productname}" class="pname">			
																										</div>
																										<input type="file" class="file files " name="file_value" >
																									</div>
																									<div class="standards-font-contain">
																									<div class="standards-font-parent">
									
																										<div class="standards-font-charild">
									
																											<div class="titlecenter">
																												<h2>정상제품기준</h2>
																											</div>
																											
																											<textarea name="normalcriteria_value" class="showtext "
																												>\${dto.normalcriteria}</textarea>
																										</div>
									
																									</div>
																									<div class="standards-font-parent">
									
																										<div class="standards-font-charild">
									
																											<div class="titlecenter">
																												<h2>비정상제품기준</h2>
																											</div>
																											
																											<textarea name="abnormalcriteria_value" class="showtext2"
																												>\${dto.abnormalcriteria}</textarea>
																										</div>
																									</div>
																								</div>
																								 \${ctrlHTML}
																								</div>
																							
																								`;
																								document.querySelector(".standards-top").append(newdataHtml)

																								newdataHtml.querySelector(".ok").addEventListener("click",(e)=>{
																									console.log("file",e.target.parentNode.parentNode.querySelector(".file").value)
																									console.log("pname",e.target.parentNode.parentNode.querySelector(".pname").value)
																									console.log("pid",e.target.parentNode.parentNode.querySelector(".pid").value)
																									console.log("showtext",e.target.parentNode.parentNode.querySelector(".showtext").value) //가져옴 
																									console.log("showtext2",e.target.parentNode.parentNode.querySelector(".showtext2").value)//가져옴
																								
																									let pid = e.target.parentNode.parentNode.querySelector(".pid").value;
																									let pname = e.target.parentNode.parentNode.querySelector(".pname").value;
																									let normalProduct = e.target.parentNode.parentNode.querySelector(".showtext").value;
																									let abnormalProduct = e.target.parentNode.parentNode.querySelector(".showtext2").value;

																									var formData = new FormData();
																									var inputFile = e.target.parentNode.parentNode.querySelector(".file").files[0];
																									console.log("inputFile",inputFile)
																									
																									
																										formData.append("pid", pid);
																										formData.append("pname", pname);
																										formData.append("uplodeFile", inputFile);
																										formData.append("normalProduct", normalProduct);
																										formData.append("abnormalProduct", abnormalProduct);
																		
								
																					
																									//포멧데이터(파일)과 다른 값들을 같이 전송하는방법 찾아보기


																									xhr.open('post', 'upload')
																									
																									//formData는 내부적으로 multipart/from-data형식으로 전송
																									// xhr.setRequestHeader()
														
																									xhr.send(formData)
																									
																									xhr.onload = function () {
																										alert("수정완료")
																										console.log(xhr.responseText)
																										location.href = "inspectionStandards"
																										
																									}

																								})// 수정확인버튼 클릭이벤트

																								//수정버튼클릭후 취소버튼
																								
																								newdataHtml.querySelector(".can").addEventListener("click",(e)=>{
																									alert("수정취소")
																								location.href = "inspectionStandards"
																								
																								
																								})//수정버튼클릭후 취소버튼

																							});
																						}

																								

																												
																			}//수정클릭시 수정화면 아작스 이벤트
																											




														e.target.parentNode.querySelector(".can").addEventListener("click", function (e) {
															console.log("e타겟", e.target.parentNode.parentNode)
															e.target.parentNode.parentNode.querySelector(".showtext").classList.add("none");
															e.target.parentNode.parentNode.querySelector(".showtext2").classList.add("none");
															e.target.parentNode.parentNode.querySelector(".file").classList.add("none");
															e.target.parentNode.parentNode.querySelector(".selects").classList.add("none");
															e.target.parentNode.parentNode.querySelector(".hidetext").classList.remove("none");
															e.target.parentNode.parentNode.querySelector(".hidetext2").classList.remove("none");
															e.target.parentNode.parentNode.querySelector(".standards-imege").classList.remove("none");
															e.target.parentNode.parentNode.querySelector(".text-serch").classList.remove("none");


															e.target.classList.add("none");
															e.target.parentNode.querySelector(".ok").classList.add("none");
															e.target.parentNode.querySelector(".u").classList.remove("none");
															
															

														})// 취소 클릭이벤트
															//선택된 옵션의 텍스트 가져오는이벤트
															let slectname ;
															document.querySelector("#select").addEventListener("change", function (e) {
																let selectedOption = this.options[this.selectedIndex];
																slectname = selectedOption.text;
																console.log("slectname",slectname)
															})
													
																
													})// 수정버튼 클릭이벤트

												} // for end

											


									})//온로드 이벤트

									// function pageajax(page){

										
											
											
										
									// 	let searchvalue = document.querySelector("#navigation-title-search").value.trim();
									// 		const xhr = new XMLHttpRequest();
									// 		xhr.open('get', `insSelectone?page=\${page}&serch=\${searchvalue}`);
									// 		xhr.setRequestHeader('Content-Type', 'application/json');
									// 		xhr.send();

									// 			xhr.onload = function () {
									// 				let data = JSON.parse(xhr.responseText);

									// 				// 기존 데이터 다시 그리기
													
									// 		console.log(data)
									// 		document.querySelector(".standards-top").innerHTML = ` `

									// 		let picknameList = data.pickname.list;        // 밀키트 검색 결과
									// 		let count = data.pickname.count;  	//카운트갯수
									// 		let pDTO = data.pDTO    			//인덱스값
									// 		let nameList = data.name_list;           // 전체 제품명 리스트
									// 		let field = data.Field;					//계정 직급
											
													
									// 				if ((picknameList)  && (picknameList.length > 0)) {
									// 					picknameList.forEach(dto => {
									// 				let newdataHtml = document.createElement("div")
									// 				newdataHtml.setAttribute("class", "standards-contain")
									// 						const ctrlHTML = `
									// 					<div class="btncenter">
									// 						<input type="hidden" value="update" name="type">
									// 						<input type="button" value="수정" class="btn u">
															
									// 					</div>
									// 					` 
									// 						newdataHtml.innerHTML = `
									// 									<div class="standards-imege-contain">
									// 										<div class="center">
									// 											<div class="manu-name text-serch">\${dto.productname}밀키트</div>
									// 											</div>
									// 												<input type="hidden" value="\${dto.productid}" class="pid">
																		
									// 											<img src="download?filename=\${dto.productimage}" class="standards-imege">
																			
									// 										</div>
									// 										<div class="standards-font-contain">
									// 										<div class="standards-font-parent">
			
									// 											<div class="standards-font-charild">
			
									// 												<div class="titlecenter">
									// 													<h2>정상제품기준</h2>
									// 												</div>
									// 												<div class="hidetext">\${dto.normalcriteria}</div>
																					
									// 											</div>
			
									// 										</div>
									// 										<div class="standards-font-parent">
			
									// 											<div class="standards-font-charild">
			
									// 												<div class="titlecenter">
									// 													<h2>비정상제품기준</h2>
									// 												</div>
									// 												<div class="hidetext2">\${dto.abnormalcriteria}</div>
																					
									// 											</div>
									// 										</div>
									// 									</div>
									// 									\${field == 'admin' ? ctrlHTML: ''}
									// 									</div>`

									// 					})
									// 				}
									// 				let pageNo = 1
									// 				let viewCount = 2 
									// 				let map = data.pickname
									// 				let dto1 = data.pDTO
									// 				pageNo = dto1.page
									// 				viewCount = dto1.getFinishViewCount
									// 				console.log(">>>>>>>>> map :"+map +" : "+"dto :"+dto1);
									// 				let total = map.count
									// 				let lastPage = Math.ceil(total / viewCount)
									// 				let groupCount = 5
									// 				let groupPosition = Math.ceil(pageNo / groupCount)
									// 				let begin = ((groupPosition-1) * groupCount) + 1;
									// 				let end = groupPosition * groupCount;
												
									// 				let searchvalue = document.querySelector("#navigation-title-search").value.trim();
									// 				document.querySelector("#page-container").innerHTML = ``;
									// 				if(end > lastPage){
									// 										end = lastPage
									// 									} 
									// 									if( begin === 1 ){
									// 										page_container.innerHTML+=`
									// 										[이전]
																		
									// 										`
									// 									}else{
									// 										page_container.innerHTML+=`
																			
									// 										<a href="inspectionStandards?page="\${begin-1}&serch=\${searchvalue}">[이전]</a>
																		
														
									// 										`
									// 									}	

									// 									for(let i = begin; i<=end ; i++){
									// 										if(i === dto1.page){
																			
									// 											page_container.innerHTML+=`
																		
									// 									<a href="inspectionStandards?page=\${ i }&serch=\${searchvalue}" class="bold">\${ i}</a>
																				
								
																		
									// 											`
									// 										}else {
																				
									// 											page_container.innerHTML+=`
									// 											<a href="inspectionStandards?page=\${ i }&serch=\${searchvalue}" class="">\${ i}</a>
																			
									// 											`
									// 										}
																			
									// 									}
									// 									if( end === lastPage ){
									// 										page_container.innerHTML+=`
									// 										[다음]
														
									// 										`
									// 									}else{
									// 										page_container.innerHTML+=`
									// 										<a href="inspectionStandards?page=\${end+1}&serch=\${searchvalue}">[다음]</a>
									// 										`
									// 									}

													



									// 		}
									



									// }	


								</script>
							</body>

						</html>