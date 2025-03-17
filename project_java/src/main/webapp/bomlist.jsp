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
            width: 50px;
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
        #boodea{
            text-align: center;
            width: 100%;
            margin-bottom: 15px;
        }
        .btn{
            border-radius: 5px;
            background-color: #007bff;
            color: white;
            padding: 5px 10px;
            border: none;
            cursor: pointer;
        }


        @media screen and (max-width: 600px) {

            #back-button {
                width: 60px;
                height: 60px;
            }

            .article {
                margin: 0 0 20px 0;
                font-size: 12px;
            }

            th,
            td {
                font-size: 12px;
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
        <div><h2>${namevalue}</h2></div>
    </div>
    <table id="maintable">
		       <c:forEach var="dto" items="${total}">
			        <tr>
			            <th>${dto.materialname}</th>
			            <th>${dto.price}</th>
			            <th>${dto.unit}</th>
			            <th>${dto.stockquantity}</th>
			            <th>${dto.spec}</th>
			            <th>${dto.supplier}</th>
			            <th>${dto.lotnumber}</th>
			            <th>${dto.warehouse}</th>
			            <th>${dto.partNumber}</th>
			            <th>수정/삭제</th>
			        </tr>
		     </c:forEach>
        <br>
    </table>


    <script>
        window.addEventListener("load", function () {
        


//             // URL에서 ?value=값 부분 가져오기
//             let params = new URLSearchParams(window.location.search);
//             let value = params.get("value"); // 'value' 값 가져오기
//             // console.log("넘어온 값:", value);

//             console.log(document.querySelector("#mid-contain-check"))
//             //뒤로가기버튼
            document.querySelector("#back-button").addEventListener("click", function () {
                window.location.href = "Finished_Product_BOM"
            })




            //아래항목 추가 
        });
    </script>
</body>

</html>