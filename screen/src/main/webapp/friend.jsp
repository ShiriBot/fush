<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="head.jsp" %>
<meta charset="UTF-8">
<%@ include file="header.jsp" %>
<title>친구관리</title>
</head>
<body>
<div class="center">
	<div class="friendsSssion">
	
		<div class="friendSearch">
			<div>
				<select>
				      	<option value="태그">태그</option>
				      	<option value="아이디">아이디</option>
				      	<option value="웹툰제목">웹툰제목</option>
				</select>
				<input type="text">
			</div>
		</div>
		
		<div class="friendDiv">
			<div class="friendthumb">
				<div><img src="images/profile.png"></div>
			</div>
			
			<div class="friendName">
				<h3>임정후</h3>
				<div>간단한 소개 쓰는 칸 ex)일상,현실적인 스토리를 좋아하는 OOO입니다.</div>
				<div class="friendTag">#일상,#성장,#스토리</div>
			</div>
		
			<div class="friendToonRanking">
				<div class="thrBox">
					<div class="FwebtoonThumb"><img src="images/doctor.jpg"></div>
					<div class="FwebtoonTitle">내과의사 박원장</div>
					<div class="FwebtoonStar">★★★★</div>
				</div>
				<div class="thrBox">
					<div class="FwebtoonThumb"><img src="images/doctor.jpg"></div>
					<div class="FwebtoonTitle">내과의사 박원장</div>
					<div class="FwebtoonStar">★★★★</div>
				</div>
			</div>		
		</div>
	</div>
</div>
</body>
</html>