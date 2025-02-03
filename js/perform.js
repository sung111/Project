


let first = document.querySelector("#first")
let second = document.querySelector("#second")          
let third = document.querySelector("#third")

// 일간 주간 월간
let op1 = document.querySelector("#sel") 
let op2 = document.querySelector("#daily") 
let op3 = document.querySelector("#week")
let op4 = document.querySelector("#month")

// 날짜선택
let days = document.querySelector("#date")
let weeks = document.querySelector("#weeks")
let months = document.querySelector("#months")

//select값이 바뀔때마다
// change 이벤트를 준다
// 달력이 바뀐다
op1.addEventListener("change", function() {
                console.log("바뀜확인")

                // days.style.display ="none"
                // months.style.display = "none"
                // weeks.style.display = "block"
                 



                switch(this.value) {

        case "일간":
            // 달력
            days.style.display = "block";
            weeks.style.display = "none";
            months.style.display = "none";
            // nextSibling.remove();
            // def.innerHTML = "<br> <table border=1 id=first>"

            //                 + "<thead id=one>"
            //                     +"<tr>"
            //                         +"<th ></th>"
            //                         +"<th>06:00~08:00</th>"
            //                         +"<th>08:00~10:00</th>"
            //                         +"<th>10:00~12:00</th>"
            //                         +"<th>12:00~14:00</th>"
            //                         +"<th>14:00~16:00</th>"
            //                         +"<th>16:00~18:00</th>"
            //                         +"</tr>"
            //                 +"</thead>"
            // 표 윗부분
            first.style.display = "block"
            second.style.display = "none"
            third.style.display = "none"
            console.log("일간확인용")
            // console.log(one)
            break;



        case "주간":
            days.style.display = "none";
            weeks.style.display = "block"
            months.style.display = "none"
            // one.style.display ="none"

            // def.innerHTML = "<br> <table border=1>" 

            //                                      + "<thead id=two>"
                                           
            //                                +"<tr>"
            //                                    +"<th class=item>" + weeks.value + "</th>"
            //                                    +"<th>월요일</th>"
            //                                    +"<th>화요일</th>"
            //                                    +"<th>수요일</th>"
            //                                    +"<th>목요일</th>"
            //                                    +"<th>금요일</th>"
            //                                    +"<th>토요일</th>"
            //                                    +"<th>일요일</th>"
                                           
            //                                +"</tr>"

            //                                     +"</thead>"
            first.style.display = "none"
            second.style.display = "block"
            third.style.display = "none"




                                         

            break;
            
            // 월간 . 주간. 일간으로 바꿨을때도 표 사라지게 하기
        case "월간":
            days.style.display = "none";
            weeks.style.display = "none"
            months.style.display = "block"
           
            // def.innerHTML = "<br> <table border=1 id=t>" 

            //                                     + "<thead>"
            //                                         +"<tr>"
            //                                             +"<th class=item>" + months.value + "</th>"
            //                                             +"<th>1주차</th>"
            //                                             +"<th>2주차</th>"
            //                                             +"<th>3주차</th>"
            //                                             +"<th>4주차</th>"
            //                                         +"</tr>"
            //                                     +"</thead>"

            first.style.display = "none"
            second.style.display = "none"
            third.style.display = "block"

            break;
                                }



                // if(op1 = "일간") {
                // days.style.display ="none"
                // months.style.display = "none"
                // weeks.style.display = "block"
                // console.log("오늘")
                // }    else if (op1 = "주간") {
                //     days.style.display ="none"
                // months.style.display = "block"
                // weeks.style.display = "none"
                // console.log("주일")
                // } else {
                //     days.style.display ="block"
                // months.style.display = "none"
                // weeks.style.display = "none"
                // console.log("월간")
                // }
                
    
})









                // if(op1 == op2) {
                // days.style.display ="none"
                // months.style.display = "none"
                // weeks.style.display = "block"
                // console.log("오늘")
                // }    else if (op1 == op3) {
                //     days.style.display ="none"
                // months.style.display = "block"
                // weeks.style.display = "none"
                // console.log("주일")
                // } else if(op1 == op4) {
                //     days.style.display ="block"
                // months.style.display = "none"
                // weeks.style.display = "none"
                // console.log("월간")
                // }
                
                 

                
                











                    

                    


                let sele = document.querySelector("#sele")
                sele.addEventListener("click", function() {
                    // console.log("안녕하세요")







                    let day = document.querySelector("#date").value
                    let weeks = document.querySelector("#weeks").value
                    let months = document.querySelector("#months").value
                    let op1 = document.querySelector("#sel").value
                    let op2 = document.querySelector("#daily").value
                    let op3 = document.querySelector("#week").value
                    let op4 = document.querySelector("#month").value
                    
                    console.log(op1)
                    console.log(day)
                    // console.log(op2)
                    // console.log(op3)
                    // console.log(op4)
                    



                // let whole = document.createElement("div")
                // //    whole.classList.add("hide")
                // whole.innerHTML = "<div id=space></div>"
                //    document.body.append(whole)
                //    console.log(whole)


                



                       
                        // 검색
                   let text = document.querySelector("#text").value
                //    let sp = document.querySelector("#space")










                   // 일간 선택시 창 표시
                   if(op1 == op2) {
                  
                   console.log("def확인")
                //    console.log(def)
                //    def.innerHTML = ""
                //    sp.innerHTML =  "<div id=newdiv>" + "<br> <table border=1>" 
                                        
                //                         + "<thead>"
                                           
                //                             +"<tr>"
                //                                 +"<th>" + day + "</th>"
                //                                 +"<th>06:00~08:00</th>"
                //                                 +"<th>08:00~10:00</th>"
                //                                 +"<th>10:00~12:00</th>"
                //                                 +"<th>12:00~14:00</th>"
                //                                 +"<th>14:00~16:00</th>"
                //                                 +"<th>16:00~18:00</th>"
                                            
                //                             +"</tr>"
                //                           +"</thead>"





                //                           +"<tbody>"



                //                             +"<tr>"
                //                                 +"<td class=item>부대찌개</td>"
                //                                 +"<td>월요일</td>"
                //                                 +"<td>화요일</td>"
                //                                 +"<td>수요일</td>"
                //                                 +"<td>목요일</td>"
                //                                 +"<td>금요일</td>"
                //                                 +"<td>토요일</td>"
                                                
                //                             +"</tr>"

                //                             +"<tr>"
                //                                 +"<td class=item>밀푀유 나베</td>"
                //                                 +"<td>월요일</td>"
                //                                 +"<td>화요일</td>"
                //                                 +"<td>수요일</td>"
                //                                 +"<td>목요일</td>"
                //                                 +"<td>금요일</td>"
                //                                 +"<td>토요일</td>"
                                               
                //                             +"</tr>"

                //                             +"<tr>"
                //                                 +"<td class=item>김치찌개</td>"
                //                                 +"<td>월요일</td>"
                //                                 +"<td>화요일</td>"
                //                                 +"<td>수요일</td>"
                //                                 +"<td>목요일</td>"
                //                                 +"<td>금요일</td>"
                //                                 +"<td>토요일</td>"
                                              
                //                             +"</tr>"

                //                             +"<tr>"
                //                                 +"<td class=item>떡볶이</td>"
                //                                 +"<td>월요일</td>"
                //                                 +"<td>화요일</td>"
                //                                 +"<td>수요일</td>"
                //                                 +"<td>목요일</td>"
                //                                 +"<td>금요일</td>"
                //                                 +"<td>토요일</td>"
                                             
                //                             +"</tr>"

                //                             +"<tr>"
                //                                 +"<td class=item>곱창전골</td>"
                //                                 +"<td>월요일</td>"
                //                                 +"<td>화요일</td>"
                //                                 +"<td>수요일</td>"
                //                                 +"<td>목요일</td>"
                //                                 +"<td>금요일</td>"
                //                                 +"<td>토요일</td>"
                                               
                //                             +"</tr>"

                

                //                           +"</tbody>"
                                        
                //                        + "</table>"
                //                        + "</div>" 



                //                       let item = document.querySelectorAll(".item")
                //                       for(i=0; i<item.length; i++)
                //                       console.log(item[i])
                //                       console.log("확인")
                                    //   let con = item[i].innerHTML



                                       if(text == "") {
                                        alert("검색어를 입력해주세요");
                                        // sp.innerHTML = ""
                                       } else if (text == "정답") {
                                        console.log("정답입니다")
                                       } else {
                                         alert("조회된 내용이 없습니다");
                                        //  sp.innerHTML = ""
                                       }       
                                            } 
                                            
                                            
                                            
                                            




                                            // 주간 선택시 창 표시
                                            else if(op1 == op3) {
                                                
                                                console.log("확인차")
                                    //             def.innerHTML = ""  
                                    //             sp.innerHTML = "<br> <table border=1>" 

                                    //              + "<thead>"
                                           
                                    //        +"<tr>"
                                    //            +"<th class=item>" + weeks + "</th>"
                                    //            +"<th>월요일</th>"
                                    //            +"<th>화요일</th>"
                                    //            +"<th>수요일</th>"
                                    //            +"<th>목요일</th>"
                                    //            +"<th>금요일</th>"
                                    //            +"<th>토요일</th>"
                                    //            +"<th>일요일</th>"
                                           
                                    //        +"</tr>"
                                    //             +"</thead>"





                                    //      +"<tbody>"



                                    //        +"<tr>"
                                    //            +"<td class=item>부대찌개</td>"
                                    //            +"<td>월요일</td>"
                                    //            +"<td>화요일</td>"
                                    //            +"<td>수요일</td>"
                                    //            +"<td>목요일</td>"
                                    //            +"<td>금요일</td>"
                                    //            +"<td>토요일</td>"
                                    //            +"<td>토요일</td>"
                                               
                                    //        +"</tr>"

                                    //        +"<tr>"
                                    //            +"<td class=item>밀푀유 나베</td>"
                                    //            +"<td>월요일</td>"
                                    //            +"<td>화요일</td>"
                                    //            +"<td>수요일</td>"
                                    //            +"<td>목요일</td>"
                                    //            +"<td>금요일</td>"
                                    //            +"<td>토요일</td>"
                                    //            +"<td>토요일</td>"
                                              
                                    //        +"</tr>"

                                    //        +"<tr>"
                                    //            +"<td class=item>김치찌개</td>"
                                    //            +"<td>월요일</td>"
                                    //            +"<td>화요일</td>"
                                    //            +"<td>수요일</td>"
                                    //            +"<td>목요일</td>"
                                    //            +"<td>금요일</td>"
                                    //            +"<td>토요일</td>"
                                    //            +"<td>토요일</td>"
                                             
                                    //        +"</tr>"

                                    //        +"<tr>"
                                    //            +"<td class=item>떡볶이</td>"
                                    //            +"<td>월요일</td>"
                                    //            +"<td>화요일</td>"
                                    //            +"<td>수요일</td>"
                                    //            +"<td>목요일</td>"
                                    //            +"<td>금요일</td>"
                                    //            +"<td>토요일</td>"
                                    //            +"<td>토요일</td>"
                                            
                                    //        +"</tr>"

                                    //        +"<tr>"
                                    //            +"<td class=item>곱창전골</td>"
                                    //            +"<td>월요일</td>"
                                    //            +"<td>화요일</td>"
                                    //            +"<td>수요일</td>"
                                    //            +"<td>목요일</td>"
                                    //            +"<td>금요일</td>"
                                    //            +"<td>토요일</td>"
                                    //            +"<td>토요일</td>"
                                              
                                    //        +"</tr>"

               

                                    //      +"</tbody>"
                                       
                                    //      + "</table>"
                                    //             console.log("안녕하세요")






                                    //   let item = document.querySelectorAll(".item")
                                    //   for(i=0; i<item.length; i++)
                                    //   console.log(item[i])
                                    //   console.log("확인")
                                                   
                                       if(text == "") {
                                        alert("검색어를 입력해주세요");
                                        // sp.innerHTML = ""
                                       } else if (text == "정답") {
                                        console.log("정답입니다")
                                       } else {
                                         alert("조회된 내용이 없습니다");
                                        //  sp.innerHTML = ""
                                       }           




                                            } 
                                         // 주간 선택 시 창 표시   
                                            
                                            















                                            // 월간 선택 시 창 표시
                                            else if (op1 == op4) {
                                            //   def.innerHTML = ""
                                            //   sp.innerHTML =  "<br> <table border=1 id=first>" 

                                            //     + "<thead>"
                                            //         +"<tr>"
                                            //             +"<th class=item>" + months + "</th>"
                                            //             +"<th>1주차</th>"
                                            //             +"<th>2주차</th>"
                                            //             +"<th>3주차</th>"
                                            //             +"<th>4주차</th>"
                                            //         +"</tr>"
                                            //     +"</thead>"





                                            //     +"<tbody>"



                                            //         +"<tr>"
                                            //             +"<td class=item>부대찌개</td>"
                                            //             +"<td>월요일</td>"
                                            //             +"<td>화요일</td>"
                                            //             +"<td>수요일</td>"
                                            //             +"<td>목요일</td>"
                                                    
                                            //         +"</tr>"

                                            //         +"<tr>"
                                            //             +"<td class=item>밀푀유 나베</td>"
                                            //             +"<td>월요일</td>"
                                            //             +"<td>화요일</td>"
                                            //             +"<td>수요일</td>"
                                            //             +"<td>목요일</td>"
                                                        
                                            //         +"</tr>"

                                            //         +"<tr>"
                                            //             +"<td class=item>김치찌개</td>"
                                            //             +"<td>월요일</td>"
                                            //             +"<td>화요일</td>"
                                            //             +"<td>수요일</td>"
                                            //             +"<td>목요일</td>"
                                                    
                                            //         +"</tr>"

                                            //         +"<tr>"
                                            //             +"<td class=item>떡볶이</td>"
                                            //             +"<td>월요일</td>"
                                            //             +"<td>화요일</td>"
                                            //             +"<td>수요일</td>"
                                            //             +"<td>목요일</td>"
                                                        
                                            //         +"</tr>"

                                            //         +"<tr>"
                                            //             +"<td class=item>곱창전골</td>"
                                            //             +"<td>월요일</td>"
                                            //             +"<td>화요일</td>"
                                            //             +"<td>수요일</td>"
                                            //             +"<td>목요일</td>"
                                                    
                                            //         +"</tr>"



                                            //     +"</tbody>"
                                                
                                            // + "</table>"


                                            


                                    //   let ft = sp.querySelector("#first")
                                    //   console.log(ft)
                                    //   console.log("테스트용도")
                                    //   let item = document.querySelectorAll(".item")
                                    //   for(i=0; i<item.length; i++)
                                    //   console.log(item[i])
                                    //   console.log("확인")






                                     // 공백 검색시 알림창 표시
                                            if(text == "") {
                                        alert("검색어를 입력해주세요");
                                        sp.innerHTML = ""

                                            }


                                        // else  if (text == "밀푀유나베") {
                                        // console.log("정답아니야")
                                        // let nabe = document.querySelectorAll(".nabe")
                                        // for(i=0; i<nabe.length; i++){
                                        //     console.log(nabe[i])
                                        //     nabe[i].style.display = "block";
                                        //     nabe[i].style.border = "1px, solid, red"
                                        //     // budae[i].style.width = "auto"
                                        // } 
                                        // // budae[i].style.display = "none"
                                        // }


                                         // 물품 검색시 특정 창 표시
                                         
                                       
                                        // else if (text == "부대찌개") {
                                        // console.log("정답아니야")
                                        // let budae = document.querySelectorAll(".budae")
                                        // for(i=0; i<budae.length; i++){
                                        //     console.log(budae[i])
                                        //     budae[i].style.display = "block";
                                        //     budae[i].style.border = "1px, solid, red"
                                           
                                        //     // budae[i].style.width = "auto"
                                        // } 
                                        // //  nabe[i].style.display = "none"
                                        // }  
                                    // 조회된 내용이 없을 경우 알림창 표시
                                    //     else {
                                    //      alert("조회된 내용이 없습니다");
                                    //     //  sp.innerHTML = ""
                                    //    }   

                                       

                                    // 이걸 밖으로 빼야함
                                    let nabe = document.querySelectorAll(".nabe")
                                    let budae = document.querySelectorAll(".budae")
                                        
                                       switch(text) {


                                            case "부대찌개":

                                            console.log("정답아니야")
                                            for(i=0; i<budae.length; i++){
                                            console.log(budae[i])

                                            // budae[i].style.display = "block";
                                            budae[i].style.display = "inline";
                                            // budae[i].style.display = "-webkit-inline-box";
                                            // budae[i].style.width = "75%"


                                            // budae[i].style.border = "1px, solid, red"
                                            nabe[i].style.display = "none";  // 이것들은 안으로 넣고
                                            }
                                            // budae[i].style.display = "block";
                                           
                                            // console.log(nabe[i])
                                            break;



                                            case "밀푀유나베":

                                            console.log("정답아니야")
                                            // let nabe = document.querySelectorAll(".nabe")
                                            // let budae = document.querySelectorAll(".budae")
                                            for(i=0; i<nabe.length; i++){
                                            console.log(nabe[i])
                                            // nabe[i].style.display = "block";
                                            nabe[i].style.display = "inline";
                                            // nabe[i].style.width = "7500px"
                                            // nabe[i].style.border = "1px, solid, red"
                                            budae[i].style.display = "none";        // 쌓이게 하려면 none block 조절
                                            }
                                           
                                            // console.log(budae[i])
                                            // nabe[i].style.display = "block";
                                            break;


                                            // switch의 else값
                                            default :    
                                            alert("조회된 내용이 없습니다");
     
                                       } 
























                                        // budae.classList.add("budaes")
                                        

                                    //     ft.innerHTML = "<table border=1 id=first>" 

                                    // + "<thead>"
                                    //     +"<tr>"

                                    //         +"<th>" + months + "</th>"
                                    //         +"<th>1주차</th>"
                                    //         +"<th>2주차</th>"
                                    //         +"<th>3주차</th>"
                                    //         +"<th>4주차</th>"

                                    //     +"</tr>"
                                    // +"</thead>"





                                    //         +"<tbody>"



                                    //             +"<tr>"

                                    //                 +"<td class=item>부대찌개</td>"
                                    //                 +"<td>월요일</td>"
                                    //                 +"<td>화요일</td>"
                                    //                 +"<td>수요일</td>"
                                    //                 +"<td>목요일</td>"
                                                
                                    //             +"</tr>"

                                                



                                    //         +"</tbody>"

                                    //         + "</table>"    


                                    //         let tr = document.querySelectorAll(".list")
                                    //    tr.addEventListener("click", function() {
                                            
                                    //         console.log("클릭확인")
                                    //             })

                                        
                                  

                                        
                                           


                                      










                                            let del = document.querySelectorAll("#del")
                                            for(i=0; i<del.length; i++) 
                                            del[i].addEventListener("click", function() {
                                            sp.innerHTML = ""
                                            console.log("삭제확인")
                                                })





                                            let fix = document.querySelectorAll("#fix")
                                            for(i=0; i<fix.length; i++) 
                                            fix[i].addEventListener("click", function() {
                                            console.log("수정확인")
                                            // let td = document.querySelector("td")
                                            // if(checked = td) {
                                            //     console.log("체크확인")
                                                
                                            // }

                                            
                                            })












                                        // if(text == "부대찌개") {
                                        //     console.log("안녕하세요")
                                        //     sp.innerHTML = "<table>" 
                                        
                                        // + "<thead>"
                                           
                                        //     +"<tr>"
                                        //         +"<th><div id=empty></div></th>"
                                        //         +"<th>06:00~08:00</th>"
                                        //         +"<th>08:00~10:00</th>"
                                        //         +"<th>10:00~12:00</th>"
                                        //         +"<th>12:00~14:00</th>"
                                        //         +"<th>14:00~16:00</th>"
                                        //         +"<th>16:00~18:00</th>"
                                            
                                        //     +"</tr>"
                                        //   +"</thead>"





                                        //   +"<tbody>"



                                        //     +"<tr>"
                                        //         +"<td>부대찌개</td>"
                                        //         +"<td>월요일</td>"
                                        //         +"<td>화요일</td>"
                                        //         +"<td>수요일</td>"
                                        //         +"<td>목요일</td>"
                                        //         +"<td>금요일</td>"
                                        //         +"<td>토요일</td>"
                                                
                                        //     +"</tr>"


                                        //     +"</tbody>"           

                                        //         +"</table>" 
                                        // }
                                        
                                        }
                                        //op4


                                        // let items = document.querySelector("#item")
                                        //     items.addEventListener("click", function() {
                                        //     items.classList.add("item")
                                        //     })    







                                        


                                        
                }) 
                // 조회




