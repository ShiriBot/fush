<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<input type="hidden" name="msg" value="<%= request.getAttribute("msg") %>">
<!-- 일단 세션정보를 저장하려던거 같아서... 근데 굳이 컨테이너 안에 넣을 필요가 있는지...? 위치를 잘 모르겠음. -->
<nav class="navbar navbar-expand-lg sticky-top navbar-light bg-light">
	<!-- navbar:네비바. navbar-expand-lg: lg breakpoint(960px)이하면 아이콘 단축, navbar-light: light테마, bg-light:색상지정-->
	<div class="container-fluid">
		<!-- container-fluid: 모든 화면에서 width 100% -->
		<a class="navbar-brand" href="/">
		<!-- navbar-brand : 로고 등을 넣는 위치로... 적당한 패딩 등 있는거 --> 
			<!-- <img src="images/logo.png" alt="" class="d-inline-block align-text-top"> -->
			A-chu
		</a>
		
		<div class="col-sm-4" id="navbarSupportedContent1">
			<div class="row">
			<form id="search" class="col-9" method="get" action ="/search_new">
				<fieldset class="field-container">
					<input type="text" placeholder="Search..." class="field" name ="keyword" />
					<div class="icons-container">
						<div class="icon-search"></div>
						<div class="icon-close">
							<div class="x-up"></div>
							<div class="x-down"></div>
						</div>
					</div>
				</fieldset>
			</form>
			<a class="col-3 nav-link primary" href="javascript:document.getElementById('search').submit()"> 상세검색</a>
			</div>
		</div>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			<!-- navbar-toggler : 좁아지면 나타나는 토글영역(햄버거버튼 등) -->
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent2">
			<!-- collapse : 정확히는 파악이 되지 않는데?...?? -->
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<!-- navbar-nav: nav-item블록, me-auto: 오른쪽 margin auto, mb-2: marginbottom 0.5, mb-lg-0 : 992px 이하에서 marginbottom 0 -->
				<!-- <li class="nav-item">
					개별 아이템 
					<a class="nav-link active" aria-current="page" href="main_new.jsp">
					nav-link: 상속에 따라 달라짐... 미쳣내, class="active"&aria-current="page": 현재 페이지 표시용인데... 이게 어떤 방식으로 작동하는지는 더 해봐야 할듯
						Home
					</a> 
				</li> -->
				<li class="nav-item">
					<a class="nav-link primary" href="/rating">
						평가하기
					</a>
				</li>
<% if(session.getAttribute("sess_id")==null) {%>
				<li class="nav-item">
					<a class="nav-link primary" href="/goLogin">
					로그인
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link navBtn primary" href="/signup">
						회원가입
					</a>
				</li>
<% } else{ %>
				<li class="nav-item">
					<a class="nav-link primary"  href="/logout" id="logout">
						로그아웃
					</a>
				</li>
				<li class="nav-item">
					<a  class="nav-link primary" href="/mypage/mypage" id="mypage">
						마이페이지
					</a>
				</li>
<%} %>										
				<!-- <li class="nav-item">
          <a class="nav-link disabled">Disabled</a>
        </li> -->
			</ul>
			
		</div>
	</div>
</nav>
<!-- <script type="text/javascript">
  $(document).ready(function () {
	  var searchField = $("#navbarSupportedContent1");
	  var keyword = searchField.find("input[name='searchArt']");
	  	  
	  $("input").on("keyup",function(key){
		  if(key.keyCode==13) {
      	
         }    
    });
  });
</script> -->