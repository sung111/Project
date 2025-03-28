
/* line차트 */ 
const ctx = document.getElementById('myChart').getContext('2d');
const config = (ctx, {
    type: 'line',
    data: {
        labels: ['06:00~08:00', '08:00~10:00', '10:00~12:00', '12:00~14:00', '14:00~16:00', '16:00~18:00',],
        datasets: [{

            // select 값이 부대찌개라면
            label: '부대찌개',
            // fill: false,
            data: [30, 
                   40,
                   50,
                   60,
                   70,
                   80,
                  
            ],
            backgroundColor: [
                'rgb(60, 179, 113)',
                
                
            ],
            borderColor: [
                'rgb(60, 179, 113)',
               
                
            ],
            borderWidth: 1
        },
        {

            // select 값이 부대찌개라면
            label: '밀푀유나베',
            fill: false,
            data: [63, 
                36,
                25,
                64,
                97,
                16,
                ],
            backgroundColor: [
                'rgb(255, 165, 0)',
                
                
            ],
            borderColor: [
                'rgb(255, 165, 0)',
               
                
            ],
            borderWidth: 1
        },
        {

            // select 값이 부대찌개라면
            label: '김치찌개',
            fill: false,
            data: [82, 
                22,
                55,
                74,
                85,
                25,
               ],
            backgroundColor: [
                '#9A2EFE',
                
                
            ],
            borderColor: [
                '#9A2EFE',
               
                
            ],
            borderWidth: 1
        },
        {

            // select 값이 부대찌개라면
            label: '떡볶이',
            fill: false,
            data: [12, 
                29,
                23,
                88,
                10,
                89,
               ],
            backgroundColor: [
                'rgb(54, 162, 235)',
                
                
            ],
            borderColor: [
                'rgb(54, 162, 235)',
               
                
            ],
            borderWidth: 1
        },
        {

            // select 값이 부대찌개라면
            label: '곱창전골',
            fill: false,
            data: [62, 
                29,
                67,
                12,
                93,
                67,
               ],
            backgroundColor: [
                'rgb(255, 99, 132)',
                
                
            ],
            borderColor: [
                'rgb(255, 99, 132)',
               
                
            ],
            borderWidth: 1
        },








        // {

        //     // select 값이 부대찌개라면
        //     label: '떡볶이',
        //     fill: false,
        //     data: [Math.random()*10000, 
        //         Math.random()*10000,
        //         Math.random()*10000,
        //         Math.random()*10000,
        //         Math.random()*10000,
        //         Math.random()*10000,
        //         ],
        //     backgroundColor: [
        //         'rgb(238, 130, 238)',
                
                
        //     ],
        //     borderColor: [
        //         'rgb(238, 130, 238)',
               
                
        //     ],
        //     borderWidth: 1
        // },
        // {

        //     // select 값이 부대찌개라면
        //     label: '곱창전골',
        //     fill: false,
        //     data: [Math.random()*10000, 
        //         Math.random()*10000,
        //         Math.random()*10000,
        //         Math.random()*10000,
        //         Math.random()*10000,
        //         Math.random()*10000,
        //         ],
        //     backgroundColor: [
        //         'rgb(106, 90, 205)',
                
                
        //     ],
        //     borderColor: [
        //         'rgb(106, 90, 205)',
               
                
        //     ],
        //     borderWidth: 1
        // },
    ]
       
    },


    
    options: {responsive: true, 
       
        
        scales: {
            y: {
                beginAtZero: true
            }
        }
    }

});




// doughnut차트 끌어오기
let donut = document.getElementById('doughsets')
donut.style.display = 'none';
let doh2 = document.getElementById('doughset')
let doh3 = document.getElementById('doughset2')




let sel = document.getElementById('sel')




// document.getElementById('Pie').style.display = 'none';
// document.getElementById('Pie2').style.display = 'none';
// document.getElementById('Pie3').style.display = 'none';
// document.getElementById('Pie4').style.display = 'none';
// document.getElementById('Pie5').style.display = 'none';


// let Pies= document.querySelector('#Pie')
// Pies.classList.add("Pie")

// let Pies2 = document.querySelector("#Pie2")
// let Pies3 = document.querySelector("#Pie3")
// let Pies4 = document.querySelector("#Pie4")
// let Pies5 = document.querySelector("#Pie5")




