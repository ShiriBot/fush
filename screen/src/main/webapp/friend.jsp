<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 아이콘 쓰는 링크/나중에 webcss로 옮기기(중복) -->
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>

<script>
	function toggle(){
			const checkbox = document.getElementById('my_checkbox');
			
			const is_checked = checkbox.checked;
			
			const minusBtns = document.querySelectorAll('.minus');
			
			if(is_checked == true){
				minusBtns.forEach(minus => {
					minus.style.display ='block';
				});
			}else{
				minusBtns.forEach(minus => {
					minus.style.display ='none';
				});
			}
	}
</script>
<%@ include file="head.jsp" %>
<title>친구관리</title>
</head>
<body onload="init()">
<%@ include file="header.jsp" %>
<div class="container-md col-md-9 mt-5">
	<ul class="nav justify-content-sm-between mb-3">
		<!-- 돌아가기 버튼 -->
		<li class="nav-item">
			<a class="nav-link" style="text-align:left" href="mypage.jsp">◀ 돌아가기</a>
		</li>
		<li class="nav-item">
			<button type="button" class="btn btn-primary" onclick="getElementById('friendModal').style.display='block';getElementById('friendModal').classList.add('show');">친구찾기</button>
		</li>
		<li class="nav-item">
			<label  class="switch-button">
			<input type="checkbox" onclick="toggle()" id="my_checkbox">
		    <span class="onoff-switch"></span>
			</label>
		</li>
	</ul>
	<div class="row justify-content-center">
		<!-- 친구목록 -->
		<!-- 친구목록 프로필사진div -->
		<div class="friendthumb col-2">
			<div><a href="#"><img src="images/profile.png"></a></div>
		</div>
		<!-- 친구의 간단한 설명div -->
		<div class="friendName col-4">
			<h3>임정후</h3>
			<div class="friendTag">OOO님의 웹툰취향은 #일상입니다.</div>
			<div class="friendTag">#일상,#성장,#스토리</div>
		</div>
		<!-- 친구의 추천웹툰 -->
		<div class="friendToonRanking col-6">
			<h5 class="hTitle">OOO님의 추천웹툰</h5>
			<div class="thrBox">
				<div class="FwebtoonThumb">
					<img src="images/doctor.jpg">
				</div>
				<div class="FwebtoonTitle"><a href="#">내과의사 박원장</a></div>
				<div class="FwebtoonStar">★★★★</div>
			</div>
			<div class="thrBox">
				<div class="FwebtoonThumb"><img src="images/doctor.jpg"></div>
				<div class="FwebtoonTitle"><a href="#">내과의사 박원장</a></div>
				<div class="FwebtoonStar">★★★★</div>
			</div>
			<!-- 마이너스 아이콘 -->
			<a href="#">
				<ion-icon name="remove-circle-outline" class="minus"></ion-icon>
			</a>
		</div>
	</div>
		<!-- 친구찾기용 모달 -->
		<div class="modal fade" id="friendModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="friendModalLabel">친구찾기</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<form name="idSearchForm">
							<div class="mb-3">
								<label for="id" class="col-form-label">
									찾으려는 id를 입력하세요
								</label>
								<input type="text" class="form-control" id="id" onchange="javascript:idSearch()">
								<div class="row" id="idSearchResult"></div>
							</div>
						</form>
					</div>
					<!-- <div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
						<button type="button" class="btn btn-primary">Save changes</button>
					</div> -->
				</div>
			</div>
		</div>
	</div>
<%@ include file="footer.jsp" %>

</body>
<script>
function idSearch() {
	var id = document.forms['idSearchForm']['id'].value;
	var x = new XMLHttpRequest();
	x.open('GET', '/mypage/friendSearch?id='+id, true);
	x.send();

	x.onreadystatechange = function() {
		if (x.readyState === 4 && x.status === 200) {
			console.log('ok')
			var rsp = x.responseText.trim();
			var result = document.getElementById('idSearchResult');
				if (rsp === 'ok') {
					result.innerHTML = '<div class="col"><span>추가가능</span></div>';
				} else {
					result.innerHTML = '<div class="col"><span>검색결과가 없어요</span></div>';
				}
		} else {
			console.log("server error")
		};
	}

	
}

</script>


</html>