<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<div class="artDetailFrame">
	<c:set value ="${detail}" var ="art"/>
	<div class="artDetail">
			<img class="detailImg" src="images/no_home.jpg">
			<button class="bttn-bordered bttn-xs bttn-primary">보러가기</button>
			<h1 style="display:inline-block;">${art.name }</h1>
			<div style="display:inline-block;">연재중</div>
			<h3>와난</h3>
			<div>평균 평점 : ★★★★★</div>
			<a href="#">#스토리</a><a href="#">#드라마</a>
			<div>집을 버리고 뛰쳐나간 고해준, 집 없이 텐트 생활하는 문제아 백은영. 
악연으로 만난 두 사람은 버려진 옛날 기숙사에서 함께 살게 되는데..
기숙사도 서로도 싫지만 돌아갈 곳이 없는 두 사람의 힘든 성장 이야기</div>
	</div>
	<c:set value="${loginUser}" var ="user"/>
	<div class="replyArrange">
		<div class="replyFrame">
			<div class="replyCard">
				<div class="replyHead">
					<strong> 작성자</strong> <small> 2022.07.28.</small>
				</div>
				<p>내용내용내용</p>
			</div>
			
		</div>
	</div>
	</div>
	<script type="text/javascript" src="/js/reply.js"></script>
<script>
	var id = '<c:out value="${user.id}"/>'
	var seqno = '<c:out value="${art.seqno}"/> ';
$(document).ready(function(){

	console.log(replyService); 
});
</script>




