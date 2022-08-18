<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="container-md col-md-9">
<!-- 화면 전체를 감싼 뼈대 -->
	<div class="row justify-content-center">
		<div class="col-10 mt-5 mb-5"  style="position:relative">
			<div class="slides">
				<!--슬라이드 아이템을 감쌀 뼈대-->
				<div class="slide_item"></div>
				<!--슬라이드될 아이템들 -->
				<div class="slide_item"></div>
				<div class="slide_item"></div>
				<div class="slide_item"></div>
				<div class="slide_item"></div>
				<div class="slide_item"></div>
			</div>
			<!-- 살려야한다  -->
			<div style="display: flex; width: 100%; justify-content: space-between;">
				<span class="prevButton">◀</span><!--이전 버튼 -->
				<span class="nextButton">▶</span><!--다음 버튼 -->
			</div>
			<div class="Thumbnail">
				<!--썸네일을 감쌀 뼈대 -->
				<div class="thumbnail_item"></div>
				<!--썸네일 아이템들 -->
				<div class="thumbnail_item"></div>
				<div class="thumbnail_item"></div>
				<div class="thumbnail_item"></div>
				<div class="thumbnail_item"></div>
				<div class="thumbnail_item"></div>
			</div>
		</div>
		<!-- <img src="images/logo.png"> -->
		<script src="js/slideShow.js"></script>
	</div>
