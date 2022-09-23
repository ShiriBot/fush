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
									<div class="tag_top col" style="visibility:hidden"></div>
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
												<a class="modifys" href="javascript:modal('${tagName.seqno}','${tagName.name}');" style="display:none;">
													<i class="fa fa-pen-to-square"></i>
												</a>
												<a class="deletes" href="javascript:modal('${tagName.seqno}','${tagName.name}');" style="display:none;">
													<i class="fa fa-circle-xmark"></i>
												</a>
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
							<div class="col tag_modify">
								<span>태그 추가</span>
								<form method="post" class="tag_modifyForm" action="/admin/tagInsert">
									<input type="text" name="tagName">
									<input class="btn btn-primary" type="submit" value="추가">
								</form>
								<span>태그 대분류 추가</span>
								<form method="post" class="tag_modifyForm">
									<input type="text" disabled>
									<input class="btn btn-primary" type="submit" value="추가">
								</form>
								<span>태그 중분류 추가</span>
								<form method="post" class="tag_modifyForm">
									<select>
										<c:forEach items="${tagList}" var="tagList">
										<option value="${tagList.top}">${tagList.top}</option>
										</c:forEach>
									</select>
									<input type="text" disabled>
									<input class="btn btn-primary" type="submit" value="추가">
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
							<div class="cols tag_modify">
								<!-- <span>태그 이름 변경</span> -->
								<a id="modifyBtn" class="btn btn-primary" href="javascript:modeChange('modify')">태그 이름 변경</a>
								<br>
								<a id="deleteBtn" class="btn btn-primary" href="javascript:modeChange('delete')">태그 삭제</a>
								<br>
								<a id="categoryBtn" class="btn btn-secondary" href="#" style="cursor:default;">분류 수정</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div id="modal" class="modal fade">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 id="modalTitle" class="modal-title"></h5>
				<button type="button" class="btn-close" onclick="javascript:modifyClose()"></button>
			</div>
			<div class="modal-body">
				<p id="modalText"></p>
				<form method="post" class="modifyForm" name="modalForm" action="">
					<input type="hidden" name="seqno">
					<input type="text" name="newName">
					<div class="modal-footer">
						<input class="btn btn-primary" name="submit" type="submit" value="변경">
						<input class="btn btn-secondary" type="button" value="취소" onclick="javascript:modifyClose()">
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<script>
	function modeChange(mode){
		var title;
		var text;
		var btn;
		if(mode=='modify'){
			const modifys = document.querySelectorAll('.modifys');
			btn=document.getElementById('modifyBtn').innerHTML;
			if(btn=='태그 이름 변경'){
				modifys.forEach(modify => {
					modify.style.display='inline';
				});
				title='태그 이름 변경';
				text='변경할 이름을 작성해주세요.';
				btn='태그 이름 변경 취소';
				document.forms['modalForm'].elements['submit'].value='변경';
				document.forms['modalForm'].action='/admin/tagModify';
			}else{
				modifys.forEach(modify => {
					modify.style.display='none';
				});
				btn='태그 이름 변경';
			}
			document.getElementById('modifyBtn').innerHTML=btn;
		}else if(mode=='delete'){
			const deletes = document.querySelectorAll('.deletes');
			btn=document.getElementById('deleteBtn').innerHTML;
			if(btn=='태그 삭제'){
				deletes.forEach(delete1 => {
					delete1.style.display='inline';
				});
				title='태그 삭제';
				text='정말 삭제하시겠습니까?';
				btn='태그 삭제 취소';
				document.forms['modalForm'].elements['newName'].disabled=true;
				document.forms['modalForm'].elements['submit'].value='삭제';
				document.forms['modalForm'].action='/admin/tagDelete';
			}else{
				deletes.forEach(delete1 => {
					delete1.style.display='none';
				});
				document.forms['modalForm'].elements['newName'].disabled=false;
				btn='태그 삭제';
			}
			document.getElementById('deleteBtn').innerHTML=btn;
		}
		document.querySelector('.modal-title').InnerHTML=title;
		document.getElementById('modalText').InnerHTML=text;
		/* 왜 안 바뀔까... */
		
	}
	
	function modal(seqno,name){
		document.getElementById('modal').style.display='flex';
		document.getElementById('modal').classList.add("show");
		const modalForm = document.forms['modalForm'];
		modalForm.elements['seqno'].value=seqno;
		modalForm.elements['newName'].value=name;
	}
	
	function modifyClose(){
		document.getElementById('modal').style.display='none';
	}
</script>

<script type="text/javascript" src="/manage/assets/js/dragdrop.js"></script>