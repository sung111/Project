<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="../css/perform.css">
<link rel="stylesheet" href="css/reset.css">
<script
	src="https://cdn.jsdelivr.net/npm/chart.js@3.7.1/dist/chart.min.js"></script>
<title>Insert title here</title>
</head>
<style>

/* 기본 세팅 */
body {
	/* background-color: lisht; */
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Apple SD Gothic Neo';
	list-style: none;
	height: 900px;

	/* border: 3px solid #007bff; */
}

li {
	top: 30%;
	font-size: 35px;
	text-align: center;
}

/* 전체영역 */
.perform {
	padding: 10px;
}

/* 메뉴 세팅 */
#nav {
	width: 100%;
	height: 10px;
	/* border: 5px solid lightgray; */
	/* display: flex;
justify-content: space-evenly; */
	/* align-items: center; */
	/* padding: 10px; */
}

/* 검색 달력 조회 Div */
#cor {
	margin-left: 10%;
	/* margin-top: 50%; */
	/* position:absolute; */
	/* margin-top: 20%; */
	color: #000000;
	cursor: pointer;
	margin-bottom: 50%;
}

/* sel 부모요소 */
#sch {
	/* display: flex; */
	/* position: absolute; */
	/* right: 100%; */
	/* top: 30%; */
	/* width: 50%; */
	align-items: center;
	display: flex;
	/* position: absolute;
    top: -175px;
    left: 10px; */
}

/* 일월주간 부모요소 */
#sel {
	display: flex;
	/* position: absolute; */
	/* top: 8%;
    left: 10%; */
	padding: 0.8%;

	/* height: 30px; */

	/* width: 80%; */
	/* height: 36px; */
}

/* 일월주달력 부모요소 */
#cal {
	display: flex;
	/* left: 200px;
    top: 53px; */
	/* width: 70%;  */
}

/* 일간 */
#daily {
	text-align: center;
	/* width: 150%; */
	padding: 1%;
	font-family: 'Apple SD Gothic Neo', serif;
	font-size: 15px;
	font-weight: 400;
}

/* 주간 */
#week {
	text-align: center;
	/* width: 150%; */
	padding: 1%;
	font-family: 'Apple SD Gothic Neo', serif;
	font-size: 15px;
	font-weight: 400;
}

/* 월간 */
#month {
	text-align: center;
	/* width: 150%; */
	padding: 1%;
	font-family: 'Apple SD Gothic Neo', serif;
	font-size: 15px;
	font-weight: 400;
}

/* 일간 달력 */
#date {
	text-align: center;
	/* position: relative;

left: 10%;
width: 25%; */
	/* font-family: 'Gowun Batang', serif;
font-size: 20px;
font-weight: 400; */
	padding: 1px;
	height: 30px;
	font-family: 'Apple SD Gothic Neo', serif;
	font-size: 15px;
	font-weight: 400;
}

/* 주간 달력 */
#weeks {
	text-align: center;
	display: none;
	/* position: relative;
       left: 10%;
    width: 20%; */
	font-family: 'Apple SD Gothic Neo', serif;
	font-size: 15px;
	font-weight: 400;
	padding: 1px;
	height: 30px;
}

/* 월간 달력 */
#months {
	text-align: center;
	display: none;
	/* position: relative;
       left: 10%;
       width: 20%; */
	font-family: 'Apple SD Gothic Neo', serif;
	font-size: 15px;
	font-weight: 400;
	padding: 1px;
	height: 30%;
}

/* 일간 차트 */
#Chart1 {
	padding: 1%;
	/* position: relative;
  
    bottom: 5%; */
}

/* 주. 월간 차트 */
#Chart2, #Chart3 {
	padding: 1%;
	/* position: relative;
  
bottom: 5%; */
	display: none;
}

/* 차트 부모요소 */
#Chartall {
	/* position: relative; */
	width: 80%;
	margin-left: 10%;
	margin-top: -1%;
}

/* #Chart4 {


    padding: 1%;
    position: relative;
    left: 30%;
    bottom: -7%;
    display: none;

}



#Chart7 {


    padding: 1%;
    position: relative;
    left: 30%;
    bottom: -7%;
    display: none;

}
 */

/* 검색 조회 부모*/
#set {
	/* width: 200%; */
	/* position: relative; */
	/* left: 100%;
    bottom: 100%; */
	/* align-items: center; */
	margin-top: 1%;
	/* display: flex; */
	color: #000000;
	cursor: pointer;
}

/* 검색 */
#text {
	/* width: 300%; */
	height: 17px;

	/* position: relative;
bottom: 120%;
left: 32%; */
}

/* 조회 */
#sele {
	color: #ffffff;
	cursor: pointer;
	background-color: #007bff;

	/* padding: 7px; */
	/* position: absolute; */

	/* bottom: 90%; */
	/* left: 90%; */

	/* left: -10%; */
	/* width: 30%; */
	/* height: 100%; */
}

/* #del {
    padding: 3px;

color: #ffffff ; cursor: pointer;
background-color: #007bff;

width: 8%;
height: 29%;
}

#fix {


    
        padding: 3px;
        
        color: #ffffff ; cursor: pointer;
        background-color: #007bff;

        width: 8%;
        height: 28%;
        
} */

/* #join {


    padding: 3px;
    position: relative;
    right: 130px;
    top: 36px;
    color: #ffffff ; cursor: pointer;
    background-color: #007bff;

} */

/* 표 기본 세팅 */
#tableall {
	/* position: relative; */
	/* bottom: 30%; */
	width: 80%;
	/* margin-bottom: 0%; */
	margin-left: 10%;
	margin-top: -55.6%;
	/* right: 100%; */
	/* border: 5px solid gray; */
	border-collapse: collapse;
}

/* thead {

width: 100%;

} */
#first {
	/* position: absolute;
    bottom: -20%; */
	
}

/* 가장 맨 윗표 가리기 */
#second {
	display: none;
	margin-top: -2%;
	/* position: absolute;
    bottom: -20%; */

	/* border: 5px solid red; */
	/* width: 500px; */
}

#third {
	display: none;
	margin-top: -5%;
	/* position: absolute;
    bottom: -20%; */

	/* border: 5px solid red; */
	/* width: 500px; */
}

/* 일간 표 td 넓이 */
.daytime {
	background-color: skyblue;
	width: 176px;
}

/* 주간 표 td 넓이 */
.wektime {
	background-color: skyblue;
	width: 160px;
}

/* 월간 표 td 넓이 */
.montime {
	background-color: skyblue;
	width: 250px;
}

.name {
	background-color: skyblue;
}

/* 2번째 가릴 표 */
.item {
	/* background-color: lightgray; */
	text-align: center;
	display: none;
}

/* 일간 식품 */
#budae1 {
	/* display: none; */
	/* width: 500%; */
	text-align: center;
}

#nabe1 {
	/* display: none; */
	width: auto;
	text-align: center;
}

#kimchi1 {
	/* display: none; */
	width: auto;
	text-align: center;
}

#ttuk1 {
	/* display: none; */
	width: auto;
	text-align: center;
}

