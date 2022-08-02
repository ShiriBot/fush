<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>

* {
	box-sizing:border-box;
}
.login {
	position:fixed;
	top:50%;
	left:50%;
	transform:translate(-50%, -50%);
	
	display: block;
	
	border : 1px solid black;
	padding: 10px;
	
	text-align:center;
}
.login input {
	display: block;
	width:100%;
	margin-bottom:10px;
}


</style>
<title>관리자 로그인</title>
</head>
<body>
	<div class="login">
		<p>관리시스템</p>
		<form action="manage_index.jsp">
			<input type="text">
			<input type="password">
			<input type="submit">
		</form>
	</div>

</body>
</html>