// Pie차트 끌어오기
let setpies = document.getElementById('piesets')
let setpie = document.getElementById('pieset')
let setpie2 = document.getElementById('pieset2')
let setpie3 = document.getElementById('pieset3')
let setpie4 = document.getElementById('pieset4')



// line차트 끌어오기
let mineChart = document.querySelector("#setting")
let mineChart2 = document.querySelector("#mcset")
let mineChart3 = document.querySelector("#mcset2")



// sel.addEventListener("change", function(){

// console.log("확인과 연락")
// document.getElementById('Pie').style.display = 'block';
// mineChart.style.display = 'none'
// document.getElementById('doughnut').style.display = 'none';
// })

// let day = document.querySelector("#day")
// day.addEventListener("change", function(){

//     console.log("확인과 연락")
//     document.getElementById('doughnut').style.display = 'block';
//     mineChart.style.display = 'none'
//     document.getElementById('Pie').style.display = 'none';

//     })
    











const ctx2 = document.getElementById('myChart2').getContext('2d');
const config2 = (ctx2, {
    type: 'line',
    data: {
        labels: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일',],
        datasets: [{

            // select 값이 부대찌개라면
            label: '부대찌개',
            data: [28, 
                   46,
                   85,
                   47,
                   67,
                   34,
                   86,
                  

            ],
            backgroundColor: [
                'rgb(60, 179, 113)',
                
                
            ],
            borderColor: [
                'rgb(60, 179, 113)',
               
                
            ],
            borderWidth: 1
        },
        {

            // select 값이 부대찌개라면
            label: '밀푀유나베',
            data: [95, 
                 23,
                86,
                74,
                16,
                97,
                54,],
            backgroundColor: [
                'rgb(255, 165, 0)',
                
                
            ],
            borderColor: [
                'rgb(255, 165, 0)',
               
                
            ],
            borderWidth: 1
        },
        {

            // select 값이 부대찌개라면
            label: '김치찌개',
            data: [22, 
                96,
                87,
                47,
                17,
                76,
                24,],
            backgroundColor: [
                '#9A2EFE',
                
                
                
            ],
            borderColor: [
                '#9A2EFE',
                
               
                
            ],
            borderWidth: 1
        },
        {

            // select 값이 부대찌개라면
            label: '떡볶이',
            data: [22, 
                46,
                87,
                47,
                10,
                76,
                48,],
            backgroundColor: [
                'rgb(54, 162, 235)',
                
                
            ],
            borderColor: [
                'rgb(54, 162, 235)',
               
                
            ],
            borderWidth: 1
        },
        {

            // select 값이 부대찌개라면
            label: '곱창전골',
            data: [22, 
                96,
                20,
                36,
                63,
                48,
                24,],
            backgroundColor: [
                'rgb(255, 99, 132)'
                
                
            ],
            borderColor: [
                'rgb(255, 99, 132)'
               
                
            ],
            borderWidth: 1
        },
        
        
        
        
    ]
     
    

    },
    options: {responsive: true,
        scales: {
            y: {
                beginAtZero: true
            }
        }
    }

    
});





const ctx3 = document.getElementById('myChart3').getContext('2d');
const config3 = (ctx3, {
    type: 'line',
    data: {
        labels: ['1주차', '2주차', '3주차', '4주차',],
        datasets: [{

            // select 값이 부대찌개라면
            label: '부대찌개',
            data: [28, 
                   46,
                   85,
                   47,
                   
                  

            ],
            backgroundColor: [
                'rgb(60, 179, 113)',
                
                
            ],
            borderColor: [
                'rgb(60, 179, 113)',
               
                
            ],
            borderWidth: 1
        },
        {

            // select 값이 부대찌개라면
            label: '밀푀유나베',
            data: [95, 
                 23,
                86,
                74,
                
                ],
            backgroundColor: [
                'rgb(255, 165, 0)',
                
                
            ],
            borderColor: [
                'rgb(255, 165, 0)',
               
                
            ],
            borderWidth: 1
        },
        {

            // select 값이 부대찌개라면
            label: '김치찌개',
            data: [22, 
                96,
                87,
                47,
                
                ],
            backgroundColor: [
                '#9A2EFE',
                
                
            ],
            borderColor: [
                '#9A2EFE',
               
                
            ],
            borderWidth: 1
        },

        {

            // select 값이 부대찌개라면
            label: '떡볶이',
            data: [22, 
                96,
                67,
                37,
              
                ],
            backgroundColor: [
               'rgb(54, 162, 235)'
                
                
            ],
            borderColor: [
                'rgb(54, 162, 235)',
               
                
            ],
            borderWidth: 1
        },
        

        {

            // select 값이 부대찌개라면
            label: '곱창전골',
            data: [22, 
                96,
                27,
                87,
                
                ],
            backgroundColor: [
                'rgb(255, 99, 132)',
                
                
            ],
            borderColor: [
                'rgb(255, 99, 132)',
               
                
            ],
            borderWidth: 1
        },
        
        
        
        
    ]
     
    

    },
    options: {responsive: true,
        scales: {
            y: {
                beginAtZero: true
            }
        }
    }

    
});






