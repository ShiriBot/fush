<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="header">
	<input type="hidden" id="loginStat" value="<%= session.getAttribute("login") %>">
	<div class="topNavigation">
		<a href="main.jsp"><img src="images/logo.png"></a>
	</div>
	<div style="display:flex">
	<div class="sizeOfSearchBar">
		<fieldset class="field-container">
			<input type="text" placeholder="Search..." class="field" />
		
			<div class="icons-container">
				<div class="icon-search"></div>
				<div class="icon-close">
					<div class="x-up"></div>
					<div class="x-down"></div>
				</div>
			</div>
		</fieldset>
	</div>
		<a class="btn primary" href="search.jsp" style="margin-left:10px;"> 상세검색</a>
	</div>
	<div>
		<a class="btn primary"  href="rating.jsp" id="rating"> 평가하기 </a>
		 
<% if(session.getAttribute("login")==null) {%>	
			<a class="btn primary"  href="loginProc.jsp" id="login"> 로그인</a>
			<a class="btn primary"  href="signup.jsp" id="member">회원가입</a>
<% } else{ %>
			<a class="btn primary"  href="logoutProc.jsp" id="logout"> 로그아웃</a>
			<a class="btn primary"  href="mypage.jsp" id="mypage">마이페이지</a>
<%} %>		
	</div>
</div>
