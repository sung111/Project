window.addEventListener('load',init)
window.addEventListener('load',time)

  function init (){
  
  document.querySelector('.btn1').addEventListener('click',(e)=>{
    console.log(e.target);

    fetch('WorkOrder.html')
    .then(response => {
      return response.text();
    })
    .then(html => {
      const parser = new DOMParser();
      const doc = parser.parseFromString(html, 'text/html');
      
      const targetBox = doc.querySelector('.workorder-layer');
      const targetBox2 = doc.querySelector('.workorder-pagenation');
      if(targetBox){
        document.querySelector('.instView').innerHTML = targetBox.innerHTML
        document.querySelector('.instView').innerHTML += targetBox2.innerHTML
      } else {
        document.querySelector('.instView').innerHTML = "불로오는도중 오류가발생했습니다."
      }
    })
    .catch(error => {
      console.error('페이지를 불러오는 도중 에러 발생:', error);
    });
  })





}


function time(){

    const now = new Date();
    const year   = now.getFullYear();
    const month  = ("0" + (now.getMonth() + 1)).slice(-2);
    const day    = ("0" + now.getDate()).slice(-2);
    
    const hour   = ("0" + now.getHours()).slice(-2);
    const minute = ("0" + now.getMinutes()).slice(-2);

    const date = `${year}-${month}-${day}T${hour}:${minute}`;
    document.querySelector('.date1').value = date;
    document.querySelector('.indate1').value = date;
    document.querySelector('.indate2').value = date;
  
}