// 생산율 버튼
let reData = document.getElementById('reData')
reData.addEventListener("change", function(){
		
    //데이터셋 수 만큼 반복
    var dataset = config.data.datasets;
    for(var i=0; i<dataset.length; i++){
        console.log(dataset);
        //데이터 갯수 만큼 반복
        var data = dataset[i].data;
        for(var j=0 ; j < data.length ; j++){
            data[j] = Math.floor(Math.random() * 50);
        }
    }

    var dataset2 = config2.data.datasets;
    for(var i=0; i<dataset2.length; i++){
        console.log(dataset2);
        //데이터 갯수 만큼 반복
        var data2 = dataset2[i].data;
        for(var j=0 ; j < data2.length ; j++){
            data[j] = Math.floor(Math.random() * 50);
        }
    }

    var dataset3 = config3.data.datasets;
    for(var i=0; i<dataset3.length; i++){
        console.log(dataset3);
        //데이터 갯수 만큼 반복
        var data3 = dataset3[i].data;
        for(var j=0 ; j < data3.length ; j++){
            data[j] = Math.floor(Math.random() * 50);
        }
    }
    
    myChart.update();	//차트 업데이트
    myChart2.update();
    myChart3.update();
    




    // document.getElementById('doughnut').style.display = 'none';
    // mineChart.style.display = 'block'
    // document.getElementById('Pie').style.display = 'none';
    
    // donut.style.display = 'none'
    // doh2.style.display = 'none'
    // doh3.style.display = 'none'


    // const selectValue = reData.value;
    // localStorage.setItem("myChart", selectValue);
    // updateChart(selectValue);


     // pies로 해야함
    

    //  pies.style.display = 'none'
    //  document.querySelector("#Pie2").style.display = 'block'
    //  document.querySelector("#Pie3").style.display = 'block'
    //  document.querySelector("#Pie4").style.display = 'block'
    //  document.querySelector("#Pie5").style.display = 'block'


    switch(this.value) {


        case "전일 대비 생산율":
        console.log("안녕하세요")
         mineChart.style.display = 'block'
          mineChart2.style.display = 'none'
           mineChart3.style.display = 'none'


        //    donut.style.display = 'none'
        //    doh2.style.display = 'none'
        //  doh3.style.display = 'none'



        //    setpies.style.display = 'none'
        //    setpie.style.display = 'none'
        //    setpie2.style.display =  'none'
        //    setpie3.style.display = 'none'
        //  setpie4.style.display = 'none'
            
        break;









        case "전주 대비 생산율":
            mineChart.style.display = 'none'
            mineChart2.style.display = 'block'
             mineChart3.style.display = 'none'


        //      donut.style.display = 'none'
        //      doh2.style.display = 'none'
        //    doh3.style.display = 'none'


        //    setpies.style.display = 'none'
        //    setpie.style.display = 'none'
        //    setpie2.style.display =  'none'
        //    setpie3.style.display = 'none'
        //  setpie4.style.display = 'none'
            
            
        break;










        case "전월 대비 생산율":
            mineChart.style.display = 'none'
            mineChart2.style.display = 'none'
             mineChart3.style.display = 'block'

        //      donut.style.display = 'none'
        //      doh2.style.display = 'none'
        //    doh3.style.display = 'none'

        //    setpies.style.display = 'none'
        //    setpie.style.display = 'none'
        //    setpie2.style.display =  'none'
        //    setpie3.style.display = 'none'
        //  setpie4.style.display = 'none'
            
            
        break;


       

   } 

})








