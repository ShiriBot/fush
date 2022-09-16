<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link rel="stylesheet" href="/css/star.css">
<div class="ratingFrame">

	<div class="ratingImgFrame">
		<src img="images/jojo.jpg" class="ratingImg">
	</div>
	<div class="ratingContent">
		<div class="ratingReply">
			<h3 class="ratingTitle">작품제목</h3>
			<button onclick ="default1()" id="replyModal">
				<ion-icon name="ellipsis-vertical-outline"></ion-icon>
			</button>
		</div>
		<h4 class="ratingArtist">작가명</h4>
<script src="/js/star.js" ></script>
		<form name="reviewform" class="reviewform" method="post" action="/save">
            <input type="hidden" name="rate" id="rate" value="0"/>
            <div class="warning_msg">별점을 선택해 주세요.</div>
                <div class="rating">
                    <div class="ratefill"></div>
                    <!-- [D] 해당 별점이 선택될 때 그 점수 이하의 input엘리먼트에 checked 클래스 추가 -->
                    <input type="checkbox" name="rating" id="rating1" value="1" class="rate_radio" title="1점">
                    <label for="rating1"></label>
                    <input type="checkbox" name="rating" id="rating2" value="2" class="rate_radio" title="2점">
                    <label for="rating2"></label>
                    <input type="checkbox" name="rating" id="rating3" value="3" class="rate_radio" title="3점" >
                    <label for="rating3"></label>
                    <input type="checkbox" name="rating" id="rating4" value="4" class="rate_radio" title="4점">
                    <label for="rating4"></label>
                    <input type="checkbox" name="rating" id="rating5" value="5" class="rate_radio" title="5점">
                    <label for="rating5"></label>
                </div>
      	  	</form>	
           </div>
		<div class="cmd">
                <input type="button" name="save" id="save" value="등록">
            </div>
	</div>
