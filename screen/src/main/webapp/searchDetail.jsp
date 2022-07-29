<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="head.jsp" %>
    
<%@ include file="header.jsp" %>
<title>상세검색</title>

<div class="divTable minimalistBlack">
  <div class="divTableHeading">
    <div class="divTableRow">
    <div class="divTableHead">장르</div>
    <div class="divTableHead">
    		<input type="checkbox" name="genre" value="일상" >일상
			<input type="checkbox" name="genre" value="개그">개그
			<input type="checkbox" name="genre" value="드라마">드라마
			<input type="checkbox" name="genre" value="액션">액션
			<input type="checkbox" name="genre" value="감성">감성
			<input type="checkbox" name="genre" value="순정">순정
			<input type="checkbox" name="genre" value="판타지">판타지
			<input type="checkbox" name="genre" value="스릴러">스릴러
			<input type="checkbox" name="genre" value="시대극">시대극
			<input type="checkbox" name="genre" value="스포츠">스포츠
    </div>
   
    </div>
  </div>
  <div class="divTableBody">
    <div class="divTableRow">
      <div class="divTableCell">플랫폼</div>
      <div class="divTableCell">
			<input type="checkbox" name="genre" value="일상" >dd
			<input type="checkbox" name="genre" value="개그">d
			<input type="checkbox" name="genre" value="드라마">
			<input type="checkbox" name="genre" value="액션">
			<input type="checkbox" name="genre" value="감성">
			<input type="checkbox" name="genre" value="순정">
			<input type="checkbox" name="genre" value="판타지">
			<input type="checkbox" name="genre" value="스릴러">
			<input type="checkbox" name="genre" value="시대극">
			<input type="checkbox" name="genre" value="스포츠">
	  </div>
     
      </div>
    <div class="divTableRow">
      <div class="divTableCell">연재완료 여부</div>
      <div class="divTableCell">
      	<input type="checkbox" name="genre" value="시대극">연재중
			<input type="checkbox" name="genre" value="스포츠">연재완료
      </div>
    </div>
    <div class="divTableRow">
      <div class="divTableCell">평점</div>
      <div class="divTableCell">
      		<input type="checkbox" name="genre" value="일상" >dd
			<input type="checkbox" name="genre" value="개그">d
			<input type="checkbox" name="genre" value="드라마">
			<input type="checkbox" name="genre" value="액션">
			<input type="checkbox" name="genre" value="감성">
			<input type="checkbox" name="genre" value="순정">
			<input type="checkbox" name="genre" value="판타지">
			<input type="checkbox" name="genre" value="스릴러">
			<input type="checkbox" name="genre" value="시대극">
			<input type="checkbox" name="genre" value="스포츠">
      </div>
    
    </div>
    <div class="divTableRow">
      <div class="divTableCell">태그</div>
      <div class="divTableCell">cell2_4</div>

    </div>
  </div>
</div>



<div class= "searchBoard">
	<div class= "searchPop">
		<input type="radio" name="row" value="인기순">
		<input type="radio" name="r	ow" value="조회순">
		<input type="radio" name="row" value="등록일자순">
	</div>
	
	
	<table>
		<tr>
			<td >
			<div class="image"></div>
			<div>내과의사 박원장</div>
			</td>
			
			<td class="detail">
			<div class ="platformDetail">플랫폼 쏼라쏼라</div>
			<div class ="webtoonDetail">작품의 설명 쏼라쏼라</div>
			<div class ="genruDetail">장르</div>
			<div class ="authorDetail">작가</div>
			<div class ="webtoonDetail">작품의 설명 쏼라쏼라</div>
			</td>
			
			<td class ="rating">
			</td>
		</tr>
	</table>
	
	
		<div class="searchCard">
		</div>
	
	</div>

	
	
	
	
	
	