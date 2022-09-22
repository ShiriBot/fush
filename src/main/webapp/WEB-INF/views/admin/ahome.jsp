<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 로그인</title>
<link rel="stylesheet" href="css/admin.css">
</head>
<body>
<script src="https://code.jquery.com/jquery-3.6.0.slim.js" 
>
</script>
	<form class="form" name="login" method="post" action="amain" onsubmit="return formCheck()">
		<div style="text-align: center;">
			<label>관리 시스템</label><br>
			<br>
			<input type="text" id="id" name="id" placeholder="아이디"><br> 
			<input type="password" id="pw" name="pw" placeholder="비밀번호 "><br>
			<span id="nene">없애야되는 글</span>
			<br> <br> <input class="loginbtn" type="submit" value="로그인">
		</div>
	</form>
</body>
<script>
// 자바스크립로 글자 없애기
/* document.getElementById("id").addEventListener('click', none);
		function none(){
			document.getElementById("nene").style.display = 'none'
		} */
		
//제이쿼리로 글자 없애기
		$(document).ready(function(){
			$("#id").click(function(){
				$("#nene").hide();
			})
		})
	function formCheck() {
		var id = document.forms["login"]["id"].value;
		if (id == "") {
			alert("아이디를 입력하세요.");
			return false;
		}

		//비밀번호 체크 
		var pw = document.forms["login"]["pw"].value;
		if (pw == "") {
			alert("비밀번호를 입력하세요.");
			return false;
		} else {
		}
	}
</script>
</html>