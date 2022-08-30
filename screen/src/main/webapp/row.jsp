<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container-md col-md-9">
<!-- 화면 전체를 감싼 뼈대 -->
	<div class="row justify-content-center">
		<div class="col-10 mt-5 mb-5"  style="position:relative">
			<div class="slides">
				<!--슬라이드 아이템을 감쌀 뼈대 -->
				<c:forEach items="${Banner}" var="banner">
					<div class="slide_item">
						<img src="${banner.route}${banner.saveName}.${banner.fileType}">
					</div>
					<!--슬라이드될 아이템들 -->
					<!-- <div class="slide_item"></div>
					<div class="slide_item"></div>
					<div class="slide_item"></div>
					<div class="slide_item"></div>
					<div class="slide_item"></div> -->
				</c:forEach>
			</div>
			<!-- 살려야한다  -->
			<div style="display: flex; width: 100%; justify-content: space-between;">
				<span class="prevButton">◀</span><!--이전 버튼 -->
				<span class="nextButton">▶</span><!--다음 버튼 -->
			</div>
			<div class="Thumbnail">
				<c:forEach items="${Banner}" var="banner">
					<!--썸네일을 감쌀 뼈대 -->
					<div class="thumbnail_item">
						<img src="${banner.route}${banner.saveName}.${banner.fileType}">
					</div>
					<!--썸네일 아이템들 -->
				<!-- 	<div class="thumbnail_item"></div>
					<div class="thumbnail_item"></div>
					<div class="thumbnail_item"></div>
					<div class="thumbnail_item"></div>
					<div class="thumbnail_item"></div> -->
				</c:forEach>	
			</div>
		</div>
		<!-- <img src="images/logo.png"> -->
		<script src="js/slideShow.js"></script>
	</div>
</div>
<!-- 슬라이드쇼 반응형...역시 거슬려서 먼저함... 개빡셋음... -->

	<div class="row">
		<div class="col">
			<h2>A-CHU 추천</h2>
		</div>
		<!-- <a href="#" style="float: right">더보기</a> -->
	</div>
	<div class="row justify-content-center">
				<c:forEach items="${mainChu}" var="mainchu">
		<div class="col-3">
			<div class="card">
					<div class="card-body">
						<div class="clickBox" onclick="location.href='artDetail.jsp'">
							<img class="card-img-top" src="${mainchu.imageRoute}" >
							<h3 class="card-title mt-2">${mainchu.name}</h3>
							<h5 class="card-subtitle">${mainchu.author}</h5>
						</div>
						<div class="clickBox"><h5>★:${mainchu.avgRating }</h5></div>
						<div class="card-link">
							<c:forEach items="${mainTag }" var="maintag">
								<c:if test="${mainchu.name eq maintag.name }">
									<a class="tag" href="search.so">${maintag.name}</a>
								</c:if>
							</c:forEach>
						</div>
					</div>
			</div>
		</div>
				</c:forEach>
	<div class="row">
		<div class="col">
			<h2>지금 인기있는 태그</h2>
		</div>
	</div>
	<c:forEach items="${mainTopTag}" var="topTag">
		<div class="row">
			<div class="col">
				<h3 class="tag clickBox" onclick="location.href='search.jsp'">${topTag.name}</h3>
				<!-- <a href="#" style="float: right">더보기</a> -->
			</div>
		</div>
		<div class="row">
			<c:forEach items ="${mainTag}" var="chuart">
				<div class="col-3">
					<c:if test="${chuart.seqno eq topTag.seqno}">
						<div class="card clickBox" onclick="location.href='artDetail.jsp'">
							<div class="card-img-top tagImg">
								<img src="${chuart.imageRoute}">
							</div>
							<p>${chuart.name}</p>
						</div>
					</c:if>
				</div>
			</c:forEach>
		</div>
	</c:forEach>
	</div>
	<!-- <div class="row">
		<div class="col">
			<h3 class="tag clickBox" onclick="location.href='search.jsp'">드라마</h3>
			<a href="#" style="float: right">더보기</a>
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

 -->