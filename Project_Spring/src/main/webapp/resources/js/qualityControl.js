let isSearching = false; // 전역에서 선언
let currentSearchParams = {}; // 검색 조건 저장용 객체

window.addEventListener('load', init)

function init() {

  const now = new Date();
  const year = now.getFullYear();
  const month = ("0" + (now.getMonth() + 1)).slice(-2);
  const day = ("0" + now.getDate()).slice(-2);
  const hour = ("0" + now.getHours()).slice(-2);
  const minute = ("0" + now.getMinutes()).slice(-2);

  const date = `${year}-${month}-${day}T${hour}:${minute}`;
  document.querySelector('.date2').value = date;
  document.querySelector('.indate1').value = date;
  document.querySelector('.indate2').value = date;

  // 합/불 큰버튼
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
  for (let i = 0; i < rad.length; i++) {
    rad[i].addEventListener('click', (e) => {

      if (rad[i].checked) {
        let ss = rad[i].value
        if (ss == '불합격') {
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



  //수정
  // if (e.target.innerText == "수정") {
  // const now = new Date();
  // const year = now.getFullYear();
  // const month = ("0" + (now.getMonth() + 1)).slice(-2);
  // const day = ("0" + now.getDate()).slice(-2);
  // const hour = ("0" + now.getHours()).slice(-2);
  // const minute = ("0" + now.getMinutes()).slice(-2);

  // const date = `${year}-${month}-${day}T${hour}:${minute}`;

  // const emdwp = e.target.parentNode.parentNode.querySelector('.emdwp').innerText
  // const tkdb = e.target.parentNode.parentNode.querySelector('.tkdb').innerText
  // const text = e.target.parentNode.parentNode.querySelector('.text1').innerText


  // const row = e.target.parentNode.parentNode;
  // row.dataset.original = row.innerHTML

  // e.target.parentNode.parentNode.innerHTML =
  //   `
  //   <div>
  //     <input type="datetime-local" class="inputT dateB" value="${date}">
  //   </div>
  //   <div class="emdwp">${emdwp}</div>
  //   <div>
  //     <select name="" id="" class="emdgkq">
  //       <option value="합격">합격</option>
  //       <option value="불합격">불합격</option>
  //     </select>
  //   </div>
  //   <div class="">
  //     <input type="text" class="inputT tkdb" value="${tkdb}">
  //   </div>
  //   <div>
  //     <input type="text" class="inputT text1" value="${text}">
  //   </div>
  //   <div>
  //     <button class="tn">완료</button>
  //     <button class="tkr">취소</button>
  //   </div>
  // `
  // }

  // 수정완료
  // if (e.target.innerText == "완료") {
  //   const view = e.target.parentNode.parentNode
  //   const tarG = e.target.parentNode.parentNode
  //   const date = tarG.querySelector('.dateB').value
  //   const wp = tarG.querySelector('.emdwp').innerText
  //   const gkq = tarG.querySelector('.emdgkq').value
  //   const tk = tarG.querySelector('.tkdb').value
  //   const tT = tarG.querySelector('.text1').value
  //   view.innerHTML = ""
  //   view.innerHTML += `
  //                     <div class="dateB">${date}</div>
  //                     <div class="emdwp">${wp}</div>
  //                     <div class="emdgkq">${gkq}</div>
  //                     <div class="tkdb">${tk}</div>
  //                     <div class="text1">${tT}</div>
  //                     <div>
  //                       <button class="tn">수정</button>
  //                       <button class="tkr">삭제</button>
  //                     </div>
  //                   `
  //   alert("수정되었습니다.")
  // }

  //   if (e.target.innerText === "취소") {
  //     const row = e.target.parentNode.parentNode;
  //     if (row.dataset.original) {
  //       row.innerHTML = row.dataset.original;
  //     }
  //   }
  // })


  // 검색창에 드랍박스 클릭시 불합사유 보이게 or 안보이게
  const searchBox = document.querySelector('#searchResult');
  const searchFail = document.querySelector('#searchFail');
  searchBox.addEventListener('change',(e)=>{
    if(searchBox.value == '불합격'){
      searchFail.disabled = false;
      searchFail.parentNode.style.display = "block";
    } else {
      searchFail.disabled = true;
      searchFail.parentNode.style.display = "none";
    }
  
  })

  // 새로고침
  document.querySelector('.btn1').addEventListener('click',(e)=>{
    location.reload();
  })

  //검색버튼
  document.querySelector('.btn4').addEventListener('click',(e)=>{
    qualSearchList(1);
  })


  //등록버튼
  document.querySelector('.btn3').addEventListener('click', (e)=>{
    // 보낼데이터 선언
    const sendData = {};
    // productid ㅇ, performanceid ㅇ, userid, result ㅇ, failreason ㅇ,comment ㅇ, qualitycontroltime ㅇ, passpack ㅇ, failpack ㅇ
    // FK
    sendData.productid = document.querySelector('#productid11').value;
    //합불 radio
    const rad = document.querySelectorAll('.rad')
    for(let i = 0 ; i<rad.length ; i++){
      if(rad[i].checked){
        sendData.result = rad[i].value
        if(rad[i].value == '불합격'){
          sendData.failreason = document.querySelector('.dropBox').value
        }
      }
    }
    // 합/불 갯수
    const ea = document.querySelectorAll('.myInput');
    sendData.passpack = ea[0].value === "" ? 0 : parseInt(ea[0].value);
    sendData.failpack = ea[1].value === "" ? 0 : parseInt(ea[1].value);
    //코멘트
    sendData.comments = document.querySelector('.textBox').value
    //날짜
    sendData.qualitycontroltime = document.querySelector('#inputdate').value
    // 실적 PK -> FK
    sendData.performanceid = document.querySelector('#performancegaja11').value;
    // id 일단 박아놓음 세션받아서넣어야함.
    sendData.userid = 'adminid2'

    if(document.querySelector('.wp2').innerText == "제품명" || document.querySelector('.wp').innerText == "제품명"){
      alert("제품을 선택해주세요");
      return;
    }
    if( ea[0].value == '' || ea[1].value == '' ){
      alert('합/불 갯수를 입력해주세요.');
      return;
    }

    const tt = confirm("정말로 등록하시겠습니까?");
    if(tt){
      fetch("/project/qualInsert",{
        method : "POST",
        headers : {
          "Content-Type" : "application/json"
        },
        body : JSON.stringify(sendData)
      })
      .then(response => response.json())
      .then(data =>{
        console.log(data);
        alert("등록완료되었습니다.")
        location.reload();
      })
      .catch(error =>{
        console.log('오류발쒱 :' , error);
      })
    }
  }) // 등록 클릭이벤트 end

  //실적조회 페이지네이션과 조회
  loadPerformList(1);

  // 품질 조회
  loadQualList(1);
} // end init


// 품질 페이지네이션 fetch 가즈아ㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏ
function loadQualList(page = 1){
  isSearching=false;
  fetch("/project/qualList",{
    method : "POST",
    headers : {
      "Content-Type" : "application/json"
    },
    body : JSON.stringify( { page : page , viewCount : 9 } )
  })
  .then(response => response.json())
  .then( data => {
    renderQualList(data.list);
    renderQualPagination(data.totalCount, data.page);
  })
}

// fetch로 search List가즈아
function qualSearchList( page = 1 ){

  if(page === 1){
    isSearching = true;
    currentSearchParams = {
      productname : document.querySelector('.wp3').value,
      searchDateStart : document.querySelector('.indate1').value,
      searchDateEnd : document.querySelector('.indate2').value,
      result : document.querySelector('#searchResult').value,
      failreason : document.querySelector('#searchFail').value
    }
  }
  const params = new URLSearchParams({
    ...currentSearchParams,
    page,
    viewCount : 9
  })
  fetch(`/project/qualList/search?${params}`)
  .then(response => response.json())
  .then(data =>{
    renderQualList(data.list);
    renderQualPagination(data.totalCount, page);
  })
  .catch(error =>{
    console.log('ㅃㅣ용삐용 에러데스요  : ', error);
  })
}

// 품질 렌더링
function renderQualList(list){
  const qualityList = document.querySelector('.box3View')
  qualityList.innerHTML = ''
  list.forEach(item =>{
    const failreason = item.failreason ? item.failreason : '';
    const comments = item.comments ? item.comments : '';
    
    const card = document.createElement('div');
    card.className = 'qualList-card'
    card.innerHTML = `
      <div>${item.qualitycontroltime}</div>
      <div>${item.productname}</div>
      <div>${item.result}</div>
      <div>${failreason}</div>
      <div>${comments}</div>
      <div>${item.username}</div>
      <div>
        <button type="button" class="Modify">수정</button>
        <button type="button" class="delete">삭제</button>
      </div>
      `
      qualityList.append(card)
  })
}

// 페이지네이션 버튼임
function renderQualPagination(totalCount, currentPage){
  const pageNationQuality = document.querySelector('.pageNationQuality');
  pageNationQuality.innerHTML = '';

  const viewCount = 9;
  const lastPage = Math.ceil(totalCount/viewCount);

  const groupSize = 5;
  const currentGroup = Math.ceil(currentPage / groupSize);
  const groupStart = ( currentGroup - 1 ) * groupSize + 1;
  let groupEnd = groupStart + groupSize -1 ;
  if(groupEnd > lastPage ) groupEnd = lastPage;

  // [이전]
  if(groupStart > 1){
    const prevBtn = document.createElement('button');
    prevBtn.textContent = '[이전]';
    prevBtn.addEventListener('click', () => {
      isSearching ? qualSearchList(groupStart - 1) : loadQualList(groupStart - 1);
    });
    pageNationQuality.appendChild(prevBtn);
  }

  // 페이지 버튼
  for (let i = groupStart; i <= groupEnd; i++) {
    const btn = document.createElement('button');
    btn.textContent = i;
    if (i === currentPage) {
      btn.style.fontWeight = 'bold';
    }
    btn.addEventListener('click', () => {
      isSearching ? qualSearchList(i) : loadQualList(i); // 번호를 loadPerformList로 넘긴다
    });
    pageNationQuality.appendChild(btn);
  }

  // [다음]
  if (groupEnd < lastPage) {
    const nextBtn = document.createElement('button');
    nextBtn.textContent = '[다음]';
    nextBtn.addEventListener('click', () => {
      isSearching ? qualSearchList(groupEnd + 1) : loadQualList(groupEnd + 1);
    });
    pageNationQuality.appendChild(nextBtn);
  }
}
// 품질관리 end //






// 실적조회 fetch가즈아
function loadPerformList(page = 1) {
  fetch("/project/performList", {
    method: "POST",
    headers: {
      "Content-Type": "application/json"
    },
    body: JSON.stringify({ page: page, viewCount: 7 })
  })
    .then(response => response.json())
    .then(data => {
      renderPerformanceList(data.list);
      renderPagination(data.totalCount, data.page);
    })
    .catch(error => {
      console.error('에러 발생:', error);
    });
}

function renderPerformanceList(list) {
  const container = document.querySelector('.wkrView');
  container.innerHTML = '';

  list.forEach(item => {
    // 숫자로 나오는 date 포메팅
    const date = new Date(item.reporttime);
    const formattedDate = date.getFullYear() + "-" +
      String(date.getMonth() + 1).padStart(2, '0') + "-" +
      String(date.getDate()).padStart(2, '0') + " " +
      String(date.getHours()).padStart(2, '0') + ":" +
      String(date.getMinutes()).padStart(2, '0') + ":" +
      String(date.getSeconds()).padStart(2, '0');

    const card = document.createElement('div');
    card.className = 'performance-card';
    // 데이터 뽑아늫기
    card.innerHTML = `
        <div>${formattedDate}</div>
        <div>${item.productname}</div>
        <div>${item.productioncount}</div>
        <div>${item.performancecomment}</div>
        <div>${item.username}</div>
        <div>
          <button type="button" class="select">선택</button>
          <input type="hidden" value="${item.performanceid}" id="performancegaja">
          <input id="productid111" type="hidden" value="${item.productid}">
        </div>
      `;
    container.appendChild(card);
  });

  // 버튼클릭시 제품명 뽑아넣기
  select();
}

function renderPagination(totalCount, currentPage) {
  const pageContainer = document.querySelector('.page-container');
  pageContainer.innerHTML = '';

  const viewCount = 7;
  const lastPage = Math.ceil(totalCount / viewCount);

  const groupSize = 5; 
  const currentGroup = Math.ceil(currentPage / groupSize);
  const groupStart = (currentGroup - 1) * groupSize + 1;
  let groupEnd = groupStart + groupSize - 1;
  if (groupEnd > lastPage) groupEnd = lastPage;

  // [이전]
  if (groupStart > 1) {
    const prevBtn = document.createElement('button');
    prevBtn.textContent = '[이전]';
    prevBtn.addEventListener('click', () => {
      loadPerformList(groupStart - 1);
    });
    pageContainer.appendChild(prevBtn);
  }

  // 페이지 버튼
  for (let i = groupStart; i <= groupEnd; i++) {
    const btn = document.createElement('button');
    btn.textContent = i;
    if (i === currentPage) {
      btn.style.fontWeight = 'bold';
    }
    btn.addEventListener('click', () => {
      loadPerformList(i); // 번호를 loadPerformList로 넘긴다
    });
    pageContainer.appendChild(btn);
  }

  // [다음]
  if (groupEnd < lastPage) {
    const nextBtn = document.createElement('button');
    nextBtn.textContent = '[다음]';
    nextBtn.addEventListener('click', () => {
      loadPerformList(groupEnd + 1);
    });
    pageContainer.appendChild(nextBtn);
  }
}

// 실적조회에서 선택버튼클릭시 제품명 끼워넣기
function select() {
  const selectBtns = document.querySelectorAll('.select');
  for (let i = 0; i < selectBtns.length; i++) {
    selectBtns[i].addEventListener('click', (e) => {
      const productName = e.target.parentNode.parentNode.querySelectorAll('div')[1].innerText;
      document.querySelector('.wp2').innerText = productName; 
      document.querySelector('.wp').innerText = productName; 
      document.querySelector('#productid11').value = e.target.parentNode.querySelector('#productid111').value;
      document.querySelector('#performancegaja11').value = e.target.parentNode.querySelector('#performancegaja').value;
    });
  }
}// 실적조회 end //




