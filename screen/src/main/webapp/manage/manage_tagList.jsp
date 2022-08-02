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
								<table class="tag_table">
									<tr>
										<th>장르</th>
										<td>
											<span>일상</span>
											<span>개그</span>
											<span>드라마</span>
											<span>액션</span>
											<span>감성</span>
											<span>판타지</span>
											<span>스릴러</span>
											<span>시대극</span>
											<span>스포츠</span>
										</td>
									</tr>
									<tr>
										<th>플랫폼</th>
										<td>
											<span>네이버</span>
											<span>카카오웹툰</span>
											<span>카카오페이지</span>
											<span>레진</span>
											<span>투믹스</span>
											<span>봄툰</span>
										</td>
									</tr>
									<tr>
										<th>완결여부</th>
										<td>
											<span>연재중</span>
											<span>완결</span>
										</td>
									</tr>
									<tr>
										<th>평점</th>
										<td>
											<span>5점</span>
											<span>4점</span>
											<span>3점</span>
											<span>2점</span>
											<span>1점</span>
										</td>
									</tr>
								</table>
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