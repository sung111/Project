<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>standard</title>

<style>
* {
	margin: 0;
	padding: 0;
}

body {
	width: 95vw;
	margin: 0 auto;
}

#top-contain {
	border: 1px solid black;
	display: flex;
	justify-content: end;
	align-items: center;
}

.crud, .button {
	border: 1px solid black;
	border-radius: 10px;
	height: 50px;
	width: 80px;
	background-color: #0056b3;
	color: white;
}

#mid-contain {
	border: 1px solid black;
	margin: 20px 0 0 0;
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
	border: 1px solid black;
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

#check-option {
	width: 200px;
	height: 50px;
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
	padding: 5px 10px;
	border: none;
	cursor: pointer;
	margin: 5px;
}

.poom {
	width: 10%;
}

/* 넓이에따른 if문 0~600px까지만 적용  */
@media screen and (max-width: 600px) {
	.crud, .button {
		height: 30px;
		width: 30px;
	}
	#check-option- {
		width: 100px;
		height: 20px;
	}
	#check-option-button {
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
</style>
</head>

<body>

	<div id="mid-contain">
		<div class="mid-contain-article" id="id1">
			제품명:<input type="text" class="mid-data">
		</div>
		<div class="mid-contain-article" id="id2">
			가격:<input type="text" class="mid-data">
		</div>
		<div class="mid-contain-article" id="id3">
			규격:<input type="text" class="mid-data">
		</div>
		<div class="mid-contain-article" id="id4">
			단위:<input type="text" class="mid-data">
		</div>
		<br>
		<div class="mid-contain-article" id="id5">
			공급업체:<input type="text" class="mid-data">
		</div>
		<div class="mid-contain-article" id="id6">
			LotNo:<input type="text" class="mid-data">
		</div>
		<div class="mid-contain-article" id="id7">
			창고위치:<input type="text" class="mid-data">
		</div>
		<div class="mid-contain-article " id="id8">
			<input type="button" value="생성" id="c"> <input type="button"
				value="확인" id="u"> <input type="button" value="취소" id="ud">
			<input type="button" value="생성" id="c2"> <input type="button"
				value="확인" id="u2"> <input type="button" value="취소" id="ud2">
		</div>
	</div>
	<div id="top-contain">

		<select name="option" id="check-option">
			<option value="1">원재료 조회</option>
			<option value="2">완재품 조회</option>
			<option value="3">전체 조회</option>

		</select>

		<!-- <input type="button" value="생성" class="button" id="c"> -->

	</div>


	<div id="main-contain">
		<!-- 원재료 테이블 -->
		<table class="start-table">
			<tr>
				<th class="manu-name poom">제품명</th>
				<th>가격</th>
				<th>규격</th>
				<th>단위</th>
				<th>공급업체</th>
				<th>품번</th>
				<th class="lotno">LotNo</th>
				<th>창고위치</th>
				<th class="ud">수정/삭제</th>
			</tr>
			<tr>
				<td>aaa</td>
				<td>aaa</td>
				<td>aaa</td>
				<td>aaa</td>
				<td>aaa</td>
				<td>aaa</td>
				<td>aaa</td>
				<td>aaa</td>
				<td>
					<form method="post" action="controller">
						<!-- 			<input type="summit" -->
					</form>
				</td>
			</tr>
			<br>
		</table>
	</div>
	<script>
		document.querySelector("#c").classList.remove("none")
		document.querySelector("#u").classList.add("none")
		document.querySelector("#ud").classList.add("none")
		document.querySelector("#c2").classList.add("none")
		document.querySelector("#u2").classList.add("none")
		document.querySelector("#ud2").classList.add("none")
	</script>


</body>
</html>