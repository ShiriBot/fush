<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value ="${detail}" var ="art"/>
<div class="ratingContainer pt-5">

</div>
<!-- 댓글 모달 -->
<div id="reply" >
<div id = "reply_modal d-flex">
<div class="reply_content  justify-content-center ">
<input id="comment" name="content" class="col-10"type="text" style="height:50%; margin-left: 8%;" placeholder="한줄평을 남겨주세요.">
<div class="col-10 mt-1 " style="height:10%; margin-left:40%;">
<button id="modifyConfig" class="btn btn-outline-primary">등록</button>
<button id="modalColseBtn"class="btn btn-outline-primary">닫기</button>
</div>
</div>
</div>
</div>
<!-- 스크립트 -->
<script type="text/javascript" src="/js/rating.js"></script>
<script>
var id = '<c:out value="${sess_id}"/>'
var seqno = '<c:out value="${art.seqno}"/>';
var modal = $("#reply");
$(document).ready(function(){
		console.log('seq : ' ,seqno);
	
showRatingList();
modal.hide();

	/*$(".ratingContainer").on("click",function(e){
	 var ch = $(this).parent().parent().parent().parent(".row").val(); 
	 var ch = $(this).children().children().children().children(".ch").val(); 
	 var starValue = e.target.value;
		rating(starValue);
		showRatingList();
	}); */

	function showRatingList(){
		ratingService.list(id,function(list){
			if(list == null || list.length==0){
				$(".ratingContainer").html("모든 작품을 평가하셨어요!");
				return;
			}
			var str=""
			for(var i= 0, len=list.length || 0; i < len; i++){
				/* console.log("list.name : ",list[i].name); */
				str+='<div class="row align-items-start mb-5">'
				str+=	'<div class="ratingImg col-2">'
				str+=		'<img src="'+ list[i].imageRoute +'" onclick=location.href="/artDetail/detail?seqno='+list[i].seqno+'" >'
				str+=	'</div>'
				str+=	'<div class="tests col-10">'
				str+=		'<div class="ratingReply justify-content-start"> <input type="hidden" value="'+list[i].seqno+'"id ="aTag">'
				str+=			'<h1 class="ratingTitle" > <a href="/artDetail/detail?seqno='+list[i].seqno+'" >'+list[i].name+'</a></h1>'
				str+=			'<h4 class="ratingArtist mt-1">'+list[i].author+'</h4>'
				str+=		'</div>'
				/* 별점부분 */
				str+=	'<div class="row align-items-start justify-content-between mt-5">'
				str+=		'<div class="rating-group col-11 mt-2">'
				
				str+=			'<input class="rating__input rating__input--none ch" checked name="rating'+i+'" id="rating0-0" value="0" type="radio">'
				str+=			' <label aria-label="0 stars" class="rating__label" for="rating0-0" data-star ="0" >&nbsp;</label>'
					for(var j = 0; j <6; j++){
						if(j >0){
				str+=			'<input class="rating__input rating__input ch" checked name="rating'+i+'" id="rating'+i+'-'+j*10+'" value="'+j+'" type="radio">'
				str+=			' <label aria-label="'+j+' stars" class="rating__label" for="rating'+i+'-'+j*10+'" data-star ="'+j+'" ><i class="rating__icon rating__icon--star fa fa-star"></i></label>'
						}
						if(j < 5){ 
				str+=			'<input class="rating__input" name="rating'+i+'" id="rating'+i+'-'+j+'5" value="'+j+'.5" type="radio">'
				str+=			' <label aria-label="'+j+'.5 stars" class="rating__label rating__label--half" for="rating'+i+'-'+j+'5"" ><i class="rating__icon rating__icon--star fa fa-star-half"></i></label>'
						}
				}
				
				/*str+=			' <label aria-label="1 star" class="rating__label" for="rating2-10'+i+'"><i class="rating__icon rating__icon--star fa fa-star"></i></label>'
	        	str+=			'<input class="rating__input" name="rating2" id="rating2-10'+i+'" value="1" type="radio">'
	        	
        		str+=			' <label aria-label="1.5 stars" class="rating__label rating__label--half" for="rating2-15'+i+'"><i class="rating__icon rating__icon--star fa fa-star-half"></i></label>'
		        str+=			'<input class="rating__input" name="rating2" id="rating2-15'+i+'" value="1.5" type="radio">'
		        
	        	str+=			' <label aria-label="2 stars" class="rating__label" for="rating2-20'+i+'"><i class="rating__icon rating__icon--star fa fa-star"></i></label>'
   				str+=			'<input class="rating__input" name="rating2" id="rating2-20'+i+'" value="2" type="radio">'
   				
       			str+=			' <label aria-label="2.5 stars" class="rating__label rating__label--half" for="rating2-25'+i+'"><i class="rating__icon rating__icon--star fa fa-star-half"></i></label>'
				str+=			'<input class="rating__input" name="rating2" id="rating2-25'+i+'" value="2.5" type="radio" checked>'
				
				str+=			' <label aria-label="3 stars" class="rating__label" for="rating2-30'+i+'"><i class="rating__icon rating__icon--star fa fa-star"></i></label>'
				str+=			'<input class="rating__input" name="rating2" id="rating2-30'+i+'" value="3" type="radio">'
				
				str+=			' <label aria-label="3.5 stars" class="rating__label rating__label--half" for="rating2-35'+i+'"><i class="rating__icon rating__icon--star fa fa-star-half"></i></label>'
				str+=			'<input class="rating__input" name="rating2" id="rating2-35'+i+'" value="3.5" type="radio">'
				
		        str+=			' <label aria-label="4 stars" class="rating__label" for="rating2-40'+i+'"><i class="rating__icon rating__icon--star fa fa-star"></i></label>'
	        	str+=			'<input class="rating__input" name="rating2" id="rating2-40'+i+'" value="4" type="radio">'
	        	
		        str+=			' <label aria-label="4.5 stars" class="ra	ting__label rating__label--half" for="rating2-45'+i+'"><i class="rating__icon rating__icon--star fa fa-star-half"></i></label>'
        		str+=			'<input class="rating__input" name="rating2" id="rating2-45'+i+'" value="4.5" type="radio">'
        		
		        str+=			' <label aria-label="5 stars" class="rating__label" for="rating2-50'+i+'"><i class="rating__icon rating__icon--star fa fa-star"></i></label>'
	        	str+=			'<input class="rating__input" name="rating2" id="rating2-50'+i+'" value="5" type="radio">' */
	            		/* 버튼 아이콘 */
	        	str+=		'</div>'
	        	str+=		'<button id="icon" class="col-1">'
				str+=		'<ion-icon name="ellipsis-vertical-outline"></ion-icon>'
				str+=		'</button>'
       			str+=		'</div>'
        		str+=	'</div>'
        		/* 벌점끝 */
        		str+='</div>'
			}
			$(".ratingContainer").html(str);
		});
	}
	 

	
	 <!-- 모달 닫기 버튼 -->
     $("#modalColseBtn").on("click",function(e){

        modal.hide();
     });

});

$('.ratingContainer').on('click','input',function(e){
	
		if(id == ""){
			alert('로그인을 해야 평가가 가능합니다.');
			}
		console.log("밖 실행");
		var artSeqno = $("#aTag");
		console.log("seqno",artSeqno.val());
		
		var ratingStar ={ 
			value : e.target.value ,
			artSeqno : artSeqno.val(),
			id : id 
	
		} 
		ratingService.rating(ratingStar ,function(result){
		})
	
}); 


</script>
