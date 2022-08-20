<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
	<head>
		<title>관리자 페이지-메인</title>
		<%@ include file="manage_head.jsp" %>
	</head>
	
	<body class="nav-md" id="nav_body">
		<div class="container body">
			<div class="main_container">
				<%@ include file="manage_sidebar.jsp" %>
				<%@ include file="manage_topnav.jsp" %>
				<%@ include file="manage_main.jsp" %>
			</div>
		</div>
	</body>
	
<script>
	function bodyClassChange(){
		const bodyClass = document.getElementById('nav_body').className;
		if(bodyClass=='nav-md'){
			document.getElementById('nav_body').className='nav-sm'
		}else{
			document.getElementById('nav_body').className='nav-md'
		}
		
	}
</script>
</html>