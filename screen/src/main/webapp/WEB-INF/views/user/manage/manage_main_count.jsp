<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>  
<% Map<String, Integer> statistics = (Map<String, Integer>)request.getAttribute("statistics"); %>
<div class="row" style="display:inlne-block;"> <!-- row class→구획구분용 -->
	<div class="col-md-3 col-sm-6 tile_count tile_stats_count">
		<span class="count_top">
			<i class="fa fa-user"></i>
			총 회원 수
		</span>
		<div class="count"><%=statistics.get("totalMember") %></div>
		<span class="count_bottom">
			<i class="green">
				<i class="fa fa-sort-asc"></i>
				<%=statistics.get("newMember") %>% 
				</i>
			직전주 대비
		</span>
	</div>
	<div class="col-md-3 col-sm-6 tile_count tile_stats_count">
		<span class="count_top">
			<i class="fa fa-star"></i>
			평가 수
		</span>
		<div class="count green"><%=statistics.get("totalRating") %></div>
		<span class="count_bottom">
			<i class="green">
				<i class="fa fa-sort-asc"></i>
				<%=statistics.get("newRating") %>% 
			</i> 
			직전 주 대비
		</span>
	</div>
	<div class="col-md-3 col-sm-6 tile_count tile_stats_count">
		<span class="count_top">
			<i class="fa fa-reply"></i>
			댓글 활동
		</span>
		<div class="count"><%=statistics.get("totalReply") %></div>
		<span class="count_bottom">
			<i class="red">
				<i class="fa fa-sort-desc"></i>
				<%=statistics.get("newReply") %>% 
			</i> 
			직전 주 대비
		</span>
	</div>
	<div class="col-md-3 col-sm-6 tile_count tile_stats_count">
		<span class="count_top">
			<i class="fa fa-user"></i>
			방문자 수
		</span>
		<div class="count">7,325</div>
		<span class="count_bottom">
			<i class="green">
				<i class="fa fa-sort-asc"></i>
				34% 
			</i> 
			직전 주 대비
		</span>
	</div>
</div>
