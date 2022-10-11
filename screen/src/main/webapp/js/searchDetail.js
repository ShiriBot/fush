/**
 * 
 */

console.log("Search Detail Module start")

var searchService = (function(){
	
	function getList(keyword,callback, error) {
		 console.log("getList실행",keyword);
			$.getJSON("/searchDetail/search/"+keyword+".json",function(result){
				 if(callback) {
					 callback(result);
					 console.log("성공");
				 }
			 }).fail(function(xhr, status, err){
				if(error) {
					error();
				}
			 });
		 }
/*	 function getList(param,callback, error) {
		 var keyword = param.keyword;
		 var tagName = param.tagName;
		 console.log("js 파일 getList실행",keyword);
		 if(keyword == '') {
			 alert('검색어를 입력해주세요');
			 return false;
		 }
		 $.getJSON("/searchDetail/search/" + keyword + "/" + tagName + ".json" ,function(result){
			 if(callback) {
				 callback(result.keyword,result.tagName);
				 console.log("성공");
			 }
		 }).fail(function(xhr, status, err){
			 if(error) {
				 error();
			 }
		 });*
	 }*/
	 return { getList: getList};
})();