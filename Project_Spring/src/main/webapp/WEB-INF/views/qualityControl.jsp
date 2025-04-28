<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ page import="java.util.*"%>
<%@ page import="project.dto.*"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>품질관리</title>
<link rel="stylesheet" href="resources\css\qualityControl.css">
<script src="resources\js\qualityControl.js"></script>
</head>
<body>
	<div id="myModal" class="modal">
		<div class="modal-content">
			<span class="close">&times;</span>
			<p>여기는 모달창 내용 영역입니다.</p>
		</div>
	</div>
	<div class="warrap">
		<div class="wkr">
			<div class="wkrTop">
				<div class="wkrwl">실적 조회</div>
				<div>
					<button class="btn1">새로고침</button>
				</div>
			</div>
			<div class="wkrView"></div>
			<div class="page-container"></div>
		</div>
<!-- 		<div class="bord"> -->
<!-- 			<div class="inBord"> -->
<!-- 				<div>검사완료율</div> -->
<!-- 				<div>%</div> -->
<!-- 				<div>(제품별)</div> -->
<!-- 			</div> -->
<!-- 			<div class="inBord"> -->
<!-- 				<div>불량률</div> -->
<!-- 				<div>%</div> -->
<!-- 				<div>(제품별)</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
		<div class="box2">
			<div class="left">
				<div class="wp">제품명</div>
				<div class="btn2B">
					<button class="btn2">제품 합격 / 불합격 기준</button>
				</div>
			</div>
			<div class="right">
				<div class="rightTop">
					<div class="wp2">제품명</div>
				</div>
				<div>
					<div>
						<input type="radio" name="ra" checked="checked" class="rad"
							value="합격"> 합격 <input type="radio" name="ra" class="rad"
							value="불합격"> 불합격
					</div>
					<div>
						<input type="datetime-local" class="date2" id="inputdate">
						<input type="hidden" id="productid11">
						<input type="hidden" id="performancegaja11">
						<div>
							합격 갯수입력 : <input type="number" class="myInput" min="1" max="100"
								oninput="validity.valid||(value='')" value="10"> pack
						</div>
						<div>
							불합 개수입력 : <input type="number" class="myInput" min="1" max="100"
								oninput="validity.valid||(value='')" placeholder="0">
							pack
						</div>
					</div>
				</div>
				<div class="insert">
					<textarea name="" id="" placeholder="기타사항" class="textBox" rows="2"></textarea>
					<button class="btn3">등록</button>
				</div>
				<div class="BB">
					<div class="BB2 hide">불합격 사유 :</div>
					<select class="dropBox hide">
						<option value="무게 미달">무게 미달</option>
						<option value="외관 불량">외관 불량</option>
						<option value="자재 불량">자재 불량</option>
					</select>
				</div>
			</div>
		</div>
		<div class="box3">
			<div class="box3Top">
				<div>
					<input type="text" placeholder="제품명" class="wp3">
				</div>
				<div class="date2">
					날짜 : <input type="datetime-local" class="indate1"> ~ <input
						type="datetime-local" class="indate2">
				</div>
				<div>
					결과 : <select class="dropBox2" id="searchResult">
						<option value="">전체</option>
						<option value="합격">합격</option>
						<option value="불합격">불합격</option>
					</select>
				</div>
				<div  style="display: none;">
					불합격 사유 : <select class="dropBox2" id="searchFail" disabled>
						<option value="">전체</option>
						<option value="무게 미달">무게 미달</option>
						<option value="외관 불량">외관 불량</option>
						<option value="자재 불량">자재 불량</option>
					</select>
				</div>
				<div>
					<button class="btn4">검색</button>
				</div>
			</div>
			<div class="dede">
				<div class="indexsss">
					<div>날짜</div>
					<div>제품명</div>
					<div>합격/불합격</div>
					<div>불합격 사유</div>
					<div>코멘트</div>
					<div>합격</div>
					<div>불합격</div>
					<div>등록인</div>
					<div>비고</div>
				</div>
			</div>
			<div class="box3View"></div>
			<div class="pageNationQuality"></div>
		</div>
	</div>
	<script>
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
	    //모달창
	    const modal = document.querySelector('#myModal');
	    // 모달창 내용
	    const content = document.querySelector('.modal-content');
	    //제품번호
	    const productid = document.querySelector('#productid11').value;
	    if (!productid) {
	      alert("제품을 선택해 주십시오.");
	    } else {
	      fetch(`/project/QaulModalSelect?productid=${productid}`)
	        .then(res => res.json())
	        .then(data => {
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
	        .catch(err => {
	          console.log("에러 : ", err)
	        })
	    }
	  })

	  // 모달창 닫기 이벤트
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

	  // 검색창에 드랍박스 클릭시 불합사유 보이게 or 안보이게
	  const searchBox = document.querySelector('#searchResult');
	  const searchFail = document.querySelector('#searchFail');
	  searchBox.addEventListener('change', (e) => {
	    if (searchBox.value == '불합격') {
	      searchFail.disabled = false;
	      searchFail.parentNode.style.display = "block";
	    } else {
	      searchFail.disabled = true;
	      searchFail.parentNode.style.display = "none";
	    }

	  })

	  // 새로고침
	  document.querySelector('.btn1').addEventListener('click', (e) => {
	    location.reload();
	  })

	  //검색버튼
	  document.querySelector('.btn4').addEventListener('click', (e) => {
	    qualSearchList(1);
	  })


	  //등록버튼
	  document.querySelector('.btn3').addEventListener('click', (e) => {

	    // 세션아이디 가져오기위한 fetch
	    fetch("/project/getSessionUserId")
	      .then(res => res.text())
	      .then(userid => {
	        if (!userid) {
	          alert("로그인 정보가 없습니다.");
	          return;
	        }
	        // 보낼데이터 선언
	        const sendData = {};
	        // productid ㅇ, performanceid ㅇ, userid ㅇ, result ㅇ, failreason ㅇ,comment ㅇ, qualitycontroltime ㅇ, passpack ㅇ, failpack ㅇ
	        sendData.userid = userid;
	        // FK
	        sendData.productid = document.querySelector('#productid11').value;
	        //합불 radio
	        const rad = document.querySelectorAll('.rad')
	        for (let i = 0; i < rad.length; i++) {
	          if (rad[i].checked) {
	            sendData.result = rad[i].value
	            if (rad[i].value == '불합격') {
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
	        // sendData.userid = 'adminid2'

	        if (document.querySelector('.wp2').innerText == "제품명" || document.querySelector('.wp').innerText == "제품명") {
	          alert("제품을 선택해주세요");
	          return;
	        }
	        if (ea[0].value == '' || ea[1].value == '') {
	          alert('합/불 갯수를 입력해주세요.');
	          return;
	        }

	        const tt = confirm("정말로 등록하시겠습니까?");
	        if (tt) {
	          fetch("/project/qualInsert", {
	            method: "POST",
	            headers: {
	              "Content-Type": "application/json"
	            },
	            body: JSON.stringify(sendData)
	          })
	            .then(response => response.json())
	            .then(data => {
	              console.log(data);
	              alert("등록완료되었습니다.")
	              location.reload();
	            })
	            .catch(error => {
	              console.log('오류발쒱 :', error);
	            })
	        }
	      })
	  }) // 등록 클릭이벤트 end



	  //실적조회 페이지네이션과 조회
	  loadPerformList(1);

	  // 품질 조회
	  loadQualList(1);
	} // end init


	// 품질 페이지네이션 fetch 가즈아ㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏ
	function loadQualList(page = 1) {
	  isSearching = false;
	  fetch("/project/qualList", {
	    method: "POST",
	    headers: {
	      "Content-Type": "application/json"
	    },
	    body: JSON.stringify({ page: page, viewCount: 9 })
	  })
	    .then(response => response.json())
	    .then(data => {
	      renderQualList(data.list);
	      renderQualPagination(data.totalCount, data.page);
	    })
	}

	// fetch로 search List가즈아
	function qualSearchList(page = 1) {

	  if (page === 1) {
	    isSearching = true;
	    currentSearchParams = {
	      productname: document.querySelector('.wp3').value,
	      searchDateStart: document.querySelector('.indate1').value,
	      searchDateEnd: document.querySelector('.indate2').value,
	      result: document.querySelector('#searchResult').value,
	      failreason: document.querySelector('#searchFail').value
	    }
	  }
	  const params = new URLSearchParams({
	    ...currentSearchParams,
	    page,
	    viewCount: 9
	  })
	  fetch(`/project/qualList/search?${params}`)
	    .then(response => response.json())
	    .then(data => {
	      renderQualList(data.list);
	      renderQualPagination(data.totalCount, page);
	    })
	    .catch(error => {
	      console.log('ㅃㅣ용삐용 에러데스요  : ', error);
	    })
	}

	// 품질 렌더링
	function renderQualList(list) {
	  const qualityList = document.querySelector('.box3View')
	  qualityList.innerHTML = ''
	  list.forEach(item => {
	    const failreason = item.failreason ? item.failreason : '';
	    const comments = item.comments ? item.comments : '';

	    const card = document.createElement('div');
	    card.className = 'qualList-card'
	    card.innerHTML = `
	      <div class="qualitycontroltime">${item.qualitycontroltime}</div>
	      <div class="productname">${item.productname}</div>
	      <div class="result">${item.result}</div>
	      <div class="failreason">${failreason}</div>
	      <div class="comments">${comments}</div>
	      <div class="passpack">${item.passpack} pack</div>
	      <div class="failpack">${item.failpack} pack</div>
	      <div class="username">${item.username}</div>
	      <div>
	        <button type="button" class="Modify">수정</button>
	        <button type="button" class="delete">삭제</button>
	        <input type="hidden" value="${item.qualitycontrolid}" id="qualitycontrolid">
	      </div>
	      `
	    qualityList.append(card)
	  })
	  ModifyBtn();
	  QaulDelete();
	}

	// 페이지네이션 버튼임
	function renderQualPagination(totalCount, currentPage) {
	  const pageNationQuality = document.querySelector('.pageNationQuality');
	  pageNationQuality.innerHTML = '';

	  const viewCount = 9;
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

	// 수정
	function ModifyBtn() {
	  const modifybtn = document.querySelectorAll('.Modify');
	  for (let i = 0; i < modifybtn.length; i++) {
	    modifybtn[i].addEventListener('click', (e) => {
	      const modifyBtnClick = e.target.parentNode.parentNode;
	      const qualitycontroltime = modifyBtnClick.querySelector('.qualitycontroltime').innerText
	      const productname = modifyBtnClick.querySelector('.productname').innerText
	      const result = modifyBtnClick.querySelector('.result').innerText
	      const failreason = modifyBtnClick.querySelector('.failreason').innerText
	      const comments = modifyBtnClick.querySelector('.comments').innerText
	      const username = modifyBtnClick.querySelector('.username').innerText
	      const qualitycontrolid = modifyBtnClick.querySelector('#qualitycontrolid').value
	      const passpack = modifyBtnClick.querySelector('.passpack').innerText.slice(0, modifyBtnClick.querySelector('.passpack').innerText.indexOf(" "))
	      const failpack = modifyBtnClick.querySelector('.failpack').innerText.slice(0, modifyBtnClick.querySelector('.failpack').innerText.indexOf(" "))

	      Number(passpack);
	      Number(failpack);

	      // 수정클릭시 innerHTML
	      modifyBtnClick.innerHTML = `
	        <div class="qualitycontroltime">
	          <input id="qualitycontroltime" type="datetime-local" value="${qualitycontroltime}" style="font-size: 11px;"></div>
	        <div class="productname">${productname}</div>
	        <div class="result">
	          <select id="result" style="width: 100%;font-size: 13px;">
							<option value="합격">합격</option>
							<option value="불합격">불합격</option>
						</select>
	        </div>
	        <div>
	          <select id="failreason" disabled style="width: 100%;font-size: 13px;">
							<option value="무게 미달">무게 미달</option>
							<option value="외관 불량">외관 불량</option>
							<option value="자재 불량">자재 불량</option>
						</select>
	        </div>
	        <div class="comments">
	          <input id="comments" type="text" value="${comments}" style="width: 100%;font-size: 12px;">
	        </div>
	        <div>
	          <input type="number" value="${passpack}" id="passpack" style="font-size: 12px;">
	        </div>
	        <div>
	          <input type="number" value="${failpack}" id="failpack" style="font-size: 12px;">
	        </div>
	        <div class="username">${username}</div>
	        <div>
	          <button type="button" class="Yes">완료</button>
	          <button type="button" class="cancel">취소</button>
	          <input type="hidden" value="${qualitycontrolid}" id="qualitycontrolid">
	        </div>
	      `
	      //
	      // 합/불 클릭시 불합사유 disabled 넣다 빼기
	      modifyBtnClick.querySelector('#result').addEventListener('change', (e) => {
	        console.log(e.target.value);
	        if (e.target.value == '불합격') {
	          modifyBtnClick.querySelector('#failreason').disabled = false;
	        } else {
	          modifyBtnClick.querySelector('#failreason').disabled = true;
	        }
	      })

	      // 수정취소
	      modifyBtnClick.querySelector('.cancel').addEventListener('click', (e) => {
	        const tt = confirm("정말로 취소하시겠습니까?");
	        if (tt) {
	          alert('수정이 취소되었습니다.');
	          location.reload();
	        }
	      })

	      // 완료클릭시
	      modifyBtnClick.querySelector('.Yes').addEventListener('click', (e) => {
	        const tt = confirm("수정된 내용을 저장하시겠습니까?")
	        if (tt) {
	          //input value 저장
	          const qualitycontroltime = modifyBtnClick.querySelector('#qualitycontroltime').value;
	          const result = modifyBtnClick.querySelector('#result').value;
	          if (result == "불합격") {
	            const failreason = modifyBtnClick.querySelector('#failreason').value;
	          }
	          const comments = modifyBtnClick.querySelector('#comments').value;
	          const qualitycontrolid = modifyBtnClick.querySelector('#qualitycontrolid').value;
	          const passpack = modifyBtnClick.querySelector('#passpack').value;
	          const failpack = modifyBtnClick.querySelector('#failpack').value;

	          //json 객체로 만들어서 보내기
	          const sendData = {
	            qualitycontroltime: qualitycontroltime,
	            result: result,
	            comments: comments,
	            qualitycontrolid: qualitycontrolid,
	            passpack: passpack,
	            failpack: failpack,
	            failreason: result === "불합격" ? failreason : null
	          }

	          // 수정 put fetch 가즈아
	          fetch("/project/QualUpdate", {
	            method: "PUT",
	            headers: {
	              "Content-Type": "application/json"
	            },
	            body: JSON.stringify(sendData)
	          })
	            .then(res => res.json())
	            .then(result => {
	              if (result === 1) {
	                alert('수정완료');
	                location.reload();
	              }
	            })
	            .catch(err => {
	              console.log("수정 실패's : ", err)
	            })
	        } //수정 if 끝
	      })//수정완료 이벤트



	    })//수정 버튼 클릭 이벤트 end
	  }// 반복문 end
	} // function ModifyBtn 끝


	//삭제버튼
	function QaulDelete() {

	  const qaulDeletes = document.querySelectorAll('.delete');
	  for (let i = 0; i < qaulDeletes.length; i++) {
	    qaulDeletes[i].addEventListener('click', (e) => {
	      const tt = confirm("정말로 삭제하시겠습니까?")
	      if (tt) {
	        const qualitycontrolid = document.querySelector('#qualitycontrolid').value;
	        fetch("/project/QaulDelete", {
	          method: "DELETE",
	          headers: {
	            "Content-Type": "application/json"
	          },
	          body: JSON.stringify({
	            qualitycontrolid: qualitycontrolid
	          })
	        })
	          .then(res => res.json())
	          .then(result => {
	            if (result === 1) {
	              alert("삭제되었습니다.");
	              location.reload();
	            }
	          })
	          .catch(err => {
	            console.log("삐용삐용 에러쓰 : ", err);
	          })
	        // 삭제 fetch end
	      } // 삭제 if end
	    })// 삭제 이벤트 end

	  }


	}
	</script>
</body>

</html>