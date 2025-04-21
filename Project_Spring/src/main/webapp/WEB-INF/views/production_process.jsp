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
            width: 90%;
            height: 80%;
        }

        .table-wid {
            width: 10%;
        }

        .table-wid2 {
            width: 25%;
        }

        .table-wid3 {
            width: 15%;
        }

        .table-wid4 {
            width: 25%;
        }

        .table-wid5 {
            width: 10%;
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
     

       

    	#milkit{
    	 margin: 5px;
    	width: 150px;
    	height: 30px;
    	padding: 5px 10px;
    	}
    	.tableall{
    	width: 100%;
        text-align: center;
    	}
	    #newtable{
	    height: 30px;
	    }
	    
        .table-button{
          text-align: center;
          height: 100%;
        }
        

        @media screen and (max-width: 767px) {
            td {
                font-size: 11px;
            }

            .table-wid {
                width: 70px;
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

            font-size: 10px;

            
            }
            .table-wid5 {
                min-width: 110px;
            }
            .texttotal{
                width: 80%;
             
                font-size: 8px;
                padding: 5px;
            
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
                <c:forEach var="dto" items="${plist}">    

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
                <thead>
                    <tr id="top-title">
                        <th class="table-wid">공정단계</th>
                        <th class="table-wid2">설명</th>
                        <th class="table-wid3">사용장비</th>
                        <th class="table-wid4">위생 기준</th>
                        <c:if test="${Field == 'ADMIN'}">	
                        <th class="table-wid5">수정/삭제</th>
                        </c:if>
                    </tr>
                </thead>

                 <tbody id="new-tbody">


                </tbody>

            </table>
   
        </div>


        <script>

            window.addEventListener("load", function () {
                console.log("페이지 로드 완료")
                selectfun();
                document.querySelector("#milkit").addEventListener("change",selectfun)
                
               
		
                
                //공정생성 클릭 이벤트
                document.querySelector("#c1").addEventListener("click",function(e){
                	console.log("공정생성 클릭")


                        let newbody = document.createElement("tr")
                            newbody.setAttribute("class", "article")
                            newbody.innerHTML = `
                            <td >
                            <textarea class="texttotal"id="text1" >값을 입력해주세요</textarea>   
                            </td>                   
                            <td >
                            <textarea class="texttotal" id="text2">값을 입력해주세요</textarea>   
                            </td>                   
                            <td >
                            <textarea class="texttotal" id="text3" >값을 입력해주세요</textarea>   
                            </td>                   
                            <td >
                            <textarea class="texttotal" id="text4" >값을 입력해주세요</textarea>   
                            </td>                   
                            <td class="table-button">
                                <input type="button" value="확인 " class="newupdat btn ">
                                <input type="submit" value="취소 " class="delet btn ">
                            </td>
                            `

                            document.querySelector("#new-tbody").append(newbody)

                            newbody.querySelector(".newupdat").addEventListener("click",(ev)=>{
                                console.log(ev.target.parentNode.parentNode.querySelector("#text1").value)
                                let text1 = ev.target.parentNode.parentNode.querySelector("#text1").value
                                let text2 = ev.target.parentNode.parentNode.querySelector("#text2").value
                                let text3 = ev.target.parentNode.parentNode.querySelector("#text3").value
                                let text4 = ev.target.parentNode.parentNode.querySelector("#text4").value
                                console.log( document.querySelector("#milkit").value)
                                let productid = document.querySelector("#milkit").value
                          
                                if(text1.trim() == ""){
                                    alert("공정단계는 필수입니다")
                                }else if(text2.trim() == ""){
                                    alert("설명은 필수입니다")
                                }else if(text3.trim() == ""){
                                    alert("사용장비는 필수입니다")
                                }else if(text4.trim() == ""){
                                    alert("위생기준은 필수입니다")
                                }else{
                                    dto ={
                                        processstage : text1,
                                        description : text2,
                                        equipment : text3,
                                        hygiene : text4,
                                        productid : productid
                                    }


                                    const xhr = new XMLHttpRequest();
                                    xhr.open('post','production_process_insert')
                                    xhr.setRequestHeader('Content-Type', 'application/json')
                                    xhr.send(JSON.stringify(dto))
                                    xhr.onload = function(){
                                        let data = JSON.parse(xhr.responseText)
                                        console.log(data)
                                        if(data == 1){
                                            alert("공정 생성 완료")
                                          
                                            selectfun();
                                           
                                        }else if (data == 0){
                                            alert("공정 생성 실패")
                                        }
                               
                                    }

                                
                                
                                
                                }   
                            })
                            //공정 생성 취소버튼 
                            newbody.querySelector(".delet").addEventListener("click",(ee)=>{
                                console.log("취소버튼 클릭")
                                selectfun();
                            })

                })
			
               


                function selectfun(){
                // 선택된 option의 value 값을 가져옵니다
                    console.log("값은 ",document.querySelector("#milkit").value)
                    // ajax
                    const xhr = new XMLHttpRequest();
                    xhr.open('get', 'production_process_view?select_value='+document.querySelector("#milkit").value)
                    xhr.setRequestHeader('Content-Type', 'application/json')
                    xhr.send()
                    xhr.onload = function () {
                            let data = JSON.parse(xhr.responseText);
                            console.log(data)
                            let deview = data.Descriptionlist;
                            document.querySelector("#new-tbody").innerHTML = ``
                            deview.forEach(dto => {
                                        let DescripBody = document.createElement("tr")
                                        DescripBody.setAttribute("class", "article")
                                        DescripBody.innerHTML = `
                                            <td style="width:10.1%;">
                                                <span class="spantotal">\${dto.processstage}</span>
                                              </td>
                                            <td style="width:29%;">
                                                <span class="spantotal">\${dto.description}</span>
                                            </td>
                                            <td style="width:15%;">
                                                <span class="spantotal">\${dto.equipment}</span>
                                                </td> 
                                            <td style="width:30%;">
                                                <span class="spantotal">\${dto.hygiene}</span>
                                             </td>
                                                `
                                         if(data.Field == 'ADMIN')
                                            {DescripBody.innerHTML +=`
                                                <td class="table-button">
                                                    <input type="hidden"  value="update" name="type">
                                                    <input type="button" value="수정 " class="updat btn ">
                                                    <input type="hidden"  value="\${dto.processid}"  id="processid_value">
                                                    <input type="submit" value="삭제 " class="delet btn ">
                                                </td>
                                                `
                                            }else{DescripBody.innerHTML +=`<td></td>`}
                                        document.querySelector("#new-tbody").append(DescripBody)
                                        //삭제 버튼 이벤트 만들기
                                        DescripBody.querySelector(".delet").addEventListener("click", function(e){
                                          console.log("삭제값",e.target.parentNode.querySelector("#processid_value").value)
                                           let dto = {
                                            processid : e.target.parentNode.querySelector("#processid_value").value
                                           }
                                            const xhr = new XMLHttpRequest();
                                            xhr.open('put','production_process_delete')
                                            xhr.setRequestHeader('Content-Type', 'application/json')
                                            xhr.send(JSON.stringify(dto))
                                            xhr.onload = function(){
                                                let data = JSON.parse(xhr.responseText)
                                                console.log(data)
                                                if(data == 1){
                                                    alert("삭제 완료")
                                                
                                                    selectfun();
                                                
                                                }else if (data == 0){
                                                    alert("삭제 실패")
                                                }
                                    
                                            }
                                        
                                        })

                                        //수정  버튼 이벤트 만들기
                                        let update = DescripBody.querySelector(".updat")
                                        DescripBody.querySelector(".updat").addEventListener("click", function(e){
                                            
                                            //수정버튼 누르면 프로세서 id를 가지고 한줄만 그리기
                                            console.log("수정버튼 클릭",e.target.parentNode.querySelector("#processid_value").value)
                                            const xhr = new XMLHttpRequest();
                                                xhr.open('get','production_process_one_line?processid='+e.target.parentNode.querySelector("#processid_value").value)
                                                xhr.setRequestHeader('Content-Type', 'application/json')
                                                xhr.send()
                                                xhr.onload = function(){
                                                    let data = JSON.parse(xhr.responseText)
                                                    console.log(data)
                                                
                                                    console.log(e.target.parentNode.parentNode)
                                                    // e.target.parentNode.parentNode.innerHTML = ``
                                                    // console.log(e.target.parentNode.parentNode)
                                                    data.forEach(dto => {
                                                        e.target.parentNode.parentNode.innerHTML = `
                                                                                    <tr>
                                                                                        <td >
                                                                                        <textarea class="texttotal"id="text1" >\${dto.processstage}</textarea>   
                                                                                        </td>                   
                                                                                        <td >
                                                                                        <textarea class="texttotal" id="text2">\${dto.description}</textarea>   
                                                                                        </td>                   
                                                                                        <td >
                                                                                        <textarea class="texttotal" id="text3" >\${dto.equipment}</textarea>   
                                                                                        </td>                   
                                                                                        <td>
                                                                                        <textarea class="texttotal" id="text4" >\${dto.hygiene}</textarea>   
                                                                                        </td>                   
                                                                                        <td class="table-button">
                                                                                      
                                                                                            <input type="hidden"  value="\${dto.processid}"  id="processid_value">
                                                                                            <input type="button" value="확인 " class="newupdat btn ">
                                                                                            <input type="submit" value="취소 " class="can btn ">
                                                                                        </td>
                                                                                    </tr>
                                                                                        `     
                                                                                        //취소버튼 이벤트
                                                                                        document.querySelector(".can").addEventListener("click",function(ee){
                                                                                            selectfun();
                                                                                        })
                                                                                   
                                                                                  
                                                                                            
                                                                                       
                                                                                    // })
        
                                                                                    DescripBody.querySelector(".newupdat").addEventListener("click",function(ee){
                                                                                        let text1 = ee.target.parentNode.parentNode.querySelector("#text1").value
                                                                                        let text2 = ee.target.parentNode.parentNode.querySelector("#text2").value
                                                                                        let text3 = ee.target.parentNode.parentNode.querySelector("#text3").value
                                                                                        let text4 = ee.target.parentNode.parentNode.querySelector("#text4").value
                                                                                        let processid = ee.target.parentNode.querySelector("#processid_value").value
                                                                                        console.log("-----",text1,text2,text3,text4,processid)
                                                                                      
                                                                                        let productid = document.querySelector("#milkit").value
                                                                                
                                                                                        if(text1.trim() == ""){
                                                                                            alert("공정단계는 필수입니다")
                                                                                        }else if(text2.trim() == ""){
                                                                                            alert("설명은 필수입니다")
                                                                                        }else if(text3.trim() == ""){
                                                                                            alert("사용장비는 필수입니다")
                                                                                        }else if(text4.trim() == ""){
                                                                                            alert("위생기준은 필수입니다")
                                                                                        }else{
                                                                                            dto ={
                                                                                                processstage : text1,
                                                                                                description : text2,
                                                                                                equipment : text3,
                                                                                                hygiene : text4,
                                                                                                processid : processid
                                                                                            }
        
        
                                                                                            const xhr = new XMLHttpRequest();
                                                                                            xhr.open('put','production_process_update')
                                                                                            xhr.setRequestHeader('Content-Type', 'application/json')
                                                                                            xhr.send(JSON.stringify(dto))
                                                                                            xhr.onload = function(){
                                                                                                let data = JSON.parse(xhr.responseText)
                                                                                                console.log(data)
                                                                                                if(data == 1){
                                                                                                    alert("공정 수정 완료")
                                                                                                
                                                                                                    selectfun();
                                                                                                
                                                                                                }else if (data == 0){
                                                                                                    alert("공정 수정 실패")
                                                                                                }
                                                                                    
                                                                                            }
        
                                                                                        
                                                                                        
                                                                                        
                                                                                        } 
                                                                                    })

                                                                                })
                                        
                                                }


                                                                          
                                                                            
                                                                                
                                                                            
                                        })
                                     

                            })
                    }
                }

              

            })
        </script>
</body>

</html>