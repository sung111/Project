window.addEventListener('load', init)


function init() {

  //로드시 시간 저장.
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
  
  



  document.querySelector('.instView').addEventListener('click', (e) => {

    // 작지 박스에서 클릭을 할시. menufacturer란 클래스가있다면 포커스 풀기.
    if (e.target.parentNode.parentNode.classList.contains('menufacturer-info')) {
      e.preventDefault();
      e.target.blur();
      alert("현재 페이지에서 수정하실수없습니다.")
    }

    // // 클릭한 요소 혹은 조상 요소가 .workorderlist-sample 클래스가 있는지 확인
    // if (e.target.innerText == '수정') {
    //   const instView = document.querySelector('.instView')
    //   const a = instView.querySelector('.workorder-tag')
    //   const b = instView.querySelectorAll('.workorderlist')
    //   const b2 = instView.querySelectorAll('a')
    //   const c = instView.querySelector('.new-workorder')
    //   const d = instView.querySelector('.order-buttonlayer')
    //   a.style.display = "none"
    //   for (let i = 0; i < b.length; i++) {
    //     b[i].style.display = "none"
    //   }
    //   for (let i = 0; i < b2.length; i++) {
    //     b2[i].style.display = "none"
    //     // console.log(b2[i])
    //   }
    //   d.style.display = "none"
    //   c.style.display = ""
    // }


    // 작지박스 클릭해서 텍스트뽑아와서 제품명 박스에 넣기
    // const z = e.target.parentNode.classList.contains("order-info-content")
    // if (z) {
    //   document.querySelector('.wp2').innerText = e.target.parentNode.querySelector('td').innerText
    //   document.querySelector('.wp').innerText = e.target.parentNode.querySelector('td').innerText
    // }

    // if (e.target.innerText == "삭제하기") {
    //   alert("현재 페이지에서 삭제하실수없습니다.")
    // }

  });



  // 작지 조회버튼튼
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
  //         document.querySelector('.instView').innerHTML = targetBox.innerHTML
  //         document.querySelector('.instView').innerHTML += targetBox2.innerHTML
  //         document.querySelector('.instView').innerHTML += targetBox3.innerHTML
  //         SampleClick.addEventListener('click', (e) => {
  //           e.target.parentNode.parentNode.classList.add('hide')
  //           targetBox2.style.display = "none"
  //           targetBox3.style.display = "block"
  //         })
  //       } else {
  //         document.querySelector('.instView').innerHTML = "불로오는도중 오류가발생했습니다."
  //       }


  //     })
  //     .catch(error => {
  //       console.error('페이지를 불러오는 도중 에러 발생:', error);
  //     });


  
  // })


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



  // //등록버튼
  // document.querySelector('.btn3').addEventListener('click', (e) => {
  //   const intd = document.querySelector('.textarea1').value
  //   const view = document.querySelector('.box3View')
  //   const date = document.querySelector('.date1')
  //   const wpName = document.querySelector('.wp2')

  //   // bom 불러와서 저장하기
  //   // 날짜, 제품명, LotNo, 코멘트, 수/삭but
  //   if(wpName.innerText == "제품명"){
  //     alert("제품이 선택되지않았습니다.")
  //   }else{
  //     view.innerHTML = `<div class="dex item">
  //                         <div class="dateB">${date.value}</div>
  //                         <div class="emdwp">${wpName.innerHTML}</div>
  //                         <div class="emdtn">10pack</div>
  //                         <div>생산완료</div>
  //                         <div class="text1">${intd}</div>
  //                         <div>
  //                           <button class="tn">수정</button>
  //                           <button class="tkr">삭제</button>
  //                         </div>
  //                       </div>` + view.innerHTML
  //     alert('실적등록을 완료했습니다.')
  //     renderPagination();

  //   }

  // })




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




  // // 페이지네이션 관련 전역 변수
  // let currentPage = 1;
  // const itemsPerPage = 7;  // 한 페이지에 표시할 항목 수

  // // 페이지네이션을 적용하는 함수
  // function renderPagination() {
  //   // 모든 등록된 항목 선택 (.item 클래스 사용)
  //   const view = document.querySelector('.box3View');
  //   const items = Array.from(view.querySelectorAll('.item'));
  //   const totalItems = items.length;
  //   const totalPages = Math.ceil(totalItems / itemsPerPage);

  //   // 모든 항목 숨긴 후, 현재 페이지에 해당하는 항목만 보이도록 처리
  //   items.forEach((item, index) => {
  //     if (index >= (currentPage - 1) * itemsPerPage && index < currentPage * itemsPerPage) {
  //       item.style.display = '';
  //     } else {
  //       item.style.display = 'none';
  //     }
  //   });

  //   // pagination 컨테이너 업데이트
  //   let paginationContainer = document.querySelector('.pagination');
  //   if (!paginationContainer) {
  //     // HTML에 없다면 새로 생성 (보통 HTML에 미리 만들어두는 것이 좋음)
  //     paginationContainer = document.createElement('div');
  //     paginationContainer.classList.add('pagination');
  //     // box3 하단에 추가
  //     document.querySelector('.box3').appendChild(paginationContainer);
  //   }

  //   // 기존 페이지네이션 버튼 초기화
  //   paginationContainer.innerHTML = '';

  //   // 페이지 번호 버튼 생성 (전체 페이지 수만큼)
  //   for (let page = 1; page <= totalPages; page++) {
  //     const btn = document.createElement('button');
  //     btn.textContent = page;
  //     if (page === currentPage) {
  //       btn.disabled = true;
  //     }
  //     btn.addEventListener('click', () => {
  //       currentPage = page;
  //       renderPagination();
  //     });
  //     paginationContainer.appendChild(btn);
  //   }
  // }

  // // (옵션) 페이지 로드 시 처음에도 페이지네이션 렌더링
  // window.addEventListener('DOMContentLoaded', renderPagination);




}