// let day = document.querySelector("#day")
// let newChart = document.querySelector("#myChart")
// let newChart2 = document.querySelector("#myChart2")
// let newChart3 = document.querySelector("#myChart3")
// day.addEventListener("change", function() {
// console.log("탄수화물")

// switch(this.value) {


   
//     case "일간 실적 상승률":
//         newChart.style.display = "block"
//         newChart2.style.display = "none"
//         newChart3.style.display = "none"
//     console.log("일간")
    

//         break;
    





//     case "주간 실적 상승률":
//         newChart.style.display = "none"
//         newChart2.style.display = "block"
//         newChart3.style.display = "none"
//     console.log("주간")
    

//         break;
       






//     case "월간 실적 상승률":
//         newChart.style.display = "none"
//         newChart2.style.display = "none"
//         newChart3.style.display = "block"
//     console.log("월간")
   
   
//         break;


// }

// })




// let ocu = document.querySelector("#ocu")
// let ocu1 = document.querySelector("#doughnut")
// let ocu2 = document.querySelector("#doughnut2")
// let ocu3 = document.querySelector("#doughnut3")
// ocu.addEventListener("change", function() {
//     console.log("탄수화물")
    
//     switch(this.value) {
    
    
       
//         case "일간 실적 지분율":
//             ocu1.style.display = "block"
//             ocu2.style.display = "none"
//             ocu3.style.display = "none"
//         console.log("일간")
        
    
//             break;
        
    
    
    
    
    
//         case "주간 실적 지분율":
//             ocu1.style.display = "none"
//             ocu2.style.display  = "block"
//             ocu3.style.display = "none"
//         console.log("주간")
        
    
//             break;
            
    
    
    
    
    
    
//         case "월간 실적 지분율":
//             ocu1.style.display = "none"
//             ocu2.style.display = "none"
//             ocu3.style.display = "block"
//         console.log("월간")
       
       
//             break;
    
    
//     }
    
//     })
    










/* Pie 차트 */ 
const pie = document.getElementById('Pie').getContext('2d');
const pieChart = new Chart(pie, {
    
    data: {
       
        labels: ['생산율1', '불량율2'],
        datasets: [{
            type: 'pie', 
            // select 값이 부대찌개라면
            label: '생산율3',
            fill: false,
            data: [95, 5,],
            backgroundColor: [
                'rgb(54, 162, 235)',
                'rgb(255, 99, 132)',
             
             
             
                
            ],
            borderColor: [
                'rgba(54, 162, 235, 1)',
               
             
              
                
            ],
            borderWidth: 1
        }],
    },
    options: {responsive: true,
        legend: {
            display: false,
            position: 'top',
            
        },
        
        scales: { 
            x: {
            
            display : false
            },
            y: {
                
                display : false
            },
        }
    }
});

const pie2 = document.getElementById('Pie2').getContext('2d');
const pieChart2 = new Chart(pie2, {
    
    data: {
       
        labels: ['생산율', '불량율'],
        datasets: [
            {
            type: 'pie',
            // select 값이 부대찌개라면
            label: '생산율',
            data: [90, 10,],
            backgroundColor: [
                'rgb(54, 162, 235)',
                'rgb(255, 99, 132)',
             
             
             
                
            ],
            borderColor: [
                'rgba(54, 162, 235, 1)',
               
             
              
                
            ],
            borderWidth: 1
        },

       
    ]
    },
    options: {responsive: true,
        scales: {
            x: {
            
                display : false
                },
                y: {
                    
                    display : false
                },
        }
    }
});

const pie3 = document.getElementById('Pie3').getContext('2d');
const pieChart3 = new Chart(pie3, {
    
    data: {
       
        labels: ['생산율', '불량율'],
        datasets: [
            {
            type: 'pie',
            // select 값이 부대찌개라면
            label: '생산율',
            data: [80, 20,],
            backgroundColor: [
                'rgb(54, 162, 235)',
                'rgb(255, 99, 132)',
             
             
             
                
            ],
            borderColor: [
                'rgba(54, 162, 235, 1)',
               
             
              
                
            ],
            borderWidth: 1
        },

       
    ]
    },
    options: {responsive: true,
        scales: {
            x: {
            
                display : false
                },
                y: {
                    
                    display : false
                },
        }
    }
});

