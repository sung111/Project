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


  // 작지
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
    view.innerHTML = `<div class="dex item">
                        <div class="dateB">${date.value}</div>
                        <div class="emdwp">${wpName.innerHTML}</div>
                        <div class="emdtn">10pack</div>
                        <div>생산완료</div>
                        <div><button class="tn">수정</button><button class="tkr">삭제</button></div>
                      </div>` + view.innerHTML
    alert('실적등록을 완료했습니다.')



  })


  document.querySelector('.box3View').addEventListener('click', (e) => {


    if (e.target.innerText == '완료') {
      const tarG = e.target.parentNode.parentNode
      const date = tarG.querySelector('.emdskf').value
      const wp = tarG.querySelector('.emdwp').value
      const tn = tarG.querySelector('.emdtn').value
      const tarGe = tarG.querySelectorAll('.input')
      tarG.innerHTML = "";
      // for (let i = 0; i < tarGe.length; i++) {
      //   console.log(tarGe[i].value);
      //   tarG.innerHTML += `<div>${tarGe[i].value}</div>`;
      // }
      tarG.innerHTML += `
                          <div class="dateB">${date}</div>
                          <div class="emdwp">${wp}</div>
                          <div class="emdtn">${tn}</div>
                          <div>생산완료</div>
                          <div><button class="tn">수정</button><button class="tkr">삭제</button></div>
                          </div>
                        `
    }

    //수정버튼
    if (e.target.innerText == '수정') {

      const now = new Date();
      const year = now.getFullYear();
      const month = ("0" + (now.getMonth() + 1)).slice(-2);
      const day = ("0" + now.getDate()).slice(-2);
      const hour = ("0" + now.getHours()).slice(-2);
      const minute = ("0" + now.getMinutes()).slice(-2);
      const date = `${year}-${month}-${day}T${hour}:${minute}`;

      const emdwp = e.target.parentNode.parentNode.querySelector('.emdwp').innerText
      const emdtn = e.target.parentNode.parentNode.querySelector('.emdtn').innerText
      e.target.parentNode.parentNode.innerHTML =
        `
      <div><input type="datetime-local" class="emdskf" value="${date}"></div>
      <div><input type="text" class="emdwp" value="${emdwp}"></div>
      <div><input type="text" class="emdtn" value="${emdtn}"></div>
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

  document.querySelector('.btn4').addEventListener('click', (e) => {
    const wp = document.querySelector('.wp3').value
    const inD1 = document.querySelector('.indate1').value
    const inD2 = document.querySelector('.indate2').value

    const items = document.querySelectorAll('.item')
    for(let i = 0 ; i < items.length ; i++){
      // console.log(items[i].innerHTML)
      items[i].querySelector('.dateB').innerHTML
      console.log(items[i].querySelector('.dateB').innerHTML)
    }





  })


}


