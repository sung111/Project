
let second = document.querySelector("#second")
let third = document.querySelector("#third")

// let fix = document.querySelector("#fix")
// let regi = document.querySelector("#regi")
// let del = document.querySelector("#del")
// del.addEventListener("click", function() {
//  alert("보고서가 삭제되었습니다")

// })

// regi.addEventListener("click", function() {
//     alert("보고서가 등록되었습니다")
   
//    })

//    fix.addEventListener("click", function() {
//     alert("보고서가 수정되었습니다")
   
//    })

   
   
  




const ctx = document.getElementById('myChart').getContext('2d');
const myChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: ['06:00~08:00', '08:00~10:00', '10:00~12:00', '12:00~14:00	', '14:00~16:00', '16:00~18:00',],
        datasets: [{

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
           
            label: '밀푀유나베',
            data: [100, 140, 110, 90, 25, 50],
            backgroundColor: [
                'rgba(54, 162, 235, 0.2)',
                
            ],
            borderColor: [
                'rgba(54, 162, 235, 0.2)',
   
            ],
        }]
       
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
    type: 'bar',
    data: {
        labels: ['월요일', '08:00~10:00', '10:00~12:00', '12:00~14:00	', '14:00~16:00', '16:00~18:00',],
        datasets: [{

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
           
            label: '밀푀유나베',
            data: [100, 140, 110, 90, 25, 50],
            backgroundColor: [
                'rgba(54, 162, 235, 0.2)',
                
            ],
            borderColor: [
                'rgba(54, 162, 235, 0.2)',
   
            ],
        }]
       
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
    type: 'bar',
    data: {
        labels: ['1주차', '08:00~10:00', '10:00~12:00', '12:00~14:00	', '14:00~16:00', '16:00~18:00',],
        datasets: [{

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
           
            label: '밀푀유나베',
            data: [100, 140, 110, 90, 25, 50],
            backgroundColor: [
                'rgba(54, 162, 235, 0.2)',
                
            ],
            borderColor: [
                'rgba(54, 162, 235, 0.2)',
   
            ],
        }]
       
    },
    options: {responsive: false, responsive: true,
        scales: {
            y: {
                beginAtZero: true
            }
        }
    }

    
});

























let but1 = document.querySelector("#dadd") 
let but2 = document.querySelector("#but2") 
let but3 = document.querySelector("#but3") 

// but1.addEventListener("click", function() {


// console.log("차트추가")
// //라벨추가
// config.data.labels.push('밀푀유나베'+config.data.labels.length)
		
// //데이터셋 수 만큼 반복
// var dataset = config.data.datasets;
// for(var i=0; i<dataset.length; i++){
//     //데이터셋의 데이터 추가
//     dataset[i].data.push(100, 140, 110, 90, 25, 50);
// }
// myChart.update();	//차트 업데이트


// })










let bar1 = document.querySelector("#Chart1") 
let bar2 = document.querySelector("#Chart2") 
let bar3 = document.querySelector("#Chart3") 


let op1 = document.querySelector("#sel") 
let op2 = document.querySelector("#daily") 
let op3 = document.querySelector("#week")
let op4 = document.querySelector("#month")

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
        
        // but1.style.display = "none"
        // but2.style.display = "none"
        // but3.style.display = "block"
        console.log(but3)
            break;
    
    }
})