const pie4 = document.getElementById('Pie4').getContext('2d');
const pieChart4 = new Chart(pie4, {
    
    data: {
       
        labels: ['생산율', '불량율'],
        datasets: [
            {
            type: 'pie',
            // select 값이 부대찌개라면
            label: '생산율',
            data: [50, 50,],
            backgroundColor: [
                'rgb(54, 162, 235)',
                'rgb(255, 99, 132)',
             
             
             
                
            ],
            borderColor: [
                'rgba(54, 162, 235, 1)',
               
             
              
                
            ],
            borderWidth: 1
        },

       
    ]
    },
    options: {responsive: true,
        scales: {
            x: {
            
                display : false
                },
                y: {
                    
                    display : false
                },
        }
    }
});

const pie5 = document.getElementById('Pie5').getContext('2d');
const pieChart5 = new Chart(pie5, {
    
    data: {
       
        labels: ['생산율', '불량율'],
        datasets: [
            {
            type: 'pie',
            // select 값이 부대찌개라면
            label: ['생산율'],
            data: [70, 30,],
            backgroundColor: [
                
                'rgb(54, 162, 235)',
                'rgb(255, 99, 132)',
             
                
            ],
            borderColor: [
                'rgba(0, 105, 155, 0.29)',
              
               
             
              
                
            ],
            borderWidth: 1
        },

       
    ]
    },
    options: {responsive: true,
        scales: {
            x: {
            
                display : false
                },
                y: {
                    
                    display : false
                },
        }
    }
});






// 생산율 불량율 버튼
sel.addEventListener("change", function(){

    console.log("확인과 연락")
    // let pies = document.getElementById('Pie')
    // pies.style.display = 'block';
    //  document.querySelector("#Pie2").style.display = 'block'
    //  document.querySelector("#Pie3").style.display = 'block'
    //  document.querySelector("#Pie4").style.display = 'block'
    //  document.querySelector("#Pie5").style.display = 'block'
  




    switch(this.value) {


        case "월별 생산율과 불량율 : 부대찌개":
        console.log("안녕하세요")
          setpies.style.display = 'block'
          setpie.style.display = 'none'
          setpie2.style.display = 'none'
          setpie3.style.display = 'none'
          setpie4.style.display = 'none'

        //   donut.style.display = 'none'
        //   doh2.style.display = 'none'
        //   doh3.style.display = 'none'

        //   mineChart.style.display = 'none'
        //   mineChart2.style.display = 'none'
        //   mineChart3.style.display = 'none'
        break;









        case "월별 생산율과 불량율 : 밀푀유나베":
            setpies.style.display = 'none'
            setpie.style.display = 'block'
            setpie2.style.display = 'none'
            setpie3.style.display = 'none'
            setpie4.style.display = 'none'

        //     donut.style.display = 'none'
        //     doh2.style.display = 'none'
        //   doh3.style.display = 'none'


            
        //     mineChart.style.display = 'none'
        //     mineChart2.style.display = 'none'
        //      mineChart3.style.display = 'none'
        break;










        case "월별 생산율과 불량율 : 김치찌개":
            setpies.style.display = 'none'
            setpie.style.display = 'none'
            setpie2.style.display =  'block'
            setpie3.style.display = 'none'
          setpie4.style.display = 'none'

        //   donut.style.display = 'none'
        //   doh2.style.display = 'none'
        // doh3.style.display = 'none'



        //   mineChart.style.display = 'none'
        //   mineChart2.style.display = 'none'
        //    mineChart3.style.display = 'none'
        break;






        case "월별 생산율과 불량율 : 떡볶이":
            setpies.style.display = 'none'
            setpie.style.display = 'none'
            setpie2.style.display =  'none'
            setpie3.style.display = 'block'
          setpie4.style.display = 'none'


        //   donut.style.display = 'none'
        //   doh2.style.display = 'none'
        // doh3.style.display = 'none'



        //   mineChart.style.display = 'none'
        //   mineChart2.style.display = 'none'
        //    mineChart3.style.display = 'none'
        break;







        case "월별 생산율과 불량율 : 곱창전골":
            setpies.style.display = 'none'
            setpie.style.display = 'none'
            setpie2.style.display =  'none'
            setpie3.style.display = 'none'
          setpie4.style.display = 'block'


        //   donut.style.display = 'none'
        //   doh2.style.display = 'none'
        // doh3.style.display = 'none'





        //   mineChart.style.display = 'none'
        //   mineChart2.style.display = 'none'
        //    mineChart3.style.display = 'none'
        break;

       

   } 

    })
    
    













