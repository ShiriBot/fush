<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
										<c:set value="${artworkList}" var="artworkList"/>
										<form name="artFilter" method="post" action="/admin/artwork">
										<div class="dataTables_length" id="datatable-arts_length">
											<label>한번에 
												<select name="length" class="form-control input-sm" onchange="javascript:document.forms['artFilter'].submit();">
													<c:forEach items="${criteria.lengthOpt}" var="len">
														<option value="${len}" 
															<c:if test="${len eq criteria.length}">
																selected
															</c:if>	
														>
														${len}</option>
													</c:forEach>
												</select> 개씩 보기
											</label>
										</div>
										<div id="datatable-buttons_wrapper" class="dataTables_wrapper dt-bootstrap no-footer" style="display:inline">
											<div class="dt--artworkList-del btn-group">
												<a class="btn btn-default buttons-html5 btn-sm" tabindex="0" aria-controls="datatable-buttons" href="#">
													<span>작품 수정하기</span>
												</a>
											</div>
										</div>
										<div id="datatable-arts_filter" class="dataTables_filter">
											<select name="searchField">
													<option value="name"
														<c:if test="${criteria.searchField eq 'name'}">selected</c:if>
														>작품명</option>
													<option value="author"
														<c:if test="${criteria.searchField eq 'author'}">selected</c:if>
														>작가명</option>
												</select>
												<label>
												검색:
													<input name="keyword" type="search" class="form-control input-sm" onchange="javascript:document.forms['artFilter'].submit();"
														<c:if test="${criteria.keyword ne null}"> value="${criteria.keyword}"</c:if>
													>
												</label>
										</div>
										</form>
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
											<c:set value="${artworkList.currentPage*criteria.length-criteria.length+1}" var="startNum"/>
											<c:if test="${artworkList.currentPage*criteria.length>artworkList.total}">
												<c:set value="${artworkList.total}" var="endNum" />
											</c:if>
											<c:if test="${artworkList.currentPage*criteria.length<artworkList.total}">
												<c:set value="${artworkList.currentPage*criteria.length}" var="endNum" />
											</c:if>
											<tbody>
												<c:if test="${artworkList.content.size() ne 0}">
												<c:forEach items="${artworkList.content}" var ="artList" varStatus="status" begin="${startNum-1}" end="${endNum-1}">
													<tr>
														<td><c:out value="${artList.name}" /></td>
														<td><c:out value="${artList.author}" /></td>
														<td style="max-width:500px;"><c:out value="${artList.detail}" /></td>
														<td><c:out value="${artList.week}" /></td>
														<td style="display: none;"><c:out value="${artList.url}" /></td>
													</tr>
												</c:forEach>
												</c:if>
											</tbody>
										</table>
										<div class="dataTables_info" id="datatable-arts_info" role="status" aria-live="polite">
											Showing <c:out value="${startNum}" /> to ${endNum } of ${artworkList.total} entries
										</div>
										<div class="dataTables_paginate paging_simple_numbers" id="datatable-arts_paginate">
											<ul class="pagination">
												<c:if test="${artworkList.currentPage>artworkList.pagingCount}">
												<li class="paginate_button previous disabled" id="datatable-arts_previous">
													<a href="/admin/artwork?length=${criteria.length}&currentPage=${artworkList.startPage-1}&searchField=${criteria.searchField}&keyword=${criteria.keyword}" >
														Previous
													</a>
												</li>
												</c:if>
												<c:forEach var="num" begin="${artworkList.startPage}" end="${artworkList.endPage}">
												<li class="paginate_arts active">
													<a <c:if test="${num eq artworkList.currentPage}"> class="fw-bolder text-decoration-underline " </c:if>
													href="/admin/artwork?length=${criteria.length}&currentPage=${num}&searchField=${criteria.searchField}&keyword=${criteria.keyword}" >
														${num}
													</a>
												</li>
												</c:forEach>
												<c:if test="${artworkList.totalPages>artworkList.endPage}">
												<li class="paginate_arts active">
													<a href="/admin/artwork?length=${criteria.length}&currentPage=${artworkList.endPage+1}&searchField=${criteria.searchField}&keyword=${criteria.keyword}">
														Next
													</a>
												</li>
												</c:if>
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