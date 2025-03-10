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

        .crud,
        .button {
   
            border-radius: 10px;
            height: 50px;
            width: 80px;
            background-color: #0056b3;
            color: white;
        }

        #mid-contain {
            border: 1px solid  #007bff;
            border-radius: 20px;
         
        }
        #mid-contain2 {
            border: 1px solid  #007bff;
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
        th{
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
        input[type=button]{
            border-radius: 5px;
            background-color: #007bff;
            color: white;
            padding: 5px 10px;
            border: none;
            cursor: pointer;
            margin: 5px;
        }
        .poom{
            width: 10%;
        }
        #radios{
            margin-left: 20px;
        }
       




        /* 넓이에따른 if문 0~600px까지만 적용  */
        @media screen and (max-width: 600px) {

            .crud,
            .button {
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
        #title{
            text-align: center;
        }
       
        #materials_hide:hover{
            background-color: #d9d9d9;
        }
        #finished_hide:hover{
            background-color: #d9d9d9;
        }
    </style>
</head>

<body>
    <div id="title">
    <h1>원재료/완제품 조회</h1>
    </div>
    <div id="top-contain">
        <select name="option" id="check-option">
            <option value="1">원재료 조회</option>
            <option value="2">완재품 조회</option>
            <option value="3">전체 조회 </option>
            
        </select>
        <input type="button" value="원재료생성" id="materials_hide" >
        <input type="button" value="완제품생성" id="finished_hide" >
        
        <!-- <input type="button" value="생성" class="button" id="c"> -->

    </div>
    <div id="mid-contain">
        <div class="mid-contain-article" id="materials_id1"> 제품명:<input type="text" class="mid-data" name="productname"> </div>
        <div class="mid-contain-article" id="materials_id2"> 가격:<input type="text" class="mid-data" name="price"> </div>
        <div class="mid-contain-article" id="materials_id3"> 규격:<input type="text" class="mid-data name="standard"> </div>
        <div class="mid-contain-article" id="materials_id4"> 단위:<input type="text" class="mid-data name="unit"> </div>
        <br>
        <div class="mid-contain-article" id="materials_id5"> 공급업체:<input type="text" class="mid-data name="supplier"> </div>
        <div class="mid-contain-article" id="materials_id6"> 품번:<input type="text" class="mid-data name="Product number"> </div>
        <div class="mid-contain-article" id="materials_id7"> LotNo:<input type="text" class="mid-data name="LotNo"> </div>
        <div class="mid-contain-article" id="materials_id8"> 창고위치:<input type="text" class="mid-data name="location"> </div>
        
        <div class="mid-contain-article " id="materials_id9">
        <form method="get" action="Part_code">
            <input type="submit" value="생성" id="materials_c">
        </from>
            <input type="button" value="확인" id="materials_u">
            <input type="button" value="취소" id="materials_ud">
            <input type="button" value="생성" id="materials_c2">
            <input type="button" value="확인" id="materials_u2">
            <input type="button" value="취소" id="materials_ud2">
        </div>
    </div>
    
    <div id="mid-contain2">
        <div class="mid-contain-article" id="finished_id1"> 완제품명:<input type="text" class="mid-data"> </div>
        <div class="mid-contain-article" id="finished_id2"> 품번:<input type="text" class="mid-data"> </div>
        <div class="mid-contain-article" id="finished_id4"> 보관창고위치:<input type="text" class="mid-data"> </div>
        <br>
        <div class="mid-contain-article" id="finished_id5"> 가격:<input type="text" class="mid-data"> </div>
        <div class="mid-contain-article" id="finished_id6"> 규격:<input type="text" class="mid-data"> </div>
        <div class="mid-contain-article" id="finished_id7"> 단위:<input type="text" class="mid-data"> </div>
        <div class="mid-contain-article" id="finished_id8"> LotNo:<input type="text" class="mid-data"> </div>
        <div class="mid-contain-article " id="finished_id9">
            <input type="button" value="생성" id="finished_c">
            <input type="button" value="확인" id="finished_u">
            <input type="button" value="취소" id="finished_ud">
            <input type="button" value="생성" id="finished_c2">
            <input type="button" value="확인" id="finished_u2">
            <input type="button" value="취소" id="finished_ud2">
        </div>
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


    <div id="main-contain">
        <!-- 원재료 테이블 -->
        <table class="start-table">
            <tr>
                <th class="manu-name poom" >제품명</th>
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
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td>
<!--                     <input type="button" value="수정" > -->
                </td>
            </tr>
            <br>
        </table>
      
    </div>
    <script>
        window.addEventListener("load", function () {

            //처음 항목 출력 
            document.querySelector("#materials_c").classList.remove("none")
            document.querySelector("#materials_u").classList.add("none")
            document.querySelector("#materials_ud").classList.add("none")
            document.querySelector("#materials_c2").classList.add("none")
            document.querySelector("#materials_u2").classList.add("none")
            document.querySelector("#materials_ud2").classList.add("none")
            
            document.querySelector("#finished_c").classList.remove("none")
            document.querySelector("#finished_u").classList.add("none")
            document.querySelector("#finished_ud").classList.add("none")
            document.querySelector("#finished_c2").classList.add("none")
            document.querySelector("#finished_u2").classList.add("none")
            document.querySelector("#finished_ud2").classList.add("none")
            
            document.querySelector("#mid-contain").classList.add("none")
            document.querySelector("#mid-contain2").classList.add("none")

            document.querySelector("#materials_hide").addEventListener("click", function () {
                document.querySelector("#mid-contain").classList.remove("none")
                document.querySelector("#mid-contain2").classList.add("none")
            })
              document.querySelector("#finished_hide").addEventListener("click", function () {
                document.querySelector("#mid-contain").classList.add("none")
                document.querySelector("#mid-contain2").classList.remove("none")
               

            })

          

        
        })
    </script>
</body>

</html>