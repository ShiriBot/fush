<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="head.jsp" %>
<meta charset="UTF-8">
<%@ include file="header.jsp" %>
<title>취향분석</title>
</head>
<body>

<div class="center">
	<div class="session">
		<h1 class="oneline">OOO님의 웹툰취향 분석	</h1>

		<h3>뭐라 써야될까</h3>
		<div class="DetailBoard">
			<div class="divideBoard">조회한 웹툰수
				<div class="webtoonCount">120</div>
			</div>
			<div class="divideBoard">평가한웹툰수
				<div class="webtoonCount">53</div>
			</div>
			<div class="divideBoard">댓글수
				<div class="webtoonCount">18</div>
			</div>
		</div>

		<h3>내 평점</h3>
		<div class="DetailBoard">
			<div class="divideBoard">
				<div class="webtoonCount">
					<!-- 넣고싶은 차트예시 (위치조정은 어케하는지몰라서 냅둠) -->
					<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
					<canvas id="bar-chart" width="500" height="300"></canvas>
					<script src="js/Chart.js"></script>
				</div>
			</div>
		</div>

		<h3>회원님이 가장 높게 평가한 웹툰 순위(순위표 차트)</h3><!-- 차트위에 이미지,제목 넣고싶은데 하기힘듬ㄴ -->
		<div class="DetailBoard1">
			<div class="podium2">
				조조코믹스
			</div>
			<div class= "podium1">
				아홉수 우리들
			</div>
			<div class= "podium3">
				유미의 세포들
			</div>
		</div>

		<h3>내가 가장많이본 장르</h3>
		<div class="DetailBoard">	
			<div class="divideBoard">액션
				<div class="webtoonCount">104</div>
			</div>
			<div class="divideBoard">일상
				<div class="webtoonCount">88</div>
			</div> 
			<div class="divideBoard" >판타지
				<div class="webtoonCount">40</div>
			</div>
		</div>

		<h3>내가 가장좋아하는 작가</h3>
		<div class="DetailBoard">
			<div class="ranking">
				<p>1위
				<p>2위
				<p>3위
			</div>
			<div class= "ranking">
				<div class="rankingTitle">이동건</div>
				<div class="rankingTitle">수박양</div>
				<div class="rankingTitle">장봉수</div>
			</div>
			<div class= "ranking">
				<div class="rankingTitle">5편</div>
				<div class="rankingTitle">3편</div>
				<div class="rankingTitle">3편</div>
			</div>
		</div>

		<h3>그 외</h3>
		<div class="DetailBoard">	
			<div class="divideBoard">좋아하는 태그
				<div class="webtoonCount" style="font-size:20px">#OO,#OO,#OO</div>
			</div>
			<div class="divideBoard">좋아하는 그림체
				<div class="webtoonCount" style="font-size:20px">OOO,OOO,OOO</div>
			</div> 
			<div class="divideBoard">좋아하는 캐릭터
				<div class="webtoonCount" style="font-size:20px">OOO,OOO,OOO</div>
			</div> 
		</div>
	</div>
</div>
</body>
</html>