window.addEventListener('load', init)


function init() {

  //로드시 시간 저장.
  const now = new Date();
  const year = now.getFullYear();
  const month = ("0" + (now.getMonth() + 1)).slice(-2);
  const day = ("0" + now.getDate()).slice(-2);
  const hour = ("0" + now.getHours()).slice(-2);
  const minute = ("0" + now.getMinutes()).slice(-2);
  // const second = ("0" + now.getSeconds()).slice(-2);
  const date = `${year}-${month}-${day}T${hour}:${minute}`
  if(document.querySelector('.indate1').value == null || document.querySelector('.indate1').value == '' ){
    document.querySelector('.indate1').value = date
  }
  if(document.querySelector('.indate2').value == null || document.querySelector('.indate2').value == '' ){
    document.querySelector('.indate2').value = date
  }
  document.querySelector('.date1').value = date
  // console.log(date.indexOf("T")); // 10
  // console.log( date.slice( date.indexOf("T")+1 ) );
  // console.log( date.slice( 0 , date.indexOf("T") ) );



  // 합/불 큰버튼
  document.querySelector('.btn2').addEventListener('click', (e) => {
    //모달창
    const modal = document.querySelector('#myModal');
    // 모달창 내용
    const content = document.querySelector('.modal-content');
    //제품번호
    const productid = document.querySelector('#productid11').value;
    if(!productid){
      alert("제품을 선택해 주십시오.");
    } else {
      fetch(`/project/QaulModalSelect?productid=${productid}`)
      .then( res => res.json() )
      .then( data => {
        console.log(data);
        console.log(data.productname);
        content.innerHTML = '';
        content.innerHTML = `<span class="close">&times;</span>
                <div style="border: 1px solid #8989ef;border-radius: inherit;margin: 10px;padding: 10px;">
                  <h1>${data.productname}</h1>
                  <div>
                    <img src="download?filename=${data.productimage}"
                    style="margin: 15px;width: 300px;">
                  </div>
                  <div style="display: flex;gap: 20px;margin: 10px auto;max-width: 516px;">
                    <div style="max-width: 258px;">
                      <h2>정상제품기준</h2>
                      <div>${data.normalcriteria}</div>
                    </div>
                    <div style="max-width: 258px;">
                      <h2>비정상제품기준</h2>
                      <div>${data.abnormalcriteria}</div>
                    </div>
                  </div>
                </div>
        `
        modal.style.display = 'block';
      })
      .catch(err =>{
        console.log("에러 : ", err)
      })
    }
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

  //조회버튼 하다가 form으로 도망감
  // document.querySelector('.btn4').addEventListener('click',(e)=>{

  //   const productname = document.querySelector('.wp3').value;
  //   const indexStart = document.querySelector('.indate1').value;
  //   const indexEnd = document.querySelector('.indate2').value;

  //   const params = new URLSearchParams({
  //     productname : productname,
  //     searchDateStart : indexStart,
  //     searchDateEnd : indexEnd
  //   }).toString();

  //   fetch(`/project/performanceSearch?${params}`,{
  //     method : "GET",
  //     headers:{
  //       "Accept":"application/json"
  //     }
  //   })
  //   .then( response => response.json() )
  //   .then( data => {
  //     console.log("받은데이따 : " , data);
  //     const viewBox = document.querySelector('.box3View');
  //     viewBox.innerHTML='';

  //     const list = data.list;
  //     const totalCount = data.totalCount;
  //     console.log("리스트", list);
  //     console.log("토탈카운따", totalCount);

  //   })
  //   .catch(error =>{
  //     console.log("에러띵 : ", error);
  //   })

  // })


  //수정 드가자이
  const modify = document.querySelectorAll('.tn');
  for(let i = 0 ; i < modify.length ; i++){
    modify[i].addEventListener('click', (e)=>{
      e.preventDefault();

      console.log(e.target.closest("form"))
      const modimodi = e.target.closest("form")
      const dateB = modimodi.querySelector('.dateB').innerText;
      const emdwp = modimodi.querySelector('.emdwp').innerText;
      const emdtn = modimodi.querySelector('.emdtn').innerText;
      const text1 = modimodi.querySelector('.text1').innerText;
      const emdId = modimodi.querySelector('.emdId').innerText;
      const performId = modimodi.querySelector('.performId').value;

      modimodi.innerHTML = `
        <div class="dateB">
          <input type="datetime-local" id="time" value="${dateB}">
        </div>
        <div class="emdwp">${emdwp}</div>
        <div class="emdtn">
          <input type="text" id="emdtn" value="${emdtn}">
        </div>
        <div class="text1">
          <input type="text" id="text1" value="${text1}">
        </div>
        <div class="emdId">${emdId}</div>
        <div style="display: flex; justify-content: center;">
          <button type="button" class="yes" style="height: 26px;">완료</button>
          <button type="button" class="cancel" style="height: 26px;">취소</button>
          <input type="hidden" id="performId" value="${performId}">
        </div>
      `

      // 수정완료 클릭시
      const yes = modimodi.querySelector('.yes');
      yes.addEventListener('click',(e)=>{
        const time = modimodi.querySelector('#time').value;
        const emdtn = modimodi.querySelector('#emdtn').value;
        const text1 = modimodi.querySelector('#text1').value;
        const performId = modimodi.querySelector('#performId').value;
        fetch("/project/performanceUpdate",{
          method : 'POST',
          headers : {
            "Content-Type" : "application/json"
          },
          body : JSON.stringify({
            reporttime: time,
            productioncount: emdtn,
            performancecomment: text1,
            performanceid: performId
          })
        })
        .then( respnose => respnose.text() )
        .then( text =>{
          console.log('text');
          if(text == 1){
            alert("수정완료");
            location.reload();
          }
          else{
            alert("수정실패");
          }
        })
        .catch(error =>{
          console.log("에러에러에러 :" , error);
        })
      }) // 수정완료 클릭 end

      //취소클릭시 새로고침
      modimodi.querySelector('.cancel').addEventListener('click', (e)=>{
        alert("수정을 취소하셨습니다.");
        location.reload();
      })
    }) // 수정 클릭이벤트 끗
  }// 수정 for문 끝







}
