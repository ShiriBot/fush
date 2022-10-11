<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작품 수정하기</title>
<%@ include file="manage_head.jsp" %>
<script src="https://unpkg.com/dropzone@5/dist/min/dropzone.min.js"></script>
<link rel="stylesheet" href="https://unpkg.com/dropzone@5/dist/min/dropzone.min.css" type="text/css" />
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
			<form id="artModifyForm" class="form-horizontal form-label-left" enctype="multipart/form-data">
				<div class="form-group row ">
					<label class="control-label col-md-3 col-sm-3 ">
						대표 이미지
						<span id="fileUpload" class="badge badge-success">파일 업로드</span>
						<div id="upload"></div>
						<!-- <span id="imageLink" class="badge badge-info">이미지 링크</span> -->
					</label>
					<div id="" class="col-md-9 col-sm-9 imageDiv">
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
<script>
var seqno = "${info.seqno}";
console.log(seqno);

var artModify = (function(){
	
	function getInfo(seqno, callback, error){
 		console.log('getInfo called..');
 		$.getJSON({
 			type: 'get',
 			url : '/adminRest/artModify/'+seqno,
 			contentType : 'application/json; charset=utf-8',
 			
 			success : function(result, status, xhr){
 				if(callback){
 					callback(result);
 				}
 			},
 			error : function(){
 				if(error){
 					error(er);
 				}
 			}
 		});
 	}
	
	function setImageLink(imageLink, callback,error){
 		console.log('image link called...');
 		console.log(seqno);
 		$.ajax({
 			type:'post',
 			url:'/adminRest/setImageLink/'+seqno,
 			data: JSON.stringify(imageLink),
 			contentType: 'application/json; charset=utf-8',
 			success : function(result, status, xhr){
 				if(callback){
 					callback(result);
 				}
 			},
 			error : function(xhr, status, er){
 				if(error){
 					error(er);
 				}
 			}
 		
 		});
 	}
	
	function setImageFile(imageLink, callback,error){
 		console.log('image link called...');
 		console.log(seqno);
 		$.ajax({
 			type:'post',
 			url:'/adminRest/setImageLink/'+seqno,
 			data: JSON.stringify(imageLink),
 			contentType: 'application/json; charset=utf-8',
 			success : function(result, status, xhr){
 				if(callback){
 					callback(result);
 				}
 			},
 			error : function(xhr, status, er){
 				if(error){
 					error(er);
 				}
 			}
 		
 		});
 	}
	
	return {
		getInfo:getInfo,
		setImageLink:setImageLink
	};
})();

$(document).ready(function(){
	
	$('#fileUpload').on('click', function(e){
		console.log('file upload click');
		$('#upload').html('<input type="file" name="imageInput" id="imageInput" accept="image/*">');
	});
	
	$('#imageLink').on('click', function(e){
		console.log('image link click');
		var imageLink = prompt('이미지 경로를 입력하세요');
		artModify.setImageLink(imageLink,function(){});
		showInfo();
	});
	
	$('#upload').on('change','input',function(e){
		console.log($(this)[0]);
		const imageInput = $(this)[0];
		const formData = new FormData();
		formData.append("image", imageInput.files[0]);
		
		$.ajax({
			type:'POST',
			url: '/adminRest/setImageFile/'+seqno,
			processData: false,
			contentType: false,
			data: formData,
			//data: $(this)[0].files[0],
			dataType: 'json',
			success: function(result){
				console.log('result: ', result)
			},
			err: function(err){
				console.log("err:", err)
			}
		})
	});
	
	function showInfo(){
		artModify.getInfo(seqno,function(info){
			var str='<img id="image" class="form-control" src="'+info.imageRoute+'">';
			$('#imageDiv').html(str);
		});
	}
});
</script>
</html>