// const pie2 = document.getElementById('Pie2').getContext('2d');
// const pieChart2 = new Chart(pie2, {
    
//     data: {
       
//         labels: ['생산율', '불량율'],
//         datasets: [
//             {
//             type: 'pie',
//             // select 값이 부대찌개라면
//             label: '밀푀유나베',
//             data: [Math.random()*10000, Math.random()*10000,],
//             backgroundColor: [
//                 'rgba(54, 162, 235, 0.2)',
             
             
             
                
//             ],
//             borderColor: [
//                 'rgba(54, 162, 235, 1)',
               
             
              
                
//             ],
//             borderWidth: 1
//         },

       
//     ]
//     },
//     options: {responsive: false,
//         scales: {
//             y: {
//                 beginAtZero: true
//             }
//         }
//     }
// });

// const pie3 = document.getElementById('Pie3').getContext('2d');
// const pieChart3 = new Chart(pie3, {
    
//     data: {
       
//         labels: ['생산율', '불량율'],
//         datasets: [
//             {
//             type: 'pie',
//             // select 값이 부대찌개라면
//             label: '김치찌개',
//             data: [Math.random()*10000, Math.random()*10000,],
//             backgroundColor: [
//                 'rgba(54, 162, 235, 0.2)',
             
             
             
                
//             ],
//             borderColor: [
//                 'rgba(54, 162, 235, 1)',
               
             
              
                
//             ],
//             borderWidth: 1
//         },

       
//     ]
//     },
//     options: {responsive: false,
//         scales: {
//             y: {
//                 beginAtZero: true
//             }
//         }
//     }
// });

// const pie4 = document.getElementById('Pie4').getContext('2d');
// const pieChart4 = new Chart(pie4, {
    
//     data: {
       
//         labels: ['생산율', '불량율'],
//         datasets: [
//             {
//             type: 'pie',
//             // select 값이 부대찌개라면
//             label: '떡볶이',
//             data: [Math.random()*10000, Math.random()*10000,],
//             backgroundColor: [
//                 'rgba(54, 162, 235, 0.2)',
             
             
             
                
//             ],
//             borderColor: [
//                 'rgba(54, 162, 235, 1)',
               
             
              
                
//             ],
//             borderWidth: 1
//         },

       
//     ]
//     },
//     options: {responsive: false,
//         scales: {
//             y: {
//                 beginAtZero: true
//             }
//         }
//     }
// });

// const pie5 = document.getElementById('Pie5').getContext('2d');
// const pieChart5 = new Chart(pie5, {
    
//     data: {
       
//         labels: ['생산율', '불량율'],
//         datasets: [
//             {
//             type: 'pie',
//             // select 값이 부대찌개라면
//             label: '곱창전골',
//             data: [Math.random()*10000, Math.random()*10000,],
//             backgroundColor: [
//                 'rgba(54, 162, 235, 0.2)',
             
             
             
                
//             ],
//             borderColor: [
//                 'rgba(54, 162, 235, 1)',
               
             
              
                
//             ],
//             borderWidth: 1
//         },

       
//     ]
//     },
//     options: {responsive: false,
//         scales: {
//             y: {
//                 beginAtZero: true
//             }
//         }
//     }
// });




/* select 박스 */





// let sel = document.querySelector("#sel")
// sel.addEventListener("change", function() {

//     console.log("d")

//     switch(this.value) {


   
//         case "생산율과 불량율 : 부대찌개":
            
//         console.log("일간")
//         Pie.style.display = "block"
//         Pie2.style.display = "none"
//         Pie3.style.display = "none"
//         Pie4.style.display = "none"
//         Pie5.style.display = "none"

//             break;
        