#ggop1 {
	/* display: none; */
	width: auto;
	text-align: center;
}

/* 주간 식품 */
#budae2 {
	/* display: none; */
	/* width: 500%; */
	text-align: center;
}

#nabe2 {
	/* display: none; */
	width: auto;
	text-align: center;
}

#kimchi2 {
	/* display: none; */
	width: auto;
	text-align: center;
}

#ttuk2 {
	/* display: none; */
	width: auto;
	text-align: center;
}

#ggop2 {
	/* display: none; */
	width: auto;
	text-align: center;
}

/* 월간 식품 */
#budae3 {
	/* display: none; */
	/* width: 500%; */
	text-align: center;
}

#nabe3 {
	/* display: none; */
	width: auto;
	text-align: center;
}

#kimchi3 {
	/* display: none; */
	width: auto;
	text-align: center;
}

#ttuk3 {
	/* display: none; */
	width: auto;
	text-align: center;
}

#ggop3 {
	/* display: none; */
	width: auto;
	text-align: center;
}

tr {
	/* border: 5px solid red; */
	width: 100%;
}

tbody {
	width: 100%;
	/* border: 5px solid red; */
}

/* .budaes {


width: auto;
text-align: center;


} */

/* 
.hide {


border: 5px solid red;
} */

/* table {
            
position: relative;
top: 150px;



} */

/* 
#days {

/* display: none; */

/* } */

/* #comm {


    width: 600px;
    height: 50px;
} */

/* 
#page {





    background-color: #4CAF50;
    color: white;
    text-align: center;
    text-decoration: none;
    font-size: 16px;
    border-radius: 5px;

 
left: 47%; 
top: 100px;
   
   
}  */

/* #page2 {
    background-color: #4CAF50;
    color: white;
    text-align: center;
    text-decoration: none;
    font-size: 16px;
    border-radius: 5px;

    position: relative;
left: 47%; 
top: 100px;
  } */

/* 폰트 */
@font-face {
	font-family: 'Apple SD Gothic Neo';
	font-weight: 900;
	font-style: normal;
	font-display: swap;
	src:
		url('https://cdn.jsdelivr.net/gh/fonts-archive/AppleSDGothicNeo/AppleSDGothicNeo-Black.woff2')
		format('woff2'),
		url('https://cdn.jsdelivr.net/gh/fonts-archive/AppleSDGothicNeo/AppleSDGothicNeo-Black.ttf')
		format('truetype');
}
</style>
<body class="perform">








<form method = "post" action="searchs">



	<!-- div로 감싸고 relative, absolute 사용 -->
	<div id="cor">
		<!-- <button id="del">삭제</button>
                <button id="fix">수정</button> -->
		<!-- <button id="join">등록</button> -->
		<div id="sch">
			<select id="sel">
				<option id="daily">일간</option>
				<option id="week">주간</option>
				<option id="month">월간</option>
			</select>

        
			<div id="cal">
				<input type="date" id="date" value="yyyy-mm-dd" name="date">
				<input type="week" id="weeks" value="yyyy-mm-dd" name="week">
				<input type="month" id="months" value="yyyy-mm-dd" name="month">
			</div>

			<div id="set">
				<input type="text" id="text" name="productname" placeholder="검색어를 입력해주세요">
				<button id="sele" type="submit">조회</button>
			</div>
		</div>
	</div>


 </form>



	<!-- 테이블 반응형 사용 위해  -->
	<!-- 일간 테이블 -->
	<div style="overflow-x: auto;" id="tableall">
		<br>
		<br>
		<br>
		<table border="1" id="first">

			<thead>
				<tr>
					<th class="daytime">완제품명</th>
					<th class="daytime">06:00~08:00</th>
					<th class="daytime">08:00~10:00</th>
					<th class="daytime">10:00~12:00</th>
					<th class="daytime">12:00~14:00</th>
					<th class="daytime">14:00~16:00</th>
					<th class="daytime">16:00~18:00</th>
				</tr>
			</thead>





			<tbody>


