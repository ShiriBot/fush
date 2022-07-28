<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div class="ratingFrame">
	<div class="ratingImgFrame">
		<div class="ratingImg">
		</div>
	</div>
	<div class="ratingContent">
		<h3 class="ratingTitle">작품제목</h3>
		<h4 class="ratingArtist">작가명</h4>
		<form name="ratingform" class="ratingform" method="post" action="./save">
			<fieldset>
				<input type="radio" name="rating" value="5" id="rate1">
				<label for="rate1">⭐</label>
				<input type="radio" name="rating" value="4" id="rate2">
				<label for="rate2">⭐</label>
				<input type="radio" name="rating" value="3" id="rate3">
				<label for="rate3">⭐</label>
				<input type="radio" name="rating" value="2" id="rate4">
				<label for="rate4">⭐</label>
				<input type="radio" name="rating" value="1" id="rate5">
				<label for="rate5">⭐</label>
			</fieldset>
		</form>
	</div>
</div>