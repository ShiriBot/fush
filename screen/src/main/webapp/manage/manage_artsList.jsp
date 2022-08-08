<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="right_col" role="main">
	<div class="">
		<div class="page-title">
			<div class="title_left">
				<h3>
					작품목록<!-- 페이지 타이틀 --> <small>현재 등록되어 있는 작품들<!-- 페이지 부제목 --></small>
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
							전체작품목록 <!-- 테이블 제목 -->
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
								<div class="card-box table-responsive">
									<p class="text-muted font-13 m-b-30">
										<!-- 테이블 설명 -->
										등록 완료된 작품 목록입니다. 
									</p>
									<div id="datatable-arts_wrapper" class="dataTables_wrapper container-fluid dt-bootstrap no-footer">
										<div class="dataTables_length" id="datatable-arts_length">
											<label>한번에 
												<select name="datatable-arts_length" aria-controls="datatable-arts" class="form-control input-sm">
													<option value="10">10</option>
													<option value="25">25</option>
													<option value="50">50</option>
													<option value="100">100</option>
												</select> 개씩 보기
											</label>
										</div>
										<div id="datatable-buttons_wrapper" class="dataTables_wrapper dt-bootstrap no-footer" style="display:inline">
											<div class="dt--members-del btn-group">
												<a class="btn btn-default buttons-html5 btn-sm" tabindex="0" aria-controls="datatable-buttons" href="#">
													<span>작품 수정하기</span>
												</a>
											</div>
											<div class="dt--members-del btn-group">
												<a class="btn btn-default buttons-html5 btn-sm" tabindex="0" aria-controls="datatable-buttons" href="#">
													<span>작품 삭제하기</span>
												</a>
											</div>
										</div>
										<div id="datatable-arts_filter" class="dataTables_filter">
											<label>
											검색:
												<input type="search" class="form-control input-sm" placeholder="" aria-controls="datatable-arts">
											</label>
										</div>
										<table id="datatable-arts" class="table table-striped table-bordered dataTable no-footer dtr-inline">
											<thead>
												<tr role="row">
													<th class="sorting_asc" tabindex="0" aria-controls="datatable-responsive" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Art name: activate to sort column descending">
														작품명
													</th>
													<th class="sorting" tabindex="0" aria-controls="datatable-responsive" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Author name: activate to sort column descending">
														작가명
													</th>
													<th class="sorting" tabindex="0" aria-controls="datatable-responsive" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Art detail: activate to sort column descending" style="max-width:500px;">
														작품설명
													</th>
													<th class="sorting" tabindex="0" aria-controls="datatable-responsive" rowspan="1" colspan="1" aria-sort="ascending" aria-label="isEnd: activate to sort column descending">
														완결여부
													</th>
													<th class="sorting" tabindex="0" aria-controls="datatable-responsive" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Art Url: activate to sort column descending" style="display: none;">
														URL
													</th>
												</tr>
											</thead>
											<tbody>
												<tr role="row" class="parent">
													<td tabindex="0" class="sorting_1">개를 낳았다</td>
													<td>이선</td>
													<td  style="max-width:500px;">사랑스러운 너와의 첫 만남부터 이별까지. 처음으로 반려견을 키우게 된 다나와 모든것이 처음인 강아지 명동이가 만나 함께 살아가는 이야기. 강아지 수명 20년. 너와 내가 함께하는 20년 동안 우린 어떤 일을 겪게 될까?</td>
													<td>연재중</td>
													<td style="display: none;">https://comic.naver.com/webtoon/list?titleId=712362</td>
												</tr>
											</tbody>
										</table>
										<div class="dataTables_info" id="datatable-arts_info" role="status" aria-live="polite">
											Showing 1 to 1 of 1 entries
										</div>
										<div class="dataTables_paginate paging_simple_numbers" id="datatable-arts_paginate">
											<ul class="pagination">
												<li class="paginate_button previous disabled" id="datatable-arts_previous">
													<a href="#" aria-controls="datatable-members" data-dt-idx="0" tabindex="0">
														Previous
													</a>
												</li>
												<li class="paginate_arts active">
													<a href="#" aria-controls="datatable-arts" data-dt-idx="1" tabindex="0">
														1
													</a>
												</li>
												<li class="paginate_arts active">
													<a href="#" aria-controls="datatable-arts" data-dt-idx="2" tabindex="0">
														Next
													</a>
												</li>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 컨텐츠 박스 단위 끝 -->
		</div>
	</div>
</div>