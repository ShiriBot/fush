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

<div class="rankingContainer">
<h1 class="oneline">나를 표현하는 한줄평</h1>

	<div class="webtoonRanking">
		<div>
			<div>평가한웹툰수</div>
			<div>댓글수</div>
		</div>
	</div>
	
	<div class="webtoonRanking">
	<h3>회원님이 가장 높게 평가한 웹툰 순위</h3>
		<div class="rankingBoard">
			<div class="find">
				<div class="ranking">1등</div>
				<div class="ranking">2등</div>
				<div class="ranking">3등</div>
			</div>
			<div>
				<div class="rankingTitle">아홉수 우리들</div>
				<div class="rankingTitle">조조코믹스</div>
				<div class="rankingTitle">유미의 세포들</div>
			</div>
		</div>
	</div>
	
	<div class="webtoonRanking">
	 <div>액션</div>
	 <div>일상</div> 
	 <div>판타지</div>
	</div>
	
	
	<div class="webtoonRanking">
	평가한 웹툰 전체 순위
	</div>
	
	<div class="webtoonRanking">
	내가 가장 좋아하는(많이보는 장르순위)
	</div>
	
	<div class="webtoonRanking">
	좋아하는 작가
	</div>
	
	<div class="webtoonRanking">
	3.플랫폼or태그
	 4.좋아하는 그림체
	</div>
</div>

</body>
</html>