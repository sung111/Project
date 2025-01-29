document.addEventListener('DOMContentLoaded', function () {
    const navButtons = document.querySelectorAll('.nav-button');
    navButtons.forEach(function (navbtn) {
        navbtn.addEventListener('click', function () {
            const navMenu = navbtn.nextElementSibling;
            const isOpen = navMenu.classList.contains('open');

            navButtons.forEach(function (btn) {
                btn.classList.remove('nav-blue');
                btn.nextElementSibling.classList.remove('open');
            });

            if (!isOpen) {
                navbtn.classList.add('nav-blue');
                navMenu.classList.add('open');
            } else {
                navbtn.classList.remove('nav-blue');
                navMenu.classList.remove('open');
            }
        });
    });

    // mobile Version
    if (window.innerWidth <= 767) { 
        const mobNavBar = document.querySelector('.mobnav-bar'); 
        const nav = document.querySelector('nav'); 
        const iframeOverlay = document.querySelector('.navopen-shadow'); 
        
        mobNavBar.addEventListener('click', function () {
            nav.classList.toggle('open'); 
            iframeOverlay.style.display = nav.classList.contains('open') ? 'block' : 'none'; 

            // X 모양으로 변경
            const bars = mobNavBar.querySelectorAll('.mobnav');
            if (nav.classList.contains('open')) {
                bars[0].style.transform = 'rotate(-45deg) translate(-5px, 6px)';
                bars[1].style.opacity = '0';
                bars[2].style.transform = 'rotate(45deg) translate(-5px, -6px)';
            } else {
                bars[0].style.transform = 'rotate(0deg) translate(0, 0)';
                bars[1].style.opacity = '1';
                bars[2].style.transform = 'rotate(0deg) translate(0, 0)';
            }
        });
    }
});

document.addEventListener("DOMContentLoaded", function(){
    const iframe = document.querySelector("iframe")
    const workOrdermenu = document.querySelector("#nav-workorder");
    workOrdermenu.addEventListener("click", function(){
        iframe.src = "componant/WorkOrder.html"
    })
})