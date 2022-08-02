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
	</div>
</div>

<div class="center" style="background-color:rgb(219, 219, 219)">
	<div class="session">
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
	</div>
</div>

<div class="center" style="background-color:rgb(219, 219, 219)">
	<div class="session">
		<div class="DetailBoard">
			<div class="divideBoard">
				<div class="webtoonCount">평점분포도</div>
			</div>
			
		</div>
	</div>
</div>

<div class="center" style="background-color:rgb(219, 219, 219)">
	<div class="session">
		<h3>회원님이 가장 높게 평가한 웹툰 순위(순위표 차트)</h3><!-- 차트로하고싶음 -->
		<div class="DetailBoard">
			<div class="ranking">
				<p>1위
				<p>2위
				<p>3위
			</div>
			<div class= "ranking">
				<div class="rankingTitle">아홉수 우리들</div>
				<div class="rankingTitle">조조코믹스</div>
				<div class="rankingTitle">유미의 세포들</div>
			</div>
		</div>
	</div>
</div>

<div class="center" style="background-color:rgb(219, 219, 219)">
	<div class="session">
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
	</div>
</div>

<div class="center" style="background-color:rgb(219, 219, 219)">	
	<div class="session">
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
		</div>
	</div>
</div>

<div class="center" style="background-color:rgb(219, 219, 219)">	
	<div class="session">
		<div class="DetailBoard">	
			<div class="divideBoard">좋아하는 태그
				<div class="webtoonCount" style="font-size:20px">#OO,#OO,#OO</div>
			</div>
			<div class="divideBoard">좋아하는 그림체
				<div class="webtoonCount" style="font-size:20px">OOO,OOO,OOO</div>
			</div> 
		</div>
	</div>
</div>

</body>
</html>