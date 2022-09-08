<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<div class="preference"> <!-- 내부 별도 스타일을 주기 위한 클래스 선언하여 감쌌음! -->
			
			<h1 class="oneline">user2님의 웹툰취향 분석	</h1>
		
			<h3>나의 평가 현황</h3>
			<c:set value="${Preference}" var="preference"/>
			<div class="DetailBoard" style="border-bottom:none;">
				<div class="divideBoard">
					<span>회원님의 평가한 평점 평균</span>
					<div class="webtoonCount">${preference.artRatingAvg }</div>
				</div>
				<div class="divideBoard">
					<span>평가한 웹툰 수</span>
					<div class="webtoonCount">${preference.artCount}</div>
				</div>
				<div class="divideBoard">
					<span>작성한 댓글 수</span>
					<div class="webtoonCount">${preference.replyCount}</div>
				</div>
			</div>
			<div class="DetailBoard">
				<div class="divideBoard">
					<div class="webtoonCount">
						<!-- 넣고싶은 차트예시 (위치조정은 어케하는지몰라서 냅둠) -->
						<canvas id="bar-chart" width="500" height="100"></canvas>
					</div>
				</div>
				
			</div>
		
			<!-- <h3>회원님이 가장 높게 평가한 웹툰 순위(순위표 차트)</h3>차트위에 이미지,제목 넣고싶은데 하기힘듬ㄴ
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
			</div> -->
		
			<h3>나의 선호태그</h3>
			<div class="DetailBoard">	
				<div id="chartdiv"></div>
					<c:forEach items="${FavoriteTag}" var="favoriteTag">
						${favoriteTag.name}
					</c:forEach>
			</div>
		
			<h3>내가 가장 많이 본 장르</h3>
			<div class="DetailBoard">	
				<div class="divideBoard">
					<span>액션</span>
					<div class="webtoonCount">104</div>
				</div>
				<div class="divideBoard">
					<span>일상</span>
					<div class="webtoonCount">88</div>
				</div> 
				<div class="divideBoard">
					<span>판타지</span>
					<div class="webtoonCount">40</div>
				</div>
			</div>
		
			<h3>내가 가장 좋아하는 장르</h3>
			<div class="DetailBoard">	
				<div class="divideBoard">
					<span>판타지</span>
					<div class="webtoonCount">4.1</div>
				</div>
				<div class="divideBoard">
					<span>액션</span>
					<div class="webtoonCount">3.7</div>
				</div> 
				<div class="divideBoard">
					<span>일상</span>
					<div class="webtoonCount">3.5</div>
				</div>
			</div>
		
			<h3>내가 가장 많이 이용하는 플랫폼</h3>
			<div class="DetailBoard">	
				<div class="divideBoard">
					<img src="images/Naver_Line_Webtoon_logo.png">
					<span>네이버</span>
					<div class="webtoonCount">57</div>
				</div>
				<div class="divideBoard">
					<img src="images/Kakao_Webtoon_logo.jpg">
					<span>카카오 웹툰</span>
					<div class="webtoonCount">46</div>
				</div> 
				<div class="divideBoard">
					<img src="images/Lezin_Webtoon_logo.jpg">
					<span>레진코믹스</span>
					<div class="webtoonCount">38</div>
				</div>
			</div>

			<h3>내가 가장 좋아하는 작가</h3>
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
	
			<!-- <h3>그 외</h3> 별도 표기
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
			</div> -->
		</div>
	</div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<script src="js/Chart.js"></script>
<script src="//cdn.amcharts.com/lib/4/core.js"></script>
<script src="//cdn.amcharts.com/lib/4/charts.js"></script>
<script src="//cdn.amcharts.com/lib/4/plugins/wordCloud.js"></script>
<script src="//cdn.amcharts.com/lib/4/themes/animated.js"></script>
<script src="js/tagCloud.js"></script>

</body>
</html>