<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작품 수정하기</title>
<%@ include file="manage_head.jsp" %>
</head>
<body>
	<div class="x_panel">
		<div class="x_title">
			<h2>
				작품 수정하기
			</h2>
			<div class="clearfix"></div>
		</div>
		<div class="x_content">
			<br>
			<form class="form-horizontal form-label-left">
				<div class="form-group row ">
					<label class="control-label col-md-3 col-sm-3 ">
						대표 이미지
						<span class="badge badge-primary">수정</span>
					</label>
					<div class="col-md-9 col-sm-9 ">
						<img id="image" class="form-control" src="${info.imageRoute}">
					</div>
				</div>
				<div class="form-group row ">
					<label class="control-label col-md-3 col-sm-3 ">
						작품명
						<span class="badge badge-primary">수정</span>
					</label>
					<div class="col-md-9 col-sm-9 ">
						<input id="name" type="text" class="form-control" value="${info.name}">
					</div>
				</div>
				<div class="form-group row ">
					<label class="control-label col-md-3 col-sm-3 ">
						작가명
						<span class="badge badge-primary">수정</span>
					</label>
					<div class="col-md-9 col-sm-9 ">
						<input id="author" type="text" class="form-control" value="${info.author}">
					</div>
				</div>
				<div class="form-group row">
					<label class="control-label col-md-3 col-sm-3 ">
						작품설명
						<span class="badge badge-primary">수정</span>
					</label>
					<div class="col-md-9 col-sm-9 ">
						<textarea id="detail" class="form-control" rows="3">${info.detail}</textarea>
					</div>
				</div>
				<div class="form-group row">
					<label class="control-label col-md-3 col-sm-3 ">
						연재처
						<span class="badge badge-primary">수정</span>
					</label>
					<div class="col-md-9 col-sm-9 ">
						<select class="form-control">
							<option <c:if test="${info.plaform=='네이버 웹툰'}">selected</c:if>>네이버 웹툰</option>
							<option <c:if test="${info.plaform=='카카오 웹툰'}">selected</c:if>>카카오 웹툰</option>
							<option <c:if test="${info.plaform=='레진코믹스'}">selected</c:if>>레진코믹스</option>
						</select>
					</div>
				</div>
				<div class="control-group row">
					<label class="control-label col-md-3 col-sm-3 ">작품 태그 관리</label>
					<div class="col-md-9 col-sm-9 ">
						<input id="tags_1" type="text" class="tags form-control" value="social, adverts, sales" data-tagsinput-init="true" style="display: none;">
						<div id="tags_1_tagsinput" class="tagsinput" style="width: auto; min-height: 100px; height: 100px;">
							<c:forEach items="${info.tag}" var="tag">
								<span class="tag">
									<span>${tag.name}&nbsp;&nbsp;</span>
									<a href="#" title="Removing tag">x</a>
								</span>
							</c:forEach>
							<div id="tags_1_addTag">
								<input id="tags_1_tag" value="" placeholder="add a tag" style="color: rgb(102, 102, 102); width: 72px;">
							</div>
							<div class="tags_clear"></div>
						</div>
						<div id="suggestions-container" style="position: relative; float: left; width: 250px; margin: 10px;"></div>
					</div>
				</div>
				<!-- <div class="ln_solid"></div>
				<div class="form-group">
					<div class="col-md-9 col-sm-9  offset-md-3">
						<button type="button" class="btn btn-primary">Cancel</button>
						<button type="reset" class="btn btn-primary">Reset</button>
						<button type="submit" class="btn btn-success">Submit</button>
					</div>
				</div> -->
			</form>
		</div>
	</div>
</body>
</html>