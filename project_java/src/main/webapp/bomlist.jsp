<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>bom리스트</title>
    <style>
        * {
            margin: 0;
            padding: 0;
        }

        body {
            width: 100%;
           
        }


        /* #back-button {
            margin: 10px 10px;
            border: 1px solid #007bff;
            border-radius: 10px;
            height: 50px;
            width: 80px;
        } */

        #mid-contain {
            border: 1px solid #007bff;
            border-radius: 20px;
            width: 100%;
            height: 250px;
            flex-direction: column;
            display: flex;
            align-items: center;
        }





        table,
        th,
        td {

            border-collapse: collapse;
            border: 1px solid black;
        }

        th,
        td {
            text-align: center;
        }

        table {

            width: 100%;
        }

        th {
            width: 50px;
            height: 20px;
            font-size: 14px;
            background-color: #007bff;
            color: white;
        }


        .navigation {
            width: 90%;
            height: 60%;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;


        }

        .navigation h2 {
            font-size: 16px;
            margin-left: 10px;

        }

        .mid-data {
            width: 60%;
            height: 20px;


        }

        .navigation-line {
            width: 100%;
            height: 33%;
            display: flex;
            justify-content: space-around;
        }

        .navigation-line-layer {
            width: 25%;
            display: flex;
            justify-content: space-between;

        }

        .navigation-line-layer h2 {
            display: flex;
            justify-content: center;
            width: 30%;

        }

        .article {
            margin-top: 10px;
            width: 25%;
            height: 30px;


        }


        .button {
            padding: 10px 15px;
            /* 여백 조정 */
            font-size: 16px;
            /* 글자 크기 조정 */
            border: none;
            /* 기본 테두리 제거 */
            border-radius: 5px;
            /* 둥근 모서리 */
            background-color: #007bff;
            /* 배경 색상 */
            color: white;
            /* 글자 색상 */
            cursor: pointer;
            /* 커서 모양 변경 */

        }

        .buttontd {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 50px;
        }

        .btnz {
            width: 100%;
            text-align: end;
        }

        .none {
            display: none;
        }

        .new-text {
            text-align: center;
            width: 80%;
        }
        #boodea{
            text-align: center;
            width: 100%;
            margin-bottom: 15px;
        }


        @media screen and (max-width: 600px) {

            #back-button {
                width: 60px;
                height: 60px;
            }

            .article {
                margin: 0 0 20px 0;
                font-size: 12px;
            }

            th,
            td {
                font-size: 12px;
            }


        }
    </style>
</head>