//         case "생산율과 불량율 : 밀푀유나베":
            
//         console.log("주간")
//         Pie.style.display = "none"
//         Pie2.style.display = "block"
//         Pie3.style.display = "none"
//         Pie4.style.display = "none"
//         Pie5.style.display = "none"

//             break;
//             // 월간 . 주간. 일간으로 바꿨을때도 표 사라지게 하기






//         case "생산율과 불량율 : 김치찌개":
            
//         console.log("월간")
//         Pie.style.display = "none"
//         Pie2.style.display = "none"
//         Pie3.style.display = "block"
//         Pie4.style.display = "none"
//         Pie5.style.display = "none"
       
//             break;




//             case "생산율과 불량율 : 떡볶이":
//                 Pie.style.display = "none"
//                 Pie2.style.display = "none"
//                 Pie3.style.display = "none"
//                 Pie4.style.display = "block"
//                 Pie5.style.display = "none"
//         console.log("월간")

       
       
//             break;







//             case "생산율과 불량율 : 곱창전골":
//                 Pie.style.display = "none"
//                 Pie2.style.display = "none"
//                 Pie3.style.display = "none"
//                 Pie4.style.display = "none"
//                 Pie5.style.display = "block"
//         console.log("월간")

        
       
//             break;
    
//     }

// })










// 도넛차트
const doughnut = document.getElementById('doughnut').getContext('2d');
const doughnutChart = new Chart(doughnut, {
    type: 'doughnut',
    data: {
        labels: ['부대찌개', '밀푀유나베', '김치찌개', '떡볶이', '곱창전골'],
        datasets: [{
            label: '# of Votes',
            data: [20, 30, 10, 25, 15,],
            backgroundColor: [
                'rgb(54, 162, 235)',
                'rgb(255, 99, 132)',
                'rgb(255, 205, 86)',
               ' rgba(0, 129, 0, 0.29)',
               'rgba(49, 47, 217, 0.27)',
                
           
                
            ],
            borderColor: [
                'rgba(54, 162, 235, 1)',
               
               
                
            ],
            borderWidth: 1
        }]
    },
    options: {responsive: true,
        scales: {
            x: {
            
                display : false
                },
                y: {
                    
                    display : false
                },
        }
    }
});

const doughnut2 = document.getElementById('doughnut2').getContext('2d');
const doughnutChart2 = new Chart(doughnut2, {
    type: 'doughnut',
    data: {
        labels: ['부대찌개', '밀푀유나베', '김치찌개', '떡볶이', '곱창전골'],
        datasets: [{
            label: '# of Votes',
            data: [30, 20, 5, 40, 5,],
            backgroundColor: [
               'rgb(54, 162, 235)',
                'rgb(255, 99, 132)',
                'rgb(255, 205, 86)',
               ' rgba(0, 129, 0, 0.29)',
               'rgba(49, 47, 217, 0.27)',
                
           
                
            ],
            borderColor: [
                'rgba(54, 162, 235, 1)',
               
               
                
            ],
            borderWidth: 1
        }]
    },
    options: {responsive: true,
        scales: {
            x: {
            
                display : false
                },
                y: {
                    
                    display : false
                },
        }
    }
});

const doughnut3 = document.getElementById('doughnut3').getContext('2d');
const doughnutChart3 = new Chart(doughnut3, {
    type: 'doughnut',
    data: {
        labels: ['부대찌개', '밀푀유나베', '김치찌개', '떡볶이', '곱창전골'],
        datasets: [{
            label: '# of Votes',
            data: [20, 5, 40, 25, 10,],
            backgroundColor: [
                
                'rgb(54, 162, 235)',
                'rgb(255, 99, 132)',
                'rgb(255, 205, 86)',
               ' rgba(0, 129, 0, 0.29)',
               'rgba(49, 47, 217, 0.27)',
           
                
            ],
            borderColor: [
                'rgba(54, 162, 235, 1)',
               
               
                
            ],
            borderWidth: 1
        }]
    },
    options: {responsive: true,
        scales: {
            x: {
            
                display : false
                },
                y: {
                    
                    display : false
                },
        }
    }
});





