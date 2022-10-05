<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!-- 장르 드롭다운 -->

<div class="row">
	<nav class="navbar navbar-expand-lg navbar-light bg-white" style="border: 1px solid #d8d8df">
	    <span class="navbar-brand">장르</span>
	    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDarkDropdown" aria-controls="navbarNavDarkDropdown" aria-expanded="false" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse" id="navbarNavDarkDropdown">
	    	<c:forEach items="${searchList}" var="taglist">
	      		<ul class="navbar-nav">
	       			 <li class="nav-item dropdown"> 
		          		<c:if test="${midSeq ne taglist.midSeq && taglist.mid ne null && taglist.topSeq eq '1'}">
					        <a class="nav-link dropdown-toggle text-dark d-inline" href="#" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
					        	${taglist.mid}
					        </a>
	           			</c:if>
		           		<c:if test="${midSeq eq taglist.midSeq}">
		           			<div class="nav-link dropdown-toggle text-dark d-none" style="display:none"></div>
		           		</c:if>
	       				<c:set value="${taglist.midSeq}" var ="midSeq"/>
			        	<ul class="dropdown-menu dropdown-menu-white" aria-labelledby="navbarDarkDropdownMenuLink">
			    	      	<c:forEach items="${searchList}" var="tagName">  
				    	      	 <c:if test="${tagName.midSeq eq midSeq && tagName.mid ne null}">
				    	      	  	<li><button class="dropdown-item tagName" name="tagname" value="${tagName.name}" onclick="location.href='/search.so?seqno=${tagName.seqno}';" >${tagName.name}</button></li>
				    	      	 </c:if>
			    	      	</c:forEach>
			    	    </ul>
	       			 </li>
	   		   </ul>
	        </c:forEach>	
	    </div>
	</nav>
</div>

<!-- 소재 드롭다운 -->
<div class="row">
	<nav class="navbar navbar-expand-lg navbar-light bg-white" style="border: 1px solid #d8d8df">
	    <span class="navbar-brand">소재</span>
	    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDarkDropdown" aria-controls="navbarNavDarkDropdown" aria-expanded="false" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse" id="navbarNavDarkDropdown">
	    	<c:forEach items="${searchList}" var="taglist">
	      		<ul class="navbar-nav">
	       			 <li class="nav-item dropdown"> 
		          		<c:if test="${midSeq ne taglist.midSeq && taglist.mid ne null && taglist.topSeq eq '2'}">
					        <a class="nav-link dropdown-toggle text-dark d-inline" href="#" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
					        	${taglist.mid}
					        </a>
	           			</c:if>
		           		<c:if test="${midSeq eq taglist.midSeq}">
		           			<div class="nav-link dropdown-toggle text-dark d-none" style="display:none"></div>
		           		</c:if>
	       				<c:set value="${taglist.midSeq}" var ="midSeq"/>
			        	<ul class="dropdown-menu dropdown-menu-white" aria-labelledby="navbarDarkDropdownMenuLink">
			    	      	<c:forEach items="${searchList}" var="tagName">  
				    	      	 <c:if test="${tagName.midSeq eq midSeq && tagName.mid ne null}">
				    	      	  	<li><a class="dropdown-item" href="#">${tagName.name}</a></li>
				    	      	 </c:if>
			    	      	</c:forEach>
			    	    </ul>
	       			 </li>
	   		   </ul>
	        </c:forEach>	
	    </div>
	</nav>
</div>
				
<!-- 그외 드롭다운 -->
<div class="row">
	<nav class="navbar navbar-expand-lg navbar-light bg-white" style="border: 1px solid #d8d8df">
	    <span class="navbar-brand">그 외</span>
	    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDarkDropdown" aria-controls="navbarNavDarkDropdown" aria-expanded="false" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse" id="navbarNavDarkDropdown">
	    	<c:forEach items="${searchList}" var="taglist">
	      		<ul class="navbar-nav">
	       			 <li class="nav-item dropdown"> 
		          		<c:if test="${midSeq ne taglist.midSeq && taglist.mid ne null && taglist.topSeq ne '1' && taglist.topSeq ne '2' }">
					        <a class="nav-link dropdown-toggle text-dark d-inline" href="#" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
					        	${taglist.mid}
					        </a>
	           			</c:if>
		           		<c:if test="${midSeq eq taglist.midSeq}">
		           			<div class="nav-link dropdown-toggle text-dark d-none" style="display:none"></div>
		           		</c:if>
	       				<c:set value="${taglist.midSeq}" var ="midSeq"/>
			        	<ul class="dropdown-menu dropdown-menu-white" aria-labelledby="navbarDarkDropdownMenuLink">
			    	      	<c:forEach items="${searchList}" var="tagName">  
				    	      	 <c:if test="${tagName.midSeq eq midSeq && tagName.mid ne null}">
				    	      	  	<li><a class="dropdown-item" href="#">${tagName.name}</a></li>
				    	      	 </c:if>
			    	      	</c:forEach>
			    	    </ul>
	       			 </li>
	   		   </ul>
	        </c:forEach>	
	    </div>
	</nav>
