const ctx = document.getElementById('myChart').getContext('2d');
const myChart = new Chart(ctx, {
    type: 'line',
    data: {
        labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        datasets: [{

            // select 값이 부대찌개라면
            label: '부대찌개',
            data: [12, 19, 35, 5, 23, 3, 10, 47, 62, 11, 13, 15],
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
            data: [12, 19, 3, 53, 22, 34, 10, 4, 62, 11, 13, 15],
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
            data: [12, 69, 3, 52, 2, 33, 10, 4, 62, 11, 13, 15],
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
            data: [12, 19, 3, 5, 26, 3, 10, 34, 6, 112, 13, 15],
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
            data: [12, 19, 3, 55, 2, 3, 10, 43, 6, 11, 13, 15],
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



const pie = document.getElementById('Pie').getContext('2d');
const pieChart = new Chart(pie, {
    
    data: {
       
        labels: ['생산율', '불량율'],
        datasets: [
            {
            type: 'pie',
            // select 값이 부대찌개라면
            label: '부대찌개',
            data: [20, 30],
            backgroundColor: [
                'rgba(54, 162, 235, 0.2)',
             
             
             
                
            ],
            borderColor: [
                'rgba(54, 162, 235, 1)',
               
             
              
                
            ],
            borderWidth: 1
        },

        {
            type: 'pie',
            // select 값이 부대찌개라면
            label: '밀푀유 나베',
            data: [40, 50],
            backgroundColor: [
                'rgb(93, 201, 178)',
                
             
             
                
            ],
            borderColor: [
                'black',
               
             
              
                
            ],
            borderWidth: 1
        },

        {
            type: 'pie',
            // select 값이 부대찌개라면
            label: '김치찌개',
            data: [40, 50],
            backgroundColor: [
                'rgb(255, 0, 0)',
                
             
             
                
            ],
            borderColor: [
                'black',
               
             
              
                
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




const doughnut = document.getElementById('doughnut').getContext('2d');
const doughnutChart = new Chart(doughnut, {
    type: 'doughnut',
    data: {
        labels: ['부대찌개', '밀푀유나베', '김치찌개', '떡볶이', '곱창전골'],
        datasets: [{
            label: '# of Votes',
            data: [20, 30, 50, 25, 40],
            backgroundColor: [
                'rgba(54, 162, 235, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(54, 162, 235, 0.2)',
           
                
            ],
            borderColor: [
                'rgba(54, 162, 235, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(54, 162, 235, 1)',
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



