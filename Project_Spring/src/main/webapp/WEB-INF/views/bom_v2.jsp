<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*" %>
<%@ page import="project.dto.*" %>
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

        @media screen and (max-width: 767px) {

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
      
        <table >
            <thead>
                <tr>
                    <th id="name">완제품 이름</th>
                    <th>품번</th>
                    <th>유통기한</th>
                    <th id="chang">보관 창고</th>
                    <th id="jeapoom">완제품 이미지</th>
                
                </tr>
            </thead>
            <tbody id="appendbody">
           </tbody>
          
            
        </table>
    <script>
        window.addEventListener("load", function () {
            search();

            document.querySelector("#search-button").addEventListener("click",search)
                             

         

            function search() {
                //맨처음한번 조회해오기
                let searchValue = document.querySelector("#search-text").value
                //ajax
            const xhr = new XMLHttpRequest();
            xhr.open('get', 'bom_v2_select?processname='+searchValue )

            xhr.setRequestHeader('Content-Type', 'application/json')

            xhr.send()

            xhr.onload = function () {
                let data = (xhr.responseText)
                console.log(xhr.responseText)
                data=JSON.parse(data)
                console.log(data)
                let list = data.list;
                document.querySelector("#appendbody").innerHTML = ` `
                     list.forEach(dto => {
                                            let newdataHtml = document.createElement("tr")
                                        
                                    newdataHtml.innerHTML = `
                                     <td>
                                        <input type="hidden" class="productid" value="\${dto.productid}">
                                        <span class="move">\${dto.productname}</span>
                                    </td>
                                    <td>\${dto.partnumber}</td>
                                    <td>\${dto.expdatedesc}</td>
                                    <td>\${dto.warehouse}</td>
                                    
                                    
                                    <td><img src="download?filename=\${dto.productimage}" ></td>
                                 
                                    `
                                    document.querySelector("#appendbody").append(newdataHtml)


                                
                                 
                                         newdataHtml.querySelector(".move").addEventListener("click",function(e){
                                            
                                            let pvalue = e.target.parentNode.querySelector(".productid").value
                                            console.log(pvalue)
                                            // window.location.href = "Bom_controller?namevalue=" + encodedNamevalue +"&pvalue="+encodedpvalue;

                                        })
                                   
	
                                    
                              
                            })
                        }


                        }







        })
    </script>



</body>

</html>