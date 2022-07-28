<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="header">
	<input type="hidden" id="loginStat" value="<%= session.getAttribute("login") %>">
	<div>
		<a href="main.jsp"><img src="images/logo.png"></a>
	</div>
	<div>
<% if(session.getAttribute("login")==null) {%>	
			<a href="loginProc.jsp" id="login"> 로그인</a>
			<a href="signup.jsp" id="member">회원가입</a>
<% } else{ %>
			<a href="logoutProc.jsp" id="logout"> 로그아웃</a>
			<a href="mypage.jsp" id="mypage">마이페이지</a>
<%} %>		
	</div>
</div>

<script>

</script>

<%@ include file="topnav.jsp"%>
