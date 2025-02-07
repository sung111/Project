
// $(function() {
//     $('input[name="daterange"]').daterangepicker({
//       opens: 'left'
//     }, function(start, end, label) {
//       console.log("A new date selection was made: " + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD'));
//     });
// });



// let del = document.querySelector("#del")
// let fix = document.querySelector("#fix")
// let table = document.querySelector("table")
// // for(i=0; i<third.length; i++) {
// table.addEventListener("click", function(event) {
// console.log("클릭")
// event.target.style.color = "lightgray"
// // table.style.color = "red"

// fix.addEventListener("click", function() {
//     console.log("삭제")
//     alert(event.target.innerHTML + "(이)가 수정되었습니다")
    
//     // table.style.color = "red"
//     })


    
// del.addEventListener("click", function() {
//     console.log("삭제")
//     alert(event.target.innerHTML + "(이)가 삭제되었습니다")
//     // table.style.color = "red"
//     })

// })

    



// let del = document.querySelector("#del")
                                     
// del.addEventListener("click", function() {
// alert("표가 삭제되었습니다")
//     })



    
//     let fix = document.querySelector("#fix")
                                  
//     fix.addEventListener("click", function() {
//     alert("표가 수정되었습니다")
//         })


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











const ctx = document.getElementById('myChart').getContext('2d');
const myChart = new Chart(ctx, {
   
    data: {
        labels: ['06:00~08:00', '08:00~10:00', '10:00~12:00', '12:00~14:00	', '14:00~16:00', '16:00~18:00',],
        datasets: [
            {
            type: 'bar',
            // select 값이 부대찌개라면
            label: '부대찌개',
            data: [100, 140, 110, 90, 25, 50],
            backgroundColor: [
                'rgba(54, 162, 235, 0.2)',
                
            ],
            borderColor: [
                'rgba(54, 162, 235, 0.2)',
   
            ],
            // borderWidth: 1
           
           
        },

        {
            type: 'bar',
            // select 값이 부대찌개라면
            label: '밀푀유나베',
            data: [10, 14, 11, 90, 25, 50],
            backgroundColor: [
                'rgba(54, 162, 235, 0.2)',
                
            ],
            borderColor: [
                'rgba(54, 162, 235, 0.2)',
   
            ],
            // borderWidth: 1
           
        
        },

        {
            type: 'bar',
            // select 값이 부대찌개라면
            label: '김치찌개',
            data: [100, 140, 110, 90, 25, 50],
            backgroundColor: [
                'rgba(54, 162, 235, 0.2)',
                
            ],
            borderColor: [
                'rgba(54, 162, 235, 0.2)',
   
            ],
            // borderWidth: 1
           
            label: '김치찌개',
            data: [100, 140, 110, 90, 25, 50],
            backgroundColor: [
                'rgba(54, 162, 235, 0.2)',
                
            ],
            borderColor: [
                'rgba(54, 162, 235, 0.2)',
   
            ],
        },

        {
            type: 'bar',
            // select 값이 부대찌개라면
            label: '떡볶이',
            data: [100, 140, 110, 90, 25, 50],
            backgroundColor: [
                'rgba(54, 162, 235, 0.2)',
                
            ],
            borderColor: [
                'rgba(54, 162, 235, 0.2)',
   
            ],
            // borderWidth: 1
           
            label: '떡볶이',
            data: [100, 140, 110, 90, 25, 50],
            backgroundColor: [
                'rgba(54, 162, 235, 0.2)',
                
            ],
            borderColor: [
                'rgba(54, 162, 235, 0.2)',
   
            ],
        },

        {
            type: 'bar',
            // select 값이 부대찌개라면
            label: '곱창전골',
            data: [100, 140, 110, 90, 25, 50],
            backgroundColor: [
                'rgba(54, 162, 235, 0.2)',
                
            ],
            borderColor: [
                'rgba(54, 162, 235, 0.2)',
   
            ],
            // borderWidth: 1
           
            label: '곱창전골',
            data: [100, 140, 110, 90, 25, 50],
            backgroundColor: [
                'rgba(54, 162, 235, 0.2)',
                
            ],
            borderColor: [
                'rgba(54, 162, 235, 0.2)',
   
            ],
        },



    ]
       
    },
    options: {responsive: false, responsive: true,
        scales: {
            y: {
                beginAtZero: true
            }
        }
    }

    
});

















