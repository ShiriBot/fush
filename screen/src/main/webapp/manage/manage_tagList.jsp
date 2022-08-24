<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div class="right_col" role="main">
	<div class="">
		<div class="page-title">
			<div class="title_left">
				<h3>
					태그목록<!-- 페이지 타이틀 --> <small><!-- 페이지 부제목 --></small>
				</h3>
			</div>
		</div>
		<div class="clearfix"></div>
		<!-- 여기까지 제목 -->
		
		<!-- 컨텐츠 큰 영역 -->
		<div class="row">
			<!-- 하얀 박스 하나 -->
			<div class="col-md-12 col-sm-12 ">
				<div class="x_panel">
					<div class="x_title">
						<h2>
							전체태그목록 <!-- 테이블 제목 -->
							<small></small>
						</h2>
						<ul class="nav navbar-right panel_toolbox">
							<li>
								<a class="collapse-link">
									<i class="fa fa-chevron-up"></i><!-- 이거 누르면 접히게 만들...고 싶어요 -->
								</a>
							</li>
						</ul>
						<div class="clearfix"></div>
					</div>
					<div class="x_content">
						<div class="row">
							<div class="col-sm-12">
								<div class="tag_table">
									<div>장르</div>
									<div class="drag-container">
										<div class="tag" draggable="true">일상</div>
										<div class="tag"  draggable="true">개그</div>
										<div class="tag"  draggable="true">드라마</div>
										<div class="tag"  draggable="true">액션</div>
										<div class="tag"  draggable="true">감성</div>
										<div class="tag"  draggable="true">판타지</div>
										<div class="tag"  draggable="true">스릴러</div>
										<div class="tag"  draggable="true">시대극</div>
										<div class="tag"  draggable="true">스포츠</div>
									</div>
									<div>플랫폼</div>
									<div class="drag-container">
										<div class="tag"  draggable="true">네이버</div>
										<div class="tag"  draggable="true">카카오웹툰</div>
										<div class="tag"  draggable="true">카카오페이지</div>
										<div class="tag"  draggable="true">레진</div>
										<div class="tag"  draggable="true">투믹스</div>
										<div class="tag"  draggable="true">봄툰</div>
									</div>
									<div>완결여부</div>
									<div class="drag-container">
										<div class="tag"  draggable="true">연재중</div>
										<div class="tag"  draggable="true">완결</div>
									</div>
									<div>평점</div>
									<div class="drag-container">
										<div class="tag"  draggable="true">5점</div>
										<div class="tag"  draggable="true">4점</div>
										<div class="tag"  draggable="true">3점</div>
										<div class="tag"  draggable="true">2점</div>
										<div class="tag"  draggable="true">1점</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-6 col-sm-6 ">
				<div class="x_panel">
					<div class="x_title">
						<h2>
							태그 추가 <!-- 테이블 제목 -->
							<small></small>
						</h2>
						<ul class="nav navbar-right panel_toolbox">
							<li>
								<a class="collapse-link">
									<i class="fa fa-chevron-up"></i><!-- 이거 누르면 접히게 만들...고 싶어요 -->
								</a>
							</li>
						</ul>
						<div class="clearfix"></div>
					</div>
					<div class="x_content">
						<div class="row">
							<div class="col-sm-6 tag_modify">
								<span>태그 추가</span>
								<form class="tag_modifyForm">
									<input type="text">
									<input type="submit" value="추가">
								</form>
								<span>태그 분류 추가</span>
								<form  class="tag_modifyForm">
									<input type="text">
									<input type="submit" value="추가">
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-6 col-sm-6 ">
				<div class="x_panel">
					<div class="x_title">
						<h2>
							태그 편집 <!-- 테이블 제목 -->
							<small></small>
						</h2>
						<ul class="nav navbar-right panel_toolbox">
							<li>
								<a class="collapse-link">
									<i class="fa fa-chevron-up"></i><!-- 이거 누르면 접히게 만들...고 싶어요 -->
								</a>
							</li>
						</ul>
						<div class="clearfix"></div>
					</div>
					<div class="x_content">
						<div class="row">
							<div class="col-sm-6 tag_modify">
									<span>태그 이름변경</span>
								<form class="tag_modifyForm">
									<input type="submit" value="변경">
								</form>
									<span>태그 삭제</span>
								<form class="tag_modifyForm">
									<input type="submit" value="삭제">
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script src="assets/js/dragdrop.js"></script>