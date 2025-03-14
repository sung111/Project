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
    <title>검사기준</title>
    <style>
        *{
            margin: 0;
            padding: 0;
        }
        body {
            width: 100%;
        
         
        }

        .de {
            display: none;

        }

        #contain-grandfatder {
            margin: 20px 0 100px 0;
            border: 1px solid black;
            width: 100%;


        }

        .contain-parents {
            border: 1px solid red;
            display: flex;

            justify-content: space-between;
            align-items: center;

        }

        .contain-child {
            /* height: 500px; */
            text-align: center;
            /* width: 100%; */

            border: 1px solid black;
        }

        .contain-arrow {
            text-align: center;
            width: 100%;
        }

        li {
            border: 1px solid black;
            list-style: none;
            padding: 0;
        }

        .arrow {
            height: 20px;
            width: 20px;
        }

        .imeg {
            width: 200px;
            height: 200px;
            border-radius: 50px;
        }

        .arrow {
            width: 40px;
            height: 50px;
        }

        li {
            font-size: 20px;
        }

        table {
            width: 100%;
            margin-bottom: 100px;
        }

        table,
        td,
        td {
            border: 1px solid black;
            border-collapse: collapse;
            font-size: 20px;
        }

        th {
            color: white;
            background-color: #007bff;
            border: 1px solid black;
        }

        .none {
            display: none;
        }


        @media screen and (max-width: 600px) {
            .imeg {
                width: 100px;
                height: 100px;
                border-radius: 10px;
            }

            .contain-child {
                font-size: 13px;
            }

            .arrow {
                height: 20px;
                width: 20px;
            }

            li {
                font-size: 13px;
            }

            table {
                width: 100vw;
            }

            td {
                font-size: 10px;
            }

            .standards-font-charild {
                font-size: 10px;

            }

            .standards-font-contain {
                width: 100%;
            }
        }

        #header-bacor {
            /* background-color: #007bff; */
            border-radius: 20px;
            padding-top: 1px;
            height: 150px;
        }

        #header {
            border: 1px solid white;
            margin-left: 20px;
            width: 60%;
            height: 50px;


        }

        #header-name {
            border: 1px solid white;
            width: 300px;

            margin: 20px 20px;
            color: white;
            font-size: 40px;
        }
    </style>
</head>


<body>


    <!-- ------------------------------------------------------------------------------------------- -->

    <style>
        #standards-top {


            display: flex;
            flex-wrap: wrap;
            justify-content: center;
           

        }

        .standards-contain {

            border: 1px solid #007bff;
            border-radius: 20px;
            margin: 10px;
            width: 48%;


        }

        .standards-imege-contain {
            width: 100%;
            /* border: 1px solid blue; */
            text-align: center;

        }

        .standards-imege {

            width: 200px;
            height: 200px;
        }

        .standards-font-parent {
            margin: 0 auto;
            vertical-align: top;
            width: 49%;

        }

        .standards-font-charild {
            padding: 2px;

            width: 95%;
            height: 220px;
            text-align: start;

        }

        .manu-name {
            color: gray;
            font-size: 20px;
            font-weight: 900;
        }

        .standards-font-contain {
            display: flex;

        }


        #title {
            /* border: 1px solid black; */
            /* margin-top: 20px; */
            width: 100%;
            text-align: center;
        }

        #navigation-title-parent {
            display: flex;
            justify-content: center;
            margin-bottom: 20px;
        }

        #navigation-title {
            width: 50%;
            display: flex;
            justify-content: space-around;
        }

        .navigation-title-article {
            width: 300px;
            display: flex;
            justify-content: space-around;
           
            align-items: center;
            height: 40px;
         
        }

        .navigation-title-article2 {
            width: 50%;
            display: flex;
            /* border: 1px solid ; */


        }

        .navigation-title-button-parent {

            margin-left: 20px;
            align-items: center;

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

        .btncenter {
            text-align: center;
            margin-bottom: 20px;
        }

        #navigation-title-text {
            /* border: 1px solid black; */
            width: 130px;
            
        }
        
        #navigation-title-search {
            padding: 5px;
          
            width: 100px;
        }

        .center {
            margin: 20px 0 20px 0;
        }

        .selects {
            margin-bottom: 80px;
        }

        .file {
            margin-bottom: 100px;
        }

        .hidetext {
            height: 80px;
        }

        .showtext {
            height: 150px;
            width: 320px;
        }

        .showtext2 {
            height: 150px;
            width: 320px;
        }
        .titlecenter{
            text-align: center;
        }
        #top-border{
            border: 1px solid #007bff;
         
        }
        



        @media screen and (max-width: 600px) {
            #navigation-title-text {
                font-size: 10px;
            }

            #navigation-title-search {
                width: 50%;
            }

        }
    </style>



    <body>
        <div id="top-border">
            <div id="title">
                <h1>검사기준</h1>
            </div>
            <div id="navigation-title-parent">
                <div id="navigation-title">
                    <div class="navigation-title-article">

                        <div id="navigation-title-text">
                            밀키트 검색
                        </div>

                            <div>
                                <input type="text" id="navigation-title-search" >
                            </div>
                      
                   
                        <div class="navigation-title-button-parent">
                            <input type="button" value="검색" class="btn search">
                        </div>
                      
                    </div>
                </div>
            </div>
        </div>
      



        <div id="standards-top">

           <c:forEach var="dto" items="${selectval}">
           
            <div class="standards-contain">
                <div class="standards-imege-contain">
                    <div class="center">
                        <div class="manu-name text-serch">${dto.productname} 밀키트</div>
                        <select id="select" class="selects" style="margin-bottom:80px;">
                        
                          <c:forEach var="dto1" items="${selectval}">
                            <option value="${dto1.productname}">${dto1.productname}</option>
                            </c:forEach>
                            
                        </select>
                       
                    </div>
                    <img src="img/${dto.productimage}" class="standards-imege">
                    <input type="file" class="file files ">
                </div>
                <div class="standards-font-contain">
                    <div class="standards-font-parent">

                        <div class="standards-font-charild">

                           <div class="titlecenter"><h2>정상제품기준</h2></div> 
                            <div class="hidetext">
                               1.${dto.normalcriteria}
                            </div>
                            <textarea name="" class="showtext" value="${dto.normalcriteria}"></textarea>
                        </div>

                    </div>
                    <div class="standards-font-parent">

                        <div class="standards-font-charild">

                            <div class="titlecenter"><h2>비정상제품기준</h2></div>
                            <div class="hidetext2">
                            ${dto.abnormalcriteria}
                            </div>
                            <textarea  name="" class="showtext2" value="${dto.abnormalcriteria}"></textarea>
                        </div>
                    </div>
                </div>
                <div class="btncenter">
                	for
                    <input type="hidden" value="update" name="type">
                    <input type="submit" value="수정" class="btn u">
