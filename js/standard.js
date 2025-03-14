window.addEventListener("load", function () {

    //처음 항목 출력 
    document.querySelector(".finishe-table").classList.remove("none")
    document.querySelector(".start-table").classList.add("none")
    document.querySelector("#c").classList.remove("none")
    document.querySelector("#u").classList.add("none")
    document.querySelector("#ud").classList.add("none")
    document.querySelector("#c2").classList.add("none")
    document.querySelector("#u2").classList.add("none")
    document.querySelector("#ud2").classList.add("none")
    document.querySelector("#mid-contain").classList.add("none")
    document.querySelector("#mid-contain2").classList.add("none")
    document.querySelector("#materials_hide").addEventListener("click", function () {
        document.querySelector("#mid-contain").classList.remove("none")
        document.querySelector("#mid-contain2").classList.add("none")
    })
    document.querySelector("#finished_hide").addEventListener("click", function () { 
        document.querySelector("#mid-contain").classList.add("none")
        document.querySelector("#mid-contain2").classList.remove("none")
    })

    const start = [
        { 제품명: "베이크드빈", 가격: 1500, 규격: 1, 재고수량: 100, 단위: "캔", 공급업체: "네이처하이브", LotNo: "ING-20250124-001", 창고위치: "상온", 품번: "P001", 입고일자: "2025-01-24", 유효기간: "2026-01-24" },
        { 제품명: "햄", 가격: 5000, 규격: 500, 재고수량: 50, 단위: "g", 공급업체: "미트하모니", LotNo: "ING-20250124-002", 창고위치: "상온", 품번: "P002", 입고일자: "2025-01-24", 유효기간: "2026-01-24" },
        { 제품명: "사골육수", 가격: 3000, 규격: 500, 재고수량: 75, 단위: "ml", 공급업체: "육수정원", LotNo: "ING-20250124-003", 창고위치: "냉장", 품번: "P003", 입고일자: "2025-01-24", 유효기간: "2025-07-24" },
        { 제품명: "사골 농축 육수", 가격: 2500, 규격: 100, 재고수량: 30, 단위: "ml", 공급업체: "*은맛푸드", LotNo: "ING-20250124-004", 창고위치: "냉장", 품번: "P004", 입고일자: "2025-01-24", 유효기간: "2025-07-24" },
        { 제품명: "사리면", 가격: 1200, 규격: 200, 재고수량: 120, 단위: "g", 공급업체: "네이처하이브", LotNo: "ING-20250124-005", 창고위치: "상온", 품번: "P005", 입고일자: "2025-01-24", 유효기간: "2026-01-24" },
        { 제품명: "부대찌개 소스", 가격: 2000, 규격: 500, 재고수량: 80, 단위: "g", 공급업체: "소스 마스터즈", LotNo: "ING-20250124-006", 창고위치: "상온", 품번: "P006", 입고일자: "2025-01-24", 유효기간: "2026-01-24" },
        { 제품명: "각종 채소", 가격: 2500, 규격: 500, 재고수량: 60, 단위: "g", 공급업체: "네이처하이브", LotNo: "ING-20250124-007", 창고위치: "냉장", 품번: "P007", 입고일자: "2025-01-24", 유효기간: "2025-06-24" },
        { 제품명: "체다슬라이스 치즈", 가격: 3000, 규격: 200, 재고수량: 40, 단위: "g", 공급업체: "네이처하이브", LotNo: "ING-20250124-008", 창고위치: "냉장", 품번: "P008", 입고일자: "2025-01-24", 유효기간: "2025-07-24" },
        { 제품명: "찌개용 용기", 가격: 500, 규격: 1, 재고수량: 200, 단위: "개", 공급업체: "에코컨테이너", LotNo: "PKG-20250124-001", 창고위치: "상온", 품번: "P009", 입고일자: "2025-01-24", 유효기간: "2026-01-24" },
        { 제품명: "김치", 가격: 1500, 규격: 500, 재고수량: 90, 단위: "g", 공급업체: "네이처하이브", LotNo: "ING-20250124-009", 창고위치: "냉장", 품번: "P010", 입고일자: "2025-01-24", 유효기간: "2025-07-24" },
        { 제품명: "고춧가루", 가격: 3000, 규격: 500, 재고수량: 55, 단위: "g", 공급업체: "네이처하이브", LotNo: "ING-20250124-010", 창고위치: "상온", 품번: "P011", 입고일자: "2025-01-24", 유효기간: "2026-01-24" },
        { 제품명: "설탕", 가격: 1000, 규격: 1, 재고수량: 100, 단위: "kg", 공급업체: "네이처하이브", LotNo: "ING-20250124-011", 창고위치: "상온", 품번: "P012", 입고일자: "2025-01-24", 유효기간: "2026-01-24" },
        { 제품명: "마늘", 가격: 2000, 규격: 500, 재고수량: 150, 단위: "g", 공급업체: "네이처하이브", LotNo: "ING-20250124-012", 창고위치: "상온", 품번: "P013", 입고일자: "2025-01-24", 유효기간: "2025-07-24" },
        { 제품명: "대파", 가격: 1000, 규격: 500, 재고수량: 80, 단위: "g", 공급업체: "네이처하이브", LotNo: "ING-20250124-013", 창고위치: "냉장", 품번: "P014", 입고일자: "2025-01-24", 유효기간: "2025-06-24" },
        { 제품명: "돈육", 가격: 6000, 규격: 500, 재고수량: 40, 단위: "g", 공급업체: "미트하모니", LotNo: "ING-20250124-014", 창고위치: "냉동", 품번: "P015", 입고일자: "2025-01-24", 유효기간: "2025-12-24" },
        { 제품명: "두부", 가격: 1500, 규격: 300, 재고수량: 200, 단위: "g", 공급업체: "네이처하이브", LotNo: "ING-20250124-015", 창고위치: "냉동", 품번: "P016", 입고일자: "2025-01-24", 유효기간: "2025-12-24" },
        { 제품명: "김치찌개용 육수", 가격: 2500, 규격: 500, 재고수량: 60, 단위: "ml", 공급업체: "육수정원", LotNo: "ING-20250124-016", 창고위치: "냉장", 품번: "P017", 입고일자: "2025-01-24", 유효기간: "2025-07-24" },
        { 제품명: "소고기", 가격: 10000, 규격: 500, 재고수량: 30, 단위: "g", 공급업체: "미트하모니", LotNo: "ING-20250124-017", 창고위치: "냉동", 품번: "P018", 입고일자: "2025-01-24", 유효기간: "2025-12-24" },
        { 제품명: "팽이버섯", 가격: 2000, 규격: 100, 재고수량: 80, 단위: "g", 공급업체: "네이처하이브", LotNo: "ING-20250124-018", 창고위치: "냉동", 품번: "P019", 입고일자: "2025-01-24", 유효기간: "2025-06-24" },
        { 제품명: "당면", 가격: 1500, 규격: 200, 재고수량: 120, 단위: "g", 공급업체: "네이처하이브", LotNo: "ING-20250124-019", 창고위치: "냉동", 품번: "P020", 입고일자: "2025-01-24", 유효기간: "2026-01-24" },
        { 제품명: "깻잎", 가격: 1500, 규격: 100, 재고수량: 100, 단위: "g", 공급업체: "네이처하이브", LotNo: "ING-20250124-020", 창고위치: "냉장", 품번: "P021", 입고일자: "2025-01-24", 유효기간: "2025-06-24" },
        { 제품명: "초간장", 가격: 1500, 규격: 500, 재고수량: 90, 단위: "ml", 공급업체: "네이처하이브", LotNo: "ING-20250124-021", 창고위치: "상온", 품번: "P022", 입고일자: "2025-01-24", 유효기간: "2026-01-24" },
        { 제품명: "밀푀유나베 소스", 가격: 2000, 규격: 500, 재고수량: 70, 단위: "g", 공급업체: "소스 마스터즈", LotNo: "ING-20250124-022", 창고위치: "상온", 품번: "P023", 입고일자: "2025-01-24", 유효기간: "2026-01-24" },
        { 제품명: "칠리소스", 가격: 2000, 규격: 500, 재고수량: 50, 단위: "g", 공급업체: "소스 마스터즈", LotNo: "ING-20250124-023", 창고위치: "상온", 품번: "P024", 입고일자: "2025-01-24", 유효기간: "2026-01-24" },
        { 제품명: "새송이 버섯", 가격: 2500, 규격: 100, 재고수량: 80, 단위: "g", 공급업체: "네이처하이브", LotNo: "ING-20250124-024", 창고위치: "냉동", 품번: "P025", 입고일자: "2025-01-24", 유효기간: "2025-06-24" },
        { 제품명: "표고 버섯", 가격: 3000, 규격: 100, 재고수량: 90, 단위: "g", 공급업체: "네이처하이브", LotNo: "ING-20250124-025", 창고위치: "냉동", 품번: "P026", 입고일자: "2025-01-24", 유효기간: "2025-06-24" },
        { 제품명: "생면", 가격: 1500, 규격: 200, 재고수량: 40, 단위: "g", 공급업체: "*성전문점", LotNo: "ING-20250124-026", 창고위치: "냉동", 품번: "P027", 입고일자: "2025-01-24", 유효기간: "2025-12-24" },
        { 제품명: "배추", 가격: 1000, 규격: 1, 재고수량: 60, 단위: "kg", 공급업체: "네이처하이브", LotNo: "ING-20250124-027", 창고위치: "냉장", 품번: "P028", 입고일자: "2025-01-24", 유효기간: "2025-06-24" },
        { 제품명: "청경채", 가격: 1500, 규격: 500, 재고수량: 80, 단위: "g", 공급업체: "네이처하이브", LotNo: "ING-20250124-028", 창고위치: "냉장", 품번: "P029", 입고일자: "2025-01-24", 유효기간: "2025-06-24" },
        { 제품명: "샤브용 육수", 가격: 2500, 규격: 500, 재고수량: 70, 단위: "ml", 공급업체: "육수정원", LotNo: "ING-20250124-029", 창고위치: "냉장", 품번: "P030", 입고일자: "2025-01-24", 유효기간: "2025-07-24" },
        { 제품명: "나베용 용기", 가격: 500, 규격: 1, 재고수량: 200, 단위: "개", 공급업체: "에코컨테이너", LotNo: "PKG-20250124-002", 창고위치: "상온", 품번: "P031", 입고일자: "2025-01-24", 유효기간: "2026-01-24" },
        { 제품명: "떡", 가격: 2000, 규격: 500, 재고수량: 60, 단위: "g", 공급업체: "네이처하이브", LotNo: "ING-20250124-030", 창고위치: "냉동", 품번: "P032", 입고일자: "2025-01-24", 유효기간: "2025-12-24" },
        { 제품명: "어묵", 가격: 3000, 규격: 500, 재고수량: 40, 단위: "g", 공급업체: "네이처하이브", LotNo: "ING-20250124-031", 창고위치: "냉동", 품번: "P033", 입고일자: "2025-01-24", 유효기간: "2025-12-24" },
        { 제품명: "떡볶이 소스", 가격: 2000, 규격: 500, 재고수량: 50, 단위: "g", 공급업체: "소스 마스터즈", LotNo: "ING-20250124-032", 창고위치: "상온", 품번: "P034", 입고일자: "2025-01-24", 유효기간: "2026-01-24" },
        { 제품명: "떡볶이 용기", 가격: 500, 규격: 1, 재고수량: 150, 단위: "개", 공급업체: "에코컨테이너", LotNo: "PKG-20250124-003", 창고위치: "상온", 품번: "P035", 입고일자: "2025-01-24", 유효기간: "2026-01-24" },
        { 제품명: "양념육 (소곱창, 대곱창)", 가격: 8000, 규격: 500, 재고수량: 30, 단위: "g", 공급업체: "미트하모니", LotNo: "ING-20250124-033", 창고위치: "냉동", 품번: "P036", 입고일자: "2025-01-24", 유효기간: "2025-12-24" },
        { 제품명: "전골용 육수", 가격: 2500, 규격: 500, 재고수량: 70, 단위: "ml", 공급업체: "육수정원", LotNo: "ING-20250124-034", 창고위치: "냉장", 품번: "P037", 입고일자: "2025-01-24", 유효기간: "2025-07-24" },
        { 제품명: "새송이버섯", 가격: 2500, 규격: 100, 재고수량: 80, 단위: "g", 공급업체: "네이처하이브", LotNo: "ING-20250124-024", 창고위치: "냉동", 품번: "P025", 입고일자: "2025-01-24", 유효기간: "2025-06-24" },
        { 제품명: "느타리버섯", 가격: 2000, 규격: 100, 재고수량: 90, 단위: "g", 공급업체: "네이처하이브", LotNo: "ING-20250124-036", 창고위치: "냉동", 품번: "P039", 입고일자: "2025-01-24", 유효기간: "2025-06-24" },
        { 제품명: "소고기", 가격: 10000, 규격: 500, 재고수량: 30, 단위: "g", 공급업체: "미트하모니", LotNo: "ING-20250124-037", 창고위치: "냉동", 품번: "P040", 입고일자: "2025-01-24", 유효기간: "2025-12-24" },
        { 제품명: "두부", 가격: 1500, 규격: 300, 재고수량: 200, 단위: "g", 공급업체: "네이처하이브", LotNo: "ING-20250124-038", 창고위치: "냉동", 품번: "P041", 입고일자: "2025-01-24", 유효기간: "2025-12-24" },
        { 제품명: "배추", 가격: 1000, 규격: 1, 재고수량: 60, 단위: "kg", 공급업체: "네이처하이브", LotNo: "ING-20250124-039", 창고위치: "냉장", 품번: "P042", 입고일자: "2025-01-24", 유효기간: "2025-06-24" },
        { 제품명: "양파", 가격: 1000, 규격: 500, 재고수량: 80, 단위: "g", 공급업체: "네이처하이브", LotNo: "ING-20250124-040", 창고위치: "냉장", 품번: "P043", 입고일자: "2025-01-24", 유효기간: "2025-06-24" },
        { 제품명: "깻잎", 가격: 1500, 규격: 100, 재고수량: 100, 단위: "g", 공급업체: "네이처하이브", LotNo: "ING-20250124-041", 창고위치: "냉장", 품번: "P044", 입고일자: "2025-01-24", 유효기간: "2025-06-24" },
        { 제품명: "라면 사리", 가격: 1200, 규격: 200, 재고수량: 150, 단위: "g", 공급업체: "네이처하이브", LotNo: "ING-20250124-042", 창고위치: "상온", 품번: "P045", 입고일자: "2025-01-24", 유효기간: "2026-01-24" },
        { 제품명: "곱창 전골 용기", 가격: 500, 규격: 1, 재고수량: 200, 단위: "개", 공급업체: "에코컨테이너", LotNo: "PKG-20250124-004", 창고위치: "상온", 품번: "P046", 입고일자: "2025-01-24", 유효기간: "2026-01-24" },
    ]

    const finishe = [
        { 제품명: "부대찌개", 가격: null, 규격: null, 재고수량: 2550, 공급업체: null, LotNo: "WPD-20250124-001", 창고위치: null, 품번: "P047", 입고일자: "2025-01-24", 유효기간: "2026-01-24" },
        { 제품명: "김치찌개", 가격: null, 규격: null, 재고수량: 3040, 공급업체: null, LotNo: "WPD-20250124-002", 창고위치: null, 품번: "P048", 입고일자: "2025-01-24", 유효기간: "2026-01-24" },
        { 제품명: "밀푀유나베", 가격: null, 규격: null, 재고수량: 5230, 공급업체: null, LotNo: "WPD-20250124-003", 창고위치: null, 품번: "P049", 입고일자: "2025-01-24", 유효기간: "2026-01-24" },
        { 제품명: "떡볶이", 가격: null, 규격: null, 재고수량: 4820, 공급업체: null, LotNo: "WPD-20250124-004", 창고위치: null, 품번: "P050", 입고일자: "2025-01-24", 유효기간: "2026-01-24" },
        { 제품명: "곱창전골", 가격: null, 규격: null, 재고수량: 3515, 공급업체: null, LotNo: "WPD-20250124-005", 창고위치: null, 품번: "P051", 입고일자: "2025-01-24", 유효기간: "2026-01-24" }
    ]

    const start2 = []

    const finishe2 = []

    //--------------전체조회
    //--------------------------

    //--------------------------원재료
    let starttrs = document.querySelectorAll(".start-tr ")
    for (let i = 0; i < starttrs.length; i++) {
        starttrs[i].innerHTML = " "
        console.log("starttrs[i].innerHTML", starttrs[i].innerHTML)
    }
    let starttablebody = document.querySelector(".start-table ")

    start.forEach(function (v) {
        newstart = document.createElement("tr")
        newstart.classList.add("start-tr")
        newstart.innerHTML = `
                        <td class="start-td">${v.제품명}</td>
                        <td class="start-td">${v.가격}</td>
                        <td class="start-td">${v.규격}</td>
                        <td class="start-td">${v.단위}</td>
                        <td class="start-td">${v.공급업체}</td>
                        <td class="start-td">${v.품번}</td>
                        <td class="start-td">${v.LotNo}</td>
                        <td class="start-td">${v.창고위치}</td>
                        <td class="start-td">
                            <input type="button" value="수정" id="update">
                            <input type="button" value="삭제" id="delet">
                            
                        </td>           
                        `
        starttablebody.append(newstart)

        //삭제인데 생성을한번해야된다. 하 
        //삭제 완
        newstart.querySelector("#delet").addEventListener("click", function (even) {
            alert("관리자계정확인")
            // console.log(even.target)
            even.target.parentNode.parentNode.remove()
        })

        // 수정버튼
        newstart.querySelector("#update").addEventListener("click", function (even) {
            alert("관리자계정확인")
            document.querySelector("#c").classList.add("none")
            document.querySelector("#u").classList.remove("none")
            document.querySelector("#ud").classList.remove("none")
            document.querySelector("#c2").classList.add("none")
            document.querySelector("#u2").classList.add("none")
            document.querySelector("#ud2").classList.add("none")

            console.log(even.target.parentNode.parentNode)
            let tdtext = even.target.parentNode.parentNode.querySelectorAll("td")
            let middatas = document.querySelectorAll(".mid-data")
            //let i = 0; i <tdtext.length; i++ 안되는이유 물어보기
            for (let i = 0; i < middatas.length; i++) {

                middatas[i].value = tdtext[i].innerText
                // middatas[6].value = tdtext[6].innerText
            }
            document.querySelector("#u").addEventListener("click", function () {
                let middatas = document.querySelectorAll(".mid-data")
                let tdtext = even.target.parentNode.parentNode.querySelectorAll("td")
                for (let i = 0; i < middatas.length; i++) {
                    tdtext[i].innerText = middatas[i].value;
                    middatas[i].value = " "
                }
                document.querySelector("#u").classList.add("none")
                document.querySelector("#ud").classList.add("none")
                document.querySelector("#c").classList.remove("none")
            })

            //수정 버튼을 클릭할 때마다 #u 버튼에 대한 이벤트 리스너가 추가되고 있습니다.
            //이렇게 하면 수정 버튼을 클릭할 때마다 #u 버튼에 대한 이벤트 리스너가 새로 추가되지 않고, 
            // 이전의 리스너가 덮어쓰여지게 됩니다. 따라서 각 제품의 수정이 독립적으로 이루어질 수 있습니다.
            // 또한, #u 버튼에 대한 이벤트 리스너를 onclick 속성으로 설정하여, 
            // 이전 리스너가 제거되도록 하였습니다. 이렇게 하면 수정할 때마다 새로운 리스너가 
            // 추가되지 않으므로, 이전 수정 내용이 지워지는 문제를 방지할 수 있습니다.

            document.querySelector("#ud").onclick = function () {
                for (let i = 0; i < middatas.length; i++) {
                    middatas[i].value = " "
                }
                document.querySelector("#u").classList.add("none")
                document.querySelector("#ud").classList.add("none")
                document.querySelector("#c").classList.remove("none")
            }
        })
    })

    //---------------------------



    //--------------------------완재품
    let finishetrs = document.querySelectorAll(".finishe-tr ")
    for (let i = 0; i < finishetrs.length; i++) {
        finishetrs[i].innerHTML = " "
        console.log("finishetrs[i].innerHTML", finishetrs[i].innerHTML)
    }
    let finishetablebody = document.querySelector(".finishe-table")
    finishe.forEach(function (v) {
        newfinishe = document.createElement("tr")
        newfinishe.classList.add("finishe-tr")
        newfinishe.innerHTML = `
                        <td class="finishe-td">${v.제품명}</td>
                        <td class="finishe-td">${v.가격}</td>
                        <td class="finishe-td">${v.규격}</td>
                        <td class="finishe-td">${v.단위}</td>
                        <td class="finishe-td">${v.공급업체}</td>
                        <td class="finishe-td">${v.품번}</td>
                        <td class="finishe-td">${v.LotNo}</td>
                        <td class="finishe-td">${v.창고위치}</td>
                        <td class="finishe-td">
                            <input type="button" value="수정" id="update">
                            <input type="button" value="삭제" id="delet">
                        </td>           
                        `
        finishetablebody.append(newfinishe)
        //삭제인데 생성을한번해야된다. 하 
        //삭제 완
        newfinishe.querySelector("#delet").addEventListener("click", function (even) {
            alert("관리자계정확인")
            // console.log(even.target)
            even.target.parentNode.parentNode.remove()
        })

        // 수정버튼
        newfinishe.querySelector("#update").addEventListener("click", function (even) {
            document.querySelector("#c").classList.add("none")
            document.querySelector("#u").classList.add("none")
            document.querySelector("#ud").classList.add("none")
            document.querySelector("#c2").classList.add("none")
            document.querySelector("#u2").classList.remove("none")
            document.querySelector("#ud2").classList.remove("none")
            console.log(even.target.parentNode.parentNode)
            let tdtext = even.target.parentNode.parentNode.querySelectorAll("td")
            let middatas = document.querySelectorAll(".mid-data")
            //let i = 0; i <tdtext.length; i++ 안되는이유 물어보기
            for (let i = 0; i < middatas.length; i++) {

                middatas[i].value = tdtext[i].innerText
                // middatas[6].value = tdtext[6].innerText
            }

            //수정 버튼을 클릭할 때마다 #u 버튼에 대한 이벤트 리스너가 추가되고 있습니다.
            //이렇게 하면 수정 버튼을 클릭할 때마다 #u 버튼에 대한 이벤트 리스너가 새로 추가되지 않고, 
            // 이전의 리스너가 덮어쓰여지게 됩니다. 따라서 각 제품의 수정이 독립적으로 이루어질 수 있습니다.
            // 또한, #u 버튼에 대한 이벤트 리스너를 onclick 속성으로 설정하여, 
            // 이전 리스너가 제거되도록 하였습니다. 이렇게 하면 수정할 때마다 새로운 리스너가 
            // 추가되지 않으므로, 이전 수정 내용이 지워지는 문제를 방지할 수 있습니다.
            document.querySelector("#u2").onclick = function () {
                console.log(middatas[0].value);
                for (let i = 0; i < middatas.length; i++) {
                    tdtext[i].innerText = middatas[i].value;
                    middatas[i].value = ""
                }
            }
            document.querySelector("#ud2").onclick = function () {
                for (let i = 0; i < middatas.length; i++) {
                    middatas[i].value = " "
                }
            }

        })
    })
    //--------------------------
    document.querySelector(".start-table").classList.remove("none")
    document.querySelector(".finishe-table").classList.add("none")


    document.querySelector("#check-option").addEventListener("change", function (e) {

        if (e.target.value == 1) {
            console.log
            document.querySelector(".start-table").classList.remove("none")
            document.querySelector(".finishe-table").classList.add("none")
            document.querySelector("#c").classList.remove("none")
            document.querySelector("#u").classList.add("none")
            document.querySelector("#ud").classList.add("none")
            document.querySelector("#c2").classList.add("none")
            document.querySelector("#u2").classList.add("none")
            document.querySelector("#ud2").classList.add("none")
        } else if (e.target.value == 2) {
            document.querySelector(".start-table").classList.add("none")
            document.querySelector(".finishe-table").classList.remove("none")
            document.querySelector("#c").classList.add("none")
            document.querySelector("#u").classList.add("none")
            document.querySelector("#c2").classList.remove("none")
            document.querySelector("#u2").classList.add("none")
            document.querySelector("#ud").classList.add("none")
            document.querySelector("#ud2").classList.add("none")
        } else if (e.target.value == 3) {
            document.querySelector(".start-table").classList.remove("none")
            document.querySelector(".finishe-table").classList.remove("none")
            document.querySelector("#c").classList.add("none")
            document.querySelector("#u").classList.add("none")
            document.querySelector("#c2").classList.remove("none")
            document.querySelector("#u2").classList.add("none")
            document.querySelector("#ud").classList.add("none")
            document.querySelector("#ud2").classList.add("none")
        }
    })

    //동작방법 1. 조회버튼을 누르면 조회창 열린다
    // document.querySelector("#check-option-button").addEventListener("click", function () {
    //     console.log("조회버튼 클릭됨")
    //     let pages = document.querySelectorAll(".page-number")
    //     for (let i = 0; i < pages.length; i++) {
    //         pages[i].classList.remove("page-none")
    //         pages[0].classList.add("page1")
    //     }
    // })
    //-=----------------------------------------------------------------------------------------------------------------
    //원재료생성
    document.querySelector("#c").addEventListener("click", function () {
        console.log("원재료생성됨")
        alert("관리자계정확인")
        let middatas = document.querySelectorAll(".mid-data")
        let starttablebody = document.querySelector(".start-table ")

        start2.push({
            제품명: middatas[0].value, 가격: middatas[1].value, 규격: middatas[2].value,
            단위: middatas[3].value, 공급업체: middatas[4].value,
            LotNo: middatas[5].value, 창고위치: middatas[6].value
        })
        for (let i = 0; i < middatas.length; i++) {
            middatas[i].value = ""
        }
        start2.forEach(function (v) {
            startt = document.createElement("tr")
            startt.classList.add("finishe-tr")
            startt.innerHTML = `
                        <td class="finishe-td">${v.제품명}</td>
                        <td class="finishe-td">${v.가격}</td>
                        <td class="finishe-td">${v.규격}</td>
                        <td class="finishe-td">${v.공급업체}</td>
                        <td class="finishe-td">${v.품번}</td>
                        <td class="finishe-td">${v.LotNo}</td>
                        <td class="finishe-td">${v.창고위치}</td>
                        <td class="finishe-td">${v.창고위치}</td>
                        <td class="finishe-td">
                            <input type="button" value="수정" id="update">
                            <input type="button" value="삭제" id="delet">
                        </td>           
                        `

            starttablebody.append(startt)
            //삭제인데 생성을한번해야된다. 하 
            //삭제 완
            startt.querySelector("#delet").addEventListener("click", function (even) {
                // console.log(even.target)
                even.target.parentNode.parentNode.remove()
            })

            startt.querySelector("#update").addEventListener("click", function (even) {
                alert("관리자계정확인")
                document.querySelector("#c").classList.add("none")
                document.querySelector("#u").classList.remove("none")
                document.querySelector("#ud").classList.remove("none")
                document.querySelector("#c2").classList.add("none")
                document.querySelector("#u2").classList.add("none")
                document.querySelector("#ud2").classList.add("none")

                console.log(even.target.parentNode.parentNode)
                let tdtext = even.target.parentNode.parentNode.querySelectorAll("td")
                let middatas = document.querySelectorAll(".mid-data")
                //let i = 0; i <tdtext.length; i++ 안되는이유 물어보기
                for (let i = 0; i < middatas.length; i++) {

                    middatas[i].value = tdtext[i].innerText
                    // middatas[6].value = tdtext[6].innerText
                }
                document.querySelector("#u").addEventListener("click", function () {
                   
                    let middatas = document.querySelectorAll(".mid-data")
                    let tdtext = even.target.parentNode.parentNode.querySelectorAll("td")
                    for (let i = 0; i < middatas.length; i++) {
                        tdtext[i].innerText = middatas[i].value;
                        middatas[i].value = " "
                    }
                    document.querySelector("#u").classList.add("none")
                    document.querySelector("#ud").classList.add("none")
                    document.querySelector("#c").classList.remove("none")

                })

                //수정 버튼을 클릭할 때마다 #u 버튼에 대한 이벤트 리스너가 추가되고 있습니다.
                //이렇게 하면 수정 버튼을 클릭할 때마다 #u 버튼에 대한 이벤트 리스너가 새로 추가되지 않고, 
                // 이전의 리스너가 덮어쓰여지게 됩니다. 따라서 각 제품의 수정이 독립적으로 이루어질 수 있습니다.
                // 또한, #u 버튼에 대한 이벤트 리스너를 onclick 속성으로 설정하여, 
                // 이전 리스너가 제거되도록 하였습니다. 이렇게 하면 수정할 때마다 새로운 리스너가 
                // 추가되지 않으므로, 이전 수정 내용이 지워지는 문제를 방지할 수 있습니다.
                document.querySelector("#ud").onclick = function () {
                    for (let i = 0; i < middatas.length; i++) {
                        middatas[i].value = " "
                    }
                    document.querySelector("#u").classList.add("none")
                    document.querySelector("#ud").classList.add("none")
                    document.querySelector("#c").classList.remove("none")
                }

            })
        })







    })
    //완재품생성
    document.querySelector("#c2").addEventListener("click", function () {
        console.log("원재료생성됨")
        let middatas = document.querySelectorAll(".mid-data")
        let finishetablebody = document.querySelector(".finishe-table")

        finishe2.push({
            제품명: middatas[0].value, 가격: middatas[1].value, 규격: middatas[2].value,
            단위: middatas[3].value, 공급업체: middatas[4].value,
            LotNo: middatas[5].value, 창고위치: middatas[6].value
        })
        for (let i = 0; i < middatas.length; i++) {
            middatas[i].value = ""
        }
        finishe2.forEach(function (v) {
            finishett = document.createElement("tr")
            finishett.classList.add("finishe-tr")
            finishett.innerHTML = `
                        <td class="finishe-td">${v.제품명}</td>
                        <td class="finishe-td">${v.가격}</td>
                        <td class="finishe-td">${v.규격}</td>
                        <td class="finishe-td">${v.공급업체}</td>
                        <td class="finishe-td">${v.품번}</td>
                        <td class="finishe-td">${v.LotNo}</td>
                        <td class="finishe-td">${v.창고위치}</td>
                        <td class="finishe-td">${v.창고위치}</td>
                        <td class="finishe-td">
                            <input type="button" value="수정" id="update">
                            <input type="button" value="삭제" id="delet">
                        </td>           
                        `

            finishetablebody.append(finishett)
            //삭제인데 생성을한번해야된다. 하 
            //삭제 완
            finishett.querySelector("#delet").addEventListener("click", function (even) {
                // console.log(even.target)
                even.target.parentNode.parentNode.remove()
            })

            finishett.querySelector("#update").addEventListener("click", function (even) {
                document.querySelector("#c").classList.add("none")
                document.querySelector("#u").classList.remove("none")
                document.querySelector("#ud").classList.remove("none")
                document.querySelector("#c2").classList.add("none")
                document.querySelector("#u2").classList.add("none")
                document.querySelector("#ud2").classList.add("none")

                console.log(even.target.parentNode.parentNode)
                let tdtext = even.target.parentNode.parentNode.querySelectorAll("td")
                let middatas = document.querySelectorAll(".mid-data")
                //let i = 0; i <tdtext.length; i++ 안되는이유 물어보기
                for (let i = 0; i < middatas.length; i++) {

                    middatas[i].value = tdtext[i].innerText
                    // middatas[6].value = tdtext[6].innerText
                }
                document.querySelector("#u").addEventListener("click", function () {
                    let middatas = document.querySelectorAll(".mid-data")
                    let tdtext = even.target.parentNode.parentNode.querySelectorAll("td")
                    for (let i = 0; i < middatas.length; i++) {
                        tdtext[i].innerText = middatas[i].value;
                        middatas[i].value = " "
                    }
                    document.querySelector("#u").classList.add("none")
                    document.querySelector("#ud").classList.add("none")
                    document.querySelector("#c").classList.remove("none")
                })

                //수정 버튼을 클릭할 때마다 #u 버튼에 대한 이벤트 리스너가 추가되고 있습니다.
                //이렇게 하면 수정 버튼을 클릭할 때마다 #u 버튼에 대한 이벤트 리스너가 새로 추가되지 않고, 
                // 이전의 리스너가 덮어쓰여지게 됩니다. 따라서 각 제품의 수정이 독립적으로 이루어질 수 있습니다.
                // 또한, #u 버튼에 대한 이벤트 리스너를 onclick 속성으로 설정하여, 
                // 이전 리스너가 제거되도록 하였습니다. 이렇게 하면 수정할 때마다 새로운 리스너가 
                // 추가되지 않으므로, 이전 수정 내용이 지워지는 문제를 방지할 수 있습니다.

                document.querySelector("#ud").onclick = function () {
                    for (let i = 0; i < middatas.length; i++) {
                        middatas[i].value = " "
                    }
                    document.querySelector("#u").classList.add("none")
                    document.querySelector("#ud").classList.add("none")
                    document.querySelector("#c").classList.remove("none")
                }
                let checkvlaue = document.querySelector("#check-option")
                if (checkvlaue.value == 1) {
                    document.querySelector("#main_contain").classList.remove("none")
                    document.querySelector("#finish_contain").classList.add("none")
                }else if(checkvlaue.value == 2){
                    document.querySelector("#main_contain").classList.add("none")
                    document.querySelector("#finish_contain").classList.remove("none")
                }




          
                Insert into (PRODUCTNAME,PARTNUMBER,EXPDATEDESC,WAREHOUSE,PRODUCTIMAGE,NORMALCRITERIA,ABNORMALCRITERIA,PRICE,SPEC,UNIT,LOTNUMBER,PRODUCTDEL) values ('부대찌개','P047','포장 후 30일 이내','냉장','Budae-Jjigae.png','1. 햄, 소시지, 베이크드빈스, 라면사리 등이 신선하고 유통기한 내 포함됨 2. 육수(또는 육수 베이스)가 새지 않고 정상 포장됨 3. 채소(양배추, 파, 양파 등)가 신선하며 변색이나 이물질 없음','1. 햄, 소시지가 변색되었거나 냄새가 남 2. 육수가 새거나 포장이 터짐 3. 채소가 시들거나 부패, 이물질 발견',30000,'600','g','WPD-20250124-001','n');
                Insert into (PRODUCTNAME,PARTNUMBER,EXPDATEDESC,WAREHOUSE,PRODUCTIMAGE,NORMALCRITERIA,ABNORMALCRITERIA,PRICE,SPEC,UNIT,LOTNUMBER,PRODUCTDEL) values ('김치찌개','P048','포장 후 30일 이내','냉장','kimchisoup.png','1.숙성된 김치가 적당히 신맛을 유지하며 유통기한 내 포함됨2.돼지고기(또는 대체 단백질)가 신선하고 변질되지 않음3.국물 베이스(육수, 양념)가 정량으로 들어 있음','1.김치가 부패 냄새가 나거나 너무 묽어짐2.돼지고기가 색이 변했거나 냄새가 남3.양념이 새거나 육수 포장이 불량',25000,'550','g','WPD-20250124-002','n');
                Insert into (PRODUCTNAME,PARTNUMBER,EXPDATEDESC,WAREHOUSE,PRODUCTIMAGE,NORMALCRITERIA,ABNORMALCRITERIA,PRICE,SPEC,UNIT,LOTNUMBER,PRODUCTDEL) values ('밀푀유나베','P049','포장 후 30일 이내','냉장','Millefeuille.png','1. 배추, 깻잎, 버섯 등 채소가 신선하고 시들거나 변색되지 않음 2. 소고기(또는 대체 단백질)가 신선하고 변질되지 않음 3. 육수와 소스가 밀봉되어 있고 누수 없음','1. 채소가 시들거나 갈변, 물러짐 2. 소고기에서 냄새가 나거나 색이 변함 3. 육수가 새거나 소스가 누락됨',35000,'700','g','WPD-20250124-003','n');
                Insert into (PRODUCTNAME,PARTNUMBER,EXPDATEDESC,WAREHOUSE,PRODUCTIMAGE,NORMALCRITERIA,ABNORMALCRITERIA,PRICE,SPEC,UNIT,LOTNUMBER,PRODUCTDEL) values ('떡볶이','P050','포장 후 30일 이내','냉장','tteokbokki.png','1. 떡이 적절한 수분을 유지하고 딱딱하지 않음 2. 고추장 베이스 양념이 정량으로 포함되고 밀봉 유지 3. 어묵, 야채가 신선하고 이물질 없음','1. 떡이 지나치게 딱딱하거나 상함 2. 양념이 새거나 포장이 터짐 3. 어묵이 상하거나 냄새가 남',20000,'500','g','WPD-20250124-004','n');
                Insert into (PRODUCTNAME,PARTNUMBER,EXPDATEDESC,WAREHOUSE,PRODUCTIMAGE,NORMALCRITERIA,ABNORMALCRITERIA,PRICE,SPEC,UNIT,LOTNUMBER,PRODUCTDEL) values ('곱창전골','P051','포장 후 30일 이내','냉장','Gopchanghotpot.png','1. 곱창이 신선하고 특유의 냄새가 심하지 않음 2. 각종 채소(부추, 양파, 깻잎 등)가 신선함 3. 국물 베이스가 밀봉되어 새지 않음','1. 곱창에서 심한 악취가 나거나 색이 변함 2. 채소가 시들거나 갈변 3. 육수가 새거나 포장이 손상됨',40000,'750','g','WPD-20250124-005','n');


                
                Insert into products (PRODUCTNAME, PARTNUMBER, EXPDATEDESC, WAREHOUSE, PRODUCTIMAGE, NORMALCRITERIA, ABNORMALCRITERIA, PRICE, SPEC, UNIT, PRODUCTDEL,LotNumber) values ('부대찌개', 'P047', '포장 후 30일 이내', '냉장', 'Budae-Jjigae.png', '1. 햄, 소시지, 베이크드빈스, 라면사리 등이 신선하고 유통기한 내 포함됨 2. 육수(또는 육수 베이스)가 새지 않고 정상 포장됨 3. 채소(양배추, 파, 양파 등)가 신선하며 변색이나 이물질 없음','1. 햄, 소시지가 변색되었거나 냄새가 남 2. 육수가 새거나 포장이 터짐 3. 채소가 시들거나 부패, 이물질 발견', 30000, 600, 'g', 'n','WPD-20250124-005');
                Insert into products (PRODUCTNAME, PARTNUMBER, EXPDATEDESC, WAREHOUSE, PRODUCTIMAGE, NORMALCRITERIA, ABNORMALCRITERIA, PRICE, SPEC, UNIT, PRODUCTDEL,LotNumber) values ('김치찌개', 'P048', '포장 후 30일 이내', '냉장', 'kimchisoup.png', '1.숙성된 김치가 적당히 신맛을 유지하며 유통기한 내 포함됨2.돼지고기(또는 대체 단백질)가 신선하고 변질되지 않음3.국물 베이스(육수, 양념)가 정량으로 들어 있음','1.김치가 부패 냄새가 나거나 너무 묽어짐2.돼지고기가 색이 변했거나 냄새가 남3.양념이 새거나 육수 포장이 불량', 25000, 550, 'g', 'n','WPD-20250124-005');
                Insert into products (PRODUCTNAME, PARTNUMBER, EXPDATEDESC, WAREHOUSE, PRODUCTIMAGE, NORMALCRITERIA, ABNORMALCRITERIA, PRICE, SPEC, UNIT, PRODUCTDEL,LotNumber) values ('밀푀유나베', 'P049', '포장 후 30일 이내', '냉장', 'Millefeuille.png', '1. 배추, 깻잎, 버섯 등 채소가 신선하고 시들거나 변색되지 않음 2. 소고기(또는 대체 단백질)가 신선하고 변질되지 않음 3. 육수와 소스가 밀봉되어 있고 누수 없음','1. 채소가 시들거나 갈변, 물러짐 2. 소고기에서 냄새가 나거나 색이 변함 3. 육수가 새거나 소스가 누락됨', 35000, 700, 'g', 'n','WPD-20250124-005');
                Insert into products (PRODUCTNAME, PARTNUMBER, EXPDATEDESC, WAREHOUSE, PRODUCTIMAGE, NORMALCRITERIA, ABNORMALCRITERIA, PRICE, SPEC, UNIT, PRODUCTDEL,LotNumber) values ('떡볶이', 'P050', '포장 후 30일 이내', '냉장', 'tteokbokki.png', '1. 배추, 깻잎, 버섯 등 채소가 신선하고 시들거나 변색되지 않음 2. 소고기(또는 대체 단백질)가 신선하고 변질되지 않음 3. 육수와 소스가 밀봉되어 있고 누수 없음','1. 채소가 시들거나 갈변, 물러짐 2. 소고기에서 냄새가 나거나 색이 변함 3. 육수가 새거나 소스가 누락됨', 20000, 500, 'g', 'n','WPD-20250124-005');
                Insert into products (PRODUCTNAME, PARTNUMBER, EXPDATEDESC, WAREHOUSE, PRODUCTIMAGE, NORMALCRITERIA, ABNORMALCRITERIA, PRICE, SPEC, UNIT, PRODUCTDEL,LotNumber) values ('곱창전골', 'P051','포장 후 30일 이내', '냉장', 'Gopchanghotpot.png', '1. 배추, 깻잎, 버섯 등 채소가 신선하고 시들거나 변색되지 않음 2. 소고기(또는 대체 단백질)가 신선하고 변질되지 않음 3. 육수와 소스가 밀봉되어 있고 누수 없음','1. 채소가 시들거나 갈변, 물러짐 2. 소고기에서 냄새가 나거나 색이 변함 3. 육수가 새거나 소스가 누락됨', 40000, 750, 'g', 'n','WPD-20250124-005');




                Insert into products (PRODUCTNAME, PARTNUMBER, EXPDATEDESC, WAREHOUSE, PRODUCTIMAGE, NORMALCRITERIA, ABNORMALCRITERIA, PRICE, SPEC, UNIT, PRODUCTDEL) values ('부대찌개')
                Insert into products (PRODUCTNAME, PARTNUMBER, EXPDATEDESC, WAREHOUSE, PRODUCTIMAGE, NORMALCRITERIA, ABNORMALCRITERIA, PRICE, SPEC, UNIT, PRODUCTDEL) values ('김치찌개')
                Insert into products (PRODUCTNAME, PARTNUMBER, EXPDATEDESC, WAREHOUSE, PRODUCTIMAGE, NORMALCRITERIA, ABNORMALCRITERIA, PRICE, SPEC, UNIT, PRODUCTDEL) values ('밀푀유나베')
                Insert into products (PRODUCTNAME, PARTNUMBER, EXPDATEDESC, WAREHOUSE, PRODUCTIMAGE, NORMALCRITERIA, ABNORMALCRITERIA, PRICE, SPEC, UNIT, PRODUCTDEL) values ('떡볶이')
                Insert into products (PRODUCTNAME, PARTNUMBER, EXPDATEDESC, WAREHOUSE, PRODUCTIMAGE, NORMALCRITERIA, ABNORMALCRITERIA, PRICE, SPEC, UNIT, PRODUCTDEL) values ('곱창전골')















            })
        })
    })
})