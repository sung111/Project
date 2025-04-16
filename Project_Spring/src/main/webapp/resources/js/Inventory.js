window.addEventListener('load', init);
// 팝업 닫기
function closePopup() {
  document.querySelector('#popup').style.display = 'none';
}

function init() {


  // 로드시 input type="date"에 값넣기
  const now = new Date();
  const year = now.getFullYear();
  // 월은 0월 부터
  const month = "0" + (now.getMonth() + 1);
  // 일은 016 처럼나옴 뒤에서 두자리 가져오기
  const day = ("0" + now.getDate()).slice(-2);
  const date = `${year}-${month}-${day}`;
  if (document.querySelector('#receiptDate').value == '' || document.querySelector('#receiptDate').value == null && document.querySelector('#expDate').value == '' || document.querySelector('#expDate').value == null) {
    document.querySelector('#expDate').value = date
    document.querySelector('#receiptDate').value = date
  }
  document.querySelector('#addin_date').value = date




  // 팝업 열기 (재고 등록)
  document.querySelector('#addinven').onclick = function () {

    editingIndex = null; // 수정 모드 초기화

    document.querySelector('#popup').style.display = 'block';
  };

  document.querySelector('#popup').addEventListener('click', (e) => {
    //console.log(e.target.classList.contains("popup"))
    if (e.target.classList.contains("popup")) {
      document.querySelector('#popup').style.display = 'none';
    }
  })

  // 로드되면 입고일 or 유효기간을 선택하고 검색시
  // input type=date 가 선택되어있게 메서드를 만듬.
  function wareClick() {
    if (document.querySelector('#warehouse').value == '입고일' || document.querySelector('#warehouse').value == '유효기간') {
      document.querySelector('#search').classList.add('hide');
      document.querySelector('#search').disabled = true
      document.querySelector('.go').classList.remove('hide');
      document.querySelector('#receiptDate').disabled = false;
      document.querySelector('#expDate').disabled = false;
    } else {
      document.querySelector('#search').classList.remove('hide');
      document.querySelector('#search').disabled = false;
      document.querySelector('.go').classList.add('hide');
      document.querySelector('#receiptDate').disabled = true;
      document.querySelector('#expDate').disabled = true;
    }
  }
  wareClick();


  // 검색
  // 검색방식 입고일 or 유효기간 선택시 검색창을 닫고 input date 가나옴.
  document.querySelector('#warehouse').addEventListener('click', wareClick)

  // 삭제
  const del = document.querySelectorAll('.del');
  const delF = document.querySelectorAll('.delFrom');
  for (let i = 0; i < del.length; i++) {
    del[i].addEventListener('click', (e) => {
      e.preventDefault()
      const tt = confirm("정말로 삭제하시겠습니까?")
      if (tt) {
        delF[i].submit();
        alert("삭제되었습니다.");
      }
    })
  }


  // //----------------------------------
  // // 수정
  // const modify = document.querySelectorAll('.modify');
  // console.log(modify.length);
  // for (let i = 0; i < modify.length; i++) {
  //   modify[i].addEventListener('click', (e) => {
  //     e.preventDefault();
  //     console.log(e.target.parentNode.parentNode.parentNode);
  //     const trModify = e.target.closest("tr");
  //     const dbgud = trModify.querySelector('#dbgud').innerText
  //     console.log(dbgud);

  //     const form = document.createElement("form");
  //     form.method = "POST";
  //     form.action = "Inventorycheck";
  //     // `<input>` 요소를 생성하여 `command=modify1` 값을 숨겨서 전달
  //     const input1 = document.createElement("input");
  //     input1.type = "hidden";
  //     input1.name = "command";
  //     const input2 = document.createElement("input");
  //     input2.type = "hidden";
  //     const input3 = document.createElement("input");
  //     input3.type = "hidden";
  //     const input4 = document.createElement("input");
  //     input4.type = "hidden";
  //     if (dbgud == "완제품") {
  //       // 완제품
  //       const lotNo = trModify.querySelector('#lotNo').innerText
  //       const materialname = trModify.querySelector('#materialname').innerText
  //       const maPartNum = trModify.querySelector('#maPartNum').innerText
  //       const maQuantity = trModify.querySelector('#maQuantity').innerText
  //       const maSpec = trModify.querySelector('#maSpec').innerText
  //       const maUnit = trModify.querySelector('#maUnit').innerText
  //       const receiptDate = trModify.querySelector('#receiptDate').innerText
  //       const maExpDate = trModify.querySelector('#maExpDate').innerText
  //       const inventoryId = trModify.querySelector('#inventoryId').value
  //       trModify.innerHTML = `
  //           <td id="lotNo">\${lotNo}</td>
  //           <td id="materialname">\${materialname}</td>
  //           <td>\${dbgud}</td>
  //           <td id="maPartNum">\${maPartNum}</td>
  //           <td id="maQuantity"><input type="number" name="maQuantity" value="\${maQuantity}" style="text-align: center; font-size: 12px;" id="maQuantity1"></td>
  //           <td id="maSpec">\${maSpec}</td>
  //           <td id="maUnit">\${maUnit}</td>
  //           <td id="receiptDate"><input type="date" name="receiptDate" value="\${receiptDate}" style="font-size: 12px;" id="receiptDate1"></td>
  //           <td id="maExpDate">\${maExpDate}</td>
  //           <td>
  //             <input type="submit" value="확인"  class="yes"
  //               style="width: 55px; height: 35px;">
  //             <button class="cancel" style="width: 55px; height: 35px;">취소</button>
  //             <input type="hidden" name="inventoryId" value="\${ inventoryId }"
  //               id="inventoryId">
  //           </td>
  //           `

  //     } else {

  //       // 원자재
  //       const prLotNo = trModify.querySelector('#prLotNo').innerText
  //       const productname = trModify.querySelector('#productname').innerText
  //       const prPartNum = trModify.querySelector('#prPartNum').innerText
  //       const prQuantity = trModify.querySelector('#prQuantity').innerText
  //       const prSpec = trModify.querySelector('#prSpec').innerText
  //       const prUnit = trModify.querySelector('#prUnit').innerText
  //       const makeDate = trModify.querySelector('#makeDate').innerText
  //       const prExpDate = trModify.querySelector('#prExpDate ').innerText
  //       const productinvenid = trModify.querySelector('#productinvenid ').value

        // trModify.innerHTML = `
        //     <td id="prLotNo">\${prLotNo}</td>
        //     <td id="productname">\${productname}</td>
        //     <td>\${dbgud}</td>
        //     <td id="prPartNum">\${prPartNum}</td>
        //     <td id="prQuantity"><input type="number" name="prQuantity" value="\${prQuantity}" style="text-align: center; font-size: 12px;" id="prQuantity1"></td>
        //     <td id="prSpec">\${prSpec}</td>
        //     <td id="prUnit">\${prUnit}</td>
        //     <td id="makeDate"><input type="date" name="makeDate" value="\${makeDate}" style="font-size: 12px;" id="makeDate1"</td>
        //     <td id="prExpDate">\${prExpDate}</td>
        //     <td>
        //       <input type="submit" value="확인"  class="yes"
        //         style="width: 55px; height: 35px;">
        //       <button class="cancel" style="width: 55px; height: 35px;">취소</button>
        //       <input type="hidden" name="productinvenid"
        //         value="\${ productinvenid }" id="productinvenid">
        //     </td>
        // `

  //     }
  //     const yes = document.querySelectorAll('.yes');
  //     yes[i].addEventListener('click', (e) => {
  //       if (dbgud == "원자재") {
  //         input1.value = "modify1"; // 수정 명령어 값
  //         // 5. `<input>` 요소를 생성하여 `inventoryId` 값을 숨겨서 전달
  //         input2.name = "inventoryId";
  //         input3.name = "maQuantity";
  //         input4.name = "receiptDate";
  //         input2.value = trModify.querySelector('#inventoryId').value;
  //         input3.value = trModify.querySelector('#maQuantity1').value
  //         input4.value = trModify.querySelector('#receiptDate1').value
  //       } else {
  //         input1.value = "modify2"; // 수정 명령어 값
  //         // 5. `<input>` 요소를 생성하여 `inventoryId` 값을 숨겨서 전달
  //         input2.name = "productinvenid";
  //         input3.name = "prQuantity";
  //         input4.name = "makeDate";
  //         input2.value = trModify.querySelector('#productinvenid').value;
  //         input3.value = trModify.querySelector('#prQuantity1').value
  //         input4.value = trModify.querySelector('#makeDate1').value
  //       }
  //       // 6. 생성한 `<input>` 요소들을 `<form>`에 추가
  //       form.appendChild(input1);
  //       form.appendChild(input2);
  //       form.appendChild(input3);
  //       form.appendChild(input4);
  //       // 7. `<form>`을 현재 문서의 `<body>`에 추가 (보이지 않지만 존재해야 함)
  //       document.body.appendChild(form);
  //       // 8. 폼을 자동으로 제출 (서버에 데이터 전송)
  //       form.submit();
  //       alert("수정되었습니다.")

  //     }) // yes event end


  //     const cancel = document.querySelectorAll('.cancel');
  //     cancel[i].addEventListener('click', (e) => {
  //       location.reload();
  //     })


  //   }) // modify addevent end
  // } // for end
  // // 수정 end
  //----------------------------------


  // 등록버튼
  document.querySelector('#insertBtn').addEventListener('click', (e) => {
    e.preventDefault();
    let inputBox = document.querySelector('#additem')
    let hiddenInventoryId = document.querySelector('#hiddenInventoryId');
    let itemtype = document.querySelector('#itemtype').value;
    let addquantity = document.querySelector('#addquantity');
    let addin_date = document.querySelector('#addin_date');
    let datalist = document.querySelector('#suggestions');
    let options = datalist.querySelectorAll('#suggestions > option');

    if (inputBox.value == '') {
      alert("품명을 입력해주시기 바랍니다.")
      return;
    } else if (addquantity.value == '') {
      alert("입고수량을 입력해주시기 바랍니다.")
      return;
    } else if (addin_date.value == '') {
      alert("입고일을 입력해주시기 바랍니다.")
      return;
    }

    for (let option of options) {
      if (option.value === inputBox.value) {
        let data = option.getAttribute('data-id');
        let type = option.getAttribute('data-type');
        if (data) {
          hiddenInventoryId.value = data;
          if (itemtype != type) {
            alert("제품유형을 다시 선택해주시기 바랍니다.");
            return;
          }
          alert("등록되었습니다.");
        }
        break;
      }
    }
    document.querySelector('#inputForm').submit();
  })


  // jsp 수정 다시 가즈아
  const modify = document.querySelectorAll('.modify');

  for (let i = 0 ; i < modify.length ; i++){
    modify[i].addEventListener('click', (e)=>{
      e.preventDefault();
      
      const trModify = e.target.closest("tr");
      
      const lotNo = trModify.querySelector('#lotNo').innerText
      const lotno2 = lotNo.slice(0,3);
      console.log(lotno2);
      const materialname = trModify.querySelector('#materialname').innerText
      const maPartNum = trModify.querySelector('#maPartNum').innerText
      const maQuantity = trModify.querySelector('#maQuantity').innerText
      const maSpec = trModify.querySelector('#maSpec').innerText
      const maUnit = trModify.querySelector('#maUnit').innerText
      const receiptDate = trModify.querySelector('#receiptDate').innerText
      const maExpDate = trModify.querySelector('#maExpDate').innerText
      const productinvenid = trModify.querySelector('#productinvenid').value

      trModify.innerHTML = 
      `
          <td id="lotNo">${lotNo}</td>
          <td id="materialname">${materialname}</td>
          <td>${dbgud}</td>
          <td id="maPartNum">${maPartNum}</td>
          <td id="maQuantity"><input type="number" name="prQuantity" value="${maQuantity}" style="text-align: center; font-size: 12px;" id="prQuantity1"></td>
          <td id="maSpec">${maSpec}</td>
          <td id="maUnit">${maUnit}</td>
          <td id="receiptDate"><input type="date" name="receiptDate" value="${receiptDate}" style="font-size: 12px;" id="makeDate1"</td>
          <td id="maExpDate">${maExpDate}</td>
          <td>
            <input type="submit" value="확인"  class="yes"
              style="width: 55px; height: 35px;">
            <button class="cancel" style="width: 55px; height: 35px;">취소</button>
            <input type="hidden" name="productinvenid"
              value="${ productinvenid }" id="productinvenid">
              <input type="hidden" name="lotnumber" value="${lotNo}">
          </td>
      `

      const yes = trModify.querySelector('.yes');
      yes.addEventListener('click', (e)=>{
        
      })

    })
  }



}