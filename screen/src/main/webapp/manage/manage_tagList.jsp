<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
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
					<c:forEach items="${tagList}" var="tagLists">
						<c:if test="${mid ne tagLists.mid}">
							<div class="row">
								<c:if test="${top ne tagLists.top}">
								<div class="tag_top col">
									${tagLists.top}
								</div>
								</c:if>
								<c:if test="${top eq tagLists.top}">
								<div class="tag_top col" style="visibility:hidden">
									${tagLists.top}
								</div>
								</c:if>
									<c:set value="${tagLists.top}" var="top"/>
								<c:if test="${top ne tagLists.mid}">
									<div class="tag_mid col">
											${tagLists.mid}
									</div>
								</c:if>
								<c:set value="${tagLists.mid}" var="mid"/>
								<div class="drag-container col-8">
									<c:forEach items="${tagList}" var="tagName">
									<c:if test="${top eq tagName.top && mid eq tagName.mid}">
									<div class="tag" draggable="true">
									${tagName.name}
									</div>
									</c:if>
									</c:forEach>
								</div>
							</div>
						</c:if>
					</c:forEach>
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