</div>		
	
<!-- 별점 -->	
<div class="row">
	<div class="col-2 d-flex justify-content-center	"></div>
	<div class="col-10 d-flex flex-row justify-content-left">
		<label for="customRange3" class="form-label">별점</label>
		<input type="range" class="form-range" min="0" max="5" step="0.5" id="customRange3">
	</div>
</div>

<!-- 태그 -->
<div class="row">
	<div class="col-2 d-flex justify-content-center	">태그</div>
	<div class="col-10 d-flex flex-row justify-content-left" id ="di">
		<div class="tableFootStyle" id="result">
		<strong>${param.tagname}</strong>
		</div>
	</div>
</div>

<!-- 검색창 -->
<div id="detailSearchBar">
	<nav class="navbar navbar-light  d-flex">
		<div class="container-fluid justify-content-center">
				<textarea class="form-control me-2 w-25 h-25"  name="searchBar"></textarea>
				<button id="searchSubmit" class="btn btn-outline-success">검색</button>
		</div>
	</nav>
</div>

<!-- 검색결과창 -->
<div class= "searchBoard">
	 <div class= "searchPop">
		<a href="#">인기순</a>
		<a href="#">조회순</a>
		<a href="#">등록일자순</a>
	</div>
		<c:forEach items="${artList}" var="artlist">
	<div id ="searchResult">	
	<div class="row">
		<%-- <c:if test="${!artlist.imageRoute}"> --%>
			<div class="col" id="artResult">
				<div class="image"><img src="${artlist.imageRoute}"></div>
				<div class="webtoonName">${artlist.name}</div>
			</div>
			<div class="col">
				<div class ="authorDetail">
					<span>작가:</span>${artlist.author}
				</div>
				<div class ="platformDetail">
					<span>연재처:</span>${artlist.plaform}
				</div>
				<div class ="webtoonDetail">
				${artlist.detail }
				</div>
				<div class ="genruDetail">
					<c:forEach items="artlist.tag" var="artTag">
							<span>장르:</span>드라마
					</c:forEach>
				</div>
				<div class ="webtoonHashtag">
					<a href="#">#전체 연령가 </a>
				</div>
			</div>
			<div class="col">
				<div class="star">
					<h4>별점</h4>
					<h2>5.0/5.0</h2>
					<div>★★★★★</div>
				</div>
			</div>
			</div>
	</div>
	</c:forEach> 
</div>
<script type="text/javascript" src="/js/searchDetail.js"></script>
<script>
var searchField = $("#detailSearchBar");
var searchBoard = $(".searchBoard");
var keyword = searchField.find("textarea[name='searchBar']");
$(document).ready(function(){
	
	$("#searchSubmit").on("click",function(){
		showList(); 
	});
		function showList(){
			searchService.getList(keyword.val(),function(list){
				console.log("겟리스트 시작", list.name);
				if(list == null || list.length==0){
					$(".searchBoard").html("검색 결과가 없습니다");
					return;
					}
				var str = "";
				for(var i = 0, len=list.length || 0; i<len; i++){
					console.log("리스트디버깅 이름: " + list[i].name);
					/* console.log("리스트디버깅 루트 :" + list[i].imageRoute );
					console.log("리스트디버깅 작가:" + list[i].author);
					console.log("리스트디버깅 플랫폼:" + list[i].plaform);
					console.log("리스트디버깅 디테일" + list[i].detail); */
					str+="<div id='searchResult'> <div class='row'>"
					str+="<div class='col' id='artResult'>"
					str+="<div class='image'><img src='"+ list[i].imageRoute +"'></div>"
					str+="<div class='webtoonName'>"+ list[i].name +"</div></div>"
					str+="<div class='col'><div class ='authorDetail'>"
					str+="<span>작가:</span>"+ list[i].author +"</div>"
					str+="<div class ='platformDetail'><span>연재처:</span>"+list[i].plaform+"</div>"
					str+="<div class ='webtoonDetail'>"+list[i].detail+"</div>"
					str+="<div class ='genruDetail'><span>장르:</span>드라마</div>"
					str+="<div class ='webtoonHashtag'><a href='#'>#전체 연령가 </a></div></div>"
					str+="<div class='col'><div class='star'>"
					str+="<h4>별점</h4> <h2>5.0/5.0</h2> <div>★★★★★</div></div></div>"
					str += "</div></div>" 
				} 
				console.log("빠져나옴?")
				$(".searchBoard").html(str);
			}) 
		};
});
</script>