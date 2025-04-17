window.addEventListener('load', init)


function init() {

  //로드시 시간 저장.
  const now = new Date();
  const year = now.getFullYear();
  const month = ("0" + (now.getMonth() + 1)).slice(-2);
  const day = ("0" + now.getDate()).slice(-2);
  const hour = ("0" + now.getHours()).slice(-2);
  const minute = ("0" + now.getMinutes()).slice(-2);
  const second = ("0" + now.getSeconds()).slice(-2);
  const date = `${year}-${month}-${day}T${hour}:${minute}:${second}`
  console.log(date)
  document.querySelector('.indate1').value = date
  document.querySelector('.indate2').value = date
  document.querySelector('.date1').value = date
  console.log(date.indexOf("T")); // 10
  console.log( date.slice( date.indexOf("T")+1 ) );
  console.log( date.slice( 0 , date.indexOf("T") ) );



  // 제품 합/불 기준 불러오기
  document.querySelector('.btn2').addEventListener('click', (e) => {
    const modal = document.querySelector('#myModal')
    const content = document.querySelector('.modal-content')
    fetch('Inspection_standards.html')
      .then(response => {
        if (!response.ok) {
          throw new Error('에러발쌩!');
        }
        return response.text();
      })
      .then(htmlString => {
        const parser = new DOMParser();
        const doc = parser.parseFromString(htmlString, 'text/html');
        const sel = doc.querySelectorAll('.standards-contain')
        const wp = document.querySelector('.wp')
        for (let i = 0; i < sel.length; i++) {
          if (wp.innerText == "부대찌개") {
            content.innerHTML = '';
            content.innerHTML = '<span class="close">&times;</span>'
            content.appendChild(sel[0].cloneNode(true));
            modal.style.display = 'block';
          } else if (wp.innerText == "김치찌개") {
            content.innerHTML = '';
            content.innerHTML = '<span class="close">&times;</span>'
            content.appendChild(sel[1].cloneNode(true));
            modal.style.display = 'block';

          } else if (wp.innerText == "밀푀유나베") {
            content.innerHTML = '';
            content.innerHTML = '<span class="close">&times;</span>'
            content.appendChild(sel[2].cloneNode(true));
            modal.style.display = 'block';

          } else if (wp.innerText == "떡볶이") {
            content.innerHTML = '';
            content.innerHTML = '<span class="close">&times;</span>'
            content.appendChild(sel[3].cloneNode(true));
            modal.style.display = 'block';
          } else if (wp.innerText == "곱창전골") {
            content.innerHTML = '';
            content.innerHTML = '<span class="close">&times;</span>'
            content.appendChild(sel[4].cloneNode(true));
            modal.style.display = 'block';
          }
        }

      })


  })
  
  // 제품합불기준 모달창 생성시 클릭이벤트
  document.querySelector('.modal').addEventListener('click', (e) => {
    const closeBtn = document.querySelector(".close");
    const modal = document.querySelector('#myModal')
    if (e.target === closeBtn) {
      modal.style.display = "none";
    }
  })
  window.addEventListener("click", (event) => {
    const modal = document.querySelector('#myModal')
    if (event.target === modal) {
      modal.style.display = "none";
    }
  });


  //삭제
  const del = document.querySelectorAll('.delete');
  const delf = document.querySelectorAll('.deleteForm');
  for(let i = 0 ; i < del.length ; i++){
    del[i].addEventListener('click',(e)=>{
      e.preventDefault();
      let tt = confirm("삭제하시겠습니까?");
      if(tt){
        delf[i].submit();
        alert("삭제되었습니다.")
      }
    })
  }

  //조회버튼
  document.querySelector('.btn4').addEventListener('click',(e)=>{

    const productname = document.querySelector('.wp3');
    const indexStart = document.querySelector('.indate1');
    const indexEnd = document.querySelector('.indate2');

    fetch('/project/perFormSearch?',{
      method : "GET",
      headers: {
        "Content-Type" : "application/json"
      },
      body: JSON.stringify({
        productname : productname,
        searchDateStart : indexStart,
        searchDateEnd : indexEnd,
      })
      .then(response => response.text())
      .then( text =>{} )
      .catch()

    })



  })





  // document.querySelector('.box3View').addEventListener('click', (e) => {


  //   if (e.target.innerText == '완료') {
  //     const tarG = e.target.parentNode.parentNode
  //     const date = tarG.querySelector('.emdskf').value
  //     const wp = tarG.querySelector('.emdwp').innerText
  //     const tn = tarG.querySelector('.emdtn').value
  //     const tT = tarG.querySelector('.text1').value
  //     tarG.innerHTML = "";
  //     // for (let i = 0; i < tarGe.length; i++) {
  //     //   console.log(tarGe[i].value);
  //     //   tarG.innerHTML += `<div>${tarGe[i].value}</div>`;
  //     // }
  //     tarG.innerHTML += `
  //                         <div class="dateB">${date}</div>
  //                         <div class="emdwp">${wp}</div>
  //                         <div class="emdtn">${tn}</div>
  //                         <div>생산완료</div>
  //                         <div class="text1">${tT}</div>
  //                         <div>
  //                           <button class="tn">수정</button>
  //                           <button class="tkr">삭제</button>
  //                         </div>
  //                         </div>
  //                       `
  //     alert("수정되었습니다.")
  //   }

  //   //수정버튼
  //   if (e.target.innerText == '수정') {

  //     const row = e.target.parentNode.parentNode;
      // row.dataset.original = row.innerHTML

  //     const now = new Date();
  //     const year = now.getFullYear();
  //     const month = ("0" + (now.getMonth() + 1)).slice(-2);
  //     const day = ("0" + now.getDate()).slice(-2);
  //     const hour = ("0" + now.getHours()).slice(-2);
  //     const minute = ("0" + now.getMinutes()).slice(-2);
  //     const date = `${year}-${month}-${day}T${hour}:${minute}`;

  //     const emdwp = e.target.parentNode.parentNode.querySelector('.emdwp').innerText
  //     const emdtn = e.target.parentNode.parentNode.querySelector('.emdtn').innerText
  //     const text = e.target.parentNode.parentNode.querySelector('.text1').innerText
  //     e.target.parentNode.parentNode.innerHTML =
  //       `
  //     <div><input type="datetime-local" class="emdskf" value="${date}"></div>
  //     <div class="emdwp">${emdwp}</div>
  //     <div><input type="text" class="emdtn" value="${emdtn}"></div>
  //     <div>생산완료</div>
  //     <div><input type="text" class="text1" value="${text}"></div>
  //     <div>
  //       <button class="dhks">완료</button>
  //       <button class="cnl">취소</button>
  //     </div>
  //     `

  //   }

  //   if (e.target.innerText === "취소") {
  //     const row = e.target.parentNode.parentNode;
  //     if (row.dataset.original) {
  //       row.innerHTML = row.dataset.original;
  //     }
  //   }



  //   const tkr = document.querySelectorAll('.tkr')
  //   for (let i = 0; i < tkr.length; i++) {
  //     if (e.target.innerText == '삭제') {
  //       e.target.parentNode.parentNode.remove();
  //       alert("삭제되었습니다.")
  //       break;
  //     }
  //   }
  // })


  // document.querySelector('.btn4').addEventListener('click', () => {

  //   const productFilter = document.querySelector('.wp3').value.trim().toLowerCase();
  //   const startD = document.querySelector('.indate1').value;
  //   const endD = document.querySelector('.indate2').value;

  //   const startDate = startD ? new Date(startD) : null;
  //   const endDate = endD ? new Date(endD) : null;

  //   const items = document.querySelectorAll('.box3View .item');

  //   items.forEach(item => {
  //     const dateElem = item.querySelector('.dateB');
  //     const emdwp = item.querySelector('.emdwp');

  //     const dateText = dateElem ? dateElem.textContent.trim() : "";
  //     const productText = emdwp ? emdwp.textContent.trim().toLowerCase() : "";

  //     const itemDate = new Date(dateText);

  //     let match = true;

  //     // 제품명 필터 (입력한 텍스트가 항목의 제품명에 포함되어 있어야 함)
  //     if (productFilter && !productText.includes(productFilter)) {
  //       match = false;
  //     }

  //     if (startDate && itemDate < startDate) {
  //       match = false;
  //     }

  //     if (endDate && itemDate > endDate) {
  //       match = false;
  //     }

  //     item.style.display = match ? "" : "none";
  //   });
  // });





}
