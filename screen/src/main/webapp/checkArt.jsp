<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="head.jsp" %>
<meta charset="UTF-8">
<%@ include file="header.jsp" %>
<title>평가한 작품보기</title>
</head>
<body>
<div class="center">
	<div class="session">
		<div class="choice">
			<div class="choiceRanking">
				<a href="#">별점별 작품</a> <!-- 별점순,등록순에 색넣고 클릭시 밑에 보드들도 그색으로 바뀌게하기 생각중 -->
			</div>
			<div class="choiceUpdate">
				<a href="#">평가 등록순</a>
			</div>
		</div>
	
		<div class="detailChart">
			<div class="leftblockChart">
				<div class="image"></div>
			</div>
			
			<div class="middleblockChart">
				<div class="checkTitle">
					내과의사 박원장
				</div>
				<div class="checkReply">
					<p>댓글:</p>
					<span>"의사들의 현실적인 고민과 애환을 재치있게 잘 그려낸 작품"</span>
				</div>
				<div class="checkTag">
					<a class="tag" href="#">태그</a>
					<a class="tag" href="#">태그</a>
					<a class="tag" href="#">태그</a>
				</div>
			</div>
			<div class="rightblockChart">
				<div class="star">
					<div>
						<h4>나의 평점</h4>
						<span>/평균 평점</span>
					</div>
					<div>
						<h2>5.0</h2>
						<span>/5.0</span>
						<div>★★★★★</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="detailChart">
			<div class="leftblockChart">
				<div class="image"></div>
			</div>
			
			<div class="middleblockChart">
				<div class="checkTitle">내과의사 박원장</div>
				댓글:
				<div class="checkReply">"의사들의 현실적인 고민과애환을 재치있게 잘 그려낸 작품"
				</div>
				<div class="checkTag">
					<a href="#">#태그</a>
					<a href="#">#태그</a>
					<a href="#">#태그</a>
				</div>
			</div>
			<div class="rightblockChart">
				<div class="star" >
					<h4>별점</h4>
					<h2>5.0/5.0</h2>
					<div>★★★★★</div>
				</div>
			</div>
		</div>
		
		<div class="detailChart">
			<div class="leftblockChart">
				<div class="image"></div>
			</div>
			
			<div class="middleblockChart">
				<div class="checkTitle">내과의사 박원장</div>
				내가 작성한 댓글:
				<div class="checkReply">"의사들의 현실적인 고민과애환을 재치있게 잘 그려낸 작품"
				</div>
				<div class="checkTag">
					<a href="#">#태그</a>
					<a href="#">#태그</a>
					<a href="#">#태그</a>
				</div>
			</div>
			<div class="rightblockChart">
				<div class="star" >
					<h4>별점</h4>
					<h2>5.0/5.0</h2>
					<div>★★★★★</div>
				</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>