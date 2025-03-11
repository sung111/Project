<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>품질관리</title>
<link rel="stylesheet" href="css\qualityControl.css">
<script src="js\qualityControl.js"></script>
<link rel="stylesheet" href="">

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
					<button class="btn1">조회</button>
				</div>
			</div>
			<div class="wkrView"></div>
		</div>
		<div class="bord">
			<div class="inBord">
				<div>검사완료율</div>
				<div>%</div>
				<div>(제품별)</div>
			</div>
			<div class="inBord">
				<div>불량률</div>
				<div>%</div>
				<div>(제품별)</div>
			</div>

		</div>
		<div class="box2">
			<div class="left">
				<div class="wp">제품명</div>
				<div class="btn2B">
					<button class="btn2">제품 합격 / 불합격 기준</button>
				</div>
			</div>
			<form method="post" action="qualityControl">						<!-- form 여기있어요 -->
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
							<input type="datetime-local" class="date2" name="date">
							<div>
								합격 갯수입력 : <input type="number" class="myInput" min="1" max="100"
									oninput="validity.valid||(value='')" placeholder="0" name="passPack"> pack
							</div>
							<div>
								불합 개수입력 : <input type="number" class="myInput" min="1" max="100"
									oninput="validity.valid||(value='')" placeholder="0" name="failPack">
								pack
							</div>
						</div>
					</div>
					<div class="insert">
						<textarea name="" id="" placeholder="기타사항" class="textBox"	rows="2" name=""></textarea>
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
			</form>
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
					결과 : <select class="dropBox2">
						<option value="">전체</option>
						<option value="">합격</option>
						<option value="">불합격</option>
					</select>
				</div>
				<div>
					불합격 사유 : <select class="dropBox2">
						<option value="">전체</option>
						<option value="">무게 미달</option>
						<option value="">외관 불량</option>
						<option value="">자재 불량</option>
					</select>
				</div>
				<div>
					<button class="btn4">검색</button>
				</div>
			</div>
			<div class="dede">
				<div class="index">
					<div>날짜</div>
					<div>제품명</div>
					<div>합격/불합격</div>
					<div>불합격 사유</div>
					<div>코멘트</div>
					<div>등록인</div>
					<div>비고</div>
				</div>
			</div>
			<div class="box3View"></div>
		</div>
	</div>
</body>

</html>