<!--                     삭제 보류 선생님이 말해줄거임 -->
<!--                             DB에 데이터 \t? 였나 넣어서 줄바꿔서 만든다음에 서블릿에서 \t?를 \n으로 바꿔라-->
<!--                     <input type="button" value="삭제" class="btn d"> -->
                    <input type="button" value="확인" class="btn ok">
                    <input type="button" value="취소" class="btn can">
                </div>
            </div>
            
		</c:forEach>


        </div>
        <script>
            window.addEventListener("load", function () {
                function hide() {
                    let textserchs = document.querySelectorAll(".text-serch")
                    for (let i = 0; i < textserchs.length; i++) {
                        textserchs[i].parentNode.parentNode.parentNode.classList.add("none")
                        console.log(textserchs[i].parentNode.parentNode.parentNode)
                    }
                }
                // ----검색코드
                document.querySelector(".search").addEventListener("click", function () {
                    hide()
                    console.log("포문전")
                    let textserchs = document.querySelectorAll(".text-serch")
                    let search = document.querySelector("#navigation-title-search").value
                    for (let i = 0; i < textserchs.length; i++) {
                        //    console.log(textserchs[i].innerText)
                        console.log(textserchs[i].innerText.indexOf("부대") != -1)
                        // console.log(search)
                        console.log("안바꿀거", textserchs[i].innerText.indexOf(search) != -1)
                        if (textserchs[i].innerText.indexOf(search) != -1) {
                            // console.log(textserchs[i])
                            textserchs[i].parentNode.parentNode.parentNode.classList.remove("none")
                            console.log("바꿀거", textserchs[i].parentNode.parentNode)

                        }

                    }

                })

                let btnok = document.querySelectorAll(" .ok")
                let btncan = document.querySelectorAll(".can")
                for (let i = 0; i < btnok.length; i++) {
                    btnok[i].classList.add("none")
                    btncan[i].classList.add("none")
                }


                document.querySelectorAll(".showtext").forEach(el => el.classList.add("none"));
                document.querySelectorAll(".showtext2").forEach(el => el.classList.add("none"));
                document.querySelectorAll(".file").forEach(el => el.classList.add("none"));
                document.querySelectorAll(".selects").forEach(el => el.classList.add("none"));
                document.querySelectorAll(".hidetext").forEach(el => el.classList.remove("none"));
                document.querySelectorAll(".hidetext2").forEach(el => el.classList.remove("none"));

                //--확인

                let bntok = document.querySelectorAll(".btn.ok")
                for (let i = 0; i < bntok.length; i++) {
                    bntok[i].addEventListener("click", function (e) {
                        console.log("된다고")
                        e.target.parentNode.querySelector(".ok").classList.add("none")
                        e.target.parentNode.querySelector(".can").classList.add("none")
                        e.target.parentNode.querySelector(".u").classList.remove("none")
                        e.target.parentNode.querySelector(".d").classList.remove("none")
                        e.target.parentNode.parentNode.querySelector(".selects").classList.add("none")
                        e.target.parentNode.parentNode.querySelector(".showtext").classList.add("none")
                        e.target.parentNode.parentNode.querySelector(".hidetext").classList.remove("none")
                        e.target.parentNode.parentNode.querySelector(".showtext2").classList.add("none")
                        e.target.parentNode.parentNode.querySelector(".hidetext2").classList.remove("none")
                        e.target.parentNode.parentNode.querySelector(".file").classList.add("none")
                        e.target.parentNode.parentNode.querySelector(".standards-imege").classList.remove("none")
                        e.target.parentNode.parentNode.querySelector(".text-serch").classList.remove("none")

                        e.target.parentNode.parentNode.querySelector(".text-serch").innerText = e.target.parentNode.parentNode.querySelector(".selects").value
                        let hidetext = e.target.parentNode.parentNode.querySelector(".hidetext")
                        let hidetext2 = e.target.parentNode.parentNode.querySelector(".hidetext2")
                        let showtext = e.target.parentNode.parentNode.querySelector(".showtext")
                        let showtext2 = e.target.parentNode.parentNode.querySelector(".showtext2")
                        hidetext.innerText = showtext.value;
                        hidetext2.innerText = showtext2.value;



                    })
                }





                //---취소
                let can = document.querySelectorAll(".btn.can")
                for (let i = 0; i < can.length; i++) {
                    can[i].addEventListener("click", function (e) {

                        e.target.parentNode.querySelector(".ok").classList.add("none")
                        e.target.parentNode.querySelector(".can").classList.add("none")
                        e.target.parentNode.querySelector(".u").classList.remove("none")
                        e.target.parentNode.querySelector(".d").classList.remove("none")
                        e.target.parentNode.parentNode.querySelector(".selects").classList.add("none")
                        e.target.parentNode.parentNode.querySelector(".showtext").classList.add("none")
                        e.target.parentNode.parentNode.querySelector(".hidetext").classList.remove("none")
                        e.target.parentNode.parentNode.querySelector(".showtext2").classList.add("none")
                        e.target.parentNode.parentNode.querySelector(".hidetext2").classList.remove("none")
                        e.target.parentNode.parentNode.querySelector(".file").classList.add("none")
                        e.target.parentNode.parentNode.querySelector(".standards-imege").classList.remove("none")
                        e.target.parentNode.parentNode.querySelector(".text-serch").classList.remove("none")

                    })
                }



                //수정-------------------
                let us = document.querySelectorAll(".u")
                for (let i = 0; i < us.length; i++) {
                    us[i].addEventListener("click", function (e) {
                        console.log(e.target.parentNode.parentNode.querySelector(".selects"))
                        e.target.parentNode.querySelector(".ok").classList.remove("none")
                        e.target.parentNode.querySelector(".can").classList.remove("none")
                        e.target.parentNode.querySelector(".u").classList.add("none")
                        e.target.parentNode.querySelector(".d").classList.add("none")
                        e.target.parentNode.parentNode.querySelector(".selects").classList.remove("none")
                        e.target.parentNode.parentNode.querySelector(".showtext").classList.remove("none")
                        e.target.parentNode.parentNode.querySelector(".hidetext").classList.add("none")
                        e.target.parentNode.parentNode.querySelector(".showtext2").classList.remove("none")
                        e.target.parentNode.parentNode.querySelector(".hidetext2").classList.add("none")
                        e.target.parentNode.parentNode.querySelector(".file").classList.remove("none")
                        e.target.parentNode.parentNode.querySelector(".standards-imege").classList.add("none")
                        e.target.parentNode.parentNode.querySelector(".text-serch").classList.add("none")

                        e.target.parentNode.parentNode.querySelector(".showtext").value = e.target.parentNode.parentNode.querySelector(".hidetext").innerText
                        e.target.parentNode.parentNode.querySelector(".showtext2").value = e.target.parentNode.parentNode.querySelector(".hidetext2").innerText
                    })
                }
                //삭제----
                let btnd = document.querySelectorAll(".d")
                for (let i = 0; i < btnd.length; i++) {
                    btnd[i].addEventListener("click", function (e) {
                        console.log("됨")
                        console.log(e.target.parentNode.parentNode)
                        e.target.parentNode.parentNode.remove()
                    })
                }


                //수정-------------------

                //-----생성 코드
                document.querySelector(".creat").addEventListener("click", function () {
                    //dom 생성
                  
                    uppand_chaild.querySelector(".standards-imege").classList.add("none")
                    uppand_chaild.querySelector(".u").classList.add("none")
                    uppand_chaild.querySelector(".can").classList.add("none")
                    uppand_chaild.querySelector(".hidetext").classList.add("none")
                    uppand_chaild.querySelector(".hidetext2").classList.add("none")
                    uppand_chaild.querySelector(".text-serch").classList.add("none")

                  

                    uppand_chaild.querySelector(".ok").addEventListener("click", function (e) {
                        e.target.parentNode.querySelector(".ok").classList.add("none")
                        e.target.parentNode.querySelector(".can").classList.add("none")
                        e.target.parentNode.querySelector(".u").classList.remove("none")
                        e.target.parentNode.querySelector(".d").classList.remove("none")
                        e.target.parentNode.parentNode.querySelector(".selects").classList.add("none")
                        e.target.parentNode.parentNode.querySelector(".showtext").classList.add("none")
                        e.target.parentNode.parentNode.querySelector(".showtext2").classList.add("none")
                        e.target.parentNode.parentNode.querySelector(".hidetext").classList.remove("none")
                        e.target.parentNode.parentNode.querySelector(".hidetext2").classList.remove("none")
                        e.target.parentNode.parentNode.querySelector(".file").classList.add("none")

                        e.target.parentNode.parentNode.querySelector(".text-serch").classList.remove("none")

                        e.target.parentNode.parentNode.querySelector(".text-serch").innerText = e.target.parentNode.parentNode.querySelector(".selects").value
                        let hidetext = e.target.parentNode.parentNode.querySelector(".hidetext")
                        let hidetext2 = e.target.parentNode.parentNode.querySelector(".hidetext2")
                        let showtext = e.target.parentNode.parentNode.querySelector(".showtext")
                        let showtext2 = e.target.parentNode.parentNode.querySelector(".showtext2")
                        hidetext.innerText = showtext.value;
                        hidetext2.innerText = showtext2.value;


                        uppand_chaild.querySelector(".u").addEventListener("click", function (e) {
                            console.log(e.target.parentNode.parentNode.querySelector(".selects"))
                            e.target.parentNode.querySelector(".ok").classList.remove("none")
                            e.target.parentNode.querySelector(".can").classList.remove("none")
                            e.target.parentNode.querySelector(".u").classList.add("none")
                            e.target.parentNode.querySelector(".d").classList.add("none")
                            e.target.parentNode.parentNode.querySelector(".selects").classList.remove("none")
                            e.target.parentNode.parentNode.querySelector(".showtext").classList.remove("none")
                            e.target.parentNode.parentNode.querySelector(".hidetext").classList.add("none")
                            e.target.parentNode.parentNode.querySelector(".showtext2").classList.remove("none")
                            e.target.parentNode.parentNode.querySelector(".hidetext2").classList.add("none")
                            e.target.parentNode.parentNode.querySelector(".file").classList.remove("none")
                            e.target.parentNode.parentNode.querySelector(".standards-imege").classList.add("none")
                            e.target.parentNode.parentNode.querySelector(".text-serch").classList.add("none")

                            e.target.parentNode.parentNode.querySelector(".showtext").value = e.target.parentNode.parentNode.querySelector(".hidetext").innerText
                            e.target.parentNode.parentNode.querySelector(".showtext2").value = e.target.parentNode.parentNode.querySelector(".hidetext2").innerText

                        })
                        uppand_chaild.querySelector(".can").addEventListener("click", function (e) {

                            e.target.parentNode.querySelector(".ok").classList.add("none")
                            e.target.parentNode.querySelector(".can").classList.add("none")
                            e.target.parentNode.querySelector(".u").classList.remove("none")
                            e.target.parentNode.querySelector(".d").classList.remove("none")
                            e.target.parentNode.parentNode.querySelector(".selects").classList.add("none")
                            e.target.parentNode.parentNode.querySelector(".showtext").classList.add("none")
                            e.target.parentNode.parentNode.querySelector(".hidetext").classList.remove("none")
                            e.target.parentNode.parentNode.querySelector(".showtext2").classList.add("none")
                            e.target.parentNode.parentNode.querySelector(".hidetext2").classList.remove("none")
                            e.target.parentNode.parentNode.querySelector(".file").classList.add("none")
                            e.target.parentNode.parentNode.querySelector(".standards-imege").classList.remove("none")
                            e.target.parentNode.parentNode.querySelector(".text-serch").classList.remove("none")




                        })
                        
                    })
                    uppand_chaild.querySelector(".d").addEventListener("click", function (e) {
                        e.target.parentNode.parentNode.remove()
                    })

                })



























            })



        </script>
    </body>

</html>