const ctx2 = document.getElementById('myChart2').getContext('2d');
const myChart2 = new Chart(ctx2, {
    
    data: {
        labels: ['월요일', '08:00~10:00', '10:00~12:00', '12:00~14:00	', '14:00~16:00', '16:00~18:00','금요일'],
        datasets: [
            {
                type: 'bar',
                // select 값이 부대찌개라면
                label: '부대찌개',
                data: [100, 140, 110, 90, 25, 50, 50],
                backgroundColor: [
                    'rgba(54, 162, 235, 0.2)',
                    
                ],
                borderColor: [
                    'rgba(54, 162, 235, 0.2)',
       
                ],
                // borderWidth: 1
               
                label: '부대찌개',
                data: [100, 140, 110, 90, 25, 50, 50],
                backgroundColor: [
                    'rgba(54, 162, 235, 0.2)',
                    
                ],
                borderColor: [
                    'rgba(54, 162, 235, 0.2)',
       
                ],
            },
    
            {
                type: 'bar',
                // select 값이 부대찌개라면
                label: '밀푀유나베',
                data: [10, 14, 11, 90, 25, 50, 50],
                backgroundColor: [
                    'rgba(54, 162, 235, 0.2)',
                    
                ],
                borderColor: [
                    'rgba(54, 162, 235, 0.2)',
       
                ],
                // borderWidth: 1
               
                label: '밀푀유나베',
                data: [10, 14, 11, 90, 25, 50, 50],
                backgroundColor: [
                    'rgba(54, 162, 235, 0.2)',
                    
                ],
                borderColor: [
                    'rgba(54, 162, 235, 0.2)',
       
                ],
            },
    
            {
                type: 'bar',
                // select 값이 부대찌개라면
                label: '김치찌개',
                data: [100, 140, 110, 90, 25, 50, 50],
                backgroundColor: [
                    'rgba(54, 162, 235, 0.2)',
                    
                ],
                borderColor: [
                    'rgba(54, 162, 235, 0.2)',
       
                ],
                // borderWidth: 1
               
                label: '김치찌개',
                data: [100, 140, 110, 90, 25, 50, 50],
                backgroundColor: [
                    'rgba(54, 162, 235, 0.2)',
                    
                ],
                borderColor: [
                    'rgba(54, 162, 235, 0.2)',
       
                ],
            },
    
            {
                type: 'bar',
                // select 값이 부대찌개라면
                label: '떡볶이',
                data: [100, 140, 110, 90, 25, 50, 50],
                backgroundColor: [
                    'rgba(54, 162, 235, 0.2)',
                    
                ],
                borderColor: [
                    'rgba(54, 162, 235, 0.2)',
       
                ],
                // borderWidth: 1
               
                label: '떡볶이',
                data: [100, 140, 110, 90, 25, 50, 50],
                backgroundColor: [
                    'rgba(54, 162, 235, 0.2)',
                    
                ],
                borderColor: [
                    'rgba(54, 162, 235, 0.2)',
       
                ],
            },
    
            {
                type: 'bar',
                // select 값이 부대찌개라면
                label: '곱창전골',
                data: [100, 140, 110, 90, 25, 50, 50],
                backgroundColor: [
                    'rgba(54, 162, 235, 0.2)',
                    
                ],
                borderColor: [
                    'rgba(54, 162, 235, 0.2)',
       
                ],
                // borderWidth: 1
               
                label: '곱창전골',
                data: [100, 140, 110, 90, 25, 50, 60],
                backgroundColor: [
                    'rgba(54, 162, 235, 0.2)',
                    
                ],
                borderColor: [
                    'rgba(54, 162, 235, 0.2)',
       
                ],
            },
    ]
       
    },
    options: {responsive: false, responsive: true,
        scales: {
            y: {
                beginAtZero: true
            }
        }
    }

    
});


















