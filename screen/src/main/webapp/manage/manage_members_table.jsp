<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="right_col" role="main">
	<div class="">
		<div class="page-title">
			<div class="title_left">
				<h3>
					회원목록<!-- 페이지 타이틀 --> <small><!-- 페이지 부제목 --></small>
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
							전체회원목록 <!-- 테이블 제목 -->
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
										테이블 설명
									</p>
									<div id="datatable-members_wrapper" class="dataTables_wrapper container-fluid dt-bootstrap no-footer">
										<div class="dataTables_length" id="datatable-members_length">
											<label>한번에 
												<select name="datatable-members_length" aria-controls="datatable-members" class="form-control input-sm">
													<option value="10">10</option>
													<option value="25">25</option>
													<option value="50">50</option>
													<option value="100">100</option>
												</select> 명씩 보기
											</label>
										</div>
										<div id="datatable-members_filter" class="dataTables_filter">
											<label>
											검색:
												<input type="search" class="form-control input-sm" placeholder="" aria-controls="datatable-members">
											</label>
										</div>
										<table id="datatable-members" class="table table-striped table-bordered dataTable no-footer dtr-inline">
											<thead>
												<tr role="row">
													<th class="sorting_asc" tabindex="0" aria-controls="datatable-members" rowspan="1" colspan="1"
														aria-sort="ascending" aria-label="ID: activate to sort column descending">
														ID
													</th>
													<th class="sorting" tabindex="0" aria-controls="datatable-members" rowspan="1" colspan="1"
														aria-label="Name: activate to sort column ascending">
														이름
													</th>
													<th class="sorting" tabindex="0" aria-controls="datatable-members" rowspan="1" colspan="1"
														aria-label="Mail: activate to sort column ascending">
														메일주소
													</th>
													<th class="sorting" tabindex="0" aria-controls="datatable-members" rowspan="1" colspan="1"
														aria-label="Grade: activate to sort column ascending">
														등급
													</th>
													<th class="sorting" tabindex="0" aria-controls="datatable-members" rowspan="1" colspan="1"
														aria-label="Start date: activate to sort column ascending">
														가입일자
													</th>
													<th class="sorting" tabindex="0" aria-controls="datatable-members" rowspan="1" colspan="1"
														aria-label="Bith: activate to sort column ascending">
														생년월일(Opt)
													</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>limfisherman</td>
													<td>임정후</td>
													<td>몰?루?</td>
													<td>관리자</td>
													<td>2022.08.04</td>
													<td>(입력안함)</td>
												</tr>
												<tr>
													<td>shiri_bot</td>
													<td>채정실</td>
													<td>cowjdtlf@gmail.com</td>
													<td>관리자</td>
													<td>2022.08.04</td>
													<td>1991.09.06.</td>
												</tr>
											</tbody>
										</table>
										<div class="dataTables_info" id="datatable-members_info" role="status" aria-live="polite">
											Showing 1 to 1 of 2 entries
										</div>
										<div class="dataTables_paginate paging_simple_numbers" id="datatable-members_paginate">
											<ul class="pagination">
												<li class="paginate_button previous disabled" id="datatable-members_previous">
													<a href="#" aria-controls="datatable-members" data-dt-idx="0" tabindex="0">
														Previous
													</a>
												</li>
												<li class="paginate_members active">
													<a href="#" aria-controls="datatable-members" data-dt-idx="1" tabindex="0">
														1
													</a>
												</li>
												<li class="paginate_members active">
													<a href="#" aria-controls="datatable-members" data-dt-idx="2" tabindex="0">
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
			<!--신규회원 목록 -->
			<div class="col-md-12 col-sm-12 ">
				<div class="x_panel">
					<div class="x_title">
						<h2>
							신규회원목록 <!-- 테이블 제목 -->
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
										최근 일주일 이내에 가입한 회원의 목록입니다.
									</p>
									<div id="datatable-members-new_wrapper" class="dataTables_wrapper container-fluid dt-bootstrap no-footer">
										<div class="dataTables_length" id="datatable-members-new_length">
											<label>한번에 
												<select name="datatable-members-new_length" aria-controls="datatable-members-new" class="form-control input-sm">
													<option value="10">10</option>
													<option value="25">25</option>
													<option value="50">50</option>
													<option value="100">100</option>
												</select> 명씩 보기
											</label>
										</div>
										<div id="datatable-members-new_filter" class="dataTables_filter">
											<label>
											검색:
												<input type="search" class="form-control input-sm" placeholder="" aria-controls="datatable-members-new">
											</label>
										</div>
										<table id="datatable-members-new" class="table table-striped table-bordered dataTable no-footer dtr-inline">
											<thead>
												<tr role="row">
													<th class="sorting_asc" tabindex="0" aria-controls="datatable-members-new" rowspan="1" colspan="1"
														aria-sort="ascending" aria-label="ID: activate to sort column descending">
														ID
													</th>
													<th class="sorting" tabindex="0" aria-controls="datatable-members-new" rowspan="1" colspan="1"
														aria-label="Name: activate to sort column ascending">
														이름
													</th>
													<th class="sorting" tabindex="0" aria-controls="datatable-members-new" rowspan="1" colspan="1"
														aria-label="Mail: activate to sort column ascending">
														메일주소
													</th>
													<th class="sorting" tabindex="0" aria-controls="datatable-members-new" rowspan="1" colspan="1"
														aria-label="Grade: activate to sort column ascending">
														등급
													</th>
													<th class="sorting" tabindex="0" aria-controls="datatable-members-new" rowspan="1" colspan="1"
														aria-label="Start date: activate to sort column ascending">
														가입일자
													</th>
													<th class="sorting" tabindex="0" aria-controls="datatable-members-new" rowspan="1" colspan="1"
														aria-label="Bith: activate to sort column ascending">
														생년월일(Opt)
													</th>
												</tr>
											</thead>
										</table>
										<div class="dataTables_info" id="datatable-members-new_info" role="status" aria-live="polite">
											Showing 1 to 1 of 0 entries
										</div>
										<div class="dataTables_paginate paging_simple_numbers" id="datatable-members-new_paginate">
											<ul class="pagination">
												<li class="paginate_button previous disabled" id="datatable-members-new_previous">
													<a href="#" aria-controls="datatable-members-new" data-dt-idx="0" tabindex="0">
														Previous
													</a>
												</li>
												<li class="paginate_members-new active">
													<a href="#" aria-controls="datatable-members-new" data-dt-idx="1" tabindex="0">
														1
													</a>
												</li>
												<li class="paginate_members-new active">
													<a href="#" aria-controls="datatable-members" data-dt-idx="2" tabindex="0">
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
			<div class="col-md-12 col-sm-12 ">
				<div class="x_panel">
					<div class="x_title">
						<h2>
							탈퇴회원목록 <!-- 테이블 제목 -->
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
										탈퇴요청한 회원 목록입니다.
									</p>
									<div id="datatable-members-del_wrapper" class="dataTables_wrapper container-fluid dt-bootstrap no-footer">
										<div class="dataTables_length" id="datatable-members-del_length">
											<label>한번에 
												<select name="datatable-members-del_length" aria-controls="datatable-members-del" class="form-control input-sm">
													<option value="10">10</option>
													<option value="25">25</option>
													<option value="50">50</option>
													<option value="100">100</option>
												</select> 명씩 보기
											</label>
										</div>
										<div id="datatable-members-del_filter" class="dataTables_filter">
											<label>
											검색:
												<input type="search" class="form-control input-sm" placeholder="" aria-controls="datatable-members-del">
											</label>
										</div>
										<table id="datatable-members-del" class="table table-striped table-bordered dataTable no-footer dtr-inline">
											<thead>
												<tr role="row">
													<th class="sorting_asc" tabindex="0" aria-controls="datatable-members-del" rowspan="1" colspan="1"
														aria-sort="ascending" aria-label="ID: activate to sort column descending">
														ID
													</th>
													<th class="sorting" tabindex="0" aria-controls="datatable-members-del" rowspan="1" colspan="1"
														aria-label="Name: activate to sort column ascending">
														이름
													</th>
													<th class="sorting" tabindex="0" aria-controls="datatable-members-del" rowspan="1" colspan="1"
														aria-label="Mail: activate to sort column ascending">
														메일주소
													</th>
													<th class="sorting" tabindex="0" aria-controls="datatable-members-del" rowspan="1" colspan="1"
														aria-label="Grade: activate to sort column ascending">
														등급
													</th>
													<th class="sorting" tabindex="0" aria-controls="datatable-members-del" rowspan="1" colspan="1"
														aria-label="Start date: activate to sort column ascending">
														가입일자
													</th>
													<th class="sorting" tabindex="0" aria-controls="datatable-members-del" rowspan="1" colspan="1"
														aria-label="Bith: activate to sort column ascending">
														생년월일(Opt)
													</th>
												</tr>
											</thead>
										</table>
										<div class="dataTables_info" id="datatable-members-del_info" role="status" aria-live="polite">
											Showing 1 to 1 of 0 entries
										</div>
										<div class="dataTables_paginate paging_simple_numbers" id="datatable-members-del_paginate">
											<ul class="pagination">
												<li class="paginate_button previous disabled" id="datatable-members-del_previous">
													<a href="#" aria-controls="datatable-members" data-dt-idx="0" tabindex="0">
														Previous
													</a>
												</li>
												<li class="paginate_members-del active">
													<a href="#" aria-controls="datatable-members-del" data-dt-idx="1" tabindex="0">
														1
													</a>
												</li>
												<li class="paginate_members-del active">
													<a href="#" aria-controls="datatable-members" data-dt-idx="2" tabindex="0">
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