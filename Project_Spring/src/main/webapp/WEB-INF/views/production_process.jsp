<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*" %>
<%@ page import="project.dto.*" %>
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
        tr{
        height: 30px;
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
             align-items: center;
         	
        }
        .btncenter{
         display: flex;
         justify-content: end;
          align-items: center;
         
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
            height: 50px;
        }

        .table-button {
/*          height:60px; */
          display: flex;
           justify-content: center;
           align-items: center;
            
        }
    	#milkit{
    	 margin: 5px;
    	width: 150px;
    	height: 30px;
    	padding: 5px 10px;
    	}
    	.tableall{
    	width: 100%;
    	}
	    #newtable{
	    height: 30px;
	    }
	    
	
        

        @media screen and (max-width: 767px) {
            td {
                font-size: 11px;
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
              
                <select name="select_value" id="milkit">    
                <c:forEach var="dto" items="${list}">    

                <option value="${dto.productid}" > ${dto.productname}</option>
                </c:forEach>
                
                </select>
           			
               <c:if test="${Field == 'ADMIN'}">	
                    <input type="button" class="btn" id="c1" value="공정 생성" >
                    </c:if>
                    

            </div>
            
        </div>
        <!-- 부대찌개 밀키트  -->
        <div id="table-chiled">
            <table class="tableall" id="defult">
                <tr>
                    <th class="table-wid">공정단계</th>
                    <th class="table-wid2">설명</th>
                    <th class="table-wid3">사용장비</th>
                    <th class="table-wid4">위생 기준</th>
                    <c:if test="${Field == 'ADMIN'}">	
                    <th class="table-wid5">수정/삭제</th>
                    </c:if>
                </tr>
      
        <c:forEach var="dto" items="${ppdvalue}">
                <tr>
              <form method="post" action="ProductionProcess_controller" >
                    <td style="width:10.1%;"><span class="spantotal">${dto.processstage}</span>
                    <input type="hidden" value="${dto.processid}" name="processid">
                     <input type="hidden" value="${dto.productid}">
                    <textarea class="texttotal" name="processstage">${dto.processstage}</textarea></td>
                    
                    <td style="width:29%;"><span class="spantotal">${dto.description}</span>
                    <textarea name="description" id="" class="texttotal">${dto.description}</textarea></td>
                    
                    <td style="width:15%;"><span class="spantotal">${dto.equipment}</span><textarea name="equipment" id=""
                            class="texttotal">${dto.equipment}</textarea></td>
                            
                    <td style="width:30%;"><span class="spantotal">${dto.hygiene}</span><textarea name="hygiene"
                            id="" class="texttotal">${dto.hygiene}</textarea></td>
                            <c:if test="${Field == 'ADMIN'}">
                            <td class="table-button">
                            	<input type="hidden"  value="update" name="type">
	                            <input type="button" value="수정 " class="updat btn ">
                                <input type="submit" value="확인 " class="uok btn">
                                <input type="button" value="취소 " class="ucan btn">
	                        </form>
	                        <form method="post" action="ProductionProcess_controller">
	                            <input type="hidden"  value="delet" name="type">
	                            <input type="hidden"  value="${dto.processid}" name="processid_value">
	                            <input type="submit" value="삭제 " class="delet btn ">
                            </form>
                            </td>
                            </c:if>
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
        
            // document.querySelector("#c1").addEventListener("click",function(e){
            //     newtable = document.createElement("tr")
            //     newtable.innerHTML = `
            //     <td id="newtd" colspan="5">
            //     	  <form method="post" action="ProductionProcess_controller">   
            //     	  <table class="tableall" id="newtable">
            //     	  <tr>
            //                 <td style="width:10.2%;"><textarea  name="new_processstage">기본값필요</textarea></td>
            //                 <td style="width:30%;"><textarea  name="new_description">기본값필요</textarea></td>
            //                 <td style="width:15%;"><textarea  name="new_equipment">기본값필요</textarea></td>
            //                 <td style="width:30%;"><textarea  name="new_hygiene">기본값필요</textarea></td>
            //                 <td id="td_5" class="table-button">
            //                 	<input type="hidden" value="" name="new_pro_value" id="new_pro_value">
            //                 	<input type="hidden" value="new" name="type" id="new_pro_value">
                      
            //                     <input type="button" value="삭제"	 class="dd btn">
            //                     <input type="button" value="확인 " class="uok btn">
            //                 </td>
            //           	  </tr>
            //              </table>
            //             </form>
            //             </td>
            //                 `
          
        
                            
                            
            //     	newtable.querySelector(".dd").addEventListener("click",function(ev){
            //     	console.log(ev.target.parentNode);
            //     	ev.target.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.remove();
               
            //     	})
                	
            //     	newtable.querySelector(".uok").addEventListener("click",function(ev){
            //     		let value = document.querySelector("#milkit").value
            //     		console.log("value값은 " ,value);
            //     		let new_pro_value = ev.target.parentNode.querySelector("#new_pro_value");
            //     		new_pro_value.value = value
            //     		// 여기
            //     		this.type = "submit";
            //     	})
                	
            //      let defult = document.querySelector("#defult")
            //     defult.append(newtable);
             
            // })

				document.querySelector("#milkit").addEventListener("change",function(e){
                // 선택된 option의 value 값을 가져옵니다
                if(this.value == "null"){
                	console.log("값이 0입니다")
                }
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
               
                })
				
                let updats = document.querySelectorAll(".updat")
				for(let i=0; i<updats.length; i++){
					updats[i].addEventListener("click",function(e){
						console.log(e.target.parentNode.parentNode.parentNode)
						e.target.parentNode.querySelector(".uok").classList.remove("none")
						e.target.parentNode.querySelector(".ucan").classList.remove("none")
						e.target.parentNode.parentNode.querySelector(".delet").classList.add("none")
						e.target.classList.add("none")
						let texttotals = e.target.parentNode.parentNode.querySelectorAll(".texttotal")
						let spantotals = e.target.parentNode.parentNode.querySelectorAll(".spantotal")
						for(let i=0; i<texttotals.length; i++){
							texttotals[i].classList.remove("none")
							spantotals[i].classList.add("none")
							
						}
						e.target.parentNode.querySelector(".ucan").addEventListener("click",function(ev){
							ev.target.parentNode.querySelector(".uok").classList.add("none")
							ev.target.classList.add("none")
							ev.target.parentNode.querySelector(".updat").classList.remove("none")
							ev.target.parentNode.parentNode.querySelector(".delet").classList.remove("none")
							console.log(ev.target.parentNode.parentNode)
							
							let texttotals = ev.target.parentNode.parentNode.querySelectorAll(".texttotal")
							let spantotals = ev.target.parentNode.parentNode.querySelectorAll(".spantotal")
							for(let i=0; i<texttotals.length; i++){
								texttotals[i].classList.add("none")
								spantotals[i].classList.remove("none")
								
							}
						})
					})
				}
			


            })
        </script>
</body>

</html>