const ctx3 = document.getElementById('myChart3').getContext('2d');
const myChart3 = new Chart(ctx3, {
   
    data: {
        labels: ['1주차', '08:00~10:00', '10:00~12:00', '4주차',],
        datasets: [
            {
                type: 'bar',
                // select 값이 부대찌개라면
                label: '부대찌개',
                data: [100, 140, 110, 90,],
                backgroundColor: [
                    'rgba(54, 162, 235, 0.2)',
                    
                ],
                borderColor: [
                    'rgba(54, 162, 235, 0.2)',
       
                ],
                // borderWidth: 1
               
                label: '부대찌개',
                data: [100, 140, 110, 90,],
                backgroundColor: [
                    'rgba(54, 162, 235, 0.2)',
                    
                ],
                borderColor: [
                    'rgba(54, 162, 235, 0.2)',
       
                ],
            },
    
            {
                type: 'bar',
                // select 값이 부대찌개라면
                label: '밀푀유나베',
                data: [10, 14, 11, 90,],
                backgroundColor: [
                    'rgba(54, 162, 235, 0.2)',
                    
                ],
                borderColor: [
                    'rgba(54, 162, 235, 0.2)',
       
                ],
                // borderWidth: 1
               
                label: '밀푀유나베',
                data: [10, 14, 11, 90,],
                backgroundColor: [
                    'rgba(54, 162, 235, 0.2)',
                    
                ],
                borderColor: [
                    'rgba(54, 162, 235, 0.2)',
       
                ],
            },
    
            {
                type: 'bar',
                // select 값이 부대찌개라면
                label: '김치찌개',
                data: [100, 140, 110, 90,],
                backgroundColor: [
                    'rgba(54, 162, 235, 0.2)',
                    
                ],
                borderColor: [
                    'rgba(54, 162, 235, 0.2)',
       
                ],
                // borderWidth: 1
               
                label: '김치찌개',
                data: [100, 140, 110, 90,],
                backgroundColor: [
                    'rgba(54, 162, 235, 0.2)',
                    
                ],
                borderColor: [
                    'rgba(54, 162, 235, 0.2)',
       
                ],
            },
    
            {
                type: 'bar',
                // select 값이 부대찌개라면
                label: '떡볶이',
                data: [100, 140, 110, 90, ],
                backgroundColor: [
                    'rgba(54, 162, 235, 0.2)',
                    
                ],
                borderColor: [
                    'rgba(54, 162, 235, 0.2)',
       
                ],
                // borderWidth: 1
               
                label: '떡볶이',
                data: [100, 140, 110, 90, ],
                backgroundColor: [
                    'rgba(54, 162, 235, 0.2)',
                    
                ],
                borderColor: [
                    'rgba(54, 162, 235, 0.2)',
       
                ],
            },
    
            {
                type: 'bar',
                // select 값이 부대찌개라면
                label: '곱창전골',
                data: [100, 140, 110, 90, ],
                backgroundColor: [
                    'rgba(54, 162, 235, 0.2)',
                    
                ],
                borderColor: [
                    'rgba(54, 162, 235, 0.2)',
       
                ],
                // borderWidth: 1
               
                label: '곱창전골',
                data: [100, 140, 110, 90, ],
                backgroundColor: [
                    'rgba(54, 162, 235, 0.2)',
                    
                ],
                borderColor: [
                    'rgba(54, 162, 235, 0.2)',
       
                ],
            },
    ]
       
    },
    options: {responsive: false, responsive: true,
        scales: {
            y: {
                beginAtZero: true
            }
        }
    }

    
});













let bar1 = document.querySelector("#Chart1") 
let bar2 = document.querySelector("#Chart2") 
let bar3 = document.querySelector("#Chart3") 




op1.addEventListener("change", function() {
    console.log("바뀜확인")


    switch(this.value) {


   
        case "일간":
            
        console.log("일간")
        first.style.display = "block"
        second.style.display = "none"
        third.style.display = "none"
     
        bar1.style.display = "block"
        bar2.style.display = "none"
        bar3.style.display = "none"
        
        days.style.display = "block";
        weeks.style.display = "none";
        months.style.display = "none";
        // but1.style.display = "block"
        // but2.style.display = "none"
        // but3.style.display = "none"

            break;
        
        case "주간":
            
        console.log("주간")
        first.style.display = "none"
        second.style.display = "block"
        third.style.display = "none"

        bar1.style.display = "none"
        bar2.style.display = "block"
        bar3.style.display = "none"

            days.style.display = "none";
            weeks.style.display = "block"
            weeks.value = " 2025-02-03 ";
            months.style.display = "none"
            weeks.valueAsDate = new Date("2025-02-03");
        // but1.style.display = "none"
        // but2.style.display = "block"
        // but3.style.display = "none"
            break;
            // 월간 . 주간. 일간으로 바꿨을때도 표 사라지게 하기


        case "월간":
            
        console.log("월간")

        first.style.display = "none"
        second.style.display = "none"
        third.style.display = "block"

        bar1.style.display = "none"
        bar2.style.display = "none"
        bar3.style.display = "block"

            days.style.display = "none";
            weeks.style.display = "none"
            months.style.display = "block"
            months.valueAsDate = new Date("2025-02-03");
        
        // but1.style.display = "none"
        // but2.style.display = "none"
        // but3.style.display = "block"
       
            break;
    
    }
})