// 실적지분 버튼
let day = document.querySelector("#day")
    day.addEventListener("change", function(){
    
        console.log("확인과 연락")
        // document.getElementById('doughnut').style.display = 'block';
        // mineChart.style.display = 'none'
        // document.getElementById('Pie').style.display = 'none';
        // document.getElementById('myChart').style.display = 'none';






    // let doh = document.getElementById('doughnut')
   
        
    switch(this.value) {


        case "일간 실적 지분":
            donut.style.display = 'block'
            doh2.style.display = 'none'
            doh3.style.display = 'none'

            // mineChart.style.display = 'none'
            // mineChart2.style.display = 'none'
            //  mineChart3.style.display = 'none'
            
            //   setpies.style.display = 'none'
            //   setpie.style.display = 'none'
            //   setpie2.style.display =  'none'
            //   setpie3.style.display = 'none'
            // setpie4.style.display = 'none'

             
        console.log("안녕하세요")
        break;









        case "주간 실적 지분":

        donut.style.display = 'none'
        doh2.style.display = 'block'
        doh3.style.display = 'none'

        // mineChart.style.display = 'none'
        //     mineChart2.style.display = 'none'
        //      mineChart3.style.display = 'none'
            
        //       setpies.style.display = 'none'
        //       setpie.style.display = 'none'
        //       setpie2.style.display =  'none'
        //       setpie3.style.display = 'none'
        //     setpie4.style.display = 'none'

        break;










        case "월간 실적 지분":
            donut.style.display = 'none'
            doh2.style.display = 'none'
            doh3.style.display = 'block'

            // mineChart.style.display = 'none'
            // mineChart2.style.display = 'none'
            //  mineChart3.style.display = 'none'
            
            //   setpies.style.display = 'none'
            //   setpie.style.display = 'none'
            //   setpie2.style.display =  'none'
            //   setpie3.style.display = 'none'
            // setpie4.style.display = 'none'

        break;


       

   } 
        })

// const doughnut2 = document.getElementById('doughnut2').getContext('2d');
// const doughnutChart2 = new Chart(doughnut2, {
//     type: 'doughnut',
//     data: {
//         labels: ['부대찌개', '밀푀유나베', '김치찌개', '떡볶이', '곱창전골'],
//         datasets: [{
//             label: '# of Votes',
//             data: [Math.random()*10000, Math.random()*10000, Math.random()*10000, Math.random()*10000, Math.random()*10000,],
//             backgroundColor: [
//                 'rgba(54, 162, 235, 0.2)',
                
           
                
//             ],
//             borderColor: [
//                 'rgba(54, 162, 235, 1)',
               
               
                
//             ],
//             borderWidth: 1
//         }]
//     },
//     options: {responsive: false,
//         scales: {
//             y: {
//                 beginAtZero: true
//             }
//         }
//     }
// });

// const doughnut3 = document.getElementById('doughnut3').getContext('2d');
// const doughnutChart3 = new Chart(doughnut3, {
//     type: 'doughnut',
//     data: {
//         labels: ['부대찌개', '밀푀유나베', '김치찌개', '떡볶이', '곱창전골'],
//         datasets: [{
//             label: '# of Votes',
//             data: [Math.random()*10000, Math.random()*10000, Math.random()*10000, Math.random()*10000, Math.random()*10000,],
//             backgroundColor: [
//                 'rgba(54, 162, 235, 0.2)',
                
           
                
//             ],
//             borderColor: [
//                 'rgba(54, 162, 235, 1)',
               
               
                
//             ],
//             borderWidth: 1
//         }]
//     },
//     options: {responsive: false,
//         scales: {
//             y: {
//                 beginAtZero: true
//             }
//         }
//     }
// });


var myChart = new Chart(ctx, config);
var myChart2 = new Chart(ctx2, config2);
var myChart3 = new Chart(ctx3, config3);



var chartpie = new Chart(pie, pieChart);

if (chartpie) {
    chartpie.destroy();
}

var chartpie2 = new Chart(pie2, pieChart2);
var chartpie3 = new Chart(pie3, pieChart3);
var chartpie4 = new Chart(pie4, pieChart4);
var chartpie5 = new Chart(pie5, pieChart5);

var douchart = new Chart(doughnut, doughnutChart);
var douchart2 = new Chart(doughnut2, doughnutChart2);
var douchart3 = new Chart(doughnut3, doughnutChart3);































