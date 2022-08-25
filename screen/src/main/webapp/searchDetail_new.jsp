<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
 
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
				
				<div class="row">
					<div class="col-2 d-flex flex-row align-items-center justify-content-center">장르</div>
					<div class="accordion col-10" id="accordionPanelsStayOpenExample">
					  <div class="accordion-item ">
					    <h2 class="accordion-header" id="panelsStayOpen-headingOne">
					      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="false" aria-controls="panelsStayOpen-collapseOne">
					       장르
					      </button>
					    </h2>
					    <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingOne">
					      <div class="accordion-body">
					      	<ul>
					      		<c:forEach items="${searchList}" var="list">
						      		<c:if test="${list.top_seq ne list.mid_seq}">
							      		<c:forEach >
							      			<c:if test="">
							      				<c:forEach>
							      				</c:forEach>
							      			</c:if>
							      		</c:forEach>
							      		<li>
							      		
							      			${list.name}
							      		</li>	
							      		
							      	</c:if>	
							      	
							      	<c:if test="${list.top_seq eq list.mid_seq}">
							      	
							      	</c:if>
					      		</c:forEach>
					      	</ul>
					      </div>
					    </div>
					  </div>
				   </div>
				</div>
				
				<div class="row">
					<div class="col-2 d-flex flex-row align-items-center justify-content-center	">소재</div>
					<div class="accordion col-10" id="accordionPanelsStayOpenExample">
					  <div class="accordion-item ">
					    <h2 class="accordion-header" id="panelsStayOpen-headingTwo">
					      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseTwo" aria-expanded="false" aria-controls="panelsStayOpen-collapseTwo">
					        소재
					      </button>
					    </h2>
					    <div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingTwo">
					      <div class="accordion-body">
					        <strong>This is the second item's accordion body.</strong> It is hidden by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
					      </div>
					    </div>
					  </div>
				   </div>
				</div>
				
				<div class="row">
					<div class="col-2 d-flex justify-content-center	">배경</div>
						<div class="col-10 d-flex flex-row justify-content-left">
						<input type="checkbox" name="tags" value="naver" id="naver">
						<label for="naver">이세계</label> 
						<input type="checkbox" name="tags" value="kakaoWebtoon" id="kakaoWebtoon">
						<label for="kakaoWebtoon">학원물</label> 
						<input type="checkbox" name="tags" value="kakaoPage" id="kakaoPage">
						<label for="kakaoPage">학원</label> 
						<input type="checkbox" name="tags" value="lezhin" id="lezin">
					</div>
				</div>
				<div class="row">
					<div class="col-2 d-flex justify-content-center	">분위기</div>
						<div class="col-10 d-flex flex-row justify-content-left">
						<input type="checkbox" name="tags" value="toomics" id="toomics">
						<label for="toomics">가슴먹먹한</label> 
						<input type="checkbox" name="tags" value="bomtoon" id="bomtoon">
						<label for="bomtoon">힐링</label>  
					</div>
				</div>
				<div class="row">
					<div class="col-2 d-flex justify-content-center	">전개방식</div>
						<div class="col-10 d-flex flex-row justify-content-left">
						<input type="checkbox" name="isEnding" value="연재중" id="연재중">
						<label for="연재중">옴니버스식</label> 
						<input type="checkbox" name="isEnding" value="완결" id="완결">
						<label for="완결">소설원작</label> 
					</div>
				</div>
				<div class="row">
					<div class="col-2 d-flex justify-content-center	">관계</div>
						<div class="col-10 d-flex flex-row justify-content-left">
						<input type="checkbox" name="isEnding" value="연재중" id="연재중">
						<label for="연재중">소꿉친구</label> 
						<input type="checkbox" name="isEnding" value="완결" id="완결">
						<label for="완결">계약관계</label> 
					</div>
				</div>
				<div class="row">
					<div class="col-2 d-flex justify-content-center	">기타</div>
						<div class="col-10 d-flex flex-row justify-content-left">
						<a href="#" onclick ="">기타</a>
					</div>
				</div>
				<div class="row">
				<div class="col-2 d-flex justify-content-center	"></div>
						<div class="col-10 d-flex flex-row justify-content-left">
							<label for="customRange3" class="form-label">별점</label>
							<input type="range" class="form-range" min="0" max="5" step="0.5" id="customRange3">
						</div>
				</div>
				<div class="row">
					<div class="col-2 d-flex justify-content-center	">태그</div>
						<div class="col-10 d-flex flex-row justify-content-left">
					<div class="tableFootStyle" id="result">원하시는 #태그를 골라주세요</div>
				</div>
			</div>
			
		<div class= "searchBoard">
			<div class= "searchPop">
				<a href="#">인기순</a>
				<a href="#">조회순</a>
				<a href="#">등록일자순</a>
			</div>
			
				<div class="row">
					<div class="col">
						<div class="image"></div>
						<div class="webtoonName">내과의사 박원장</div>
					</div>
					<div class="col">
						<div class ="authorDetail">
							<span>글:</span>
							장봉수
							<span>그림:</span>
							장봉수 
						</div>
						<div class ="platformDetail">
							<span>연재처:</span>
							네이버
						</div>
						
						
						<!-- 현재 몇화까지 연재중인지 쓰기 완결여부 -->
						
						
						<div class ="webtoonDetail">
							어릴 적 TV에 나오는 의사들의 멋진 모습을 보고 의사가 되기로 결심한 박원장. 
							인고의 세월을 보내고 전문의가 되어 본인 이름을 내건 의원의 원장이 되었으나 그를 기다리고 있는 것은 TV 속 의사들의 찬란한 인생이 아니었으니...
							판타지 의학 드라마는 이제 그만! 19년 차 현직 의사가 직접 그리는 대한민국 의사들의 진짜 이야기! 화제의 하이퍼리얼리즘 메디컬드라마 '내과 박원장'
						</div>
						<div class ="genruDetail">
							<span>장르:</span>
							드라마
						</div>
						<div class ="webtoonHashtag">
							<a href="#">
								#드라마 
							</a>
							<a href="#">
								#스토리 
							</a>
							<a href="#">
								#전체 연령가 
							</a>
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

	