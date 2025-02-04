window.addEventListener('load', init)


function init() {

  //시간고정
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


  //등록버튼
  document.querySelector('.btn3').addEventListener('click', (e) => {
    const intd = document.querySelector('.registrationView').innerHTML
    const view = document.querySelector('.box3View')
    const date = document.querySelector('.date1')
    const wpName = document.querySelector('.wp2')
    
    const index = document.querySelector('.index');
    // bom 불러와서 저장하기
    // 날짜, 제품명, LotNo, 코멘트, 수/삭but
    view.innerHTML = `<div class="dex">
                        <div>${date.value}</div>
                        <div>${wpName.innerHTML}</div>
                        <div>10pack</div>
                        <div>생산완료</div>
                        <div><button class="tn">수정</button><button class="tkr">삭제</button></div>
                      </div>` + view.innerHTML
    alert('실적등록을 완료했습니다.')



  })


  document.querySelector('.box3View').addEventListener('click', (e) => {


    if (e.target.innerText == '완료') {
      const tarG = e.target.parentNode.parentNode
      const tarGe = tarG.querySelectorAll('.input')
      tarG.innerHTML = "";
      for (let i = 0; i < tarGe.length; i++) {
        console.log(tarGe[i].value);
        tarG.innerHTML += `<div>${tarGe[i].value}</div>`;
      }
      tarG.innerHTML += `
                          <div>생산완료</div>
                          <div><button class="tn">수정</button><button class="tkr">삭제</button></div>
                          </div>
                        `
    }

    //수정버튼
    if (e.target.innerText == '수정') {
      e.target.parentNode.parentNode.innerHTML =
      `
      <div><input type="datetime-local" class="input"></div>
      <div><input type="text" class="input"></div>
      <div><input type="text" class="input"></div>
      <div>생산완료</div>
      <div><button class="dhks">완료</button><button class="cnl">취소</button></div>
      `
    }


    const tkr = document.querySelectorAll('.tkr')
    for (let i = 0; i < tkr.length; i++) {
      if (e.target.innerText == '삭제') {
        e.target.parentNode.parentNode.remove();
      }
    }
  })





}


