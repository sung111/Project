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
    <title>생산공정</title>
    <style>
        *{
            margin: 0;
            padding: 0;
        }
        body {
            font-family: Arial, sans-serif;
            width: 100%;
        
        }

        #header-bacor {
            background-color: #007bff;
            border-radius: 20px;
            padding-top: 1px;
            height: 200px;
        }

        #header {
            border: 1px solid white;
            margin-left: 20px;
            width: 80%;



        }

        #header-name {
            border: 1px solid white;
            width: 300px;

            margin: 20px 20px;
            color: white;
            font-size: 40px;
        }

        td,
        th {
            border: 1px solid #ddd;
            border-collapse: collapse;
        }

        th {
            background-color: #007bff;
            color: #ffffff;
           

        }

        .tdf {
            background-color: #007bff;
        }



        .none {
            display: none;
        }

        table {
            width: 100%;
            height: 300px;
            border-collapse: collapse;
            
        }


        .bood {
            width: 90%;
        }

        #c_container {
        
   
            width: 100%;
           
          
        }
        #c_container2{
        	
            width: 100%;
            display: flex;
            justify-content: end;
         	
        }

        .texttotal {
            font-size: 15px;
            width: 95%;
            height: 80%;
        }

        .table-wid {
            width: 10%;
        }

        .table-wid2 {
            width: 30%;
        }

        .table-wid3 {
            width: 15%;
        }

        .table-wid4 {
            width: 30%;
        }

        .table-wid5 {
            width: 15%;
        }

        #title {
            width: 100%;
            text-align: center;
        }

        #title h2 {
            font-weight: bold;
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

        .table-button {
            height: 94%;
            text-align: center;
            
        }
    	#milkit{
    	 margin: 5px;
    	width: 100px;
    	height: 30px;
    	padding: 5px 10px;
    	}
        

        @media screen and (max-width: 600px) {
            td {
                font-size: 12px;
            }

            .table-wid {
                width: 70px;
            }
        }
    </style>
</head>

<body>
    <div id="total">

        <div id="c_container">
            <div id="title">
                <h1>생산공정</h1>
            </div>
            
            <div id="c_container2">
            
             <form method="post" action="ProductionProcess_controller">   
                <select name="select_value" id="milkit">    
                <c:forEach var="dto" items="${productvalue}">             
                <option value="${dto.productid}">${dto.productname}</option>
                </c:forEach>
                
                </select>
                    <input type="submit" class="btn" value="조회">
                    <input type="button" class="btn" id="c1" value="공정 생성">
                  </form>
            </div>
            
        </div>
        <!-- 부대찌개 밀키트  -->
        <div id="table-chiled">
            <table class="tableall" id="budae-jjigae">
                <tr>
                    <th class="table-wid">공정단계</th>
                    <th class="table-wid2">설명</th>
                    <th class="table-wid3">사용장비</th>
                    <th class="table-wid4">위생 기준</th>
                    <th class="table-wid5">수정/삭제</th>
                </tr>
        <c:forEach var="dto" items="${ppdvalue}">
                <tr>
                    <td><span class="spantotal">${dto.processstage}</span>
                    <input type="text" value="${dto.processid}">
                     <input type="text" value="${dto.productid}">
                    <textarea class="texttotal">${dto.processstage}</textarea></td>
                    
                    <td><span class="spantotal">${dto.description}</span>
                    <textarea name="" id="" class="texttotal">${dto.description}</textarea></td>
                    
                    <td><span class="spantotal">${dto.equipment}</span><textarea name="" id=""
                            class="texttotal">${dto.equipment}</textarea></td>
                            
                    <td><span class="spantotal">${dto.hygiene}</span><textarea name=""
                            id="" class="texttotal">${dto.hygiene}</textarea></td>
                            
                            <td class="table-button">
	                            <input type="button" value="수정 " class="du btn">
	                            <input type="button" value="삭제 " class="dd btn">
                                <input type="button" value="확인 " class="uok btn">
                                <input type="button" value="취소 " class="ucan btn">
                            </td>
                    </td>
                </tr>
           </c:forEach>
            </table>
   
        </div>


        <script>

            window.addEventListener("load", function () {
            document.querySelectorAll(".texttotal").forEach(el => el.classList.add("none"));
            document.querySelectorAll(".uok").forEach(el => el.classList.add("none"));
            document.querySelectorAll(".ucan").forEach(el => el.classList.add("none"));
        








            })
        </script>
</body>

</html>