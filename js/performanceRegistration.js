window.addEventListener('load', init)
window.addEventListener('load', time)

function init() {

  document.querySelector('.btn1').addEventListener('click', (e) => {
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
        if (targetBox) {
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

  document.querySelector('.btn3').addEventListener('click', (e) => {
    const intd = document.querySelector('.registrationView').innerHTML
    const view = document.querySelector('.box3View')
    const date = document.querySelector('.date1')
    const wpName = document.querySelector('.wp2')
    // bom 불러와서 저장하기
    // 날짜, 제품명, LotNo, 코멘트, 수/삭but 
    view.innerHTML += `<div class="index">
                        <div>${date.value}</div>
                        <div>${wpName.innerHTML}</div>
                        <div>1box</div>
                        <div>완료</div>
                        <div><button class="tn">수정</button><button class="tkr">삭제</button></div>
                      </div>`

    const tkr = document.querySelectorAll('.tkr')
    for(let i = 0 ; i < tkr.length ; i++){
      tkr[i].addEventListener('click', (e) => {
        e.target.parentNode.parentNode.remove();
      })
    }

    const tn = document.querySelectorAll('.tn')
    for(let i = 0 ; i < tkr.length ; i++){
      tn[i].addEventListener('click', (e) => {
        // console.log(e.target.parentNode.parentNode)
        e.target.parentNode.parentNode.innerHTML =
                      `
                        <div><input type="text"></div>
                        <div><input type="text"></div>
                        <div><input type="text"></div>
                        <div>완료</div>
                        <div><button class="dhks">완료</button><button class="cnl">취소</button></div>
                      `
      })
      
    }
    document.querySelector('.box3View').addEventListener('click',(e)=>{
      if (e.target.innerHTML == '완료'){
        document.querySelector('.index').innerHTML += 
        
        console.log('gd')
      }
    })
    




  })





}


function time() {

  const now = new Date();
  const year = now.getFullYear();
  const month = ("0" + (now.getMonth() + 1)).slice(-2);
  const day = ("0" + now.getDate()).slice(-2);

  const hour = ("0" + now.getHours()).slice(-2);
  const minute = ("0" + now.getMinutes()).slice(-2);

  const date = `${year}-${month}-${day}T${hour}:${minute}`;
  document.querySelector('.date1').value = date;
  document.querySelector('.indate1').value = date;
  document.querySelector('.indate2').value = date;

}