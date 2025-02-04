window.addEventListener('load', init)
window.addEventListener('load', time)

function time() {
  const now = new Date();
  const year = now.getFullYear();
  const month = ("0" + (now.getMonth() + 1)).slice(-2);
  const day = ("0" + now.getDate()).slice(-2);
  const hour = ("0" + now.getHours()).slice(-2);
  const minute = ("0" + now.getMinutes()).slice(-2);

  const date = `${year}-${month}-${day}T${hour}:${minute}`;
  document.querySelector('.indate1').value = date;
  document.querySelector('.indate2').value = date;
  document.querySelector('.date2').value = date;
}


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
          document.querySelector('.wkrView').innerHTML = targetBox.innerHTML
          document.querySelector('.wkrView').innerHTML += targetBox2.innerHTML
        } else {
          document.querySelector('.wkrView').innerHTML = "불로오는도중 오류가발생했습니다."
        }
      })
      .catch(error => {
        console.error('페이지를 불러오는 도중 에러 발생:', error);
      });
  })


  // 제품 합/불 라디오버튼클릭시 숨기기/나오기
  const rad = document.querySelectorAll('.rad')
  let ss
  for (let i = 0; i < rad.length; i++) {
    rad[i].addEventListener('click', (e) => {
      if (rad[i].checked) {
        ss = rad[i].value
        if (ss == "불합격") {
          document.querySelector('.dropBox').classList.remove('hide')
        } else {
          document.querySelector('.dropBox').classList.add('hide')
        }
      }
    })
  }


  //등록버튼
  document.querySelector('.btn3').addEventListener('click', (e) => {
    const rad = document.querySelectorAll('.rad')
    let ss
    for (let i = 0; i < rad.length; i++) {
      // console.log(rad[i].checked);
      // console.log(rad[i].value);
      if (rad[i].checked) {
        ss = rad[i].value;
      }
    }

    // ss=합불
    // drop = 불합일때 드랍메뉴 벨류
    console.log(ss)
    const drop = document.querySelector('.dropBox').value
    console.log(drop);
    // 텍스트박스 값
    const textB = document.querySelector('.textBox').value
    console.log(textB)
    const date = document.querySelector('.date2').value
    console.log(date)
    const wp2 = document.querySelector('.wp2')
    const box3 = document.querySelector('.box3View')
    box3.innerHTML = `
                      <div class="dex">
                        <div>${date}</div>
                        <div>${wp2.innerText}</div>
                        <div>${ss}</div>
                        <div>사유 ㅋ</div>
                        <div>${textB}</div>
                        <div><button class="tn">수정</button><button class="tkr">삭제</button></div>
                      </div>
                    ` + box3.innerHTML
    alert("품질등록을 완료했습니다.")

  })

  document.querySelector('.box3View').addEventListener('click', (e)=>{

    //삭제
    // console.log(e.target);
    if(e.target.innerText == "삭제"){
      e.target.parentNode.parentNode.remove();
    }

    if(e.target.innerText == "수정"){
      e.target.parentNode.parentNode.innerHTML =
      `
      <div><input type="datetime-local"></div>
      <div><input type="text"></div>
      <div><input type="text"></div>
      <div><input type="text"></div>
      <div><input type="text"></div>
      <div><button class="tn">완료</button><button class="tkr">취소</button></div>

      `
    }


  })






}

