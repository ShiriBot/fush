<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
<script>
	function button1_click() {
		var minus = document.getElementsByClassName("minus");
		for(i=0; i<minus.length;i++){
			minus[i].style.display="block";
		}
	}
</script>
<%@ include file="head.jsp" %>
<%@ include file="header.jsp" %>
<title>친구관리</title>
</head>
<body>
<div class="center">
	<div class="sssion">
		<!-- 삭제버튼 -->
		<div class="friendMange">
			<button onclick="javascript:button1_click()">삭제	</button>
		</div>
		
		<!-- 친구목록 -->
		<div class="friendBoard">
			<!-- 친구목록 프로필사진div -->
			<div class="friendthumb">
				<div><a href="#"><img src="images/profile.png"></a></div>
			</div>
			<!-- 친구의 간단한 설명div -->
			<div class="friendName">
				<h3>임정후</h3>
				<div class="friendTag">OOO님의 웹툰취향은 #일상입니다.</div>
				<div class="friendTag">#일상,#성장,#스토리</div>
			</div>
			<!-- 친구의 추천웹툰 -->
			<div class="friendToonRanking">
				<h5 class="hTitle">OOO님의 추천웹툰</h5>
				<div class="thrBox">
					<div class="FwebtoonThumb">
						<img src="images/doctor.jpg">
					</div>
					<div class="FwebtoonTitle"><a href="#">내과의사 박원장</a></div>
					<div class="FwebtoonStar">★★★★</div>
				</div>
				<div class="thrBox">
					<div class="FwebtoonThumb"><img src="images/doctor.jpg"></div>
					<div class="FwebtoonTitle"><a href="#">내과의사 박원장</a></div>
					<div class="FwebtoonStar">★★★★</div>
				</div>
			</div>		
			<!-- 마이너스 아이콘 -->
			<a href="#">
				<ion-icon name="remove-circle-outline" class="minus"></ion-icon>
			</a>
		</div>
		<!-- 친구목록 -->
		<div class="friendBoard">
			<!-- 친구목록 프로필사진div -->
			<div class="friendthumb">
				<div><a href="#"><img src="images/profile.png"></a></div>
			</div>
			<!-- 친구의 간단한 설명div -->
			<div class="friendName">
				<h3>임정후</h3>
				<div class="friendTag">OOO님의 웹툰취향은 #일상입니다.</div>
				<div class="friendTag">#일상,#성장,#스토리</div>
			</div>
			<!-- 친구의 추천웹툰 -->
			<div class="friendToonRanking">
				<h5 class="hTitle">OOO님의 추천웹툰</h5>
				<div class="thrBox">
					<div class="FwebtoonThumb">
						<img src="images/doctor.jpg">
					</div>
					<div class="FwebtoonTitle"><a href="#">내과의사 박원장</a></div>
					<div class="FwebtoonStar">★★★★</div>
				</div>
				<div class="thrBox">
					<div class="FwebtoonThumb"><img src="images/doctor.jpg"></div>
					<div class="FwebtoonTitle"><a href="#">내과의사 박원장</a></div>
					<div class="FwebtoonStar">★★★★</div>
				</div>
			</div>		
			<!-- 마이너스 아이콘 -->
			<a href="#">
				<ion-icon name="remove-circle-outline" class="minus"></ion-icon>
			</a>
		</div>
		<!-- 친구목록 -->
		<div class="friendBoard">
			<!-- 친구목록 프로필사진div -->
			<div class="friendthumb">
				<div><a href="#"><img src="images/profile.png"></a></div>
			</div>
			<!-- 친구의 간단한 설명div -->
			<div class="friendName">
				<h3>임정후</h3>
				<div class="friendTag">OOO님의 웹툰취향은 #일상입니다.</div>
				<div class="friendTag">#일상,#성장,#스토리</div>
			</div>
			<!-- 친구의 추천웹툰 -->
			<div class="friendToonRanking">
				<h5 class="hTitle">OOO님의 추천웹툰</h5>
				<div class="thrBox">
					<div class="FwebtoonThumb">
						<img src="images/doctor.jpg">
					</div>
					<div class="FwebtoonTitle"><a href="#">내과의사 박원장</a></div>
					<div class="FwebtoonStar">★★★★</div>
				</div>
				<div class="thrBox">
					<div class="FwebtoonThumb"><img src="images/doctor.jpg"></div>
					<div class="FwebtoonTitle"><a href="#">내과의사 박원장</a></div>
					<div class="FwebtoonStar">★★★★</div>
				</div>
			</div>		
			<!-- 마이너스 아이콘 -->
			<a href="#">
				<ion-icon name="remove-circle-outline" class="minus"></ion-icon>
			</a>
		</div>
		<!-- 친구목록 -->
		<div class="friendBoard">
			<!-- 친구목록 프로필사진div -->
			<div class="friendthumb">
				<div><a href="#"><img src="images/profile.png"></a></div>
			</div>
			<!-- 친구의 간단한 설명div -->
			<div class="friendName">
				<h3>임정후</h3>
				<div class="friendTag">OOO님의 웹툰취향은 #일상입니다.</div>
				<div class="friendTag">#일상,#성장,#스토리</div>
			</div>
			<!-- 친구의 추천웹툰 -->
			<div class="friendToonRanking">
				<h5 class="hTitle">OOO님의 추천웹툰</h5>
				<div class="thrBox">
					<div class="FwebtoonThumb">
						<img src="images/doctor.jpg">
					</div>
					<div class="FwebtoonTitle"><a href="#">내과의사 박원장</a></div>
					<div class="FwebtoonStar">★★★★</div>
				</div>
				<div class="thrBox">
					<div class="FwebtoonThumb"><img src="images/doctor.jpg"></div>
					<div class="FwebtoonTitle"><a href="#">내과의사 박원장</a></div>
					<div class="FwebtoonStar">★★★★</div>
				</div>
			</div>		
			<!-- 마이너스 아이콘 -->
			<a href="#">
				<ion-icon name="remove-circle-outline" class="minus"></ion-icon>
			</a>
		</div>
		<!-- 친구목록 -->
		<div class="friendBoard">
			<!-- 친구목록 프로필사진div -->
			<div class="friendthumb">
				<div><a href="#"><img src="images/profile.png"></a></div>
			</div>
			<!-- 친구의 간단한 설명div -->
			<div class="friendName">
				<h3>임정후</h3>
				<div class="friendTag">OOO님의 웹툰취향은 #일상입니다.</div>
				<div class="friendTag">#일상,#성장,#스토리</div>
			</div>
			<!-- 친구의 추천웹툰 -->
			<div class="friendToonRanking">
				<h5 class="hTitle">OOO님의 추천웹툰</h5>
				<div class="thrBox">
					<div class="FwebtoonThumb">
						<img src="images/doctor.jpg">
					</div>
					<div class="FwebtoonTitle"><a href="#">내과의사 박원장</a></div>
					<div class="FwebtoonStar">★★★★</div>
				</div>
				<div class="thrBox">
					<div class="FwebtoonThumb"><img src="images/doctor.jpg"></div>
					<div class="FwebtoonTitle"><a href="#">내과의사 박원장</a></div>
					<div class="FwebtoonStar">★★★★</div>
				</div>
			</div>		
			<!-- 마이너스 아이콘 -->
			<a href="#">
				<ion-icon name="remove-circle-outline" class="minus"></ion-icon>
			</a>
		</div>
		
	</div>
</div>
</body>
</html>