<c:forEach var="dto" items="${queryid}">
					<tr id="budae1">
						<td class="name">${dto.productname}</td>
						<td>${dto.t6_8}</td>
						<td>${dto.t8_10}</td>
						<td>${dto.t10_12}</td>
						<td>${dto.t12_14}</td>
						<td>${dto.t14_16}</td>
						<td>${dto.t16_18}</td>

					</tr>
				</c:forEach>













				<c:forEach var="dto" items="${query}">
					<tr id="budae1">
						<td class="name">${dto.productname}</td>
						<td>${dto.t6_8}</td>
						<td>${dto.t8_10}</td>
						<td>${dto.t10_12}</td>
						<td>${dto.t12_14}</td>
						<td>${dto.t14_16}</td>
						<td>${dto.t16_18}</td>

					</tr>
				</c:forEach>

				

				</tr>

			</tbody>

		</table>




		<!-- <table border=1>" 
                                            
                        + "<thead>"
                           
                            +"<tr>"
                                +"<th>" + day + "</th>"
                                +"<th>06:00~08:00</th>"
                                +"<th>08:00~10:00</th>"
                                +"<th>10:00~12:00</th>"
                                +"<th>12:00~14:00</th>"
                                +"<th>14:00~16:00</th>"
                                +"<th>16:00~18:00</th>"
                            
                            +"</tr>"
                          +"</thead>" -->









		<!-- 주간 테이블 -->
		<br>
		<table border=1 id="second">
			<thead>
				<tr>
					<th class="wektime">완제품명</th>
					<th class="wektime">월요일</th>
					<th class="wektime">화요일</th>
					<th class="wektime">수요일</th>
					<th class="wektime">목요일</th>
					<th class="wektime">금요일</th>
					<th class="wektime">토요일</th>
					<th class="wektime">일요일</th>
				</tr>
			</thead>
			<tbody>
				<tr id="budae2">
					<td class="name">부대찌개</td>
					<td>200</td>
					<td>835</td>
					<td>445</td>
					<td>366</td>
					<td>366</td>
					<td>366</td>
					<td>366</td>

				</tr>
				<tr id="nabe2">
					<td class="name">밀푀유나베</td>
					<td>626</td>
					<td>835</td>
					<td>445</td>
					<td>366</td>
					<td>366</td>
					<td>366</td>
					<td>366</td>

				</tr>
				<tr id="kimchi2">
					<td class="name">김치찌개</td>
					<td>626</td>
					<td>835</td>
					<td>445</td>
					<td>366</td>
					<td>366</td>
					<td>366</td>
					<td>366</td>

				</tr>
				<tr id="ttuk2">
					<td class="name">떡볶이</td>
					<td>626</td>
					<td>835</td>
					<td>445</td>
					<td>366</td>
					<td>366</td>
					<td>366</td>
					<td>366</td>

				</tr>
				<tr id="ggop2">
					<td class="name">곱창전골</td>
					<td>626</td>
					<td>835</td>
					<td>445</td>
					<td>366</td>
					<td>366</td>
					<td>366</td>
					<td>366</td>

				</tr>
			</tbody>
		</table>






		<!-- 월간 테이블 -->
		<br>
		<table border="1" id="third">
			<thead>
				<tr>
					<th class="montime">완제품명</th>
					<th class="montime">1주차</th>
					<th class="montime">2주차</th>
					<th class="montime">3주차</th>
					<th class="montime">4주차</th>
				</tr>
			</thead>
			<tbody>
				<tr id="budae3">
					<td class="name">부대찌개</td>
					<td>400</td>
					<td>835</td>
					<td>445</td>
					<td>366</td>

				</tr>
				<tr id="nabe3">
					<td class="name">밀푀유나베</td>
					<td>626</td>
					<td>835</td>
					<td>445</td>
					<td>366</td>

				</tr>
				<tr id="kimchi3">
					<td class="name">김치찌개</td>
					<td>626</td>
					<td>835</td>
					<td>445</td>
					<td>366</td>

				</tr>
				<tr id="ttuk3">
					<td class="name">떡볶이</td>
					<td>626</td>
					<td>835</td>
					<td>445</td>
					<td>366</td>

				</tr>
				<tr id="ggop3">
					<td class="name">곱창전골</td>
					<td>626</td>
					<td>835</td>
					<td>445</td>
					<td>366</td>

				</tr>

			</tbody>
		</table>


	</div>











	<!-- 바 차트 -->
	<div id="Chartall">

		<!-- 일간 차트 -->
		<div id="Chart1">



			<canvas id="myChart" width="1120%" height="450%"></canvas>
		</div>





		<!-- 주간 차트 -->
		<div id="Chart2">

			<!-- <div id="but2">
                <button id="dadd2">데이터 추가</button>
                <button id="ddel2">데이터 삭제</button>
                </div> -->

			<canvas id="myChart2" width="1120%" height="450%"></canvas>
		</div>





		<!-- 월간 차트 -->
		<div id="Chart3">

			<!-- <div id="but3">
                <button id="dadd3">데이터 추가</button>
                <button id="ddel3">데이터 삭제</button>
            </div> -->


			<canvas id="myChart3" width="1120%" height="450%"></canvas>
		</div>

	</div>









	<script>
		let first = document.querySelector("#first")
		let second = document.querySelector("#second")
		let third = document.querySelector("#third")

		// 일간 주간 월간
		let op1 = document.querySelector("#sel")
		let op2 = document.querySelector("#daily")
		let op3 = document.querySelector("#week")
		let op4 = document.querySelector("#month")

		// 날짜선택
		let days = document.querySelector("#date")
		let weeks = document.querySelector("#weeks")
		let months = document.querySelector("#months")

		// 바 그래프
		const ctx = document.getElementById('myChart').getContext('2d');
		const myChart = new Chart(ctx, {
			
			
			
			data : { 
				labels : [ '06:00~08:00', '08:00~10:00', '10:00~12:00',
						'12:00~14:00	', '14:00~16:00', '16:00~18:00', ],
				datasets : [
					
					<c:forEach var="dto" items="${query}">
						{
							type : 'bar',
							// select 
							label : '${dto.productname}',
							data : [ ${dto.t6_8},
								     ${dto.t8_10},
								     ${dto.t10_12},
								     ${dto.t12_14},
								     ${dto.t14_16},
								     ${dto.t16_18}, ],
							backgroundColor : [ 'rgba(164, 0, 0, 0.43)',
								                'rgba(98, 151, 0, 0.58)',
								                'rgba(98, 151, 158, 0.58)',
								                'rgba(210, 72, 160, 0.4)',
								                'rgba(210, 185, 160, 0.81)',

							],
							borderColor : [ 'rgba(164, 0, 0, 0.43)',
								            'rgba(98, 151, 0, 0.58)',
								            'rgba(98, 151, 158, 0.58)',
								            'rgba(210, 72, 160, 0.4)',
								            

							],
						// borderWidth: 1
						}, 
						</c:forEach>
						
						<c:forEach var="dto" items="${queryid}">
						{
							type : 'bar',
							// select 
							label : '${dto.productname}',
							data : [ ${dto.t6_8},
								     ${dto.t8_10},
								     ${dto.t10_12},
								     ${dto.t12_14},
								     ${dto.t14_16},
								     ${dto.t16_18}, ],
							backgroundColor : [ 'rgba(164, 0, 0, 0.43)',
								                'rgba(98, 151, 0, 0.58)',
								                'rgba(98, 151, 158, 0.58)',
								                'rgba(210, 72, 160, 0.4)',
								                'rgba(210, 185, 160, 0.81)',

							],
							borderColor : [ 'rgba(164, 0, 0, 0.43)',
								            'rgba(98, 151, 0, 0.58)',
								            'rgba(98, 151, 158, 0.58)',
								            'rgba(210, 72, 160, 0.4)',
								            

							],
						// borderWidth: 1
						}, 
						</c:forEach>

						/* {
							type : 'bar',
							// select 값이 부대찌개라면
							label : '밀푀유나베',
							data : [ Math.random() * 10000,
									Math.random() * 10000,
									Math.random() * 10000,
									Math.random() * 10000,
									Math.random() * 10000,
									Math.random() * 10000, ],
							backgroundColor : [ 'rgba(54, 121, 178, 0.33)',

							],
							borderColor : [ 'rgba(54, 121, 178, 0.33)',

							],
						// borderWidth: 1

						}, */

						/* {
							type : 'bar',
							// select 값이 부대찌개라면
							label : '김치찌개',
							data : [ Math.random() * 10000,
									Math.random() * 10000,
									Math.random() * 10000,
									Math.random() * 10000,
									Math.random() * 10000,
									Math.random() * 10000, ],
							backgroundColor : [ 'rgba(54, 121, 217, 0.59)',

							],
							borderColor : [ 'rgba(54, 121, 217, 0.59)',

							],
							// borderWidth: 1

							label : '김치찌개',
							data : [ Math.random() * 10000,
									Math.random() * 10000,
									Math.random() * 10000,
									Math.random() * 10000,
									Math.random() * 10000,
									Math.random() * 10000, ],
							backgroundColor : [ 'rgba(54, 121, 217, 0.42)',

							],
							borderColor : [ 'rgba(54, 121, 217, 0.42)',

							],
						}, */

						/* {
							type : 'bar',
							// select 값이 부대찌개라면
							label : '떡볶이',
							data : [ Math.random() * 10000,
									Math.random() * 10000,
									Math.random() * 10000,
									Math.random() * 10000,
									Math.random() * 10000,
									Math.random() * 10000, ],
							backgroundColor : [ 'rgba(54, 121, 188, 0.75)',

							],
							borderColor : [ 'rgba(54, 121, 188, 0.75)',

							],
							// borderWidth: 1

							label : '떡볶이',
							data : [ Math.random() * 10000,
									Math.random() * 10000,
									Math.random() * 10000,
									Math.random() * 10000,
									Math.random() * 10000,
									Math.random() * 10000, ],
							backgroundColor : [ 'rgba(54, 121, 188, 0.38)',

							],
							borderColor : [ 'rgba(54, 121, 188, 0.38)',

							],
						}, */

						/* {
							type : 'bar',
							// select 값이 부대찌개라면
							label : '곱창전골',
							data : [ Math.random() * 10000,
									Math.random() * 10000,
									Math.random() * 10000,
									Math.random() * 10000,
									Math.random() * 10000,
									Math.random() * 10000, ],
							backgroundColor : [ 'rgba(54, 162, 235, 0.2)',

							],
							borderColor : [ 'rgba(54, 162, 235, 0.2)',

							],
							// borderWidth: 1

							label : '곱창전골',
							data : [ Math.random() * 10000,
									Math.random() * 10000,
									Math.random() * 10000,
									Math.random() * 10000,
									Math.random() * 10000,
									Math.random() * 10000, ],
							backgroundColor : [ 'rgba(54, 121, 178, 0.79)',

							],
							borderColor : [ 'rgba(54, 121, 178, 0.79)',

							],
						}, */

				]

			},
			options : {
				responsive : false,
				responsive : true,
				scales : {
					y : {
						beginAtZero : true
					}
				}
			}

		});

		// 주간 바 그래프
		const ctx2 = document.getElementById('myChart2').getContext('2d');
		const myChart2 = new Chart(ctx2, {

			data : {
				labels : [ '월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '금요일' ],
				datasets : [
						{
							type : 'bar',
							// select 값이 부대찌개라면
							label : '부대찌개',
							data : [ Math.random() * 10000,
									Math.random() * 10000,
									Math.random() * 10000,
									Math.random() * 10000,
									Math.random() * 10000,
									Math.random() * 10000,
									Math.random() * 10000 ],
							backgroundColor : [ 'rgba(54, 162, 235, 0.2)',

							],
							borderColor : [ 'rgba(54, 162, 235, 0.2)',

							],
						// borderWidth: 1

						},

						{
							type : 'bar',
							// select 값이 부대찌개라면
							label : '밀푀유나베',
							data : [ Math.random() * 10000,
									Math.random() * 10000,
									Math.random() * 10000,
									Math.random() * 10000,
									Math.random() * 10000,
									Math.random() * 10000,
									Math.random() * 10000 ],
							backgroundColor : [ 'rgba(54, 121, 178, 0.33)',

							],
							borderColor : [ 'rgba(54, 121, 178, 0.33)',

							],
						// borderWidth: 1

						},

						{
							type : 'bar',
							// select 값이 부대찌개라면
							label : '김치찌개',
							data : [ Math.random() * 10000,
									Math.random() * 10000,
									Math.random() * 10000,
									Math.random() * 10000,
									Math.random() * 10000,
									Math.random() * 10000,
									Math.random() * 10000 ],
							backgroundColor : [ 'rgba(54, 121, 217, 0.59)',

							],
							borderColor : [ 'rgba(54, 121, 217, 0.59)',

							],
							// borderWidth: 1

							label : '김치찌개',
							data : [ Math.random() * 10000,
									Math.random() * 10000,
									Math.random() * 10000,
									Math.random() * 10000,
									Math.random() * 10000,
									Math.random() * 10000,
									Math.random() * 10000 ],
							backgroundColor : [ 'rgba(54, 121, 217, 0.42)',

							],
							borderColor : [ 'rgba(54, 121, 217, 0.42)',

							],
						},

						{
							type : 'bar',
							// select 값이 부대찌개라면
							label : '떡볶이',
							data : [ Math.random() * 10000,
									Math.random() * 10000,
									Math.random() * 10000,
									Math.random() * 10000,
									Math.random() * 10000,
									Math.random() * 10000,
									Math.random() * 10000 ],
							backgroundColor : [ 'rgba(54, 121, 188, 0.75)',

							],
							borderColor : [ 'rgba(54, 121, 188, 0.75)',

							],
							// borderWidth: 1

							label : '떡볶이',
							data : [ Math.random() * 10000,
									Math.random() * 10000,
									Math.random() * 10000,
									Math.random() * 10000,
									Math.random() * 10000,
									Math.random() * 10000,
									Math.random() * 10000 ],
							backgroundColor : [ 'rgba(54, 121, 188, 0.38)',

							],
							borderColor : [ 'rgba(54, 121, 188, 0.38)',

							],
						},

						{
							type : 'bar',
							// select 값이 부대찌개라면
							label : '곱창전골',
							data : [ Math.random() * 10000,
									Math.random() * 10000,
									Math.random() * 10000,
									Math.random() * 10000,
									Math.random() * 10000,
									Math.random() * 10000,
									Math.random() * 10000 ],
							backgroundColor : [ 'rgba(54, 162, 235, 0.2)',

							],
							borderColor : [ 'rgba(54, 162, 235, 0.2)',

							],
							// borderWidth: 1

							label : '곱창전골',
							data : [ Math.random() * 10000,
									Math.random() * 10000,
									Math.random() * 10000,
									Math.random() * 10000,
									Math.random() * 10000,
									Math.random() * 10000,
									Math.random() * 10000 ],
							backgroundColor : [ 'rgba(54, 121, 178, 0.79)',

							],
							borderColor : [ 'rgba(54, 121, 178, 0.79)',

							],
						}, ]

			},
			options : {
				responsive : false,
				responsive : true,
				scales : {
					y : {
						beginAtZero : true
					}
				}
			}

		});

		// 월간 바 그래프
		const ctx3 = document.getElementById('myChart3').getContext('2d');
		const myChart3 = new Chart(ctx3, {

			data : {
				labels : [ '1주차', '2주차', '3주차', '4주차', ],
				datasets : [
						{
							type : 'bar',
							// select 값이 부대찌개라면
							label : '부대찌개',
							data : [ Math.random() * 10000,
									Math.random() * 10000,
									Math.random() * 10000,
									Math.random() * 10000,
									Math.random() * 10000,
									Math.random() * 10000, ],
							backgroundColor : [ 'rgba(54, 162, 235, 0.2)',

							],
							borderColor : [ 'rgba(54, 162, 235, 0.2)',

							],
						// borderWidth: 1

						},

						{
							type : 'bar',
							// select 값이 부대찌개라면
							label : '밀푀유나베',
							data : [ Math.random() * 10000,
									Math.random() * 10000,
									Math.random() * 10000,
									Math.random() * 10000,
									Math.random() * 10000,
									Math.random() * 10000, ],
							backgroundColor : [ 'rgba(54, 121, 178, 0.33)',

							],
							borderColor : [ 'rgba(54, 121, 178, 0.33)',

							],
						// borderWidth: 1

						},

						{
							type : 'bar',
							// select 값이 부대찌개라면
							label : '김치찌개',
							data : [ Math.random() * 10000,
									Math.random() * 10000,
									Math.random() * 10000,
									Math.random() * 10000,
									Math.random() * 10000,
									Math.random() * 10000, ],
							backgroundColor : [ 'rgba(54, 121, 217, 0.59)',

							],
							borderColor : [ 'rgba(54, 121, 217, 0.59)',

							],
							// borderWidth: 1

							label : '김치찌개',
							data : [ Math.random() * 10000,
									Math.random() * 10000,
									Math.random() * 10000,
									Math.random() * 10000,
									Math.random() * 10000,
									Math.random() * 10000, ],
							backgroundColor : [ 'rgba(54, 121, 217, 0.42)',

							],
							borderColor : [ 'rgba(54, 121, 217, 0.42)',

							],
						},

						{
							type : 'bar',
							// select 값이 부대찌개라면
							label : '떡볶이',
							data : [ Math.random() * 10000,
									Math.random() * 10000,
									Math.random() * 10000,
									Math.random() * 10000,
									Math.random() * 10000,
									Math.random() * 10000, ],
							backgroundColor : [ 'rgba(54, 121, 188, 0.75)',

							],
							borderColor : [ 'rgba(54, 121, 188, 0.75)',

							],
							// borderWidth: 1

							label : '떡볶이',
							data : [ Math.random() * 10000,
									Math.random() * 10000,
									Math.random() * 10000,
									Math.random() * 10000,
									Math.random() * 10000,
									Math.random() * 10000, ],
							backgroundColor : [ 'rgba(54, 121, 188, 0.38)',

							],
							borderColor : [ 'rgba(54, 121, 188, 0.38)',

							],
						},

						{
							type : 'bar',
							// select 값이 부대찌개라면
							label : '곱창전골',
							data : [ Math.random() * 10000,
									Math.random() * 10000,
									Math.random() * 10000,
									Math.random() * 10000,
									Math.random() * 10000,
									Math.random() * 10000, ],
							backgroundColor : [ 'rgba(54, 162, 235, 0.2)',

							],
							borderColor : [ 'rgba(54, 162, 235, 0.2)',

							],
							// borderWidth: 1

							label : '곱창전골',
							data : [ Math.random() * 10000,
									Math.random() * 10000,
									Math.random() * 10000,
									Math.random() * 10000,
									Math.random() * 10000,
									Math.random() * 10000, ],
							backgroundColor : [ 'rgba(54, 121, 178, 0.79)',

							],
							borderColor : [ 'rgba(54, 121, 178, 0.79)',

							],
						}, ]

			},
			options : {
				responsive : false,
				responsive : true,
				scales : {
					y : {
						beginAtZero : true
					}
				}
			}

		}); 

		
		
		
		
		
		
		// 바 그래프 끌어오기
		let bar1 = document.querySelector("#Chart1")
		let bar2 = document.querySelector("#Chart2")
		let bar3 = document.querySelector("#Chart3")

		// select change 이벤트
		op1.addEventListener("change", function() {
			console.log("바뀜확인")

			switch (this.value) {

			case "일간":

				console.log("일간")
				first.style.display = "block"
				second.style.display = "none"
				third.style.display = "none"

				bar1.style.display = "block"
				bar2.style.display = "none"
				bar3.style.display = "none"

				days.style.display = "block";
				weeks.style.display = "none";
				months.style.display = "none";
				// but1.style.display = "block"
				// but2.style.display = "none"
				// but3.style.display = "none"

				break;

			case "주간":

				console.log("주간")
				first.style.display = "none"
				second.style.display = "block"
				third.style.display = "none"

				bar1.style.display = "none"
				bar2.style.display = "block"
				bar3.style.display = "none"

				days.style.display = "none";
				weeks.style.display = "block"
				weeks.value = " 2025-02-03 ";
				months.style.display = "none"
				weeks.valueAsDate = new Date("2025-02-03");
				// but1.style.display = "none"
				// but2.style.display = "block"
				// but3.style.display = "none"
				break;
			// 월간 . 주간. 일간으로 바꿨을때도 표 사라지게 하기

			case "월간":

				console.log("월간")

				first.style.display = "none"
				second.style.display = "none"
				third.style.display = "block"

				bar1.style.display = "none"
				bar2.style.display = "none"
				bar3.style.display = "block"

				days.style.display = "none";
				weeks.style.display = "none"
				months.style.display = "block"
				months.valueAsDate = new Date("2025-02-03");

				// but1.style.display = "none"
				// but2.style.display = "none"
				// but3.style.display = "block"

				break;

			}
		})

		// const pie = document.getElementById('myChart4').getContext('2d');
		// const pieChart = new Chart(pie, {

		//     data: {

		//         labels: ['생산율', '불량율'],
		//         datasets: [
		//             {
		//             type: 'pie',
		//             // select 값이 부대찌개라면
		//             label: '부대찌개',
		//             data: [20, 30],
		//             backgroundColor: [
		//                 'rgba(54, 162, 235, 0.2)',

		//             ],
		//             borderColor: [
		//                 'rgba(54, 162, 235, 1)',

		//             ],
		//             borderWidth: 1
		//         },

		//         {
		//             type: 'pie',
		//             // select 값이 부대찌개라면
		//             label: '밀푀유 나베',
		//             data: [40, 50],
		//             backgroundColor: [
		//                 'rgb(93, 201, 178)',

		//             ],
		//             borderColor: [
		//                 'black',

		//             ],
		//             borderWidth: 1
		//         },

		//         {
		//             type: 'pie',
		//             // select 값이 부대찌개라면
		//             label: '김치찌개',
		//             data: [40, 50],
		//             backgroundColor: [
		//                 'rgb(255, 0, 0)',

		//             ],
		//             borderColor: [
		//                 'black',

		//             ],
		//             borderWidth: 1
		//         },
		//     ]
		//     },
		//     options: {responsive: false,
		//         scales: {
		//             y: {
		//                 beginAtZero: true
		//             }
		//         }
		//     }
		// });

		// const doughnut = document.getElementById('myChart7').getContext('2d');
		// const doughnutChart = new Chart(doughnut, {
		//     type: 'doughnut',
		//     data: {
		//         labels: ['부대찌개', '밀푀유나베', '김치찌개', '떡볶이', '곱창전골'],
		//         datasets: [{
		//             label: '# of Votes',
		//             data: [20, 30, 50, 25, 40],
		//             backgroundColor: [
		//                 'rgba(54, 162, 235, 0.2)',

		//             ],
		//             borderColor: [
		//                 'rgba(54, 162, 235, 1)',

		//             ],
		//             borderWidth: 1
		//         }]
		//     },
		//     options: {responsive: false,
		//         scales: {
		//             y: {
		//                 beginAtZero: true
		//             }
		//         }
		//     }
		// });

		// let bar4 = document.querySelector("#Chart4")
		// let bar7 = document.querySelector("#Chart7")

		// let page1 = document.querySelector("#page")
		// page1.addEventListener("click", function() {

		//     bar1.style.display = "block"
		//     bar2.style.display = "none"
		//     bar3.style.display = "none"
		//     bar4.style.display = "none"
		//     bar7.style.display = "none"
		// console.log("입력")

		// })

		// let page2 = document.querySelector("#page2")
		// page2.addEventListener("click", function() {

		//     bar1.style.display = "none"
		//     bar2.style.display = "none"
		//     bar3.style.display = "none"

		//     bar4.style.display = "block"
		//     bar7.style.display = "none"
		//     console.log("입력2")

		// })

		// let page3 = document.querySelector("#page3")
		// page3.addEventListener("click", function() {

		//     bar1.style.display = "none"
		//     bar2.style.display = "none"
		//     bar3.style.display = "none"

		//     bar4.style.display = "none"
		//     bar7.style.display = "block"

		// console.log("입력2")

		// })

		// if(op1 == op2) {
		// days.style.display ="none"
		// months.style.display = "none"
		// weeks.style.display = "block"
		// console.log("오늘")
		// }    else if (op1 == op3) {
		//     days.style.display ="none"
		// months.style.display = "block"
		// weeks.style.display = "none"
		// console.log("주일")
		// } else if(op1 == op4) {
		//     days.style.display ="block"
		// months.style.display = "none"
		// weeks.style.display = "none"
		// console.log("월간")
		// }

		// 조회버튼
		let sele = document.querySelector("#sele")
		sele.addEventListener("click", function() {
			// console.log("안녕하세요")

			// 일간 월간 주간 선택 끌어오기
			let day = document.querySelector("#date").value
			let weeks = document.querySelector("#weeks").value
			let months = document.querySelector("#months").value

			// 일간 월간 주간 달력 끌어오기
			let op1 = document.querySelector("#sel").value
			let op2 = document.querySelector("#daily").value
			let op3 = document.querySelector("#week").value
			let op4 = document.querySelector("#month").value

			console.log(op1)
			console.log(day)
			// console.log(op2)
			// console.log(op3)
			// console.log(op4)

			// let whole = document.createElement("div")
			// //    whole.classList.add("hide")
			// whole.innerHTML = "<div id=space></div>"
			//    document.body.append(whole)
			//    console.log(whole)

			// 검색 끌어오기
			let text = document.querySelector("#text").value
			//    let sp = document.querySelector("#space")

			// 일간 선택시 창 표시
			if (op1 == op2) {

				console.log("def확인")
				//    console.log(def)
				//    def.innerHTML = ""
				//    sp.innerHTML =  "<div id=newdiv>" + "<br> <table border=1>" 

				//                         + "<thead>"

				//                             +"<tr>"
				//                                 +"<th>" + day + "</th>"
				//                                 +"<th>06:00~08:00</th>"
				//                                 +"<th>08:00~10:00</th>"
				//                                 +"<th>10:00~12:00</th>"
				//                                 +"<th>12:00~14:00</th>"
				//                                 +"<th>14:00~16:00</th>"
				//                                 +"<th>16:00~18:00</th>"

				//                             +"</tr>"
				//                           +"</thead>"

				//                           +"<tbody>"

				//                             +"<tr>"
				//                                 +"<td class=item>부대찌개</td>"
				//                                 +"<td>월요일</td>"
				//                                 +"<td>화요일</td>"
				//                                 +"<td>수요일</td>"
				//                                 +"<td>목요일</td>"
				//                                 +"<td>금요일</td>"
				//                                 +"<td>토요일</td>"

				//                             +"</tr>"

				//                             +"<tr>"
				//                                 +"<td class=item>밀푀유 나베</td>"
				//                                 +"<td>월요일</td>"
				//                                 +"<td>화요일</td>"
				//                                 +"<td>수요일</td>"
				//                                 +"<td>목요일</td>"
				//                                 +"<td>금요일</td>"
				//                                 +"<td>토요일</td>"

				//                             +"</tr>"

				//                             +"<tr>"
				//                                 +"<td class=item>김치찌개</td>"
				//                                 +"<td>월요일</td>"
				//                                 +"<td>화요일</td>"
				//                                 +"<td>수요일</td>"
				//                                 +"<td>목요일</td>"
				//                                 +"<td>금요일</td>"
				//                                 +"<td>토요일</td>"

				//                             +"</tr>"

				//                             +"<tr>"
				//                                 +"<td class=item>떡볶이</td>"
				//                                 +"<td>월요일</td>"
				//                                 +"<td>화요일</td>"
				//                                 +"<td>수요일</td>"
				//                                 +"<td>목요일</td>"
				//                                 +"<td>금요일</td>"
				//                                 +"<td>토요일</td>"

				//                             +"</tr>"

				//                             +"<tr>"
				//                                 +"<td class=item>곱창전골</td>"
				//                                 +"<td>월요일</td>"
				//                                 +"<td>화요일</td>"
				//                                 +"<td>수요일</td>"
				//                                 +"<td>목요일</td>"
				//                                 +"<td>금요일</td>"
				//                                 +"<td>토요일</td>"

				//                             +"</tr>"

				//                           +"</tbody>"

				//                        + "</table>"
				//                        + "</div>" 

				//                       let item = document.querySelectorAll(".item")
				//                       for(i=0; i<item.length; i++)
				//                       console.log(item[i])
				//                       console.log("확인")
				//   let con = item[i].innerHTML

				//    if(text == "") {
				//     alert("검색어를 입력해주세요");
				//     // sp.innerHTML = ""
				//    } else if (text == "정답") {
				//     console.log("정답입니다")
				//    } else {
				//      alert("조회된 내용이 없습니다");
				//     //  sp.innerHTML = ""
				//    }       
				//         } 

			}

			// 주간 선택시 창 표시
			else if (op1 == op3) {

				console.log("확인차")
				//             def.innerHTML = ""  
				//             sp.innerHTML = "<br> <table border=1>" 

				//              + "<thead>"

				//        +"<tr>"
				//            +"<th class=item>" + weeks + "</th>"
				//            +"<th>월요일</th>"
				//            +"<th>화요일</th>"
				//            +"<th>수요일</th>"
				//            +"<th>목요일</th>"
				//            +"<th>금요일</th>"
				//            +"<th>토요일</th>"
				//            +"<th>일요일</th>"

				//        +"</tr>"
				//             +"</thead>"

				//      +"<tbody>"

				//        +"<tr>"
				//            +"<td class=item>부대찌개</td>"
				//            +"<td>월요일</td>"
				//            +"<td>화요일</td>"
				//            +"<td>수요일</td>"
				//            +"<td>목요일</td>"
				//            +"<td>금요일</td>"
				//            +"<td>토요일</td>"
				//            +"<td>토요일</td>"

				//        +"</tr>"

				//        +"<tr>"
				//            +"<td class=item>밀푀유 나베</td>"
				//            +"<td>월요일</td>"
				//            +"<td>화요일</td>"
				//            +"<td>수요일</td>"
				//            +"<td>목요일</td>"
				//            +"<td>금요일</td>"
				//            +"<td>토요일</td>"
				//            +"<td>토요일</td>"

				//        +"</tr>"

				//        +"<tr>"
				//            +"<td class=item>김치찌개</td>"
				//            +"<td>월요일</td>"
				//            +"<td>화요일</td>"
				//            +"<td>수요일</td>"
				//            +"<td>목요일</td>"
				//            +"<td>금요일</td>"
				//            +"<td>토요일</td>"
				//            +"<td>토요일</td>"

				//        +"</tr>"

				//        +"<tr>"
				//            +"<td class=item>떡볶이</td>"
				//            +"<td>월요일</td>"
				//            +"<td>화요일</td>"
				//            +"<td>수요일</td>"
				//            +"<td>목요일</td>"
				//            +"<td>금요일</td>"
				//            +"<td>토요일</td>"
				//            +"<td>토요일</td>"

				//        +"</tr>"

				//        +"<tr>"
				//            +"<td class=item>곱창전골</td>"
				//            +"<td>월요일</td>"
				//            +"<td>화요일</td>"
				//            +"<td>수요일</td>"
				//            +"<td>목요일</td>"
				//            +"<td>금요일</td>"
				//            +"<td>토요일</td>"
				//            +"<td>토요일</td>"

				//        +"</tr>"

				//      +"</tbody>"

				//      + "</table>"
				//             console.log("안녕하세요")

				//   let item = document.querySelectorAll(".item")
				//   for(i=0; i<item.length; i++)
				//   console.log(item[i])
				//   console.log("확인")

				//    if(text == "") {
				//     alert("검색어를 입력해주세요");
				//     // sp.innerHTML = ""
				//    } else if (text == "정답") {
				//     console.log("정답입니다")
				//    } else {
				//      alert("조회된 내용이 없습니다");
				//     //  sp.innerHTML = ""
				//    }           

			}
			// 주간 선택 시 창 표시   

			// 월간 선택 시 창 표시
			else if (op1 == op4) {
				//   def.innerHTML = ""
				//   sp.innerHTML =  "<br> <table border=1 id=first>" 

				//     + "<thead>"
				//         +"<tr>"
				//             +"<th class=item>" + months + "</th>"
				//             +"<th>1주차</th>"
				//             +"<th>2주차</th>"
				//             +"<th>3주차</th>"
				//             +"<th>4주차</th>"
				//         +"</tr>"
				//     +"</thead>"

				//     +"<tbody>"

				//         +"<tr>"
				//             +"<td class=item>부대찌개</td>"
				//             +"<td>월요일</td>"
				//             +"<td>화요일</td>"
				//             +"<td>수요일</td>"
				//             +"<td>목요일</td>"

				//         +"</tr>"

				//         +"<tr>"
				//             +"<td class=item>밀푀유 나베</td>"
				//             +"<td>월요일</td>"
				//             +"<td>화요일</td>"
				//             +"<td>수요일</td>"
				//             +"<td>목요일</td>"

				//         +"</tr>"

				//         +"<tr>"
				//             +"<td class=item>김치찌개</td>"
				//             +"<td>월요일</td>"
				//             +"<td>화요일</td>"
				//             +"<td>수요일</td>"
				//             +"<td>목요일</td>"

				//         +"</tr>"

				//         +"<tr>"
				//             +"<td class=item>떡볶이</td>"
				//             +"<td>월요일</td>"
				//             +"<td>화요일</td>"
				//             +"<td>수요일</td>"
				//             +"<td>목요일</td>"

				//         +"</tr>"

				//         +"<tr>"
				//             +"<td class=item>곱창전골</td>"
				//             +"<td>월요일</td>"
				//             +"<td>화요일</td>"
				//             +"<td>수요일</td>"
				//             +"<td>목요일</td>"

				//         +"</tr>"

				//     +"</tbody>"

				// + "</table>"

				//   let ft = sp.querySelector("#first")
				//   console.log(ft)
				//   console.log("테스트용도")
				//   let item = document.querySelectorAll(".item")
				//   for(i=0; i<item.length; i++)
				//   console.log(item[i])
				//   console.log("확인")

				// else  if (text == "밀푀유나베") {
				// console.log("정답아니야")
				// let nabe = document.querySelectorAll(".nabe")
				// for(i=0; i<nabe.length; i++){
				//     console.log(nabe[i])
				//     nabe[i].style.display = "block";
				//     nabe[i].style.border = "1px, solid, red"
				//     // budae[i].style.width = "auto"
				// } 
				// // budae[i].style.display = "none"
				// }

				// 물품 검색시 특정 창 표시

				// else if (text == "부대찌개") {
				// console.log("정답아니야")
				// let budae = document.querySelectorAll(".budae")
				// for(i=0; i<budae.length; i++){
				//     console.log(budae[i])
				//     budae[i].style.display = "block";
				//     budae[i].style.border = "1px, solid, red"

				//     // budae[i].style.width = "auto"
				// } 
				// //  nabe[i].style.display = "none"
				// }  
				// 조회된 내용이 없을 경우 알림창 표시
				//     else {
				//      alert("조회된 내용이 없습니다");
				//     //  sp.innerHTML = ""
				//    }   

				// // 이걸 밖으로 빼야함
				// let nabe = document.getElementById("nabe3")
				// let budae = document.getElementById("budae3")
				// let td = document.querySelector("td")

				//    switch(text) {

				//         case "부대찌개":

				//         console.log("정답아니야")

				//         alert(text + "가 검색되었습니다")

				//         // for(i=0; i<budae.length; i++){
				//         // console.log(budae[i])

				//         // budae[i].style.display = "block";
				//         // budae.style.display = "block";
				//         // budae[i].style.display = "-webkit-inline-box";
				//         // td.style.width = "500px"

				//         // budae[i].style.border = "1px, solid, red"
				//         // nabe.style.display = "none";  // 이것들은 안으로 넣고

				//         // budae[i].style.display = "block";

				//         // console.log(nabe[i])
				//         break;

				//         case "밀푀유나베":

				//         console.log("정답아니야")
				//         alert(text + "가 검색되었습니다")
				//         // let nabe = document.querySelectorAll(".nabe")
				//         // let budae = document.querySelectorAll(".budae")
				//         // for(i=0; i<nabe.length; i++){
				//         // console.log(nabe[i])
				//         // nabe[i].style.display = "block";
				//         // nabe.style.display = "inline";
				//         // nabe[i].style.width = "7500px"
				//         // nabe[i].style.border = "1px, solid, red"
				//         // budae.style.display = "none";        // 쌓이게 하려면 none block 조절

				//         // console.log(budae[i])
				//         // nabe[i].style.display = "block";
				//         break;

				//         case "김치찌개":

				//         console.log("정답아니야")
				//         alert(text + "가 검색되었습니다")
				//         // let nabe = document.querySelectorAll(".nabe")
				//         // let budae = document.querySelectorAll(".budae")
				//         // for(i=0; i<nabe.length; i++){
				//         // console.log(nabe[i])
				//         // nabe[i].style.display = "block";
				//         // nabe.style.display = "inline";
				//         // nabe[i].style.width = "7500px"
				//         // nabe[i].style.border = "1px, solid, red"
				//         // budae.style.display = "none";        // 쌓이게 하려면 none block 조절

				//         // console.log(budae[i])
				//         // nabe[i].style.display = "block";
				//         break;

				//         case "떡볶이":

				//         console.log("정답아니야")

				//         alert(text + "가 검색되었습니다")

				//         // for(i=0; i<budae.length; i++){
				//         // console.log(budae[i])

				//         // budae[i].style.display = "block";
				//         // budae.style.display = "block";
				//         // budae[i].style.display = "-webkit-inline-box";
				//         // td.style.width = "500px"

				//         // budae[i].style.border = "1px, solid, red"
				//         // nabe.style.display = "none";  // 이것들은 안으로 넣고

				//         // budae[i].style.display = "block";

				//         // console.log(nabe[i])
				//         break;

				//         case "곱창전골":

				//         console.log("정답아니야")

				//         alert(text + "가 검색되었습니다")

				//         // for(i=0; i<budae.length; i++){
				//         // console.log(budae[i])

				//         // budae[i].style.display = "block";
				//         // budae.style.display = "block";
				//         // budae[i].style.display = "-webkit-inline-box";
				//         // td.style.width = "500px"

				//         // budae[i].style.border = "1px, solid, red"
				//         // nabe.style.display = "none";  // 이것들은 안으로 넣고

				//         // budae[i].style.display = "block";

				//         // console.log(nabe[i])
				//         break;

				//         // switch의 else값
				//         default :    
				//         alert("조회된 내용이 없습니다");

				//    } 

				// budae.classList.add("budaes")

				//     ft.innerHTML = "<table border=1 id=first>" 

				// + "<thead>"
				//     +"<tr>"

				//         +"<th>" + months + "</th>"
				//         +"<th>1주차</th>"
				//         +"<th>2주차</th>"
				//         +"<th>3주차</th>"
				//         +"<th>4주차</th>"

				//     +"</tr>"
				// +"</thead>"

				//         +"<tbody>"

				//             +"<tr>"

				//                 +"<td class=item>부대찌개</td>"
				//                 +"<td>월요일</td>"
				//                 +"<td>화요일</td>"
				//                 +"<td>수요일</td>"
				//                 +"<td>목요일</td>"

				//             +"</tr>"

				//         +"</tbody>"

				//         + "</table>"    

				//         let tr = document.querySelectorAll(".list")
				//    tr.addEventListener("click", function() {

				//         console.log("클릭확인")
				//             })

				// let del = document.querySelectorAll("#del")
				// for(i=0; i<del.length; i++) 
				// del[i].addEventListener("click", function() {
				// sp.innerHTML = ""
				// console.log("삭제확인")
				//     })

				// let fix = document.querySelectorAll("#fix")
				// for(i=0; i<fix.length; i++) 
				// fix[i].addEventListener("click", function() {
				// console.log("수정확인")

				// let td = document.querySelector("td")
				// if(checked = td) {
				//     console.log("체크확인")

				// }

				// if(text == "부대찌개") {
				//     console.log("안녕하세요")
				//     sp.innerHTML = "<table>" 

				// + "<thead>"

				//     +"<tr>"
				//         +"<th><div id=empty></div></th>"
				//         +"<th>06:00~08:00</th>"
				//         +"<th>08:00~10:00</th>"
				//         +"<th>10:00~12:00</th>"
				//         +"<th>12:00~14:00</th>"
				//         +"<th>14:00~16:00</th>"
				//         +"<th>16:00~18:00</th>"

				//     +"</tr>"
				//   +"</thead>"

				//   +"<tbody>"

				//     +"<tr>"
				//         +"<td>부대찌개</td>"
				//         +"<td>월요일</td>"
				//         +"<td>화요일</td>"
				//         +"<td>수요일</td>"
				//         +"<td>목요일</td>"
				//         +"<td>금요일</td>"
				//         +"<td>토요일</td>"

				//     +"</tr>"

				//     +"</tbody>"           

				//         +"</table>" 
				// }

			}
			//op4

			// let items = document.querySelector("#item")
			//     items.addEventListener("click", function() {
			//     items.classList.add("item")
			//     })    

			// 공백 검색시 알림창 표시
			if (text == "") {
				alert("검색어를 입력해주세요");
				sp.innerHTML = ""

			}

			// 이걸 밖으로 빼야함
			let nabe = document.getElementById("nabe3")
			let budae = document.getElementById("budae3")
			let td = document.querySelector("td")

			switch (text) {

			case "부대찌개":

				console.log("정답아니야")

				alert(text + "가 검색되었습니다")

				// for(i=0; i<budae.length; i++){
				// console.log(budae[i])

				// budae[i].style.display = "block";
				// budae.style.display = "block";
				// budae[i].style.display = "-webkit-inline-box";
				// td.style.width = "500px"

				// budae[i].style.border = "1px, solid, red"
				// nabe.style.display = "none";  // 이것들은 안으로 넣고

				// budae[i].style.display = "block";

				// console.log(nabe[i])
				break;

			case "밀푀유나베":

				console.log("정답아니야")
				alert(text + "가 검색되었습니다")
				// let nabe = document.querySelectorAll(".nabe")
				// let budae = document.querySelectorAll(".budae")
				// for(i=0; i<nabe.length; i++){
				// console.log(nabe[i])
				// nabe[i].style.display = "block";
				// nabe.style.display = "inline";
				// nabe[i].style.width = "7500px"
				// nabe[i].style.border = "1px, solid, red"
				// budae.style.display = "none";        // 쌓이게 하려면 none block 조절

				// console.log(budae[i])
				// nabe[i].style.display = "block";
				break;

			case "김치찌개":

				console.log("정답아니야")
				alert(text + "가 검색되었습니다")
				// let nabe = document.querySelectorAll(".nabe")
				// let budae = document.querySelectorAll(".budae")
				// for(i=0; i<nabe.length; i++){
				// console.log(nabe[i])
				// nabe[i].style.display = "block";
				// nabe.style.display = "inline";
				// nabe[i].style.width = "7500px"
				// nabe[i].style.border = "1px, solid, red"
				// budae.style.display = "none";        // 쌓이게 하려면 none block 조절

				// console.log(budae[i])
				// nabe[i].style.display = "block";
				break;

			case "떡볶이":

				console.log("정답아니야")

				alert(text + "가 검색되었습니다")

				// for(i=0; i<budae.length; i++){
				// console.log(budae[i])

				// budae[i].style.display = "block";
				// budae.style.display = "block";
				// budae[i].style.display = "-webkit-inline-box";
				// td.style.width = "500px"

				// budae[i].style.border = "1px, solid, red"
				// nabe.style.display = "none";  // 이것들은 안으로 넣고

				// budae[i].style.display = "block";

				// console.log(nabe[i])
				break;

			case "곱창전골":

				console.log("정답아니야")

				alert(text + "가 검색되었습니다")

				// for(i=0; i<budae.length; i++){
				// console.log(budae[i])

				// budae[i].style.display = "block";
				// budae.style.display = "block";
				// budae[i].style.display = "-webkit-inline-box";
				// td.style.width = "500px"

				// budae[i].style.border = "1px, solid, red"
				// nabe.style.display = "none";  // 이것들은 안으로 넣고

				// budae[i].style.display = "block";

				// console.log(nabe[i])
				break;

			// switch의 else값
			default:
				alert("조회된 내용이 없습니다");

			}

		})
		// 조회
	</script>


</body>
</html>