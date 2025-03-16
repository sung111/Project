window.addEventListener('load', init)



function init() {

  const now = new Date();
  const year = now.getFullYear();
  const month = ("0" + (now.getMonth() + 1)).slice(-2);
  const day = ("0" + now.getDate()).slice(-2);
  const hour = ("0" + now.getHours()).slice(-2);
  const minute = ("0" + now.getMinutes()).slice(-2);

  const date = `${year}-${month}-${day}T${hour}:${minute}`;
  document.querySelector('.indate1').value = date;
  document.querySelector('.indate2').value = date;
  document.querySelector('.insertDate').value = date;
  


  // document.querySelector('.wkrView').addEventListener('click', (e) => {

  //   const B = document.querySelectorAll('.menufacturer-info-list')
  //   for(let i = 0 ; i < B.length ; i++){
  //     if(e.target.parentNode.classList.contains('menufacturer-info-list')){
  //       e.preventDefault();
  //       e.target.blur();
  //     }
  //   }
  //   // console.log(e.target.parentNode.parentNode)
  //   if(e.target.parentNode.parentNode.classList.contains('menufacturer-info')){
  //     e.preventDefault();
  //     e.target.blur();
  //     alert("현재 페이지에서 수정하실수없습니다.")
  //   }

    // 클릭한 요소 혹은 조상 요소가 .workorderlist-sample 클래스가 있는지 확인
    // e.style.display = "none"

    // if (e.target.innerText == '수정') {
    //   const wkrView = document.querySelector('.wkrView')
    //   const a = wkrView.querySelector('.workorder-tag')
    //   const b = wkrView.querySelectorAll('.workorderlist')
    //   const b2 = wkrView.querySelectorAll('a')
    //   const c = wkrView.querySelector('.new-workorder')
    //   const d = wkrView.querySelector('.order-buttonlayer')



    //   a.style.display = "none"
    //   for (let i = 0; i < b.length; i++) {
    //     b[i].style.display = "none"
    //   }
    //   for (let i = 0; i < b2.length; i++) {
    //     b2[i].style.display = "none"
    //     // console.log(b2[i])
    //   }
    //   c.style.display = ""
    //   d.style.display = "none"
    // }

    // const z = e.target.parentNode.classList.contains("order-info-content")
    // if (z) {
    //   document.querySelector('.wp2').innerText = e.target.parentNode.querySelector('td').innerText
    //   document.querySelector('.wp').innerText = e.target.parentNode.querySelector('td').innerText
    // }

    // if (e.target.innerText == "삭제하기") {
    //   alert("현재 페이지에서 삭제하실수없습니다.")
    // }

  // });





  // 작지
  // document.querySelector('.btn1').addEventListener('click', (e) => {
  //   fetch('WorkOrder.html')
  //     .then(response => {
  //       return response.text();

  //     })
  //     .then(html => {
  //       const parser = new DOMParser();
  //       const doc = parser.parseFromString(html, 'text/html');

  //       const targetBox = doc.querySelector('.workorder-layer');
  //       const targetBox2 = doc.querySelector('.workorder-pagenation');
  //       const targetBox3 = doc.querySelector('.sample');
  //       const SampleClick = doc.querySelector(".workorderlist-sample")
  //       if (targetBox) {
  //         document.querySelector('.wkrView').innerHTML = targetBox.innerHTML
  //         document.querySelector('.wkrView').innerHTML += targetBox2.innerHTML
  //         document.querySelector('.wkrView').innerHTML += targetBox3.innerHTML
  //         SampleClick.addEventListener('click', (e) => {
  //           e.target.parentNode.parentNode.classList.add('hide')
  //           targetBox2.style.display = "none"
  //           targetBox3.style.display = "block"
  //         })
  //       }
  //     })
  //     .catch(error => {
  //       console.error('페이지를 불러오는 도중 에러 발생:', error);
  //     });



  // })


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

  

  // 모달창
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





  // 제품 합/불 라디오버튼클릭시 숨기기/나오기
  const rad = document.querySelectorAll('.rad')
  let ss
  for (let i = 0; i < rad.length; i++) {
    rad[i].addEventListener('click', (e) => {
      
      if (rad[i].checked) {
        ss = rad[i].value
        if (ss == "불합격") {
          document.querySelector('.dropBox').disabled = false;
          document.querySelector('.dropBox').classList.remove('hide')
          document.querySelector('.BB2').classList.remove('hide')
        } else {
          document.querySelector('.dropBox').disabled = true;
          document.querySelector('.dropBox').classList.add('hide')
          document.querySelector('.BB2').classList.add('hide')
        }
      }
    })
  }


  //등록버튼
  // document.querySelector('.btn3').addEventListener('click', (e) => {
  //   const rad = document.querySelectorAll('.rad')
  //   let ss
  //   for (let i = 0; i < rad.length; i++) {
  //     // console.log(rad[i].checked);
  //     // console.log(rad[i].value);
  //     if (rad[i].checked) {
  //       ss = rad[i].value;
  //     }
  //   }

  //   // ss=합불
  //   // drop = 불합일때 드랍메뉴 벨류
  //   console.log(ss)
  //   const drop = document.querySelector('.dropBox').value
  //   console.log(drop);
  //   // 텍스트박스 값
  //   const textB = document.querySelector('.textBox').value
  //   console.log(textB)
  //   const date = document.querySelector('.date2').value
  //   console.log(date)
  //   const wp2 = document.querySelector('.wp2')
  //   const box3 = document.querySelector('.box3View')
  //   if(wp2.innerText == "제품명"){
  //     alert('제품이 선택되어있지않습니다.')
  //   } else{
  //     if (ss == "합격") {
  //       box3.innerHTML = `
  //                         <div class="dex item">
  //                           <div class="dateB">${date}</div>
  //                           <div class="emdwp">${wp2.innerText}</div>
  //                           <div class="emdgkq">${ss}</div>
  //                           <div class="tkdb"></div>
  //                           <div class="text1">${textB}</div>
  //                           <div>
  //                             <button class="tn">수정</button>
  //                             <button class="tkr">삭제</button>
  //                           </div>
  //                         </div>
  //                       `+ box3.innerHTML;
  //                       renderPagination();  // 페이지네이션 업데이트
  //     } else {
  //       box3.innerHTML = `
  //                         <div class="dex item">
  //                           <div class="dateB">${date}</div>
  //                           <div class="emdwp">${wp2.innerText}</div>
  //                           <div class="emdgkq">${ss}</div>
  //                           <div class="tkdb">${drop}</div>
  //                           <div class="text1">${textB}</div>
  //                           <div>
  //                             <button class="tn">수정</button>
  //                             <button class="tkr">삭제</button>
  //                           </div>
  //                         </div>
  //                       `+ box3.innerHTML;
  //                       renderPagination();  // 페이지네이션 업데이트
  
  //     }
  //     alert("품질등록을 완료했습니다.")
  //   }
    

  // })

  document.querySelector('.box3View').addEventListener('click', (e) => {

    //삭제
    // console.log(e.target);
    if (e.target.innerText == "삭제") {
      e.target.parentNode.parentNode.remove();
      alert("삭제되었습니다.")
    }

    //수정
    if (e.target.innerText == "수정") {
      const now = new Date();
      const year = now.getFullYear();
      const month = ("0" + (now.getMonth() + 1)).slice(-2);
      const day = ("0" + now.getDate()).slice(-2);
      const hour = ("0" + now.getHours()).slice(-2);
      const minute = ("0" + now.getMinutes()).slice(-2);

      const date = `${year}-${month}-${day}T${hour}:${minute}`;

      const emdwp = e.target.parentNode.parentNode.querySelector('.emdwp').innerText
      const tkdb = e.target.parentNode.parentNode.querySelector('.tkdb').innerText
      const text = e.target.parentNode.parentNode.querySelector('.text1').innerText


      const row = e.target.parentNode.parentNode;
      row.dataset.original = row.innerHTML

      e.target.parentNode.parentNode.innerHTML =
        `
        <div>
          <input type="datetime-local" class="inputT dateB" value="${date}">
        </div>
        <div class="emdwp">${emdwp}</div>
        <div>
          <select name="" id="" class="emdgkq">
            <option value="합격">합격</option>
            <option value="불합격">불합격</option>
          </select>
        </div>
        <div class="">
          <input type="text" class="inputT tkdb" value="${tkdb}">
        </div>
        <div>
          <input type="text" class="inputT text1" value="${text}">
        </div>
        <div>
          <button class="tn">완료</button>
          <button class="tkr">취소</button>
        </div>
      `
    }

    // 수정완료
    if (e.target.innerText == "완료") {
      const view = e.target.parentNode.parentNode
      const tarG = e.target.parentNode.parentNode
      const date = tarG.querySelector('.dateB').value
      const wp = tarG.querySelector('.emdwp').innerText
      const gkq = tarG.querySelector('.emdgkq').value
      const tk = tarG.querySelector('.tkdb').value
      const tT = tarG.querySelector('.text1').value
      view.innerHTML = ""
      view.innerHTML += `
                        <div class="dateB">${date}</div>
                        <div class="emdwp">${wp}</div>
                        <div class="emdgkq">${gkq}</div>
                        <div class="tkdb">${tk}</div>
                        <div class="text1">${tT}</div>
                        <div>
                          <button class="tn">수정</button>
                          <button class="tkr">삭제</button>
                        </div>
                      `
      alert("수정되었습니다.")
    }

    if (e.target.innerText === "취소") {
      const row = e.target.parentNode.parentNode;
      if (row.dataset.original) {
        row.innerHTML = row.dataset.original;
      }
    }
  })


  


  document.querySelector('.btn4').addEventListener('click', function () {
    const productSearch = document.querySelector('.wp3').value.trim().toLowerCase();
    const startD = document.querySelector('.indate1').value;
    const endD = document.querySelector('.indate2').value;
    const dropBoxes = document.querySelectorAll('.dropBox2');
    const resultSearch = dropBoxes[0] ? dropBoxes[0].value : "";      // 결과 (합격/불합격)
    const failReasonSearch = dropBoxes[1] ? dropBoxes[1].value : "";    // 불합격 사유
    const items = document.querySelectorAll('.box3View .dex');
    items.forEach(item => {
      let match = true;

      const itemDateText = item.children[0] ? item.children[0].innerText.trim() : "";
      const itemProductText = item.children[1] ? item.children[1].innerText.trim().toLowerCase() : "";
      const itemResultText = item.children[2] ? item.children[2].innerText.trim() : "";
      const itemFailReasonText = item.children[3] ? item.children[3].innerText.trim() : "";

      if (productSearch && !itemProductText.includes(productSearch)) {
        match = false;
      }

      if (startD) {
        const startDate = new Date(startD);
        const itemDate = new Date(itemDateText);
        if (itemDate < startDate) {
          match = false;
        }
      }
      if (endD) {
        const endDate = new Date(endD);
        const itemDate = new Date(itemDateText);
        if (itemDate > endDate) {
          match = false;
        }
      }

      if (resultSearch && itemResultText !== resultSearch) {
        match = false;
      }

      if (failReasonSearch && itemFailReasonText !== failReasonSearch) {
        match = false;
      }

      item.style.display = match ? '' : 'none';
    });
  });




  // 페이지네이션 관련 전역 변수
  let currentPage = 1;
  const itemsPerPage = 7;  // 한 페이지에 표시할 항목 수

  // 페이지네이션을 적용하는 함수
  function renderPagination() {
    // 모든 등록된 항목 선택 (.item 클래스 사용)
    const view = document.querySelector('.box3View');
    const items = Array.from(view.querySelectorAll('.dex'));
    const totalItems = items.length;
    const totalPages = Math.ceil(totalItems / itemsPerPage);

    // 모든 항목 숨긴 후, 현재 페이지에 해당하는 항목만 보이도록 처리
    items.forEach((item, index) => {
      if (index >= (currentPage - 1) * itemsPerPage && index < currentPage * itemsPerPage) {
        item.style.display = '';
      } else {
        item.style.display = 'none';
      }
    });

    // pagination 컨테이너 업데이트
    let paginationContainer = document.querySelector('.pagination');
    if (!paginationContainer) {
      // HTML에 없다면 새로 생성 (보통 HTML에 미리 만들어두는 것이 좋음)
      paginationContainer = document.createElement('div');
      paginationContainer.classList.add('pagination');
      // box3 하단에 추가
      document.querySelector('.box3').appendChild(paginationContainer);
    }

    // 기존 페이지네이션 버튼 초기화
    paginationContainer.innerHTML = '';

    // 페이지 번호 버튼 생성 (전체 페이지 수만큼)
    for (let page = 1; page <= totalPages; page++) {
      const btn = document.createElement('button');
      btn.textContent = page;
      if (page === currentPage) {
        btn.disabled = true;
      }
      btn.addEventListener('click', () => {
        currentPage = page;
        renderPagination();
      });
      paginationContainer.appendChild(btn);
    }
  }

  // (옵션) 페이지 로드 시 처음에도 페이지네이션 렌더링
  // window.addEventListener('DOMContentLoaded', renderPagination);


}