let page2 = document.querySelector("#page2")
page2.addEventListener("click", function() {



    bar1.style.display = "none"
    bar2.style.display = "none"
    bar3.style.display = "none"





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



                                    //    if(text == "") {
                                    //     alert("검색어를 입력해주세요");
                                    //     // sp.innerHTML = ""
                                    //    } else if (text == "정답") {
                                    //     console.log("정답입니다")
                                    //    } else {
                                    //      alert("조회된 내용이 없습니다");
                                    //     //  sp.innerHTML = ""
                                    //    }       
                                    //         } 
                                            
                                            
                                            
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
                                                   
                                    //    if(text == "") {
                                    //     alert("검색어를 입력해주세요");
                                    //     // sp.innerHTML = ""
                                    //    } else if (text == "정답") {
                                    //     console.log("정답입니다")
                                    //    } else {
                                    //      alert("조회된 내용이 없습니다");
                                    //     //  sp.innerHTML = ""
                                    //    }           




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

                                       

                                    // // 이걸 밖으로 빼야함
                                    // let nabe = document.getElementById("nabe3")
                                    // let budae = document.getElementById("budae3")
                                    // let td = document.querySelector("td")

                                    //    switch(text) {


                                    //         case "부대찌개":

                                    //         console.log("정답아니야")
                                              
                                    //         alert(text + "가 검색되었습니다")




                                    //         // for(i=0; i<budae.length; i++){
                                    //         // console.log(budae[i])

                                    //         // budae[i].style.display = "block";
                                    //         // budae.style.display = "block";
                                    //         // budae[i].style.display = "-webkit-inline-box";
                                    //         // td.style.width = "500px"


                                    //         // budae[i].style.border = "1px, solid, red"
                                    //         // nabe.style.display = "none";  // 이것들은 안으로 넣고
                                            
                                    //         // budae[i].style.display = "block";
                                           
                                    //         // console.log(nabe[i])
                                    //         break;



                                    //         case "밀푀유나베":

                                    //         console.log("정답아니야")
                                    //         alert(text + "가 검색되었습니다")
                                    //         // let nabe = document.querySelectorAll(".nabe")
                                    //         // let budae = document.querySelectorAll(".budae")
                                    //         // for(i=0; i<nabe.length; i++){
                                    //         // console.log(nabe[i])
                                    //         // nabe[i].style.display = "block";
                                    //         // nabe.style.display = "inline";
                                    //         // nabe[i].style.width = "7500px"
                                    //         // nabe[i].style.border = "1px, solid, red"
                                    //         // budae.style.display = "none";        // 쌓이게 하려면 none block 조절
                                            
                                           
                                    //         // console.log(budae[i])
                                    //         // nabe[i].style.display = "block";
                                    //         break;

                                    //         case "김치찌개":

                                    //         console.log("정답아니야")
                                    //         alert(text + "가 검색되었습니다")
                                    //         // let nabe = document.querySelectorAll(".nabe")
                                    //         // let budae = document.querySelectorAll(".budae")
                                    //         // for(i=0; i<nabe.length; i++){
                                    //         // console.log(nabe[i])
                                    //         // nabe[i].style.display = "block";
                                    //         // nabe.style.display = "inline";
                                    //         // nabe[i].style.width = "7500px"
                                    //         // nabe[i].style.border = "1px, solid, red"
                                    //         // budae.style.display = "none";        // 쌓이게 하려면 none block 조절
                                            
                                           
                                    //         // console.log(budae[i])
                                    //         // nabe[i].style.display = "block";
                                    //         break;

                                            
                                    //         case "떡볶이":

                                    //         console.log("정답아니야")
                                              
                                    //         alert(text + "가 검색되었습니다")




                                    //         // for(i=0; i<budae.length; i++){
                                    //         // console.log(budae[i])

                                    //         // budae[i].style.display = "block";
                                    //         // budae.style.display = "block";
                                    //         // budae[i].style.display = "-webkit-inline-box";
                                    //         // td.style.width = "500px"


                                    //         // budae[i].style.border = "1px, solid, red"
                                    //         // nabe.style.display = "none";  // 이것들은 안으로 넣고
                                            
                                    //         // budae[i].style.display = "block";
                                           
                                    //         // console.log(nabe[i])
                                    //         break;

                                            
                                    //         case "곱창전골":

                                    //         console.log("정답아니야")
                                              
                                    //         alert(text + "가 검색되었습니다")




                                    //         // for(i=0; i<budae.length; i++){
                                    //         // console.log(budae[i])

                                    //         // budae[i].style.display = "block";
                                    //         // budae.style.display = "block";
                                    //         // budae[i].style.display = "-webkit-inline-box";
                                    //         // td.style.width = "500px"


                                    //         // budae[i].style.border = "1px, solid, red"
                                    //         // nabe.style.display = "none";  // 이것들은 안으로 넣고
                                            
                                    //         // budae[i].style.display = "block";
                                           
                                    //         // console.log(nabe[i])
                                    //         break;


                                    //         // switch의 else값
                                    //         default :    
                                    //         alert("조회된 내용이 없습니다");
     
                                    //    } 
























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

                                        
                                  

                                        
                                           


                                      










                                            // let del = document.querySelectorAll("#del")
                                            // for(i=0; i<del.length; i++) 
                                            // del[i].addEventListener("click", function() {
                                            // sp.innerHTML = ""
                                            // console.log("삭제확인")
                                            //     })


                                              


                                            // let fix = document.querySelectorAll("#fix")
                                            // for(i=0; i<fix.length; i++) 
                                            // fix[i].addEventListener("click", function() {
                                            // console.log("수정확인")










                                            // let td = document.querySelector("td")
                                            // if(checked = td) {
                                            //     console.log("체크확인")
                                                
                                            // }

                                            
                                            












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





































                                     // 공백 검색시 알림창 표시
                                     if(text == "") {
                                        alert("검색어를 입력해주세요");
                                        sp.innerHTML = ""

                                            }


// 이걸 밖으로 빼야함
let nabe = document.getElementById("nabe3")
let budae = document.getElementById("budae3")
let td = document.querySelector("td")

   switch(text) {


        case "부대찌개":

        console.log("정답아니야")
          
        alert(text + "가 검색되었습니다")




        // for(i=0; i<budae.length; i++){
        // console.log(budae[i])

        // budae[i].style.display = "block";
        // budae.style.display = "block";
        // budae[i].style.display = "-webkit-inline-box";
        // td.style.width = "500px"


        // budae[i].style.border = "1px, solid, red"
        // nabe.style.display = "none";  // 이것들은 안으로 넣고
        
        // budae[i].style.display = "block";
       
        // console.log(nabe[i])
        break;



        case "밀푀유나베":

        console.log("정답아니야")
        alert(text + "가 검색되었습니다")
        // let nabe = document.querySelectorAll(".nabe")
        // let budae = document.querySelectorAll(".budae")
        // for(i=0; i<nabe.length; i++){
        // console.log(nabe[i])
        // nabe[i].style.display = "block";
        // nabe.style.display = "inline";
        // nabe[i].style.width = "7500px"
        // nabe[i].style.border = "1px, solid, red"
        // budae.style.display = "none";        // 쌓이게 하려면 none block 조절
        
       
        // console.log(budae[i])
        // nabe[i].style.display = "block";
        break;

        case "김치찌개":

        console.log("정답아니야")
        alert(text + "가 검색되었습니다")
        // let nabe = document.querySelectorAll(".nabe")
        // let budae = document.querySelectorAll(".budae")
        // for(i=0; i<nabe.length; i++){
        // console.log(nabe[i])
        // nabe[i].style.display = "block";
        // nabe.style.display = "inline";
        // nabe[i].style.width = "7500px"
        // nabe[i].style.border = "1px, solid, red"
        // budae.style.display = "none";        // 쌓이게 하려면 none block 조절
        
       
        // console.log(budae[i])
        // nabe[i].style.display = "block";
        break;

        
        case "떡볶이":

        console.log("정답아니야")
          
        alert(text + "가 검색되었습니다")




        // for(i=0; i<budae.length; i++){
        // console.log(budae[i])

        // budae[i].style.display = "block";
        // budae.style.display = "block";
        // budae[i].style.display = "-webkit-inline-box";
        // td.style.width = "500px"


        // budae[i].style.border = "1px, solid, red"
        // nabe.style.display = "none";  // 이것들은 안으로 넣고
        
        // budae[i].style.display = "block";
       
        // console.log(nabe[i])
        break;

        
        case "곱창전골":

        console.log("정답아니야")
          
        alert(text + "가 검색되었습니다")




        // for(i=0; i<budae.length; i++){
        // console.log(budae[i])

        // budae[i].style.display = "block";
        // budae.style.display = "block";
        // budae[i].style.display = "-webkit-inline-box";
        // td.style.width = "500px"


        // budae[i].style.border = "1px, solid, red"
        // nabe.style.display = "none";  // 이것들은 안으로 넣고
        
        // budae[i].style.display = "block";
       
        // console.log(nabe[i])
        break;


        // switch의 else값
        default :    
        alert("조회된 내용이 없습니다");

   } 


                                        
  


                                        
                }) 
                // 조회




