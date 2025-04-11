<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>완제품 관리</title>
    <style>
        *{
            margin: 0;
            padding: 0;
        }
        body {
            font-family: Arial, sans-serif;
            text-align: center;
        }

        .container {
            width: 100%;
            margin: 0 auto;
        }

        .form-group {
            border: 1px solid #007bff;
            border-radius: 20px;
            margin-bottom: 20px;
        }

        input,
        button {
            padding: 10px;
            margin: 5px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th,
        td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
        }


        th {
            color: #ffffff;
            background-color: #f4f4f4;
        }

        img {
            width: 80px;
            height: 80px;
            object-fit: cover;
        }

        .btn {
            border-radius: 5px;
            background-color: #007bff;
            color: white;
            padding: 5px 10px;
            border: none;
            cursor: pointer;
        }

        th {
            background-color: #007bff;
        }

        .move {
            text-decoration: underline;
        }

        .move:hover {
            font-weight: bold;
            cursor: pointer;
        }

        .none {
            display: none;
        }

        #name {
            width: 12%;
        }

        .ctext {
            width: 100px;
            height: 8px;
        }

        .nonemove {
            position: absolute;
            right: 5000px;
        }
        #title_insert{
            border: 1px solid #007bff;
            margin-bottom: 20px;
            display: flex;
            justify-content: end;
            align-items: center;
        }
        .title_margin{
            border: 1px solid black;
            width: 300px;
            margin-right: 20px;
            display: flex;
            justify-content: space-around;
        }
        .title_margin1{
            border: 1px solid black;
            width: 200px;
            margin-right: 20px;
            display: flex;
            justify-content: space-around;
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
                font-size: 10px;
            }
            .btn-parent{
                display: flex;
            }
            .btn{
                width: 50px;
                height: 30px;
                font-size: 5px;
            }
          .ctext{
            width: 60px;
            font-size: 8px;
          }
          .cfile{
           
            margin: 0;
            /* width: 20px; */
            font-size: 6px;
          }
          #jeapoom{
            width: 20px;
          }
          .cselct{
            width: 20px;
          }
          table{
            width: 100%;
          }
          body{
            margin: 0px;
          }
          #chang{
            width: 50px;
          }
        
        }
    </style>
</head>

<body>
    <div class="container">
        
        <div class="form-group">
            <h1>완제품 관리</h1>
            <label for="search">완제품 이름</label>
            <input type="text" id="search-text" placeholder="검색할 완제품 입력">
            <button class="btn" id="search-button">검색</button>
        </div>
      
        <table id="appendbody">
            <thead>
                <tr>
                    <th id="name">완제품 이름</th>
                    <th>품번</th>
                    <th>유통기한</th>
                    <th id="chang">보관 창고</th>
                    <th id="jeapoom">완제품 이미지</th>
                
                </tr>
            </thead>
            <c:forEach var="dto" items="${slectall}">
          
                <tr>
                    <td>
                    	<input type="hidden" value="${dto.productid}" class="productid"></input>
                        <div class="value move">${dto.productname}</div>
                        
                    </td>
                    <td>
                        <div>${dto.partnumber}</div>
                    </td>
                    <td>
                        <div class="value hide">${dto.expdatedesc}</div>
                    </td>
                    <td>
                        <div class="value hide">${dto.warehouse}</div> 
                    </td>
                    <td><img src="img/${dto.productimage}" alt="${dto.productname}" class="imgg">
                
                    </td>
                 
                </tr>
              </c:forEach>

    <script>
        window.addEventListener("load", function () {
           
            let moves = document.querySelectorAll(".move")
            for(let i =0; i<moves.length; i++){
                moves[i].addEventListener("click",function(e){
                	
              		let pvalue = e.target.parentNode.querySelector(".productid").value
                    let namevalue = this.textContent; 
                    const encodedNamevalue = encodeURIComponent(namevalue);
                    const encodedpvalue= encodeURIComponent(pvalue);
                    window.location.href = "Bom_controller?namevalue=" + encodedNamevalue +"&pvalue="+encodedpvalue;

                })
            }
	









        })
    </script>



</body>

</html>