<body>
    <div id="mid-contain">
        <div class="navigation">
            <div class="navigation-line">

                <div class="navigation-line-layer">
                    <h2>제품명</h2>
                    <select name="" class="mid-data">
                        <option value="메이크드빈">메이크드빈</option>
                        <option value="햄">햄</option>
                        <option value="사골육수">사골육수</option>
                        <option value="사골 농축 육수">사골 농축 육수</option>
                    </select>
                    <!-- <input type="text" class="mid-data"> -->
                </div>

                <div class="navigation-line-layer">
                    <h2>가격</h2> <input type="text" class="mid-data">
                </div>
                <div class="navigation-line-layer">
                    <h2>규격</h2> <input type="text" class="mid-data">
                </div>
                <div class="navigation-line-layer">
                    <h2>재고수량</h2> <input type="text" class="mid-data">
                </div>
            </div>
            <div class="navigation-line">
                <div class="navigation-line-layer">
                    <h2>단위</h2> <input type="text" class="mid-data">
                </div>
                <div class="navigation-line-layer">
                    <h2>공급업체</h2> <input type="text" class="mid-data">
                </div>
                <div class="navigation-line-layer">
                    <h2>LotNo</h2> <input type="text" class="mid-data">
                </div>
                <div class="navigation-line-layer">
                    <h2>장고위치</h2> <input type="text" class="mid-data">
                </div>
            </div>
            <div class="navigation-line-layer">
                <h2>품번</h2> <input type="text" class="mid-data">
            </div>
        </div>
        <div>
            <div class="btnz">
                <input type="button" class="button" value="등록" id="mid-contain-check">
                <input type="button" class="button" value="목록이동" id="back-button">
            </div>
        </div>
    </div>
    <div id="boodea">
        <div><h2>부대찌개</h2></div>
    </div>
    <table id="maintable">
        <tr>
            <th>제품명</th>
            <th>가격</th>
            <th>단위</th>
            <th>재고수량</th>
            <th>규격</th>
            <th>공급업체</th>
            <th>LotNo</th>
            <th>창고위치</th>
            <th>품번</th>
            <th>수정/삭제</th>

        </tr>
        <br>
    </table>


    <script>
        window.addEventListener("load", function () {
            const bj = [
                { 제품명: "베이크드빈", 가격: 1500, 규격: 1, 재고수량: 100, 단위: "캔", 공급업체: "네이처하이브", LotNo: "ING-20250124-001", 창고위치: "상온", 품번: "P001", 입고일자: "2025-01-24", 유효기간: "2026-01-24" },
                { 제품명: "햄", 가격: 5000, 규격: 500, 재고수량: 50, 단위: "g", 공급업체: "미트하모니", LotNo: "ING-20250124-002", 창고위치: "상온", 품번: "P002", 입고일자: "2025-01-24", 유효기간: "2026-01-24" },
                { 제품명: "사골육수", 가격: 3000, 규격: 500, 재고수량: 75, 단위: "ml", 공급업체: "육수정원", LotNo: "ING-20250124-003", 창고위치: "냉장", 품번: "P003", 입고일자: "2025-01-24", 유효기간: "2025-07-24" },
                { 제품명: "사골 농축 육수", 가격: 2500, 규격: 100, 재고수량: 30, 단위: "ml", 공급업체: "*은맛푸드", LotNo: "ING-20250124-004", 창고위치: "냉장", 품번: "P004", 입고일자: "2025-01-24", 유효기간: "2025-07-24" },
                { 제품명: "사리면", 가격: 1200, 규격: 200, 재고수량: 120, 단위: "g", 공급업체: "네이처하이브", LotNo: "ING-20250124-005", 창고위치: "상온", 품번: "P005", 입고일자: "2025-01-24", 유효기간: "2026-01-24" },
                { 제품명: "부대찌개 소스", 가격: 2000, 규격: 500, 재고수량: 80, 단위: "g", 공급업체: "소스 마스터즈", LotNo: "ING-20250124-006", 창고위치: "상온", 품번: "P006", 입고일자: "2025-01-24", 유효기간: "2026-01-24" },
                { 제품명: "각종 채소", 가격: 2500, 규격: 500, 재고수량: 60, 단위: "g", 공급업체: "네이처하이브", LotNo: "ING-20250124-007", 창고위치: "냉장", 품번: "P007", 입고일자: "2025-01-24", 유효기간: "2025-06-24" },
                { 제품명: "체다슬라이스 치즈", 가격: 3000, 규격: 200, 재고수량: 40, 단위: "g", 공급업체: "네이처하이브", LotNo: "ING-20250124-008", 창고위치: "냉장", 품번: "P008", 입고일자: "2025-01-24", 유효기간: "2025-07-24" },
                { 제품명: "찌개용 용기", 가격: 500, 규격: 1, 재고수량: 200, 단위: "개", 공급업체: "에코컨테이너", LotNo: "PKG-20250124-001", 창고위치: "상온", 품번: "P009", 입고일자: "2025-01-24", 유효기간: "2026-01-24" },
            ];
            const kj = [

                { 제품명: "김치", 가격: 1500, 규격: 500, 재고수량: 90, 단위: "g", 공급업체: "네이처하이브", LotNo: "ING-20250124-009", 창고위치: "냉장", 품번: "P010", 입고일자: "2025-01-24", 유효기간: "2025-07-24" },
                { 제품명: "고춧가루", 가격: 3000, 규격: 500, 재고수량: 55, 단위: "g", 공급업체: "네이처하이브", LotNo: "ING-20250124-010", 창고위치: "상온", 품번: "P011", 입고일자: "2025-01-24", 유효기간: "2026-01-24" },
                { 제품명: "설탕", 가격: 1000, 규격: 1, 재고수량: 100, 단위: "kg", 공급업체: "네이처하이브", LotNo: "ING-20250124-011", 창고위치: "상온", 품번: "P012", 입고일자: "2025-01-24", 유효기간: "2026-01-24" },
                { 제품명: "마늘", 가격: 2000, 규격: 500, 재고수량: 150, 단위: "g", 공급업체: "네이처하이브", LotNo: "ING-20250124-012", 창고위치: "상온", 품번: "P013", 입고일자: "2025-01-24", 유효기간: "2025-07-24" },
                { 제품명: "대파", 가격: 1000, 규격: 500, 재고수량: 80, 단위: "g", 공급업체: "네이처하이브", LotNo: "ING-20250124-013", 창고위치: "냉장", 품번: "P014", 입고일자: "2025-01-24", 유효기간: "2025-06-24" },
                { 제품명: "돈육", 가격: 6000, 규격: 500, 재고수량: 40, 단위: "g", 공급업체: "미트하모니", LotNo: "ING-20250124-014", 창고위치: "냉동", 품번: "P015", 입고일자: "2025-01-24", 유효기간: "2025-12-24" },
                { 제품명: "두부", 가격: 1500, 규격: 300, 재고수량: 200, 단위: "g", 공급업체: "네이처하이브", LotNo: "ING-20250124-015", 창고위치: "냉동", 품번: "P016", 입고일자: "2025-01-24", 유효기간: "2025-12-24" },
                { 제품명: "김치찌개용 육수", 가격: 2500, 규격: 500, 재고수량: 60, 단위: "ml", 공급업체: "육수정원", LotNo: "ING-20250124-016", 창고위치: "냉장", 품번: "P017", 입고일자: "2025-01-24", 유효기간: "2025-07-24" },
            ];
            const mu = [

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

            ];
            const tt = [
                { 제품명: "떡", 가격: 2000, 규격: 500, 재고수량: 60, 단위: "g", 공급업체: "네이처하이브", LotNo: "ING-20250124-030", 창고위치: "냉동", 품번: "P032", 입고일자: "2025-01-24", 유효기간: "2025-12-24" },
                { 제품명: "어묵", 가격: 3000, 규격: 500, 재고수량: 40, 단위: "g", 공급업체: "네이처하이브", LotNo: "ING-20250124-031", 창고위치: "냉동", 품번: "P033", 입고일자: "2025-01-24", 유효기간: "2025-12-24" },
                { 제품명: "떡볶이 소스", 가격: 2000, 규격: 500, 재고수량: 50, 단위: "g", 공급업체: "소스 마스터즈", LotNo: "ING-20250124-032", 창고위치: "상온", 품번: "P034", 입고일자: "2025-01-24", 유효기간: "2026-01-24" },
                { 제품명: "떡볶이 용기", 가격: 500, 규격: 1, 재고수량: 150, 단위: "개", 공급업체: "에코컨테이너", LotNo: "PKG-20250124-003", 창고위치: "상온", 품번: "P035", 입고일자: "2025-01-24", 유효기간: "2026-01-24" },

            ]

            const gh = [
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

            const new1 = [];





            // URL에서 ?value=값 부분 가져오기
            let params = new URLSearchParams(window.location.search);
            let value = params.get("value"); // 'value' 값 가져오기
            // console.log("넘어온 값:", value);

            console.log(document.querySelector("#mid-contain-check"))
            //뒤로가기버튼
            document.querySelector("#back-button").addEventListener("click", function () {
                window.location.href = "bom_v2.html"
            })



            let starttablebody = document.querySelector("#maintable")
            if (value == "부대찌개" || value == "밀푀유나배" || value == "곱창전골") {

                bj.forEach(function (v, i) {
                    let options = bj.map(v => `<option value="${v.제품명}">${v.제품명}</option>`).join("");
                    budae = document.createElement("tr")
                    budae.innerHTML = `
                        <td><span class="new-span">${v.제품명}</span>
                        <select name="option" class="check-option" value="${v.제품명}">${options}</select></td>
                        <td><span class="new-span">${v.가격}</span><input type="text" class="new-text" value="${v.가격}"></td>
                        <td><span class="new-span aa">${v.규격}</span><input type="text" class="new-text ab" value="${v.규격}"></td>
                        <td><span class="new-span">${v.재고수량}</span><input type="text" class="new-text" value="${v.재고수량}"></td>
                        <td><span class="new-span">${v.단위}</span><input type="text" class="new-text" value="${v.단위}"></td>
                        <td><span class="new-span aa">${v.공급업체}</span><input type="text" class="new-text ab" value="${v.공급업체}"></td>
                        <td><span class="new-span">${v.LotNo}</span><input type="text" class="new-text"value="${v.LotNo}"></td>
                        <td><span class="new-span aa">${v.창고위치}</span><input type="text" class="new-text ab" value="${v.창고위치}"></td>
                        <td><span class="new-span aa">${v.품번}</span><input type="text" class="new-text ab" value="${v.품번}"></td>
                    
                        <td class="buttontd">
                        <input type="button" value="수정" class="u">
                        <input type="button" value="삭제" class="d">
                        <input type="button" value="확인" class="ok">
                        <input type="button" value="취소" class="can">
                        </td>`

                    // <input type="text" class="new-text" value="${v.제품명}"></td>
                    starttablebody.append(budae)
                    let new_texs = budae.querySelectorAll(".new-text")
                    let new_spans = budae.querySelectorAll(".new-span")
                    let new_chop = budae.querySelector(".check-option")
                    let ab = budae.querySelectorAll(".ab")
                    let aa = budae.querySelectorAll(".aa")
                    let oks = budae.querySelectorAll(".ok")
                    let cans = budae.querySelectorAll(".can")
                    let us = budae.querySelectorAll(".u")
                    let ds = budae.querySelectorAll(".d")
                    for (let a = 0; a < new_texs.length; a++) {
                        new_texs[a].classList.add("none")
                    }
                    for (let a = 0; a < ab.length; a++) {
                        console.log(ab[a])
                        ab[a].classList.add("none")
                    }


                    new_chop.classList.add("none")

                    for (let a = 0; a < oks.length; a++) {
                        oks[a].classList.add("none")
                        cans[a].classList.add("none")
                    }
                    budae.querySelector(".u").addEventListener("click", function (e) {

                        for (let a = 0; a < new_texs.length; a++) {
                            console.log(new_texs[a])
                            console.log(new_spans[a])
                            new_texs[a].classList.remove("none")
                            new_spans[a].classList.add("none")
                            // console.log(e.target.parentNode)
                            e.target.parentNode.querySelector(".u").classList.add("none")
                            e.target.parentNode.querySelector(".d").classList.add("none")
                            e.target.parentNode.querySelector(".ok").classList.remove("none")
                            e.target.parentNode.querySelector(".can").classList.remove("none")
                        }

                        new_chop.classList.remove("none")
                        for (let a = 0; a < aa.length; a++) {
                            console.log(aa[a])
                            aa[a].classList.remove("none")
                        }
                        for (let a = 0; a < ab.length; a++) {
                            console.log(ab[a])
                            ab[a].classList.add("none")
                        }

                    })

                    budae.querySelector(".ok").addEventListener("click", function (e) {
                        for (let a = 0; a < new_texs.length; a++) {
                            // console.log(new_texs[a])
                            // console.log(new_span[a])
                            new_texs[a].classList.add("none")
                            new_spans[a].classList.remove("none")
                            // console.log(e.target.parentNode)    
                        }
                        console.log(e)
                        e.target.parentNode.querySelector(".u").classList.remove("none")
                        e.target.parentNode.querySelector(".d").classList.remove("none")
                        e.target.parentNode.querySelector(".ok").classList.add("none")
                        e.target.parentNode.querySelector(".can").classList.add("none")
                        e.target.parentNode.querySelector(".can").classList.add("none")

                        new_chop.classList.add("none")

                        new_spans[0].innerText = new_chop.value
                        for (let aa = 1; aa < new_texs.length; aa++) {
                            new_spans[aa + 1].innerText = new_texs[aa].value
                        }
                        console.log(e.target.parentNode.parentNode)

                    })
                    budae.querySelector(".check-option").addEventListener("change", function (e) {
                        console.log(e.target.value)
                        console.log(e.target.parentNode.parentNode.querySelectorAll(".new-span")[0])
                        e.target.parentNode.parentNode.querySelectorAll(".new-span")[0].innerText = e.target.value
                    })

                    budae.querySelector(".can").addEventListener("click", function (e) {
                        new_chop.classList.add("none")
                        for (let ai = 0; ai < new_texs.length; ai++) {
                            console.log("포문돔")
                            new_texs[ai].classList.add("none")
                            new_spans[ai].classList.remove("none")

                        }
                        e.target.parentNode.querySelector(".u").classList.remove("none")
                        e.target.parentNode.querySelector(".d").classList.remove("none")
                        e.target.parentNode.querySelector(".ok").classList.add("none")
                        e.target.parentNode.querySelector(".can").classList.add("none")
                    })


                    budae.querySelector(".d").addEventListener("click", function (e) {
                        // console.log(e.target.parentNode.parentNode)
                        e.target.parentNode.parentNode.remove()
                    })


                })




                document.querySelector("#mid-contain-check").addEventListener("click", function (e) {
                    console.log(e.target)
                    plus();
                })


                function plus() {

                    // console.log("zzzz")
                    let middatas = document.querySelectorAll(".mid-data")
                    for (let i = 0; i < middatas.length; i++) {
                        console.log(middatas[i].value)
                    }

                    new1.push({
                        제품명: middatas[0].value, 가격: middatas[1].value, 규격: middatas[2].value,
                        재고수량: middatas[3].value, 단위: middatas[4].value, 공급업체: middatas[5].value,
                        LotNo: middatas[6].value, 창고위치: middatas[7].value, 품번: middatas[8].value,

                    })
                    for (let i = 0; i < middatas.length; i++) {
                        middatas[i].value = " "
                    }
                    // console.log(bj)
                    new1.forEach(function (v, i) {
                        let options = bj.map(v => `<option value="${v.제품명}">${v.제품명}</option>`).join("");
                        newstart1 = document.createElement("tr")
                        newstart1.innerHTML = `
                       <td><span class="new-span">${v.제품명}</span>
                        <select name="option" class="check-option" value="${v.제품명}">${options}</select></td>
                        <td><span class="new-span">${v.가격}</span><input type="text" class="new-text" value="${v.가격}"></td>
                        <td><span class="new-span aa">${v.규격}</span><input type="text" class="new-text ab" value="${v.규격}"></td>
                        <td><span class="new-span">${v.재고수량}</span><input type="text" class="new-text" value="${v.재고수량}"></td>
                        <td><span class="new-span">${v.단위}</span><input type="text" class="new-text" value="${v.단위}"></td>
                        <td><span class="new-span aa">${v.공급업체}</span><input type="text" class="new-text ab" value="${v.공급업체}"></td>
                        <td><span class="new-span">${v.LotNo}</span><input type="text" class="new-text"value="${v.LotNo}"></td>
                        <td><span class="new-span aa">${v.창고위치}</span><input type="text" class="new-text ab" value="${v.창고위치}"></td>
                        <td><span class="new-span aa">${v.품번}</span><input type="text" class="new-text ab" value="${v.품번}"></td>
                    
                        <td class="buttontd">
                        <input type="button" value="수정" class="u">
                        <input type="button" value="삭제" class="d">
                        <input type="button" value="확인" class="ok">
                        <input type="button" value="취소" class="can">
                        </td>`
                        starttablebody.append(newstart1)
                        let new_texs = newstart1.querySelectorAll(".new-text")
                        let new_spans = newstart1.querySelectorAll(".new-span")
                        let new_chop = newstart1.querySelector(".check-option")
                        let ab = newstart1.querySelectorAll(".ab")
                        let aa = newstart1.querySelectorAll(".aa")
                        let oks = newstart1.querySelectorAll(".ok")
                        let cans = newstart1.querySelectorAll(".can")
                        let us = newstart1.querySelectorAll(".u")
                        let ds = newstart1.querySelectorAll(".d")
                        for (let a = 0; a < new_texs.length; a++) {
                            new_texs[a].classList.add("none")
                        }
                        for (let a = 0; a < ab.length; a++) {
                            console.log(ab[a])
                            ab[a].classList.add("none")
                        }


                        new_chop.classList.add("none")

                        for (let a = 0; a < oks.length; a++) {
                            oks[a].classList.add("none")
                            cans[a].classList.add("none")
                        }
                        newstart1.querySelector(".u").addEventListener("click", function (e) {
                            for (let a = 0; a < new_texs.length; a++) {
                                // console.log(new_texs[a])
                                // console.log(new_span[a])
                                new_texs[a].classList.remove("none")
                                new_spans[a].classList.add("none")
                                // console.log(e.target.parentNode)
                                e.target.parentNode.querySelector(".u").classList.add("none")
                                e.target.parentNode.querySelector(".d").classList.add("none")
                                e.target.parentNode.querySelector(".ok").classList.remove("none")
                                e.target.parentNode.querySelector(".can").classList.remove("none")

                                new_chop.classList.remove("none")
                                for (let a = 0; a < aa.length; a++) {
                                    console.log(aa[a])
                                    aa[a].classList.remove("none")
                                }
                                for (let a = 0; a < ab.length; a++) {
                                    console.log(ab[a])
                                    ab[a].classList.add("none")
                                }

                            }
                        })

                        newstart1.querySelector(".ok").addEventListener("click", function (e) {
                            for (let a = 0; a < new_texs.length; a++) {
                                // console.log(new_texs[a])
                                // console.log(new_span[a])
                                new_texs[a].classList.add("none")
                                new_spans[a].classList.remove("none")
                                // console.log(e.target.parentNode)    
                            }
                            new_chop.classList.add("none")
                            e.target.parentNode.querySelector(".u").classList.remove("none")
                            e.target.parentNode.querySelector(".d").classList.remove("none")
                            e.target.parentNode.querySelector(".ok").classList.add("none")
                            e.target.parentNode.querySelector(".can").classList.add("none")
                            console.log(e.target.parentNode.parentNode)

                            new_spans[0].innerText = new_chop.value
                            for (let aa = 1; aa < new_texs.length; aa++) {
                                new_spans[aa + 1].innerText = new_texs[aa].value
                            }


                        })
                        newstart1.querySelector(".can").addEventListener("click", function (e) {
                            for (let ai = 0; ai < new_texs.length; ai++) {
                                console.log("포문돔")
                                new_texs[ai].classList.add("none")
                                new_spans[ai].classList.remove("none")
                            }
                            new_chop.classList.add("none")
                            e.target.parentNode.querySelector(".u").classList.remove("none")
                            e.target.parentNode.querySelector(".d").classList.remove("none")
                            e.target.parentNode.querySelector(".ok").classList.add("none")
                            e.target.parentNode.querySelector(".can").classList.add("none")
                        })

                        newstart1.querySelector(".d").addEventListener("click", function (e) {
                            // console.log(e.target.parentNode.parentNode)
                            e.target.parentNode.parentNode.remove()
                        })
                    })


                }

            } else if (value == "김치찌개" || value == "곱창전골") {
                kj.forEach(function (v, i) {
                    let options = bj.map(v => `<option value="${v.제품명}">${v.제품명}</option>`).join("");
                    budae = document.createElement("tr")
                    budae.innerHTML = `
                        <td><span class="new-span">${v.제품명}</span>
                        <select name="option" class="check-option" value="${v.제품명}">${options}</select></td>
                        <td><span class="new-span">${v.가격}</span><input type="text" class="new-text" value="${v.가격}"></td>
                        <td><span class="new-span aa">${v.규격}</span><input type="text" class="new-text ab" value="${v.규격}"></td>
                        <td><span class="new-span">${v.재고수량}</span><input type="text" class="new-text" value="${v.재고수량}"></td>
                        <td><span class="new-span">${v.단위}</span><input type="text" class="new-text" value="${v.단위}"></td>
                        <td><span class="new-span aa">${v.공급업체}</span><input type="text" class="new-text ab" value="${v.공급업체}"></td>
                        <td><span class="new-span">${v.LotNo}</span><input type="text" class="new-text"value="${v.LotNo}"></td>
                        <td><span class="new-span aa">${v.창고위치}</span><input type="text" class="new-text ab" value="${v.창고위치}"></td>
                        <td><span class="new-span aa">${v.품번}</span><input type="text" class="new-text ab" value="${v.품번}"></td>
                    
                        <td class="buttontd">
                        <input type="button" value="수정" class="u">
                        <input type="button" value="삭제" class="d">
                        <input type="button" value="확인" class="ok">
                        <input type="button" value="취소" class="can">
                        </td>`

                    // <input type="text" class="new-text" value="${v.제품명}"></td>
                    starttablebody.append(budae)
                    let new_texs = budae.querySelectorAll(".new-text")
                    let new_spans = budae.querySelectorAll(".new-span")
                    let new_chop = budae.querySelector(".check-option")
                    let ab = budae.querySelectorAll(".ab")
                    let aa = budae.querySelectorAll(".aa")
                    let oks = budae.querySelectorAll(".ok")
                    let cans = budae.querySelectorAll(".can")
                    let us = budae.querySelectorAll(".u")
                    let ds = budae.querySelectorAll(".d")
                    for (let a = 0; a < new_texs.length; a++) {
                        new_texs[a].classList.add("none")
                    }
                    for (let a = 0; a < ab.length; a++) {
                        console.log(ab[a])
                        ab[a].classList.add("none")
                    }


                    new_chop.classList.add("none")

                    for (let a = 0; a < oks.length; a++) {
                        oks[a].classList.add("none")
                        cans[a].classList.add("none")
                    }
                    budae.querySelector(".u").addEventListener("click", function (e) {

                        for (let a = 0; a < new_texs.length; a++) {
                            console.log(new_texs[a])
                            console.log(new_spans[a])
                            new_texs[a].classList.remove("none")
                            new_spans[a].classList.add("none")
                            // console.log(e.target.parentNode)
                            e.target.parentNode.querySelector(".u").classList.add("none")
                            e.target.parentNode.querySelector(".d").classList.add("none")
                            e.target.parentNode.querySelector(".ok").classList.remove("none")
                            e.target.parentNode.querySelector(".can").classList.remove("none")
                        }

                        new_chop.classList.remove("none")
                        for (let a = 0; a < aa.length; a++) {
                            console.log(aa[a])
                            aa[a].classList.remove("none")
                        }
                        for (let a = 0; a < ab.length; a++) {
                            console.log(ab[a])
                            ab[a].classList.add("none")
                        }

                    })

                    budae.querySelector(".ok").addEventListener("click", function (e) {
                        for (let a = 0; a < new_texs.length; a++) {
                            // console.log(new_texs[a])
                            // console.log(new_span[a])
                            new_texs[a].classList.add("none")
                            new_spans[a].classList.remove("none")
                            // console.log(e.target.parentNode)    
                        }
                        console.log(e)
                        e.target.parentNode.querySelector(".u").classList.remove("none")
                        e.target.parentNode.querySelector(".d").classList.remove("none")
                        e.target.parentNode.querySelector(".ok").classList.add("none")
                        e.target.parentNode.querySelector(".can").classList.add("none")
                        e.target.parentNode.querySelector(".can").classList.add("none")

                        new_chop.classList.add("none")

                        new_spans[0].innerText = new_chop.value
                        for (let aa = 1; aa < new_texs.length; aa++) {
                            new_spans[aa + 1].innerText = new_texs[aa].value
                        }
                        console.log(e.target.parentNode.parentNode)

                    })
                    budae.querySelector(".check-option").addEventListener("change", function (e) {
                        console.log(e.target.value)
                        console.log(e.target.parentNode.parentNode.querySelectorAll(".new-span")[0])
                        e.target.parentNode.parentNode.querySelectorAll(".new-span")[0].innerText = e.target.value
                    })

                    budae.querySelector(".can").addEventListener("click", function (e) {
                        new_chop.classList.add("none")
                        for (let ai = 0; ai < new_texs.length; ai++) {
                            console.log("포문돔")
                            new_texs[ai].classList.add("none")
                            new_spans[ai].classList.remove("none")

                        }
                        e.target.parentNode.querySelector(".u").classList.remove("none")
                        e.target.parentNode.querySelector(".d").classList.remove("none")
                        e.target.parentNode.querySelector(".ok").classList.add("none")
                        e.target.parentNode.querySelector(".can").classList.add("none")
                    })


                    budae.querySelector(".d").addEventListener("click", function (e) {
                        // console.log(e.target.parentNode.parentNode)
                        e.target.parentNode.parentNode.remove()
                    })


                })




                document.querySelector("#mid-contain-check").addEventListener("click", function (e) {
                    console.log(e.target)
                    plus();
                })


                function plus() {

                    // console.log("zzzz")
                    let middatas = document.querySelectorAll(".mid-data")
                    for (let i = 0; i < middatas.length; i++) {
                        console.log(middatas[i].value)
                    }

                    new1.push({
                        제품명: middatas[0].value, 가격: middatas[1].value, 규격: middatas[2].value,
                        재고수량: middatas[3].value, 단위: middatas[4].value, 공급업체: middatas[5].value,
                        LotNo: middatas[6].value, 창고위치: middatas[7].value, 품번: middatas[8].value,

                    })
                    for (let i = 0; i < middatas.length; i++) {
                        middatas[i].value = " "
                    }
                    // console.log(bj)
                    new1.forEach(function (v, i) {
                        let options = bj.map(v => `<option value="${v.제품명}">${v.제품명}</option>`).join("");
                        newstart1 = document.createElement("tr")
                        newstart1.innerHTML = `
                       <td><span class="new-span">${v.제품명}</span>
                        <select name="option" class="check-option" value="${v.제품명}">${options}</select></td>
                        <td><span class="new-span">${v.가격}</span><input type="text" class="new-text" value="${v.가격}"></td>
                        <td><span class="new-span aa">${v.규격}</span><input type="text" class="new-text ab" value="${v.규격}"></td>
                        <td><span class="new-span">${v.재고수량}</span><input type="text" class="new-text" value="${v.재고수량}"></td>
                        <td><span class="new-span">${v.단위}</span><input type="text" class="new-text" value="${v.단위}"></td>
                        <td><span class="new-span aa">${v.공급업체}</span><input type="text" class="new-text ab" value="${v.공급업체}"></td>
                        <td><span class="new-span">${v.LotNo}</span><input type="text" class="new-text"value="${v.LotNo}"></td>
                        <td><span class="new-span aa">${v.창고위치}</span><input type="text" class="new-text ab" value="${v.창고위치}"></td>
                        <td><span class="new-span aa">${v.품번}</span><input type="text" class="new-text ab" value="${v.품번}"></td>
                    
                        <td class="buttontd">
                        <input type="button" value="수정" class="u">
                        <input type="button" value="삭제" class="d">
                        <input type="button" value="확인" class="ok">
                        <input type="button" value="취소" class="can">
                        </td>`
                        starttablebody.append(newstart1)
                        let new_texs = newstart1.querySelectorAll(".new-text")
                        let new_spans = newstart1.querySelectorAll(".new-span")
                        let new_chop = newstart1.querySelector(".check-option")
                        let ab = newstart1.querySelectorAll(".ab")
                        let aa = newstart1.querySelectorAll(".aa")
                        let oks = newstart1.querySelectorAll(".ok")
                        let cans = newstart1.querySelectorAll(".can")
                        let us = newstart1.querySelectorAll(".u")
                        let ds = newstart1.querySelectorAll(".d")
                        for (let a = 0; a < new_texs.length; a++) {
                            new_texs[a].classList.add("none")
                        }
                        for (let a = 0; a < ab.length; a++) {
                            console.log(ab[a])
                            ab[a].classList.add("none")
                        }


                        new_chop.classList.add("none")

                        for (let a = 0; a < oks.length; a++) {
                            oks[a].classList.add("none")
                            cans[a].classList.add("none")
                        }
                        newstart1.querySelector(".u").addEventListener("click", function (e) {
                            for (let a = 0; a < new_texs.length; a++) {
                                // console.log(new_texs[a])
                                // console.log(new_span[a])
                                new_texs[a].classList.remove("none")
                                new_spans[a].classList.add("none")
                                // console.log(e.target.parentNode)
                                e.target.parentNode.querySelector(".u").classList.add("none")
                                e.target.parentNode.querySelector(".d").classList.add("none")
                                e.target.parentNode.querySelector(".ok").classList.remove("none")
                                e.target.parentNode.querySelector(".can").classList.remove("none")

                                new_chop.classList.remove("none")
                                for (let a = 0; a < aa.length; a++) {
                                    console.log(aa[a])
                                    aa[a].classList.remove("none")
                                }
                                for (let a = 0; a < ab.length; a++) {
                                    console.log(ab[a])
                                    ab[a].classList.add("none")
                                }

                            }
                        })

                        newstart1.querySelector(".ok").addEventListener("click", function (e) {
                            for (let a = 0; a < new_texs.length; a++) {
                                // console.log(new_texs[a])
                                // console.log(new_span[a])
                                new_texs[a].classList.add("none")
                                new_spans[a].classList.remove("none")
                                // console.log(e.target.parentNode)    
                            }
                            new_chop.classList.add("none")
                            e.target.parentNode.querySelector(".u").classList.remove("none")
                            e.target.parentNode.querySelector(".d").classList.remove("none")
                            e.target.parentNode.querySelector(".ok").classList.add("none")
                            e.target.parentNode.querySelector(".can").classList.add("none")
                            console.log(e.target.parentNode.parentNode)

                            new_spans[0].innerText = new_chop.value
                            for (let aa = 1; aa < new_texs.length; aa++) {
                                new_spans[aa + 1].innerText = new_texs[aa].value
                            }


                        })
                        newstart1.querySelector(".can").addEventListener("click", function (e) {
                            for (let ai = 0; ai < new_texs.length; ai++) {
                                console.log("포문돔")
                                new_texs[ai].classList.add("none")
                                new_spans[ai].classList.remove("none")
                            }
                            new_chop.classList.add("none")
                            e.target.parentNode.querySelector(".u").classList.remove("none")
                            e.target.parentNode.querySelector(".d").classList.remove("none")
                            e.target.parentNode.querySelector(".ok").classList.add("none")
                            e.target.parentNode.querySelector(".can").classList.add("none")
                        })

                        newstart1.querySelector(".d").addEventListener("click", function (e) {
                            // console.log(e.target.parentNode.parentNode)
                            e.target.parentNode.parentNode.remove()
                        })
                    })


                }

            } else {

                mu.forEach(function (v, i) {
                    let options = bj.map(v => `<option value="${v.제품명}">${v.제품명}</option>`).join("");
                    budae = document.createElement("tr")
                    budae.innerHTML = `
                        <td><span class="new-span">${v.제품명}</span>
                        <select name="option" class="check-option" value="${v.제품명}">${options}</select></td>
                        <td><span class="new-span">${v.가격}</span><input type="text" class="new-text" value="${v.가격}"></td>
                        <td><span class="new-span aa">${v.규격}</span><input type="text" class="new-text ab" value="${v.규격}"></td>
                        <td><span class="new-span">${v.재고수량}</span><input type="text" class="new-text" value="${v.재고수량}"></td>
                        <td><span class="new-span">${v.단위}</span><input type="text" class="new-text" value="${v.단위}"></td>
                        <td><span class="new-span aa">${v.공급업체}</span><input type="text" class="new-text ab" value="${v.공급업체}"></td>
                        <td><span class="new-span">${v.LotNo}</span><input type="text" class="new-text"value="${v.LotNo}"></td>
                        <td><span class="new-span aa">${v.창고위치}</span><input type="text" class="new-text ab" value="${v.창고위치}"></td>
                        <td><span class="new-span aa">${v.품번}</span><input type="text" class="new-text ab" value="${v.품번}"></td>
                    
                        <td class="buttontd">
                        <input type="button" value="수정" class="u">
                        <input type="button" value="삭제" class="d">
                        <input type="button" value="확인" class="ok">
                        <input type="button" value="취소" class="can">
                        </td>`

                    // <input type="text" class="new-text" value="${v.제품명}"></td>
                    starttablebody.append(budae)
                    let new_texs = budae.querySelectorAll(".new-text")
                    let new_spans = budae.querySelectorAll(".new-span")
                    let new_chop = budae.querySelector(".check-option")
                    let ab = budae.querySelectorAll(".ab")
                    let aa = budae.querySelectorAll(".aa")
                    let oks = budae.querySelectorAll(".ok")
                    let cans = budae.querySelectorAll(".can")
                    let us = budae.querySelectorAll(".u")
                    let ds = budae.querySelectorAll(".d")
                    for (let a = 0; a < new_texs.length; a++) {
                        new_texs[a].classList.add("none")
                    }
                    for (let a = 0; a < ab.length; a++) {
                        console.log(ab[a])
                        ab[a].classList.add("none")
                    }


                    new_chop.classList.add("none")

                    for (let a = 0; a < oks.length; a++) {
                        oks[a].classList.add("none")
                        cans[a].classList.add("none")
                    }
                    budae.querySelector(".u").addEventListener("click", function (e) {

                        for (let a = 0; a < new_texs.length; a++) {
                            console.log(new_texs[a])
                            console.log(new_spans[a])
                            new_texs[a].classList.remove("none")
                            new_spans[a].classList.add("none")
                            // console.log(e.target.parentNode)
                            e.target.parentNode.querySelector(".u").classList.add("none")
                            e.target.parentNode.querySelector(".d").classList.add("none")
                            e.target.parentNode.querySelector(".ok").classList.remove("none")
                            e.target.parentNode.querySelector(".can").classList.remove("none")
                        }

                        new_chop.classList.remove("none")
                        for (let a = 0; a < aa.length; a++) {
                            console.log(aa[a])
                            aa[a].classList.remove("none")
                        }
                        for (let a = 0; a < ab.length; a++) {
                            console.log(ab[a])
                            ab[a].classList.add("none")
                        }

                    })

                    budae.querySelector(".ok").addEventListener("click", function (e) {
                        for (let a = 0; a < new_texs.length; a++) {
                            // console.log(new_texs[a])
                            // console.log(new_span[a])
                            new_texs[a].classList.add("none")
                            new_spans[a].classList.remove("none")
                            // console.log(e.target.parentNode)    
                        }
                        console.log(e)
                        e.target.parentNode.querySelector(".u").classList.remove("none")
                        e.target.parentNode.querySelector(".d").classList.remove("none")
                        e.target.parentNode.querySelector(".ok").classList.add("none")
                        e.target.parentNode.querySelector(".can").classList.add("none")
                        e.target.parentNode.querySelector(".can").classList.add("none")

                        new_chop.classList.add("none")

                        new_spans[0].innerText = new_chop.value
                        for (let aa = 1; aa < new_texs.length; aa++) {
                            new_spans[aa + 1].innerText = new_texs[aa].value
                        }
                        console.log(e.target.parentNode.parentNode)

                    })
                    budae.querySelector(".check-option").addEventListener("change", function (e) {
                        console.log(e.target.value)
                        console.log(e.target.parentNode.parentNode.querySelectorAll(".new-span")[0])
                        e.target.parentNode.parentNode.querySelectorAll(".new-span")[0].innerText = e.target.value
                    })

                    budae.querySelector(".can").addEventListener("click", function (e) {
                        new_chop.classList.add("none")
                        for (let ai = 0; ai < new_texs.length; ai++) {
                            console.log("포문돔")
                            new_texs[ai].classList.add("none")
                            new_spans[ai].classList.remove("none")

                        }
                        e.target.parentNode.querySelector(".u").classList.remove("none")
                        e.target.parentNode.querySelector(".d").classList.remove("none")
                        e.target.parentNode.querySelector(".ok").classList.add("none")
                        e.target.parentNode.querySelector(".can").classList.add("none")
                    })


                    budae.querySelector(".d").addEventListener("click", function (e) {
                        // console.log(e.target.parentNode.parentNode)
                        e.target.parentNode.parentNode.remove()
                    })


                })




                document.querySelector("#mid-contain-check").addEventListener("click", function (e) {
                    console.log(e.target)
                    plus();
                })


                function plus() {

                    // console.log("zzzz")
                    let middatas = document.querySelectorAll(".mid-data")
                    for (let i = 0; i < middatas.length; i++) {
                        console.log(middatas[i].value)
                    }

                    new1.push({
                        제품명: middatas[0].value, 가격: middatas[1].value, 규격: middatas[2].value,
                        재고수량: middatas[3].value, 단위: middatas[4].value, 공급업체: middatas[5].value,
                        LotNo: middatas[6].value, 창고위치: middatas[7].value, 품번: middatas[8].value,

                    })
                    for (let i = 0; i < middatas.length; i++) {
                        middatas[i].value = " "
                    }
                    // console.log(bj)
                    new1.forEach(function (v, i) {
                        let options = bj.map(v => `<option value="${v.제품명}">${v.제품명}</option>`).join("");
                        newstart1 = document.createElement("tr")
                        newstart1.innerHTML = `
                       <td><span class="new-span">${v.제품명}</span>
                        <select name="option" class="check-option" value="${v.제품명}">${options}</select></td>
                        <td><span class="new-span">${v.가격}</span><input type="text" class="new-text" value="${v.가격}"></td>
                        <td><span class="new-span aa">${v.규격}</span><input type="text" class="new-text ab" value="${v.규격}"></td>
                        <td><span class="new-span">${v.재고수량}</span><input type="text" class="new-text" value="${v.재고수량}"></td>
                        <td><span class="new-span">${v.단위}</span><input type="text" class="new-text" value="${v.단위}"></td>
                        <td><span class="new-span aa">${v.공급업체}</span><input type="text" class="new-text ab" value="${v.공급업체}"></td>
                        <td><span class="new-span">${v.LotNo}</span><input type="text" class="new-text"value="${v.LotNo}"></td>
                        <td><span class="new-span aa">${v.창고위치}</span><input type="text" class="new-text ab" value="${v.창고위치}"></td>
                        <td><span class="new-span aa">${v.품번}</span><input type="text" class="new-text ab" value="${v.품번}"></td>
                    
                        <td class="buttontd">
                        <input type="button" value="수정" class="u">
                        <input type="button" value="삭제" class="d">
                        <input type="button" value="확인" class="ok">
                        <input type="button" value="취소" class="can">
                        </td>`
                        starttablebody.append(newstart1)
                        let new_texs = newstart1.querySelectorAll(".new-text")
                        let new_spans = newstart1.querySelectorAll(".new-span")
                        let new_chop = newstart1.querySelector(".check-option")
                        let ab = newstart1.querySelectorAll(".ab")
                        let aa = newstart1.querySelectorAll(".aa")
                        let oks = newstart1.querySelectorAll(".ok")
                        let cans = newstart1.querySelectorAll(".can")
                        let us = newstart1.querySelectorAll(".u")
                        let ds = newstart1.querySelectorAll(".d")
                        for (let a = 0; a < new_texs.length; a++) {
                            new_texs[a].classList.add("none")
                        }
                        for (let a = 0; a < ab.length; a++) {
                            console.log(ab[a])
                            ab[a].classList.add("none")
                        }


                        new_chop.classList.add("none")

                        for (let a = 0; a < oks.length; a++) {
                            oks[a].classList.add("none")
                            cans[a].classList.add("none")
                        }
                        newstart1.querySelector(".u").addEventListener("click", function (e) {
                            for (let a = 0; a < new_texs.length; a++) {
                                // console.log(new_texs[a])
                                // console.log(new_span[a])
                                new_texs[a].classList.remove("none")
                                new_spans[a].classList.add("none")
                                // console.log(e.target.parentNode)
                                e.target.parentNode.querySelector(".u").classList.add("none")
                                e.target.parentNode.querySelector(".d").classList.add("none")
                                e.target.parentNode.querySelector(".ok").classList.remove("none")
                                e.target.parentNode.querySelector(".can").classList.remove("none")

                                new_chop.classList.remove("none")
                                for (let a = 0; a < aa.length; a++) {
                                    console.log(aa[a])
                                    aa[a].classList.remove("none")
                                }
                                for (let a = 0; a < ab.length; a++) {
                                    console.log(ab[a])
                                    ab[a].classList.add("none")
                                }

                            }
                        })

                        newstart1.querySelector(".ok").addEventListener("click", function (e) {
                            for (let a = 0; a < new_texs.length; a++) {
                                // console.log(new_texs[a])
                                // console.log(new_span[a])
                                new_texs[a].classList.add("none")
                                new_spans[a].classList.remove("none")
                                // console.log(e.target.parentNode)    
                            }
                            new_chop.classList.add("none")
                            e.target.parentNode.querySelector(".u").classList.remove("none")
                            e.target.parentNode.querySelector(".d").classList.remove("none")
                            e.target.parentNode.querySelector(".ok").classList.add("none")
                            e.target.parentNode.querySelector(".can").classList.add("none")
                            console.log(e.target.parentNode.parentNode)

                            new_spans[0].innerText = new_chop.value
                            for (let aa = 1; aa < new_texs.length; aa++) {
                                new_spans[aa + 1].innerText = new_texs[aa].value
                            }


                        })
                        newstart1.querySelector(".can").addEventListener("click", function (e) {
                            for (let ai = 0; ai < new_texs.length; ai++) {
                                console.log("포문돔")
                                new_texs[ai].classList.add("none")
                                new_spans[ai].classList.remove("none")
                            }
                            new_chop.classList.add("none")
                            e.target.parentNode.querySelector(".u").classList.remove("none")
                            e.target.parentNode.querySelector(".d").classList.remove("none")
                            e.target.parentNode.querySelector(".ok").classList.add("none")
                            e.target.parentNode.querySelector(".can").classList.add("none")
                        })

                        newstart1.querySelector(".d").addEventListener("click", function (e) {
                            // console.log(e.target.parentNode.parentNode)
                            e.target.parentNode.parentNode.remove()
                        })
                    })


                }



            }






            //아래항목 추가 
        });
    </script>
</body>

</html>