<!-- 슬라이드쇼 반응형...역시 거슬려서 먼저함... 개빡셋음... -->

	<div class="row">
		<div class="col">
			<h2>A-CHU 추천</h2>
		</div>
		<!-- <a href="#" style="float: right">더보기</a> -->
	</div>
	<div class="row justify-content-center">
		<div class="col-3">
			<div class="card">
				<div class="card-body">
					<div class="clickBox" onclick="location.href='artDetail.jsp'">
						<img class="card-img-top" src="images/no_home.jpg" >
						<h3 class="card-title mt-2">집이 없어</h3>
						<h5 class="card-subtitle">와난</h5>
					</div>
					<div class="card-link">
						<a class="tag" href="search.jsp">오컬트</a>
						<a class="tag" href="search.jsp">학원물</a>
						<a class="tag" href="search.jsp">성장드라마</a>
						<a class="tag" href="search.jsp">드라마</a>
						<a class="tag" href="search.jsp">스토리</a>
						<a class="tag" href="search.jsp">공감</a>
					</div>
				</div>
			</div>
		</div>
		<div class="col-3">
			<div class="card">
				<div class="card-body">
					<div class="clickBox" onclick="location.href='artDetail.jsp'">
						<img class="card-img-top" src="images/sample1.jpg" >
						<h3 class="card-title mt-2">독립일기</h3>
						<h5 class="card-subtitle">자까</h5>
					</div>
					<div class="card-link">
						<a class="tag" href="search.jsp">일상</a>
						<a class="tag" href="search.jsp">에피소드</a>
						<a class="tag" href="search.jsp">공감</a>
					</div>
				</div>
			</div>
		</div>
		<div class="col-3">
			<div class="card">
				<div class="card-body">
					<div class="clickBox" onclick="location.href='artDetail.jsp'">
						<img class="card-img-top" src="images/sample2.jpg" >
						<h3 class="card-title mt-2">이상한 변호사 우영우</h3>
						<h5 class="card-subtitle">유일 / 화음조 / 이예지</h5>
					</div>
					<div class="card-link">
						<a class="tag" href="search.jsp">법정드라마</a>
						<a class="tag" href="search.jsp">드라마원작</a>
						<a class="tag" href="search.jsp">힐링</a>
						<a class="tag" href="search.jsp">직업드라마</a>
						<a class="tag" href="search.jsp">성장드라마</a>
						<a class="tag" href="search.jsp">드라마</a>
						<a class="tag" href="search.jsp">스토리</a>
						<a class="tag" href="search.jsp">공감</a>
					</div>
				</div>
			</div>
		</div>
		<div class="col-3">
			<div class="card">
				<div class="card-body">
					<div class="clickBox" onclick="location.href='artDetail.jsp'">
						<img class="card-img-top" src="images/sample3.jpg" >
						<h3 class="card-title mt-2">나노마신</h3>
						<h5 class="card-subtitle">현절무 / 금강불괴 / 한중월야</h5>
					</div>
					<div class="card-link">
						<a class="tag" href="search.jsp">사이다</a>
						<a class="tag" href="search.jsp">게임판타지</a>
						<a class="tag" href="search.jsp">이능력배틀물</a>
						<a class="tag" href="search.jsp">사극</a>
						<a class="tag" href="search.jsp">소설원작</a>
						<a class="tag" href="search.jsp">무협</a>
						<a class="tag" href="search.jsp">스토리</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col">
			<h2>지금 인기있는 태그</h2>
		</div>
	</div>
	<div class="row">
		<div class="col">
			<h3 class="tag clickBox" onclick="location.href='search.jsp'">스토리</h3>
			<!-- <a href="#" style="float: right">더보기</a> -->
		</div>
	</div>
	<div class="row">
		<div class="col-2">
			<div class="card clickBox" onclick="location.href='artDetail.jsp'">
				<div class="card-img-top tagImg">
					<img src="images/no_home.jpg">
				</div>
				<p>집이 없어</p>
			</div>
		</div>
		<div class="col-2">
			<div class="card clickBox" onclick="location.href='artDetail.jsp'">
				<div class="card-img-top tagImg">
					<img src="images/sample2.jpg">
				</div>
				<p>이상한 변호사 우영우</p>
			</div>
		</div>
		<div class="col-2">
			<div class="card clickBox" onclick="location.href='artDetail.jsp'">
				<div class="card-img-top tagImg">
					<img src="images/sample3.jpg">
				</div>
				<p>나노마신</p>
			</div>
		</div>
		<div class="col-2">
			<div class="card clickBox" onclick="location.href='artDetail.jsp'">
				<div class="card-img-top tagImg">
					<img src="images/sample4.jpg">
				</div>
				<p>연애혁명</p>
			</div>
		</div>
		<div class="col-2">
			<div class="card clickBox" onclick="location.href='artDetail.jsp'">
				<div class="card-img-top tagImg">
					<img src="images/sample5.jpg">
				</div>
			<p>호랑신랑뎐</p>
			</div>
		</div>
		<div class="col-2">
			<div class="card clickBox" onclick="location.href='artDetail.jsp'">
				<div class="card-img-top tagImg">
					<img src="images/sample6.jpg">
				</div>
				<p>개를 낳았다</p>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col">
			<h3 class="tag clickBox" onclick="location.href='search.jsp'">드라마</h3>
			<!-- <a href="#" style="float: right">더보기</a> -->
		</div>
	</div>
	<div class="row">
		<div class="col-2">
			<div class="card clickBox" onclick="location.href='artDetail.jsp'">
				<div class="card-img-top tagImg">
					<img src="images/no_home.jpg">
				</div>
				<p>집이 없어</p>
			</div>
		</div>
		<div class="col-2">
			<div class="card clickBox" onclick="location.href='artDetail.jsp'">
				<div class="card-img-top tagImg">
					<img src="images/sample2.jpg">
				</div>
				<p>이상한 변호사 우영우</p>
			</div>
		</div>
		<div class="col-2">
			<div class="card clickBox" onclick="location.href='artDetail.jsp'">
				<div class="card-img-top tagImg">
					<img src="images/sample3.jpg">
				</div>
				<p>나노마신</p>
			</div>
		</div>
		<div class="col-2">
			<div class="card clickBox" onclick="location.href='artDetail.jsp'">
				<div class="card-img-top tagImg">
					<img src="images/sample4.jpg">
				</div>
				<p>연애혁명</p>
			</div>
		</div>
		<div class="col-2">
			<div class="card clickBox" onclick="location.href='artDetail.jsp'">
				<div class="card-img-top tagImg">
					<img src="images/sample5.jpg">
				</div>
			<p>호랑신랑뎐</p>
			</div>
		</div>
		<div class="col-2">
			<div class="card clickBox" onclick="location.href='artDetail.jsp'">
				<div class="card-img-top tagImg">
					<img src="images/sample6.jpg">
				</div>
				<p>개를 낳았다</p>
			</div>
		</div>
	</div>
</div>
