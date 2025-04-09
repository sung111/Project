<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>실적등록</title>
<link rel="stylesheet" href="css\Performance.css">
<script src="js\Performance.js"></script>

</head>

<body>
	<div id="myModal" class="modal">
		<div class="modal-content">
			<span class="close">&times;</span>
			<p>여기는 모달창 내용 영역입니다.</p>
		</div>
	</div>
	<div class="warrap">
		<div class="instruction">
			<div class="instTop">
				<div class="wkr">작업지시서</div>
				<div>
					<button class="btn1">조회</button>
				</div>
			</div>
			<div class="instView"></div>
		</div>
		<div>
			<div class="bord">
				<div class="inBord">
					<div>현재 진행률</div>
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
				<div class="criteria">
					<div class="wp">제품명</div>
					<div class="btn2B">
						<button class="btn2">제품 합격/불합격 기준</button>
					</div>
				</div>
				<div class="registration">
					<div class="rightTop">
						<div class="wp2">제품명</div>
						<div>
							<input type="datetime-local" class="date1">
						</div>
						<button class="btn3">등록</button>
					</div>
					<div>
						<div id="ea">
							생산갯수 : <input type="number" id="myInput" min="1" max="100"
								oninput="validity.valid||(value='')" value="10"> pack
						</div>
					</div>
					<textarea name="" id="" class="textarea1" rows="8" heigth="100"></textarea>
				</div>
			</div>
			<div class="box3">
				<div class="box3Top">
					<div>
						<input type="text" class="wp3" placeholder="제품명">
					</div>
					<div class="date2">
						<input type="datetime-local" class="indate1"> ~ <input
							type="datetime-local" class="indate2">
					</div>
					<div>
						<button class="btn4">조회</button>
					</div>
				</div>
				<div class="indexBox">
					<div class="index">
						<div>날짜</div>
						<div>제품명</div>
						<div>수량</div>
						<div>생산현황</div>
						<div>코멘트</div>
						<div>등록인</div>
						<div>비고</div>
					</div>
				</div>
				<div class="box3View"></div>
			</div>
		</div>
	</div>
	<script>
		
	</script>
</body>

</html>