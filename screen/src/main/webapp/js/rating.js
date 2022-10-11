/**
 *  평가하기 페이지
 */
 
 console.log("rating service start");
 
 var ratingService = (function(){
	function list(id , callback){
		console.log("list 함수시작");
		$.getJSON("/ratingRest/" + id + ".json",function(data){
			if(callback){
				callback(data);
			}
		}).fail(function(xhr, status ,err){
			if(error){
				error();
			}
		});
	}
	function rating(val,callback){
		console.log("rating function  실행 " , val);
		$.ajax({
			type : 'POST',
			url : '/ratingRest/val',
			data : JSON.stringify(val),
			  contentType : 'application/json; charset=utf-8',
			  success :function(result, status, xhr){
				  if(callback) {
					  callback(result);
				  }
			  },error : function(xhr,status,er){
					 if(error) {
						 error(er);
					 }
				 }
		});
	}
	return {list : list};
})();