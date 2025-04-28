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
        #pagehtml{
          width: 100%;
            margin: 0 auto;
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
          #search-button{
            font-size: 10px;
          }
        
        }
    </style>
</head>

<body>
    <!-- 내용 -->
     <input type="hidden" value="${pageNo}" id="firstpageNo">
        <div class="container">
       


    </div>

    <script>

        window.addEventListener("load",search)
        
        
        function search(event,pageNo,serch) {
                //맨처음한번 조회해오기
                event.preventDefault();
                
                //ajax
            const xhr = new XMLHttpRequest();
            //if pageNo 언디판 serch 언디파인 if else문 써서 값을 넣거나 뺴자 
           let firstpageNo = document.querySelector("#firstpageNo").value
        //    pageNo = firstpageNo 
           if(pageNo === undefined ){
                pageNo = 1
                console.log("pageNo if작동")
            }
            if(serch === undefined){
                serch = " "
                console.log("serch if작동")
            }
           console.log("pageNo",pageNo,"serch",serch,"firstpageNo",firstpageNo)
            xhr.open('get', 'bom_v2_select?page='+pageNo+'&serch='+serch )
            xhr.setRequestHeader('Content-Type', 'application/json')

            xhr.send()

            xhr.onload = function () {
                let data = (xhr.responseText)
                console.log(xhr.responseText)
                data=JSON.parse(data)
                console.log(data)
                let page = data.pDTO.page //현제페이지
                let serch = data.pDTO.serch //현제검색어 
                let totalcount = data.slect.conut; //전체 숫자
                let list = data.slect.list; //가져온 음식 리스트
                document.querySelector(".container").innerHTML = ` `
                document.querySelector(".container").innerHTML +=`
           
                <div class="form-group">
                    <h1>완제품 관리</h1>
                        <label for="search">완제품 이름</label>
                        <input type="text" id="search-text" placeholder="검색할 완제품 입력" value="\${serch}">
                        <button class="btn" id="search-button">검색</button>
                </div>
            
                    <table>
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
                   
                `
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
                                        let productname = e.target.innerHTML
                                        console.log(pvalue)
                                        console.log(pvalue)
                                        location.href = "bomlist?pid=" + pvalue + "&pname="+productname +"&page="+page;
                                        // alert("pvalue"+pvalue+"  productname"+productname+"  page"+page)

                                    })
                                    
        
                                        
                                
                    })
                    let pageHtml = document.createElement("div")
                    pageHtml.setAttribute("id" ,"pagehtml")
                   //현제검색어 serch // 현제페이지page //현제 총카운트 totalcount // 가져온음식 리스트 list
                   
                   
                   
                   
                   
                   let dtoo = data.pDTO
                   let pageNo = 1
                   let viewCount = 10 
                   
                   pageNo = data.pDTO.page
                   serch = data.pDTO.serch
                   viewCount = data.pDTO.fourViewCount //
                   console.log(1,data.pDTO.fourViewCount)
                   console.log(2,pageNo)
                   console.log(3,viewCount)
                   
                   
                   
                   
                   
                   let total =data.slect.count // 전체 겟수
                   let lastPage = Math.ceil(total / viewCount) 
                   let groupCount = 5
                   let groupPosition = Math.ceil(pageNo / groupCount)
                   let begin = ((groupPosition-1) * groupCount) + 1;
                   let end = groupPosition * groupCount;
                   
                   console.log("현제 페이지",page)    //현제 페이지
                   console.log("검색어",serch)	//검색어																	
                   console.log("전체카운트",total) //전체카운트
                   console.log("현제 음식 가져온거",list) // 현제 음식 가져온거
                   
                   
                   
                   if(end > lastPage){
                       end = lastPage
                    } 
                    if( begin === 1 ){
                        pageHtml.innerHTML+=`
                        [이전]
                    
                        `
                    }else{
                        pageHtml.innerHTML+=`
                        <a href="bom_v2_select?page=\${begin-1}&serch=\${serch}" class="clickable">[이전]</a>
                        `
                    }	

                    for(let i = begin; i<=end ; i++){
                        if(i === pageNo){
                            pageHtml.innerHTML+=`
                            <a href="bom_v2_select?page=\${ i }&serch=\${serch}" class="bold clickable" data-page="\${i}">\${ i}</a>
                            `
                        }else {
                            pageHtml.innerHTML+=`
                            <a href="bom_v2_select?page=\${ i }&serch=\${serch}" class="clickable" data-page="\${i}">\${ i}</a>
                            `
                        }
                        
                    }
                    if( end === lastPage ){
                        pageHtml.innerHTML+=`
                        [다음]
                        `
                    }else{
                        pageHtml.innerHTML+=`
                        <a href="inspectionStandards?page=\${end+1}&serch=\${serch}" class="clickable">[다음]</a>
                        `
                    }
                    
                    document.querySelector(".container").append(pageHtml)

                    pageHtml.querySelectorAll(".clickable").forEach(dto =>{
                            dto.addEventListener("click",search)

                            //페이지이동이벤트
                            dto.addEventListener("click",function(e){
                                let search_text =document.querySelector("#search-text").value
                                 

                                
                                if(e.target.getAttribute("data-page") == 1){
                                    
                                  
                                }else{
                                    console.log("전달인자1 존재")
                                    console.log("전달인자2",e.target.getAttribute("data-page"))
                                    console.log("전달인자3",search_text)
                                    // alert(e.target.getAttribute("data-page"),search_text)
                                    let nowpage = e.target.getAttribute("data-page")
                                    console.log("nowpage",nowpage)
                                   
                                    search(e ,nowpage, search_text)
                                    
                                
                               }
                           
                           
                           
                           
                            })

                    })
                    //검색  이벤트 
                    document.querySelector("#search-button").addEventListener("click",function(e){
                        let texval = document.querySelector("#search-text").value
                        let startpaage = 1
                        search(e ,startpaage, texval)
                    })

                    //----------------


            }


        }
       



    </script>



</body>

</html>