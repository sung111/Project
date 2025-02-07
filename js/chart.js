const ctx = document.getElementById('myChart').getContext('2d');
const config = (ctx, {
    type: 'line',
    data: {
        labels: ['06:00~08:00', '08:00~10:00', '10:00~12:00', '12:00~14:00', '14:00~16:00', '16:00~18:00',],
        datasets: [{

            // select 값이 부대찌개라면
            label: '일별 상승률',
            fill: false,
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
            label: '주간 상승율',
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
            label: '월간 상승율',
            fill: false,
            data: [82, 
                22,
                55,
                74,
                85,
                25,
               ],
            backgroundColor: [
                'rgba(54, 162, 235, 0.2)',
                
                
            ],
            borderColor: [
                'rgba(54, 162, 235, 0.2)',
               
                
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


    
    options: {responsive: false,
        scales: {
            y: {
                beginAtZero: true
            }
        }
    }

});



document.getElementById('reData').onclick = function(){
		
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
    
    myChart.update();	//차트 업데이트
}
















const ctx2 = document.getElementById('myChart2').getContext('2d');
const myChart2 = new Chart(ctx2, {
    type: 'line',
    data: {
        labels: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일',],
        datasets: [{

            // select 값이 부대찌개라면
            label: '부대찌개',
            data: [Math.random()*10000, 
                   Math.random()*10000,
                   Math.random()*10000,
                   Math.random()*10000,
                   Math.random()*10000,
                   Math.random()*10000,
                   Math.random()*10000,
                  

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
            data: [Math.random()*10000, 
                Math.random()*10000,
                Math.random()*10000,
                Math.random()*10000,
                Math.random()*10000,
                Math.random()*10000,
                Math.random()*10000,],
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
            data: [Math.random()*10000, 
                Math.random()*10000,
                Math.random()*10000,
                Math.random()*10000,
                Math.random()*10000,
                Math.random()*10000,
                Math.random()*10000,],
            backgroundColor: [
                'rgba(54, 162, 235, 0.2)',
                
                
            ],
            borderColor: [
                'rgba(54, 162, 235, 0.2)',
               
                
            ],
            borderWidth: 1
        },
        {

            // select 값이 부대찌개라면
            label: '떡볶이',
            data: [Math.random()*10000, 
                Math.random()*10000,
                Math.random()*10000,
                Math.random()*10000,
                Math.random()*10000,
                Math.random()*10000,
                Math.random()*10000,],
            backgroundColor: [
                'rgb(238, 130, 238)',
                
                
            ],
            borderColor: [
                'rgb(238, 130, 238)',
               
                
            ],
            borderWidth: 1
        },
        {

            // select 값이 부대찌개라면
            label: '곱창전골',
            data: [Math.random()*10000, 
                Math.random()*10000,
                Math.random()*10000,
                Math.random()*10000,
                Math.random()*10000,
                Math.random()*10000,
                Math.random()*10000,],
            backgroundColor: [
                'rgb(106, 90, 205)',
                
                
            ],
            borderColor: [
                'rgb(106, 90, 205)',
               
                
            ],
            borderWidth: 1
        },
    ]
       
    },
    options: {responsive: false,
        scales: {
            y: {
                beginAtZero: true
            }
        }
    }

    
});








const ctx3 = document.getElementById('myChart3').getContext('2d');
const myChart3 = new Chart(ctx3, {
    type: 'line',
    data: {
        labels: ['1주차', '2주차', '3주차', '4주차',],
        datasets: [{

            // select 값이 부대찌개라면
            label: '부대찌개',
            data: [Math.random()*10000, 
                   Math.random()*10000,
                   Math.random()*10000,
                   Math.random()*10000,
               

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
            data: [Math.random()*10000, 
                Math.random()*10000,
                Math.random()*10000,
                Math.random()*10000,
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
            data: [Math.random()*10000, 
                Math.random()*10000,
                Math.random()*10000,
                Math.random()*10000,
               ],
            backgroundColor: [
                'rgba(54, 162, 235, 0.2)',
                
                
            ],
            borderColor: [
                'rgba(54, 162, 235, 0.2)',
               
                
            ],
            borderWidth: 1
        },
        {

            // select 값이 부대찌개라면
            label: '떡볶이',
            data: [Math.random()*10000, 
                Math.random()*10000,
                Math.random()*10000,
                Math.random()*10000,
               ],
            backgroundColor: [
                'rgb(238, 130, 238)',
                
                
            ],
            borderColor: [
                'rgb(238, 130, 238)',
               
                
            ],
            borderWidth: 1
        },
        {

            // select 값이 부대찌개라면
            label: '곱창전골',
            data: [Math.random()*10000, 
                Math.random()*10000,
                Math.random()*10000,
                Math.random()*10000,
               ],
            backgroundColor: [
                'rgb(106, 90, 205)',
                
                
            ],
            borderColor: [
                'rgb(106, 90, 205)',
               
                
            ],
            borderWidth: 1
        },
    ]
       
    },
    options: {responsive: false,
        scales: {
            y: {
                beginAtZero: true
            }
        }
    }

    
});





let day = document.querySelector("#day")
let newChart = document.querySelector("#myChart")
let newChart2 = document.querySelector("#myChart2")
let newChart3 = document.querySelector("#myChart3")
day.addEventListener("change", function() {
console.log("탄수화물")

switch(this.value) {


   
    case "일간 실적 상승률":
        newChart.style.display = "block"
        newChart2.style.display = "none"
        newChart3.style.display = "none"
    console.log("일간")
    

        break;
    





    case "주간 실적 상승률":
        newChart.style.display = "none"
        newChart2.style.display = "block"
        newChart3.style.display = "none"
    console.log("주간")
    

        break;
        // 월간 . 주간. 일간으로 바꿨을때도 표 사라지게 하기






    case "월간 실적 상승률":
        newChart.style.display = "none"
        newChart2.style.display = "none"
        newChart3.style.display = "block"
    console.log("월간")
   
   
        break;


}

})




let ocu = document.querySelector("#ocu")
let ocu1 = document.querySelector("#doughnut")
let ocu2 = document.querySelector("#doughnut2")
let ocu3 = document.querySelector("#doughnut3")
ocu.addEventListener("change", function() {
    console.log("탄수화물")
    
    switch(this.value) {
    
    
       
        case "일간 실적 지분율":
            ocu1.style.display = "block"
            ocu2.style.display = "none"
            ocu3.style.display = "none"
        console.log("일간")
        
    
            break;
        
    
    
    
    
    
        case "주간 실적 지분율":
            ocu1.style.display = "none"
            ocu2.style.display  = "block"
            ocu3.style.display = "none"
        console.log("주간")
        
    
            break;
            // 월간 . 주간. 일간으로 바꿨을때도 표 사라지게 하기
    
    
    
    
    
    
        case "월간 실적 지분율":
            ocu1.style.display = "none"
            ocu2.style.display = "none"
            ocu3.style.display = "block"
        console.log("월간")
       
       
            break;
    
    
    }
    
    })
    











const pie = document.getElementById('Pie').getContext('2d');
const pieChart = new Chart(pie, {
    
    data: {
       
        labels: ['생산율', '불량율'],
        datasets: [
            {
            type: 'pie',
            // select 값이 부대찌개라면
            label: '부대찌개',
            data: [Math.random()*10000, Math.random()*10000,],
            backgroundColor: [
                'rgba(54, 162, 235, 0.2)',
             
             
             
                
            ],
            borderColor: [
                'rgba(54, 162, 235, 1)',
               
             
              
                
            ],
            borderWidth: 1
        },

       
    ]
    },
    options: {responsive: false,
        scales: {
            y: {
                beginAtZero: true
            }
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
            label: '밀푀유나베',
            data: [Math.random()*10000, Math.random()*10000,],
            backgroundColor: [
                'rgba(54, 162, 235, 0.2)',
             
             
             
                
            ],
            borderColor: [
                'rgba(54, 162, 235, 1)',
               
             
              
                
            ],
            borderWidth: 1
        },

       
    ]
    },
    options: {responsive: false,
        scales: {
            y: {
                beginAtZero: true
            }
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
            label: '김치찌개',
            data: [Math.random()*10000, Math.random()*10000,],
            backgroundColor: [
                'rgba(54, 162, 235, 0.2)',
             
             
             
                
            ],
            borderColor: [
                'rgba(54, 162, 235, 1)',
               
             
              
                
            ],
            borderWidth: 1
        },

       
    ]
    },
    options: {responsive: false,
        scales: {
            y: {
                beginAtZero: true
            }
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
            label: '떡볶이',
            data: [Math.random()*10000, Math.random()*10000,],
            backgroundColor: [
                'rgba(54, 162, 235, 0.2)',
             
             
             
                
            ],
            borderColor: [
                'rgba(54, 162, 235, 1)',
               
             
              
                
            ],
            borderWidth: 1
        },

       
    ]
    },
    options: {responsive: false,
        scales: {
            y: {
                beginAtZero: true
            }
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
            label: '곱창전골',
            data: [Math.random()*10000, Math.random()*10000,],
            backgroundColor: [
                'rgba(54, 162, 235, 0.2)',
             
             
             
                
            ],
            borderColor: [
                'rgba(54, 162, 235, 1)',
               
             
              
                
            ],
            borderWidth: 1
        },

       
    ]
    },
    options: {responsive: false,
        scales: {
            y: {
                beginAtZero: true
            }
        }
    }
});




/* select 박스 */
let choi1 = document.querySelector("#choi1")
let choi2 = document.querySelector("#choi2")
let choi3 = document.querySelector("#choi3")
let choi4 = document.querySelector("#choi4")
let choi5 = document.querySelector("#choi5")


let Pie = document.querySelector("#Pie")
let Pie2 = document.querySelector("#Pie2")
let Pie3 = document.querySelector("#Pie3")
let Pie4 = document.querySelector("#Pie4")
let Pie5 = document.querySelector("#Pie5")





let sel = document.querySelector("#sel")
sel.addEventListener("change", function() {

    console.log("d")

    switch(this.value) {


   
        case "생산율과 불량율 : 부대찌개":
            
        console.log("일간")
        Pie.style.display = "block"
        Pie2.style.display = "none"
        Pie3.style.display = "none"
        Pie4.style.display = "none"
        Pie5.style.display = "none"

            break;
        





        case "생산율과 불량율 : 밀푀유나베":
            
        console.log("주간")
        Pie.style.display = "none"
        Pie2.style.display = "block"
        Pie3.style.display = "none"
        Pie4.style.display = "none"
        Pie5.style.display = "none"

            break;
            // 월간 . 주간. 일간으로 바꿨을때도 표 사라지게 하기






        case "생산율과 불량율 : 김치찌개":
            
        console.log("월간")
        Pie.style.display = "none"
        Pie2.style.display = "none"
        Pie3.style.display = "block"
        Pie4.style.display = "none"
        Pie5.style.display = "none"
       
            break;




            case "생산율과 불량율 : 떡볶이":
                Pie.style.display = "none"
                Pie2.style.display = "none"
                Pie3.style.display = "none"
                Pie4.style.display = "block"
                Pie5.style.display = "none"
        console.log("월간")

       
       
            break;







            case "생산율과 불량율 : 곱창전골":
                Pie.style.display = "none"
                Pie2.style.display = "none"
                Pie3.style.display = "none"
                Pie4.style.display = "none"
                Pie5.style.display = "block"
        console.log("월간")

        
       
            break;
    
    }

})











const doughnut = document.getElementById('doughnut').getContext('2d');
const doughnutChart = new Chart(doughnut, {
    type: 'doughnut',
    data: {
        labels: ['부대찌개', '밀푀유나베', '김치찌개', '떡볶이', '곱창전골'],
        datasets: [{
            label: '# of Votes',
            data: [Math.random()*10000, Math.random()*10000, Math.random()*10000, Math.random()*10000, Math.random()*10000,],
            backgroundColor: [
                'rgba(54, 162, 235, 0.2)',
                
           
                
            ],
            borderColor: [
                'rgba(54, 162, 235, 1)',
               
               
                
            ],
            borderWidth: 1
        }]
    },
    options: {responsive: false,
        scales: {
            y: {
                beginAtZero: true
            }
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
            data: [Math.random()*10000, Math.random()*10000, Math.random()*10000, Math.random()*10000, Math.random()*10000,],
            backgroundColor: [
                'rgba(54, 162, 235, 0.2)',
                
           
                
            ],
            borderColor: [
                'rgba(54, 162, 235, 1)',
               
               
                
            ],
            borderWidth: 1
        }]
    },
    options: {responsive: false,
        scales: {
            y: {
                beginAtZero: true
            }
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
            data: [Math.random()*10000, Math.random()*10000, Math.random()*10000, Math.random()*10000, Math.random()*10000,],
            backgroundColor: [
                'rgba(54, 162, 235, 0.2)',
                
           
                
            ],
            borderColor: [
                'rgba(54, 162, 235, 1)',
               
               
                
            ],
            borderWidth: 1
        }]
    },
    options: {responsive: false,
        scales: {
            y: {
                beginAtZero: true
            }
        }
    }
});


var myChart = new Chart(ctx, config);


































