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

li {
	border: 1px solid black;
	list-style: none;
	padding: 0;
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

table, td, td {
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
</style>
</head>


<body>


	<!-- ------------------------------------------------------------------------------------------- -->

	<style>
#standards-top {
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
	height: 220px;
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

@media screen and (max-width: 600px) {
	#navigation-title-text {
		font-size: 10px;
	}
	#navigation-title-search {
		width: 50%;
	}
}
</style>
<body>
<form action="InspectionS" method="get">
	<div id="top-border">
		<div id="title">
			<h1>검사기준</h1>
		</div>
		<div id="navigation-title-parent">
			<div id="navigation-title">
				<div class="navigation-title-article">

					<div id="navigation-title-text">밀키트 검색</div>

					<div>
						<input type="text" id="navigation-title-search" name="serchvalue" value="">
					</div>


					<div class="navigation-title-button-parent">
						<input type="hidden" value="search" name="type">
						<input type="submit" value="검색" class="btn search">
					</div>

				</div>
			</div>
		</div>
	</div>
</form>



	<div id="standards-top">
		<c:forEach var="dto" items="${selectval}">

			<div class="standards-contain">
						<form action="InspectionS" method="post">
				<div class="standards-imege-contain">
					<div class="center">
							<div class="manu-name text-serch">${dto.productname}밀키트</div>

							<select id="select" class="selects" style="margin-bottom: 80px;"
								name="product_select">
								<c:forEach var="dto1" items="${selectval}">
									<option value="${dto1.productid}">${dto1.productname}</option>
								</c:forEach>
							</select>
					</div>
					<img src="img/${dto.productimage}" class="standards-imege"> <input
						type="file" class="file files" name="file_value">
				</div>
				<div class="standards-font-contain">
					<div class="standards-font-parent">

						<div class="standards-font-charild">

							<div class="titlecenter">
								<h2>정상제품기준</h2>
							</div>
							<div class="hidetext">${dto.normalcriteria}</div>
							<textarea name="normalcriteria_value" class="showtext"
								value="${dto.normalcriteria}">${dto.normalcriteria}</textarea>
						</div>

					</div>
					<div class="standards-font-parent">

						<div class="standards-font-charild">

							<div class="titlecenter">
								<h2>비정상제품기준</h2>
							</div>
							<div class="hidetext2">${dto.abnormalcriteria}</div>
							<textarea name="abnormalcriteria_value" class="showtext2"
								value="${dto.abnormalcriteria}">${dto.abnormalcriteria}</textarea>
						</div>
					</div>
				</div>
					<c:if test="${Field == 'ADMIN'}">	
				<div class="btncenter">
					<input type="hidden" value="update" name="type"> 
					
					<input type="button" value="수정" class="btn u">
					
					<input type="submit" value="확인" class="btn ok"> <input
						type="button" value="취소" class="btn can">
				</div>
					</c:if>
			</div>
			</form>
				
		</c:forEach>

	</div>



	<script>
            window.addEventListener("load", function () {
            
             
               

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
				for(let i = 0; i<us.length; i++){
					us[i].addEventListener("click", function (e) {
						console.log(e.target.parentNode.parentNode);
// 						console.log("e타겟",e.target.parentNode)
// 						console.log("e타겟",e.target.parentNode.parentNode)
						e.target.parentNode.parentNode.querySelector(".showtext").classList.remove("none");
						e.target.parentNode.parentNode.querySelector(".showtext2").classList.remove("none");
						e.target.parentNode.parentNode.querySelector(".file").classList.remove("none");
						e.target.parentNode.parentNode.querySelector(".selects").classList.remove("none");
						e.target.parentNode.parentNode.querySelector(".hidetext").classList.add("none");
						e.target.parentNode.parentNode.querySelector(".hidetext2").classList.add("none");
						e.target.parentNode.parentNode.querySelector(".standards-imege").classList.add("none");
						e.target.parentNode.parentNode.querySelector(".text-serch").classList.add("none");
						
						e.target.classList.add("none");
						e.target.parentNode.querySelector(".ok").classList.remove("none");
						e.target.parentNode.querySelector(".can").classList.remove("none");
						
						e.target.parentNode.querySelector(".can").addEventListener("click", function (e) {
							console.log("e타겟",e.target.parentNode.parentNode)
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
						})
					})
				}


            })



        </script>
</body>

</html>