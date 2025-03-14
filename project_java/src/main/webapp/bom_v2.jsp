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
        /* #appendbody{
            margin-top: 95px;
        } */

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
            <button class="btn" id="add">등록</button>
        </div>

        <table id="appendbody">
            <thead>
                <tr>
                    <th id="name">완제품 이름</th>
                    <th>품번</th>
                    <th>유통기한</th>
                    <th id="chang">보관 창고</th>
                    <th id="jeapoom">완제품 이미지</th>
                    <th>수정 / 삭제</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>
                        <div class="value move">부대찌개</div>
                        <select name="" class="cselct on ">
                            <option value="부대찌개">부대찌개</option>
                            <option value="김치찌개">김치찌개</option>
                            <option value="밀푀유나배">밀푀유나배</option>
                            <option value="떡볶이">떡볶이</option>
                            <option value="곱창전골">곱창전골</option>
                        </select>
                    </td>
                    <td>
                        <div>P001</div>
                    </td>
                    <td>
                        <div class="value hide">포장후 30일이내</div><input type="text" value="포장후 30일이내"
                            class="ctext on show">
                    </td>
                    <td>
                        <div class="value hide">상온</div> <input type="text" value="상온" class="ctext on show">
                    </td>
                    <td><img src="/img/Budae-Jjigae.png" alt="부대찌개" class="imgg"><input type="file" class="cfile on ">
                    </td>
                    <td>
                        <div class="btn-parent">
                            <button class="btn btn-edit">수정</button>
                            <button class="btn btn-delete">삭제</button>
                            <button class="btn btn-ok">확인</button>
                            <button class="btn btn-del">취소</button>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="value move">김치찌개</div>
                        <select name="" class="cselct on ">
                            <option value="부대찌개">부대찌개</option>
                            <option value="김치찌개">김치찌개</option>
                            <option value="밀푀유나배">밀푀유나배</option>
                            <option value="떡볶이">떡볶이</option>
                            <option value="곱창전골">곱창전골</option>
                        </select>
                    </td>
                    <td>
                        <div>P002</div>
                    </td>
                    <td>
                        <div class="value hide">포장후 25일이내</div><input type="text" value="포장후 25일이내"
                            class="ctext on show">
                    </td>
                    <td>
                        <div class="value hide">냉장</div> <input type="text" value="냉장" class="ctext on show">
                    </td>
                    <td><img src="/img/kimchisoup.png" alt="김치찌개" class="imgg"><input type="file" class="cfile on ">
                    </td>
                    <td>
                        <div class="btn-parent">
                            <button class="btn btn-edit">수정</button>
                            <button class="btn btn-delete">삭제</button>
                            <button class="btn btn-ok">확인</button>
                            <button class="btn btn-del">취소</button>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="value move">밀푀유나배</div>
                        <select name="" class="cselct on ">
                            <option value="부대찌개">부대찌개</option>
                            <option value="김치찌개">김치찌개</option>
                            <option value="밀푀유나배">밀푀유나배</option>
                            <option value="떡볶이">떡볶이</option>
                            <option value="곱창전골">곱창전골</option>
                        </select>
                    </td>
                    <td>
                        <div>P003</div>
                    </td>
                    <td>
                        <div class="value hide">포장후 20일이내</div><input type="text" value="포장후 20일이내"
                            class="ctext on show">
                    </td>
                    <td>
                        <div class="value hide">상온</div> <input type="text" value="상온" class="ctext on show">
                    </td>
                    <td><img src="/img/Millefeuille.png" alt="밀푀유나베" class="imgg"><input type="file"
                            class="cfile on off"></td>
                    <td>
                        <div class="btn-parent">
                            <button class="btn btn-edit">수정</button>
                            <button class="btn btn-delete">삭제</button>
                            <button class="btn btn-ok">확인</button>
                            <button class="btn btn-del">취소</button>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="value move">떡볶이</div>
                        <select name="" class="cselct on ">
                            <option value="부대찌개">부대찌개</option>
                            <option value="김치찌개">김치찌개</option>
                            <option value="밀푀유나배">밀푀유나배</option>
                            <option value="떡볶이">떡볶이</option>
                            <option value="곱창전골">곱창전골</option>
                        </select>
                    </td>
                    <td>
                        <div>P004</div>
                    </td>
                    <td>
                        <div class="value hide">포장후 15일이내</div><input type="text" value="포장후 15일이내"
                            class="ctext on show">
                    </td>
                    <td>
                        <div class="value hide">냉장</div> <input type="text" value="냉장" class="ctext on show">
                    </td>
                    <td><img src="/img/tteokbokki.png" alt="떡볶이" class="imgg"><input type="file" class="cfile on "></td>
                    <td>
                        <div class="btn-parent">
                            <button class="btn btn-edit">수정</button>
                            <button class="btn btn-delete">삭제</button>
                            <button class="btn btn-ok">확인</button>
                            <button class="btn btn-del">취소</button>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="value move">떡볶이</div>
                        <select name="" class="cselct on ">
                            <option value="부대찌개">부대찌개</option>
                            <option value="김치찌개">김치찌개</option>
                            <option value="밀푀유나배">밀푀유나배</option>
                            <option value="떡볶이">떡볶이</option>
                            <option value="곱창전골">곱창전골</option>
                        </select>
                    </td>
                    <td>
                        <div>P004</div>
                    </td>
                    <td>
                        <div class="value hide">포장후 15일이내</div><input type="text" value="포장후 15일이내"
                            class="ctext on show">
                    </td>
                    <td>
                        <div class="value hide">냉장</div> <input type="text" value="냉장" class="ctext on show">
                    </td>
                    <td><img src="/img/tteokbokki.png" alt="떡볶이" class="imgg"><input type="file" class="cfile on "></td>
                    <td>
                        <div class="btn-parent">
                            <button class="btn btn-edit">수정</button>
                            <button class="btn btn-delete">삭제</button>
                            <button class="btn btn-ok">확인</button>
                            <button class="btn btn-del">취소</button>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

    <script>
        window.addEventListener("load", function () {
            //각리스트클레스에서
            let moves = document.querySelectorAll(".move");
            // console.log(moves);

            for (let i = 0; i < moves.length; i++) {

                console.log(moves[i])
                moves[i].addEventListener("click", function (e) {
                    let value = e.target.innerText
                    // console.log(e.target)
                    window.location.href = "bomlist.html";
                    window.location.href = `bomlist.html?value=${value}`;

                })
            }


            //------검색기능
            document.querySelector("#search-button").addEventListener("click", function () {
                // console.log(moves[0].innerText);
                let stvalue = document.querySelector("#search-text").value
                for (let a = 0; a < moves.length; a++) {
                    // console.log(moves[a].innerText)
                    if (stvalue != moves[a].innerText) {
                        console.log(moves[a].parentNode)
                        // moves[0].parentNode.clasList.add("none")
                    }
                }
            })
            //----------파일숨김코드
            function fileoccult() {
                let cfiles = document.querySelectorAll(".cfile")
                for (let i = 0; i < cfiles.length; i++) {
                    cfiles[i].classList.add("none")
                }
            }
            fileoccult()
            //-----------파일숨김코드

            //----------확인 취소 버튼 숨김코드
            function btnoccult() {
                let oks = document.querySelectorAll(".btn-ok")
                let dels = document.querySelectorAll(".btn-del")
                for (let i = 0; i < oks.length; i++) {
                    oks[i].classList.add("none")
                    dels[i].classList.add("none")
                }
            }
            btnoccult()
            //-----------확인 취소 버튼 숨김코드



            //------------인풋텍스트 숨기는코드
            function textoccult() {
                let ctexts = document.querySelectorAll(".ctext")
                for (let i = 0; i < ctexts.length; i++) {
                    ctexts[i].classList.add("none")
                }
            }
            textoccult()
            //--------------인풋 텍스트숨기는코드


            //------------인풋 셀렉트 감추기코드

            function selectoccult() {
                let cselcts = document.querySelectorAll(".cselct")
                for (let i = 0; i < cselcts.length; i++) {
                    cselcts[i].classList.add("none")
                    cselcts[i].classList.add("none")
                }
            }
            selectoccult()
            //---------------------인풋 셀렉트 감추기코드

            //----수정버튼 
            let edits = document.querySelectorAll(".btn-edit")
            for (let i = 0; i < edits.length; i++) {
                edits[i].addEventListener("click", function (e) {
                    console.log(e.target.parentNode.parentNode.parentNode.querySelectorAll(".on"))
                    let ons = e.target.parentNode.parentNode.parentNode.querySelectorAll(".on")
                    let values = e.target.parentNode.parentNode.parentNode.querySelectorAll(".value")
                    let imgg = e.target.parentNode.parentNode.parentNode.querySelectorAll(".imgg")
                    console.log(e.target.parentNode.parentNode.parentNode.querySelectorAll(".imgg"))
                    let show = e.target.parentNode.parentNode.parentNode.querySelectorAll(".show")
                    // console.log(e.target.parentNode.parentNode.querySelectorAll(".show"))
                    // console.log(e.target.parentNode.parentNode.querySelectorAll(".hide"))
                    let hide = e.target.parentNode.parentNode.parentNode.querySelectorAll(".hide")
                    let cselct = e.target.parentNode.parentNode.parentNode.querySelector(".cselct")
                    let move = e.target.parentNode.parentNode.parentNode.querySelector(".move")
                    for (let a = 0; a < ons.length; a++) {
                        ons[a].classList.remove("none")
                    }
                    for (let a = 0; a < values.length; a++) {

                        values[a].classList.add("nonemove")
                    }
                    for (let a = 0; a < imgg.length; a++) {
                        imgg[a].classList.add("none")
                        
                    }
                    // console.log(e.target)
                    // console.log(e.target.parentNode.querySelector(".btn-delete"))

                    e.target.classList.add("none")
                    e.target.parentNode.parentNode.parentNode.querySelector(".btn-delete").classList.add("none")
                    e.target.parentNode.parentNode.parentNode.querySelector(".btn-ok").classList.remove("none")
                    e.target.parentNode.parentNode.parentNode.querySelector(".btn-del").classList.remove("none")
                    //-----------------------확인버튼-------------------
                    e.target.parentNode.parentNode.querySelector(".btn-ok").addEventListener("click", function () {

                        for (let a = 0; a < ons.length; a++) {
                            ons[a].classList.add("none")
                        }
                        for (let a = 0; a < show.length; a++) {
                            hide[a].innerText = show[a].value

                        }
                        for (let a = 0; a < values.length; a++) {

                            values[a].classList.remove("nonemove")
                        }
                        move.innerText = cselct.value
                        e.target.classList.remove("none")
                        e.target.parentNode.parentNode.parentNode.querySelector(".cfile").classList.remove("none")
                        e.target.parentNode.parentNode.querySelector(".btn-delete").classList.remove("none")
                        e.target.parentNode.parentNode.querySelector(".btn-ok").classList.add("none")
                        e.target.parentNode.parentNode.querySelector(".btn-del").classList.add("none")

                    })
                    e.target.parentNode.querySelector(".btn-del").addEventListener("click", function () {
                        for (let a = 0; a < ons.length; a++) {
                            ons[a].classList.add("none")
                        }
                        for (let a = 0; a < values.length; a++) {

                            values[a].classList.remove("nonemove")
                        }
                        for (let a = 0; a < imgg.length; a++) {

                            imgg[a].classList.add("none")
                        }
                        console.log()
                        e.target.classList.remove("none")
                        e.target.parentNode.parentNode.parentNode.querySelector(".btn-delete").classList.remove("none")
                        e.target.parentNode.parentNode.parentNode.querySelector(".btn-ok").classList.add("none")
                        e.target.parentNode.parentNode.parentNode.querySelector(".btn-del").classList.add("none")
                    })

                })
            }
            //-----------------삭제
            let dels = document.querySelectorAll(".btn-delete")
            for (let i = 0; i < dels.length; i++) {
                dels[i].addEventListener("click", function (e) {
                    console.log(e.target.parentNode.parentNode)
                    e.target.parentNode.parentNode.parentNode.remove();
                })
            }
            //----------------


            //---등록버튼누르면 dom넣는 함수
            function newpush() {
                let appendbody = document.querySelector("#appendbody")
                let newmaue = document.createElement("tr")
                newmaue.innerHTML = `
                                    <td>
                        <div class="value move"></div>
                            <select name="" class="cselct on ">
                                <option value="부대찌개">부대찌개</option>
                                <option value="김치찌개">김치찌개</option>
                                <option value="밀푀유나배">밀푀유나배</option>
                                <option value="떡볶이">떡볶이</option>
                                <option value="곱창전골">곱창전골</option>
                            </select>
                            </td>
                            <td>
                                <div class="number"></div>
                            </td>
                            <td>
                                <div class="value hide"></div><input type="text" value="" class="ctext on show">
                            </td>
                            <td>
                                <div class="value hide"></div> <input type="text" value="" class="ctext on show">
                            </td>
                            <td><input type="file" class="cfile on ">
                            </td>
                            <td>
                            <button class="btn btn-edit">수정</button>
                            <button class="btn btn-ok">확인</button>
                            <button class="btn btn-delete">삭제</button>
                            <button class="btn btn-del">취소</button>
                            </td>
                            `





                appendbody.append(newmaue)
                newmaue.querySelector(".btn-ok").classList.remove("none")
                newmaue.querySelector(".btn-del").classList.add("none")
                newmaue.querySelector(".btn-edit").classList.add("none")
                newmaue.querySelector(".btn-delete").classList.remove("none")
                //삭제이벤트--------------------
                newmaue.querySelector(".btn-delete").addEventListener("click", function (e) {
                    e.target.parentNode.parentNode.remove()

                })
                //------------------------------
                //----------확인이벤트-----------
                newmaue.querySelector(".btn-ok").addEventListener("click", function (e) {
                    // console.log(e.target.parentNode.parentNode.querySelector(".cselct").value)
                    if (e.target.parentNode.parentNode.querySelector(".cselct").value == "부대찌개") {
                        e.target.parentNode.parentNode.querySelector(".number").innerText = "P001"
                    } else if (e.target.parentNode.parentNode.querySelector(".cselct").value == "김치찌개") {
                        e.target.parentNode.parentNode.querySelector(".number").innerText = "P002"
                    } else if (e.target.parentNode.parentNode.querySelector(".cselct").value == "밀푀유나배") {
                        e.target.parentNode.parentNode.querySelector(".number").innerText = "P003"
                    } else if (e.target.parentNode.parentNode.querySelector(".cselct").value == "떡볶이") {
                        e.target.parentNode.parentNode.querySelector(".number").innerText = "P004"
                    } else if (e.target.parentNode.parentNode.querySelector(".cselct").value == "곱창전골") {
                        e.target.parentNode.parentNode.querySelector(".number").innerText = "P005"
                    }
                    let hide = newmaue.querySelectorAll(".hide")
                    let show = newmaue.querySelectorAll(".show")
                    let move = newmaue.querySelector(".move")
                    let cselct = newmaue.querySelector(".cselct")
                    let cfile = newmaue.querySelector(".cfile")
                    for (let i = 0; i < hide.length; i++) {
                        hide[i].innerText = show[i].value
                    }
                    move.innerText = cselct.value
                    newmaue.querySelector(".btn-edit").classList.remove("none")
                    newmaue.querySelector(".btn-delete").classList.remove("none")
                    newmaue.querySelector(".btn-ok").classList.add("none")
                    newmaue.querySelector(".btn-del").classList.add("none")
                    for (let i = 0; i < hide.length; i++) {
                        hide[i].classList.remove("none")
                        show[i].classList.add("none")
                    }
                    cselct.classList.add("none")
                    move.classList.remove("none")


                })
                newmaue.querySelector(".btn-edit").addEventListener("click", function () {
                    newmaue.querySelector(".btn-ok").classList.remove("none")
                    newmaue.querySelector(".btn-del").classList.remove("none")
                    newmaue.querySelector(".btn-edit").classList.add("none")
                    newmaue.querySelector(".btn-delete").classList.add("none")
                    let hide = newmaue.querySelectorAll(".hide")
                    let show = newmaue.querySelectorAll(".show")
                    let move = newmaue.querySelector(".move")
                    let cselct = newmaue.querySelector(".cselct")
                    let cfile = newmaue.querySelector(".cfile")
                    for (let i = 0; i < hide.length; i++) {
                        hide[i].classList.add("none")
                        show[i].classList.remove("none")
                    }
                    cselct.classList.remove("none")
                    move.classList.add("none")
                    move.innerText = cselct.value


                })
                newmaue.querySelector(".btn-del").addEventListener("click", function () {
                    let hide = newmaue.querySelectorAll(".hide")
                    let show = newmaue.querySelectorAll(".show")
                    let move = newmaue.querySelector(".move")
                    let cselct = newmaue.querySelector(".cselct")
                    let cfile = newmaue.querySelector(".cfile")
                    newmaue.querySelector(".btn-edit").classList.remove("none")
                    newmaue.querySelector(".btn-delete").classList.remove("none")
                    newmaue.querySelector(".btn-ok").classList.add("none")
                    newmaue.querySelector(".btn-del").classList.add("none")
                    for (let i = 0; i < hide.length; i++) {
                        hide[i].classList.remove("none")
                        show[i].classList.add("none")
                    }
                    cselct.classList.add("none")
                    move.classList.remove("none")

                })

            }



            //-------등록버튼
            document.querySelector("#add").addEventListener("click", function () {
                newpush();
            })
            //---------------












        })
    </script>



</body>

</html>